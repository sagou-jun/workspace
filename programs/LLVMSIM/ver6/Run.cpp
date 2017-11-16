#include"IRSim6.hpp"

using namespace IRSIM;

/*レジスタの命名*/
inline void RegNaming(Instruction *CurInst){
  std::string testname = RegNameGen();
  StringRef RN(testname);
  Twine RegName(RN);
  CurInst->setName(RN);
}

int CmpResult(CmpInst *cmpInst,IRegs *opr1,IRegs *opr2); /* CmpInstの結果の判定 TUREなら1 FALSEなら0を返す */
void BinaryOpSwitch(unsigned opcode,RegTableELE *reg,IRegs *opr1,IRegs *opr2);

void IRSim::Run(std::string &FileName){
  setIRFileName(FileName);
  Run();
  return ;
}

void IRSim::setIRFileName(string &FileName){
  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  Owner = parseIRFile(FileName.c_str(),Err,Context);
  if(!Owner){
    Err.print(FileName.c_str(),errs());
    return ;
  }
  
}

void IRSim::Run(){
  Module *Mod = Owner.get();
  if(Mod == NULL)
    {
      cerr<<"IRSim::Run LLVMIR File is not specified"<<endl;
      return ;
    }
  AllocateGlobalVariables();
  RegT.CallProcess();
  Function *fn = Mod->getFunction("main");
  if(fn != NULL)
    {
      RunFunction(fn);
      cerr<<endl<<"--------Run End--------"<<endl;
      dump();
    }
  else
    cerr<<"main function does not exist"<<endl;
  return;
}

int IRSim::RunFunction(llvm::Function *CurFn){
  RunInstResult rtn;
  cerr<<"\n"<<CurFn->getName().str()<<"\n";
  for(Function::iterator BBI = CurFn->begin(),BBI_End = CurFn->end();
      BBI != BBI_End;
      BBI++)
    {
      errs()<<"\t"<<BBI->getName()<<"\n";
      for(BasicBlock::iterator InstI = BBI->begin(),InstI_End = BBI->end();
	  InstI != InstI_End;
	  InstI++)
	{
	  rtn = RunInstruction(InstI);
	  /*Call命令はTerminate命令ではないのでBasicBlockの内部に存在しうる*/
	  if(rtn.Result == FUNCTION_RUNINST)
	    {
	      RunFunction(rtn.NextFunc);
	      //rtn.Result = NORMAL_RUNINST;
	    }
	  else if(rtn.Result == EXIT_RUNINST)
	    {
	      cerr<<"!!EXIT!!"<<endl;
	      cerr<<endl<<"--------Run End--------"<<endl;
	      dump();
	      exit(1);
	    }
	  
	}
      switch(rtn.Result){
      case BRANCH_RUNINST:
	{
	  BBI = rtn.NextBB;
	  BBI--;
	  break;
	}
      case RETURN_RUNINST:
	{
	  if(FunctionStack.empty())
	    break;
	  else
	    {
	      /*
	      StackELE *ReturnPoint = FunctionStack.back();
	      cerr<<"Return to "<<ReturnPoint->Fn->getName().str()<<endl;
	      */
	      FunctionStack.pop();
	      /*ローカルメモリの解放*/
	      /*ポインタが同じアドレスを指していた場合にmyFreeエラーになるため改善が必要*/
	      for(RegTable::const_iterator const_RegTableI = RegT.const_begin(),const_RegTableI_End = RegT.const_end();
		  const_RegTableI != const_RegTableI_End;
		  const_RegTableI++)
		{
		  if((*const_RegTableI)->getKind() == POINTER)
		    Mem.myFree((*const_RegTableI)->getAdd());
		}
	      RegT.RetProcess();
	      return 0;
	    }
	}
      case NORMAL_RUNINST:
      case ERROR_RUNINST:
      default:
	break;
      }
    }
  return 0;
}

int IRSim::RunThisFunction(Type *rtnType,string &FunctionName){
  bool check = false;
  //cout<<"\n"<<FunctionName<<"\n";
  Module *Mod = Owner.get();
  Function *fn = Mod->getFunction(FunctionName);
  if(fn != NULL)
    {
      RunFunction(fn);
      cerr<<endl<<"--------Run End--------"<<endl;
      //dump();
    }
  else
    cerr<<"\""<<FunctionName<<"\""<<"is not found"<<endl;
  return 0;
}

