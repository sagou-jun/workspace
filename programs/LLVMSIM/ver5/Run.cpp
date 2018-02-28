#include"IRSim5.hpp"

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
  for(Module::iterator FNIte = Mod->begin(),FNIteEnd = Mod->end();
      FNIte != FNIteEnd;
      FNIte++)
    {
      RunFunction(FNIte);
    }
  cout<<"--------Run End--------\n\n";
  dump();
  return;
}

int IRSim::RunFunction(llvm::Function *CurFn){
  RunInstResult rtn;
  cout<<"\n"<<CurFn->getName().str()<<"\n";
  for(Function::iterator BBIte = CurFn->begin(),BBIteEnd = CurFn->end();
      BBIte != BBIteEnd;
      BBIte++)
    {
      rtn = RunBasicBlock(BBIte);
      switch(rtn.Result){
      case BRANCH_RUNINST:
	{
	  BBIte = rtn.NextBB;
	  BBIte--;
	  continue;
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

   for(Module::iterator FNIte = Mod->begin(),FNIteEnd = Mod->end();
      FNIte != FNIteEnd;
      FNIte++)
    {
      if(FNIte->getName().str() == FunctionName)
	{
	  RunFunction(FNIte);
	  check = true;
	  break;
	}
    }
  if(check)
    {
      cout<<"--------Run End--------\n\n";
      //dump();
    }
  else
    cerr<<"\""<<FunctionName<<"\""<<"is not found"<<endl;
  return 0;
}

RunInstResult IRSim::RunBasicBlock(llvm::BasicBlock *CurBB){
  RunInstResult rtn;
  cout<<"\n\t"<<CurBB->getName().str()<<"\n";
  for(BasicBlock::iterator InstIte = CurBB->begin(),InstIteEnd = CurBB->end();
      InstIte != InstIteEnd;
      InstIte++)
    {
      rtn = RunInstruction(InstIte);
      if(rtn.Result == FUNCTION_RUNINST)/*call 命令*/
	{
	  RunFunction(rtn.NextFunc);
	  cout<<CurBB->getParent()->getName().str()<<endl;
	}
      else if(rtn.Result == RETURN_RUNINST)
	{
	  return rtn;
	}
    }
  return rtn;
}

/*
 *Br,(RET)
 *BinaryOp,CmpInst
 *Alloca,Store,Load,GEP
 *(Call)
 */
RunInstResult IRSim::RunInstruction(llvm::Instruction *CurInst){
  Value *OP[5];
  IRegs *Iget[2];	// 即値とレジスタの値のget関数インターフェース
  RegTableELE *reg[3];	// レジスタ操作インターフェース
  unsigned opcode = CurInst->getOpcode();
  unsigned oprs = CurInst->getNumOperands();
  RunInstResult rtn;
  rtn.Result = NORMAL_RUNINST;
  //errs()<<*CurInst<<" "<<oprs<<"\n";
  //cerr<<CurInst->getOpcodeName()<<":"<<oprs<<endl;
  for(int i = 0;i < oprs;i++)
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
	  rtn.Result = RETURN_RUNINST;
	  return rtn;
	}
    }
  /*Bitwise Binary Operations&CmpInst*/
  else if(CurInst->isBinaryOp()||opcode == Instruction::ICmp||opcode == Instruction::FCmp)
    {
      /*あまり良くない実装*/
      ImmInt ImmValueI[2];
      ImmDouble ImmValueD[2];
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
      PC++;
    }
  /*CastInst*/
  else if(CurInst->isCast())
    {
      /*未実装*/
      switch(opcode){
      case Instruction::SExt:
      case Instruction::Trunc:
	{
	  ImmInt imm;
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
    {
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
	      ImmInt ImmValue(imm->getSExtValue());
	      /*確保するデータ型*/
	      if(OperandType == Type::IntegerTyID)
		reg[0] = RegT.setRegAdd(Mem.myAllocInt(0,ImmValue.getValue()),CurInst->getName().str());
	      else if(OperandType == Type::DoubleTyID)
		reg[0] = RegT.setRegAdd(Mem.myAllocDouble(0,ImmValue.getValue()),CurInst->getName().str());
	      reg[0]->setKind(ARRAY);
	    }
	  /*ここまでの部分はLLVMIRの仕様で定義された複数の領域を確保するための処理だが、
	    どのようなCコードから生成した場合に動くのか分かっていない
	    フロントエンドにclang 3.6.2を使用した場合、少なくともArray型の確保には使用されない*/
	  else
	    {
	      if(OperandType == Type::IntegerTyID)
		reg[0] = RegT.setRegAdd(Mem.myAllocInt(),CurInst->getName().str());
	      else if(OperandType == Type::DoubleTyID)
		reg[0] = RegT.setRegAdd(Mem.myAllocDouble(),CurInst->getName().str());
	      else if(OperandType == Type::ArrayTyID)
		reg[0] = RegT.setRegAdd(Mem.myAllocArray(dyn_cast<ArrayType>(alo->getAllocatedType())),
					CurInst->getName().str());
	      else if(OperandType == Type::StructTyID)
       		reg[0] = RegT.setRegAdd(Mem.myAllocStruct(dyn_cast<StructType>(alo->getAllocatedType())),
					CurInst->getName().str());
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
	      ImmInt ImmValue;
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
	      ImmDouble ImmValue;
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
	  switch(CurInst->getType()->getTypeID()){
	  case Type::IntegerTyID:
	    {
	      reg[0] = RegT.setRegInt(0,CurInst->getName().str());
	      break;
	    }
	  case Type::DoubleTyID:
	    {
	      reg[0] = RegT.setRegDouble(0,CurInst->getName().str());
	      break;
	    }
	  case Type::VoidTyID:
	    {
	      rtn.Result = FUNCTION_RUNINST;
	      rtn.NextFunc = callinst->getCalledFunction();
	      //return rtn;
	      break;
	    }
	  default:
	    RegT.setRegAdd(0,CurInst->getName().str());
	    break;
	  }
	  break;
	}
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
  ImmInt imm[oprs];
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