/*
 *Br,RET
 *BinaryOp,CmpInst
 *Alloca,Store,Load,GEP
 *Call
 */
RunInstResult IRSim::RunInstruction(llvm::Instruction *CurInst){
  Value *OP[5];
  IRegs *Iget[2];	// 即値とレジスタの値のget関数インターフェース
  RegTableELE *reg[3];	// レジスタ操作インターフェース
  unsigned opcode = CurInst->getOpcode();
  unsigned oprs = CurInst->getNumOperands();
  RunInstResult rtn;
  rtn.Result = NORMAL_RUNINST;
  errs()<<"\t|"<<*CurInst<<"\n";
  //cerr<<"\t\t"<<CurInst->getOpcodeName()<<":"<<oprs<<":"<<opcode<<endl;
  /*引数の数が3以上の場合は可変長引数の可能性があるのでオペランドの格納は行わない*/
  for(int i = 0;i < oprs&&i < 5 ;i++)
    {
      OP[i] = CurInst->getOperand(i);
    } 
  /*代入先のレジスタに名前がない場合は名前をつける
    CurInstに名前がついていない場合は代入先のレジスタに名前がついていないと判断する*/
  if(!CurInst->hasName()&&(CurInst->getType()->getTypeID() != Type::VoidTyID))
    RegNaming(CurInst);
  
  /*Terminator Instructions*/
  if(CurInst->isTerminator())
    {
      /*Instruction::Br:*/
      if(opcode == Instruction::Br)
	{
	  BranchInst *BrInst = dyn_cast<BranchInst>(CurInst);
	  if(BrInst->isUnconditional())
	    rtn.NextBB = BrInst->getSuccessor(0);
	  else if(BrInst->isConditional())
	    {
		reg[0] = RegT.RegLookUp(OP[0]->getName().str());
		if(reg[0]->getInt() == 1)
		  rtn.NextBB = BrInst->getSuccessor(0);
		else
		  rtn.NextBB = BrInst->getSuccessor(1);
	    }
	  rtn.Result = BRANCH_RUNINST;
	  return rtn;
	}
      else if(opcode == Instruction::Ret)
	{
	  /*Instruction::Ret:*/
	  if(FunctionStack.empty())
	    {
	      rtn.Result = RETURN_RUNINST;
	      return rtn;
	    }
	  ReturnInst *retinst = dyn_cast<ReturnInst>(CurInst);
	  Value *RetValue = retinst->getReturnValue();
	  unsigned RXRegID = FunctionStack.back()->RegID;
	  ImmediateValue<int> immi;
	  ImmediateValue<double> immd;	
	  if(RetValue != NULL)
	    {
	      switch(RetValue->getType()->getTypeID()){
	      case Type::IntegerTyID:
		{
		  ConstantInt *imm = dyn_cast<ConstantInt>(RetValue);
		  //即値
		  if(imm != NULL)
		    {
		      immi.setValue( imm->getSExtValue());
		      RegT.ReturnValue(&immi,RXRegID);
		    }
		  else
		    RegT.ReturnValue(RetValue->getName().str(),RXRegID);
		  break;
		}
	      case Type::FloatTyID:
	      case Type::DoubleTyID:
		{
		  ConstantFP *imm = dyn_cast<ConstantFP>(RetValue);
		  //即値
		  if(imm != NULL)
		    {
		      immd.setValue( imm->getValueAPF().convertToDouble());
		      RegT.ReturnValue(&immi,RXRegID);
		    }
		  else
		    RegT.ReturnValue(RetValue->getName().str(),RXRegID);
		  break;
		}
		/*Array,Struct,Pointer型が即値で指定されるコードは生成されないと仮定する*/
	      case Type::ArrayTyID:
	      case Type::StructTyID:
	      case Type::PointerTyID:
		{
		  RegT.ReturnValue(RetValue->getName().str(),RXRegID);
		}
		break;
	      default:
		break;
	      }
	    }
	  rtn.Result = RETURN_RUNINST;
	  return rtn;
	}
    }
  /*Bitwise Binary Operations&CmpInst*/
  else if(CurInst->isBinaryOp()||opcode == Instruction::ICmp||opcode == Instruction::FCmp)
    {
      /*あまり良くない実装*/
      ImmediateValue<int> ImmValueI[2];
      ImmediateValue<double> ImmValueD[2];
      Type::TypeID OperandType;
      if(CurInst->isBinaryOp())
	OperandType = CurInst->getType()->getTypeID();
      else
	{
	  OperandType = OP[0]->getType()->getTypeID();
	  //あまり良くない実装
	  reg[0] = RegT.setRegInt(0,CurInst->getName().str());
	}
      /*整数型あるいは符号なし整数の演算*/
      if(OperandType == Type::IntegerTyID)
	{
	  //あまり良くない実装
	  if(CurInst->isBinaryOp())
	    reg[0] = RegT.setRegInt(0,CurInst->getName().str());
	  for(int i = 0;i < oprs;i++)
	    {
	      ConstantInt *imm = dyn_cast<ConstantInt>(OP[i]);
	      if(imm == NULL)
		Iget[i] = RegT.RegLookUp(OP[i]->getName().str()); // NULLが帰った場合のエラー処理を追加するべき
	      else
		{
		  /*あまり良くない実装*/
		  ImmValueI[i].setValue(imm->getSExtValue());
		  Iget[i] = &ImmValueI[i];
		}
	    }
	}
      /*double型の演算*/
      else if(OperandType == Type::DoubleTyID)
	{
	  //あまり良くない実装
	  if(CurInst->isBinaryOp())
	    reg[0] = RegT.setRegDouble(0,CurInst->getName().str());
	  for(int i = 0;i < oprs;i++)
	    {
	      ConstantFP *imm = dyn_cast<ConstantFP>(OP[i]);
	      if(imm == NULL)
		Iget[i] = RegT.RegLookUp(OP[i]->getName().str()); // NULLが帰った場合のエラー処理を追加するべき
	      else
		{
		  /*あまり良くない実装*/
		  ImmValueD[i].setValue(imm->getValueAPF().convertToDouble());
		  Iget[i] = &ImmValueD[i];
		}  
	    }
	}
      if(CurInst->isBinaryOp())
	{
	  BinaryOpSwitch(opcode,reg[0],Iget[0],Iget[1]);
	}
      else
	{
	  CmpInst *cmp = dyn_cast<CmpInst>(CurInst);
	  if(cmp == NULL)
	    {
	      cerr<<"CmpInst ERROR"<<endl;
	      exit(1);
	    }
	  reg[0]->setValue(CmpResult(cmp,Iget[0],Iget[1]));
	}
    }
  /*CastInst*/
  else if(CurInst->isCast())
    {
      /*未実装*/
      switch(opcode){
      case Instruction::SIToFP:
	{
	  ImmediateValue<int> imm;
	  ConstantInt *Imm = dyn_cast<ConstantInt>(OP[0]);
	  if(Imm != NULL)
	    {
	      imm.setValue(Imm->getSExtValue());
	      Iget[0] = &imm;
	    }
	  else
	    {
	      reg[1] = RegT.setRegInt(0,OP[0]->getName().str(),false);
	      Iget[0] = reg[1];
	    }
	  /*SSAなので再代入はありえない*/
	  reg[0] = RegT.setRegDouble(static_cast<double>(Iget[0]->getInt()),CurInst->getName().str());
	  break;
	}
      case Instruction::SExt:
      case Instruction::ZExt:
      case Instruction::Trunc:// Truncate integers	
      case Instruction::FPToUI:
      case Instruction::FPToSI:
      case Instruction::UIToFP:
      case Instruction::FPTrunc:
      case Instruction::FPExt:
      case Instruction::PtrToInt:
      case Instruction::IntToPtr:
      case Instruction::BitCast:
	{
	  ImmediateValue<int> imm;
	  ConstantInt *Imm = dyn_cast<ConstantInt>(OP[0]);
	  if(Imm != NULL)
	    {
	      imm.setValue(Imm->getSExtValue());
	      Iget[0] = &imm;
	    }
	  else
	    {
	      reg[1] = RegT.setRegInt(0,OP[0]->getName().str(),false);
	      Iget[0] = reg[1];
	    }
	  /*SSAなので再代入はありえない*/
	  reg[0] = RegT.setRegInt(Iget[0]->getInt(),CurInst->getName().str());
	  break;
	}
      }
    }
  else
    switch(opcode){
      /*Memory Operations*/
    case Instruction::Alloca:
      {
	/*Instruction::Alloca*/
	AllocaInst *alo = dyn_cast<AllocaInst>(CurInst);
	Type::TypeID OperandType = alo->getAllocatedType()->getTypeID();
	/*ここから*/
	if(alo->isArrayAllocation())
	  {
	    //NULLを返すことはないはず
	    ConstantInt *imm = dyn_cast<ConstantInt>(alo->getArraySize());
	    ImmediateValue<int> ImmValue(imm->getSExtValue());
	    /*確保するデータ型*/
	    if(OperandType == Type::IntegerTyID)
	      reg[0] = RegT.setRegAdd(Mem.myAllocInt(0,ImmValue.getInt()),CurInst->getName().str());
	    else if(OperandType == Type::DoubleTyID)
	      reg[0] = RegT.setRegAdd(Mem.myAllocDouble(0,ImmValue.getInt()),CurInst->getName().str());
	    reg[0]->setKind(ARRAY);
	  }
	/*ここまでの部分はLLVMIRの仕様で定義された複数の領域を確保するための処理だが、
	  どのようなCコードから生成した場合に動くのか分かっていない
	  フロントエンドにclang 3.6.2を使用した場合、少なくともArray型の確保には使用されない*/
	/*ここから通常のalloca命令の処理*/
	else
	  switch(OperandType){
	  case Type::IntegerTyID:
	    RegT.setRegAdd(Mem.myAllocInt(),CurInst->getName().str());
	    break;
	  case Type::DoubleTyID:
	    RegT.setRegAdd(Mem.myAllocDouble(),CurInst->getName().str());
	    break;
	  case Type::ArrayTyID:
	    RegT.setRegAdd(Mem.myAllocArray(dyn_cast<ArrayType>(alo->getAllocatedType())),
			   CurInst->getName().str())->setKind(ARRAY);
	    break;
	  case Type::StructTyID:
	    RegT.setRegAdd(Mem.myAllocStruct(dyn_cast<StructType>(alo->getAllocatedType())),
			   CurInst->getName().str())->setKind(STRUCT);
	    break;
	  }
	break;
      }
    case Instruction::Store:
      {
	/*Instruction::Store*/
	/*STOREのオペランドに名前のついていないレジスタは登場しない,即値はありえる*/
	GEPOperator *gepOp = dyn_cast<GEPOperator>(OP[1]);
	unsigned addr;
	if(gepOp != NULL)
	  {
	    unsigned gepOprs = gepOp->getNumOperands();
	    Value *GEPOP[gepOprs];
	    for(int i = 0;i < gepOprs;i++)
	      GEPOP[i] = gepOp->getOperand(i);
	    addr = myGetElementPtr(GEPOP,gepOprs);
	  }
	else
	  addr = RegT.RegLookUp(OP[1]->getName().str())->getAdd();
	Type::TypeID OperandType = OP[0]->getType()->getTypeID();
	if(OperandType == Type::IntegerTyID)
	  {
	    ImmediateValue<int> ImmValue;
	    ConstantInt *imm = dyn_cast<ConstantInt>(OP[0]);
	    if(imm == NULL)
	      Iget[0] = RegT.RegLookUp(OP[0]->getName().str());
	    else
	      {
		ImmValue.setValue(imm->getSExtValue());
		Iget[0] = &ImmValue;
	      }
	    Mem.getPtr(addr)->setData(Iget[0]->getInt());
	  }
	else if(OperandType == Type::DoubleTyID)
	  {
	    ImmediateValue<double> ImmValue;
	    ConstantFP *imm = dyn_cast<ConstantFP>(OP[0]);
	    if(imm == NULL)
	      Iget[0] = RegT.RegLookUp(OP[0]->getName().str());
	    else
	      {
		ImmValue.setValue(imm->getValueAPF().convertToDouble());
		Iget[0] = &ImmValue;
	      }
	    Mem.getPtr(addr)->setData(Iget[0]->getDouble());
	  }
	break;
      }
    case Instruction::Load:	
      {
	/*Instruction::Load*/
	/*Load命令には即値は登場しない*/
	/*ロードするデータの型*/
	Type::TypeID OperandType = CurInst->getType()->getTypeID();
	/*OP[0]はメモリへのポインタのレジスタ*/
	GEPOperator *gepOp = dyn_cast<GEPOperator>(OP[0]);
	unsigned addr;
	if(gepOp != NULL)
	  {
	    /*load <ty> getelementptr ...の場合*/
	    unsigned gepOprs = gepOp->getNumOperands();
	    Value *GEPOP[gepOprs];
	    for(int i = 0;i < gepOprs;i++)
	      GEPOP[i] = gepOp->getOperand(i);
	    addr = myGetElementPtr(GEPOP,gepOprs);
	  }
	else
	  {
	    reg[1] = RegT.RegLookUp(OP[0]->getName().str());
	    addr = reg[1]->getAdd();
	  }
	switch(CurInst->getType()->getTypeID()){
	case Type::IntegerTyID:
	  reg[0] = RegT.setRegInt(Mem.getPtr(addr)->getInt(),CurInst->getName().str());
	  break;
	case Type::FloatTyID:
	case Type::DoubleTyID:
	  reg[0] = RegT.setRegDouble(Mem.getPtr(addr)->getDouble(),CurInst->getName().str());
	  break;
	case Type::ArrayTyID:
	case Type::StructTyID:
	case Type::PointerTyID:
	  reg[0] = RegT.setRegAdd(Mem.getPtr(addr)->getAdd(),CurInst->getName().str());
	  break;
	default:
	  cerr<<"IRSim::RunInstruction load undefined Type"<<endl;
	}
	break;
      }
      /*現在の実装だと可変長の引数に対応できないので，変更が必要*/
    case Instruction::GetElementPtr:
      {
	reg[0] = RegT.setRegAdd(0,CurInst->getName().str(),false);
	reg[0]->setValue(myGetElementPtr(OP,oprs));
	break;
      }
    case Instruction::Call:
      {
	/*Instruction::Call:*/
	CallInst *callinst = dyn_cast<CallInst>(CurInst);
	if(callinst == NULL)
	  {
	    cerr<<"IRSIM::RunInstruction::CallInst dyn_cast error"<<endl;
	    exit(1);
	  }
	Function *CalledFunction = callinst->getCalledFunction();
	FunctionType *FnType = CalledFunction->getFunctionType();
	/*宣言のみで定義されていない関数を呼び出した場合*/
	if(CalledFunction->isDeclaration())
	  {
	    cerr<<"This Function is only declaration \""<<CalledFunction->getName().str()<<"\""<<endl;
	    //デバッグしやすくするため戻り値がvoid型の場合はそのまま実行
	    if(FnType->getReturnType()->getTypeID() != Type::VoidTyID)
	      rtn.Result = EXIT_RUNINST;
	    else
	      cerr<<"Ignore Function Calling "<<CalledFunction->getName().str()<<endl;
	    return rtn;
	  }
	/*呼び出しスタックにデータを積む*/
	FunctionStack.push(GetStackELEInstance(CurInst->getParent()->getParent(),RegT.getLastRegID()));
	/*戻り値の型の判別*/
	/*FunctionTypeの戻り値の型と戻り値を格納する変数の型が一致していない場合は動作未定義*/
	switch(FnType->getReturnType()->getTypeID()){
	case Type::IntegerTyID:
	  {
	    reg[0] = RegT.setRegInt(0,CurInst->getName().str());
	    break;
	  }
	case Type::FloatTyID:
	case Type::DoubleTyID:
	  {
	    reg[0] = RegT.setRegDouble(0,CurInst->getName().str());
	    break;
	  }
	case Type::ArrayTyID:
	case Type::StructTyID:
	case Type::PointerTyID:
	case Type::VoidTyID:
	default:
	  {
	    RegT.setRegAdd(0,"void");
	    break;
	  }
	}
	/*呼び出し先の関数のレジスタテーブルの生成*/
	/*RegT.PassingArgumentで引数の値を渡す*/
	RegT.CallProcess();
	/*仮引数のレジスタ登録と値の設定*/
	/*3.6.2のllvmではCallInstに引数のiteratorが存在しない*/
	unsigned ArgNum = callinst->getNumArgOperands();/*実引数の数取得*/
	unsigned ParamNum = FnType->getNumParams();/*仮引数の数取得*/
	if(ArgNum < ParamNum)
	  {
	    /*実引数の数 < 仮引数の数の場合はエラーとする*/
	    cerr<<"CallInst::Num of Args and Params does not match"<<endl;
	    exit(1);
	  }
	{
	  /*ローカル変数のスコープ制限用コードブロック*/
	  /*実際に意味があるかどうかは検証していない*/
	  Value *ArgValue;
	  Value *ParamValue;
	  ImmediateValue<int> immi;
	  ImmediateValue<double> immd;
	  IRegs *Iget;
	  Function::ArgumentListType::iterator Param_Ite = CalledFunction->arg_begin(),
	    Param_Ite_End = CalledFunction->arg_end();
	  for(unsigned i = 0;i < ArgNum;i++)
	    {
	      ArgValue = callinst->getArgOperand(i);
	      ParamValue = Param_Ite;
	      /*
	      if(ArgValue->getType()->getTypeID() != ParamValue->getType()->getTypeID())
		{
		  cerr<<"Argument Type and Psrameter Type does not match"<<endl;
		  exit(1);
		}
	      */
	      /*仮引数のレジスタに名前がついていなかったら*/
	      if(!ParamValue->hasName())
		{
		  cerr<<"Run::RunInstruction::CallInst::Paramete doesn't have name"<<endl;
		  exit(1);
		}
	      string ParamName = ParamValue->getName().str();
	      switch(ArgValue->getType()->getTypeID()){
	      case Type::IntegerTyID:
		{
		  ConstantInt *imm = dyn_cast<ConstantInt>(ArgValue);
		  //即値
		  if(imm != NULL)
		    {
		      immi.setValue( imm->getSExtValue());
		      RegT.PassingArgument(&immi,ParamName,INTEGER);
		    }
		  else
		    RegT.PassingArgument(ArgValue->getName().str(),ParamName,INTEGER);
		  break;
		}
	      case Type::FloatTyID:
	      case Type::DoubleTyID:
		{
		  ConstantFP *imm = dyn_cast<ConstantFP>(ArgValue);
		  //即値
		  if(imm != NULL)
		    {
		      immd.setValue( imm->getValueAPF().convertToDouble());
		      RegT.PassingArgument(&immd,ParamName,DOUBLE);
		    }
		  else
		    RegT.PassingArgument(ArgValue->getName().str(),ParamName,DOUBLE);
		  break;
		}
		/*Array,Struct,Pointer型が即値で指定されるコードは生成されないと仮定する*/
	      case Type::ArrayTyID:
	      case Type::StructTyID:
	      case Type::PointerTyID:
		{
		  RegT.PassingArgument(ArgValue->getName().str(),ParamName,POINTER);
		}
		break;
	      default:
		break;
	      }
	      if(ParamNum > 1)
		{
		  Param_Ite++;
		  ParamNum--;
		}
	    }
	}
	/*実行する関数を変更するための制御信号の生成*/
	rtn.Result = FUNCTION_RUNINST;
	rtn.NextFunc = CalledFunction;
	break;
      }
    default:
      {
	cerr<<"This Instruction is not defined. opcode="<<opcode<<endl;
      }
    }
  return rtn;
}

int CmpResult(CmpInst *cmpInst,IRegs *opr1,IRegs *opr2){
  int result;
  llvm::FCmpInst *fcmp = dyn_cast<llvm::FCmpInst>(cmpInst);
  if(fcmp != NULL)
    {
      /*どちらかのオペランドがnanだと1になる*/
      int unordered = isnan(opr1->getDouble()) && isnan(opr2->getDouble());
      switch(cmpInst->getPredicate()){
      case CmpInst::FCMP_FALSE:
	{
	  result = 0;
	  break;
	}
      case CmpInst::FCMP_OEQ:
	{
	  if(opr1->getDouble() == opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_OGT:
	{
	  if(opr1->getDouble() < opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_OGE:
	{
	  if(opr1->getDouble() <= opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_OLT:
	{
	  if(opr1->getDouble() > opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_OLE:
	{
	  if(opr1->getDouble() >= opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_ONE:
	{
	  if(opr1->getDouble() != opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_ORD:
	{
	  result = !unordered;
	  break;
	}
      case CmpInst::FCMP_UNO:
	{
	  result = unordered;
	  break;
	}
      case CmpInst::FCMP_UEQ:
	{
	  if(opr1->getDouble() == opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_UGT:
	{
	  if(opr1->getDouble() < opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_UGE:
	{
	  if(opr1->getDouble() <= opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_ULT:
	{
	  if(opr1->getDouble() > opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_ULE:
	{
	  if(opr1->getDouble() >= opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_UNE:
	{
	  if(opr1->getDouble() != opr2->getDouble())
	    result = !unordered;
	  else
	    result = 0;
	  break;
	}
      case CmpInst::FCMP_TRUE:
	{
	  result = 1;
	  break;
	}
      }
    }
   else
     {
       int unsignedopr[2] = {abs(opr1->getInt()),abs(opr2->getInt())};
       switch(cmpInst->getPredicate()){
       case CmpInst::ICMP_EQ:	//< equal
	 {
	   //cout<<" EQ ";
	   if(opr1->getInt() == opr2->getInt())
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_NE:	//< not equal
	 {
	   //cout<<" NEQ ";
	   if(opr1->getInt() != opr2->getInt())
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_UGT:	//< unsigned greater than
	 {
	   //cout<<" UGT ";
	   if(unsignedopr[0] > unsignedopr[1])
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_UGE:	//< unsigned greater or equal
	 {
	   //cout<<" UGE ";
	   if(unsignedopr[0] >= unsignedopr[1])
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_ULT:	//< unsigned less than
	 {
	   //cout<<" ULT ";
	   if(unsignedopr[0] < unsignedopr[1])
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_ULE:	//< unsigned less or equal
	 {
	   //cout<<" ULE ";
	   if(unsignedopr[0] <= unsignedopr[1])
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_SGT:	//< signed greater than
	 {
	   //cout<<" SGT ";
	   if(opr1->getInt() > opr2->getInt())
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_SGE:	//< signed greater or equal
	 {
	   //cout<<" SGE ";
	   if(opr1->getInt() >= opr2->getInt())
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_SLT:	//< signed less than
	 {
	   //cout<<" SLT ";
	   if(opr1->getInt() < opr2->getInt())
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       case CmpInst::ICMP_SLE:	//< signed less or equal
	 {
	   //cout<<" SLE ";
	   if(opr1->getInt() <= opr2->getInt())
	     result = 1;
	   else
	     result = 0;
	   break;
	 }
       default:
	 break;
       }
     }
  return result;
}

/*Binary Operations　ADD:加算 SUB:減算 MUL:乗算 DIV:除算　REM:剰余*/
void BinaryOpSwitch(unsigned opcode,RegTableELE *reg,IRegs *opr1,IRegs *opr2){
  switch(opcode){
  case Instruction::Add:
    {
      reg->setValue(static_cast<int>(opr1->getInt()+opr2->getInt()));
      break;
    }
  case Instruction::Sub:
    {
      reg->setValue(static_cast<int>(opr1->getInt()-opr2->getInt()));
      break;
    }
  case Instruction::Mul:
    {
      reg->setValue(static_cast<int>(opr1->getInt()*opr2->getInt()));
      break;
    }
  case Instruction::UDiv:
    {
      reg->setValue(static_cast<int>(abs(opr1->getInt()/opr2->getInt())));
      break;
    }
  case Instruction::URem:
    {
      reg->setValue(static_cast<int>(abs(opr1->getInt()%opr2->getInt())));
      break;
    }
  case Instruction::SDiv:
    {
      reg->setValue(static_cast<int>(opr1->getInt()/opr2->getInt()));
      break;
    }
  case Instruction::SRem:
    {
      reg->setValue(static_cast<int>(opr1->getInt()%opr2->getInt()));
      break;
    }
  case Instruction::FAdd:
    {
      reg->setValue(static_cast<double>(opr1->getDouble()+opr2->getDouble()));
      break;
    }
  case Instruction::FSub:
    {
      reg->setValue(static_cast<double>(opr1->getDouble()-opr2->getDouble()));
      break;
    }
  case Instruction::FMul:
    {
      reg->setValue(static_cast<double>(opr1->getDouble()*opr2->getDouble()));
      break;
    }
  case Instruction::FDiv:
    {
      reg->setValue(static_cast<double>(opr1->getDouble()/opr2->getDouble()));
      break;
    }
  case Instruction::FRem:
    {
      reg->setValue(static_cast<double>(fmod(opr1->getDouble(),opr2->getDouble())));
      break;
    }
  case Instruction::Shl://shift left logical
    {
      reg->setValue(static_cast<int>(opr1->getInt()<<opr2->getInt()));
      break;
    }
  case Instruction::LShr://shift right logical
    {
      reg->setValue(static_cast<int>(opr1->getInt()>>opr2->getInt()));
      break;
    }
  case Instruction::AShr://shift right Arithmetic
    {
      cerr<<"not define"<<endl;
      reg->setValue(static_cast<int>(opr1->getInt()<<opr2->getInt()));
      break;
    }
  case Instruction::And:
    {
      reg->setValue(static_cast<int>(opr1->getInt()&opr2->getInt()));
      break;
    }
  case Instruction::Or:
    {
      reg->setValue(static_cast<int>(opr1->getInt()|opr2->getInt()));
      break;
    }
  case Instruction::Xor:
    {
      reg->setValue(static_cast<int>(opr1->getInt()^opr2->getInt()));
    }
  }
  return ;
}

inline unsigned IRSim::myGetElementPtr(Value *OP[],unsigned oprs){
  /*あまり良くない実装*/
  ImmediateValue<int> imm[oprs];
  IRegs *Iget[oprs];		// 即値とレジスタの値のget関数インターフェース
  RegTableELE *reg[oprs];		// レジスタ操作インターフェース
  /*先頭のオペランドはPointerType*/
  PointerType *ptrType = dyn_cast<PointerType>(OP[0]->getType());
  if(ptrType == NULL)
    {
      cerr<<"GetElementPtr: Invalid Operand"<<endl;
      exit(1);
    }
  reg[0] = RegT.setRegAdd(0,OP[0]->getName().str(),false);
  for(int i = 1;i < oprs;i++)
    {
      /*ベースからのオフセット*/
      if(OP[i]->getType()->getTypeID() == Type::IntegerTyID)
	{
	  ConstantInt *Imm = dyn_cast<ConstantInt>(OP[i]);
	  /*即値の場合*/
	  if(Imm != NULL)
	    {
	      imm[i].setValue(Imm->getSExtValue());
	      Iget[i] = &imm[i];
	    }
	  else
	    {
	      reg[i] = RegT.setRegInt(0,OP[i]->getName().str(),false);
	      Iget[i] = reg[i];
	    }
	}
    }
  switch(ptrType->getElementType()->getTypeID()){
  case Type::ArrayTyID:
    {
      
      ArrayType *arrayTy = dyn_cast<ArrayType>(ptrType->getElementType());
      CalcArrayRtn ArraySize = Mem.CalcArraySize(arrayTy);
      unsigned addr = reg[0]->getAdd()+ArraySize.size*Iget[1]->getInt()+static_cast<unsigned>(Iget[2]->getInt());
      //cerr<<"myGetElementPtr: this pointer is ArrayType & Addr = "<<addr<<endl;
      return addr;
    }
  case Type::StructTyID:
    {
      StructType *structTy = dyn_cast<StructType>(ptrType->getElementType());
      unsigned size = Mem.CalcStructSize(structTy);
      unsigned addr = reg[0]->getAdd()+size*Iget[1]->getInt()+static_cast<unsigned>(Iget[2]->getInt());
      //cerr<<"myGetElementPtr: this pointer is StructType & Addr="<<addr<<endl;
      //RegT.dump();
      //Mem.dump();
      return addr;
    }
  default:
    break;
  }
  return 0;
}
