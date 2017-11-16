#include"IRSim4.hpp"

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
  IRFile = FileName;
  Run();
  return ;
}

void IRSim::Run(){
  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  std::unique_ptr<Module> Owner = parseIRFile(IRFile.c_str(),Err,Context);
  if(!Owner){
    Err.print(IRFile.c_str(),errs());
    return ;
  }
  
  
  Mod = Owner.get();
  AllocateGlobalVariables(Mod);
  for(Module::iterator FNIte = Mod->begin(),FNIteEnd = Mod->end();
      FNIte != FNIteEnd;
      FNIte++)
    {
      RunFunction(FNIte);
    }
  outs()<<"--------Run End--------\n\n";
  dump();
  return;
}

int IRSim::RunFunction(llvm::Function *CurFn){
  RunInstResult rtn;
  outs()<<"\n"<<CurFn->getName()<<"\n";
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
  outs()<<"\n"<<FunctionName<<"\n";
  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  std::unique_ptr<Module> Owner = parseIRFile(IRFile.c_str(),Err,Context);
  if(!Owner)
    {
      Err.print(IRFile.c_str(),errs());
      return 0;
    }
  
  Mod = Owner.get();
  AllocateGlobalVariables(Mod);
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
      outs()<<"--------Run End--------\n\n";
      dump();
    }
  else
    cerr<<"\""<<FunctionName<<"\""<<"is not found"<<endl;
  return 0;
}

RunInstResult IRSim::RunBasicBlock(llvm::BasicBlock *CurBB){
  RunInstResult rtn;
  outs()<<"\n"<<CurBB->getName()<<"\n";
  for(BasicBlock::iterator InstIte = CurBB->begin(),InstIteEnd = CurBB->end();
      InstIte != InstIteEnd;
      InstIte++)
    {
      rtn = RunInstruction(InstIte);
      if(rtn.Result == FUNCTION_RUNINST)/*call 命令*/
	RunFunction(rtn.NextFunc);
    }
  return rtn;
}


RunInstResult IRSim::RunInstruction(llvm::Instruction *CurInst){
  Value *OP[3];
  IRegs *Iget[2];		// 即値とレジスタの値のget関数インターフェース
  RegTableELE *reg[3];		// レジスタ操作インターフェース
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
	  /*値を返す処理はcall命令の処理を設計してから実装する*/
	  
	}
    }
  /*Bitwise Binary Operations&CmpInst*/
  else if(CurInst->isBinaryOp()||opcode == Instruction::ICmp||opcode == Instruction::FCmp)
    {
      Type::TypeID OperandType;
      if(CurInst->isBinaryOp())
	OperandType = CurInst->getType()->getTypeID();
      else
	OperandType = OP[0]->getType()->getTypeID();
      /*整数型あるいは符号なし整数の演算*/
      if(OperandType == Type::IntegerTyID)
	{
	  reg[0] = RegT.setRegInt(0,CurInst->getName().str());
	  ImmInt ImmValue[2];
	  for(int i = 0;i < oprs;i++)
	    {
	      ConstantInt *imm = dyn_cast<ConstantInt>(OP[i]);
	      if(imm == NULL)
		Iget[i] = RegT.RegLookUp(OP[i]->getName().str()); // NULLが帰った場合のエラー処理を追加するべき
	      else
		{
		  //ImmInt ImmValue(imm->getSExtValue());
		  ImmValue[i] = imm->getSExtValue();
		  Iget[i] = &ImmValue[i];
		}
	    }
	}
      /*double型の演算*/
      else if(OperandType == Type::DoubleTyID)
	{
	  reg[0] = RegT.setRegDouble(0,CurInst->getName().str());
	  for(int i = 0;i < oprs;i++)
	    {
	      ConstantFP *imm = dyn_cast<ConstantFP>(OP[i]);
	      if(imm == NULL)
		Iget[i] = RegT.RegLookUp(OP[i]->getName().str()); // NULLが帰った場合のエラー処理を追加するべき
	      else
		{
		  ImmDouble ImmValue(imm->getValueAPF().convertToDouble());
		  Iget[i] = &ImmValue;
		}
	    }
	}
      if(CurInst->isBinaryOp())
	BinaryOpSwitch(opcode,reg[0],Iget[0],Iget[1]);
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
    }/*Binary Operations end*/

  else
    {
      switch(opcode){
       /*Memory Operations*/
      case Instruction::Alloca:
	{
	  /*Instruction::Alloca*/
	  AllocaInst *alo = dyn_cast<AllocaInst>(CurInst);
	  Type::TypeID OperandType = alo->getAllocatedType()->getTypeID();
	  reg[0] = RegT.setRegAdd(0,CurInst->getName().str());
	  //複数の領域を確保した場合、そのレジスタはARRAY型として扱う
	  if(alo->isArrayAllocation())
	    {
	      //NULLを返すことはないはず
	      ConstantInt *imm = dyn_cast<ConstantInt>(alo->getArraySize());
	      ImmInt ImmValue(imm->getSExtValue());
	      /*確保するデータ型*/
	      if(OperandType == Type::IntegerTyID)
		reg[0]->setValue(Mem.myAllocInt(0,ImmValue.getValue()));
	      else if(OperandType == Type::DoubleTyID)
		reg[0]->setValue(Mem.myAllocDouble(0,ImmValue.getValue()));
	      reg[0]->setKind(ARRAY);
	    }
	  else
	    {
	      if(OperandType == Type::IntegerTyID)
		reg[0]->setValue(Mem.myAllocInt());
	      else if(OperandType == Type::DoubleTyID)
		reg[0]->setValue(Mem.myAllocDouble());
	    }
	  break;
	}
      case Instruction::Store:
	{
	  /*Instruction::Store*/
	  /*STOREのオペランドに名前のついていないレジスタは登場しない,即値はありえる*/
	  Type::TypeID OperandType = OP[0]->getType()->getTypeID();
	  if(OperandType == Type::IntegerTyID)
	    {
	      ImmInt ImmValue;
	      ConstantInt *imm = dyn_cast<ConstantInt>(OP[0]);
	      reg[1] = RegT.setRegInt(0,OP[1]->getName().str());
	      if(imm == NULL)
		Iget[0] = RegT.RegLookUp(OP[0]->getName().str());
	      else
		{
		  ImmValue.setValue(imm->getSExtValue());
		  Iget[0] = &ImmValue;
		}
	      Mem.getPtr(reg[1]->getAdd())->setData(Iget[0]->getInt());
	    }
	  else if(OperandType == Type::DoubleTyID)
	    {
	      ImmDouble ImmValue;
	      ConstantFP *imm = dyn_cast<ConstantFP>(OP[0]);
	      reg[1] = RegT.setRegDouble(0,OP[1]->getName().str());
	      if(imm == NULL)
		Iget[0] = RegT.RegLookUp(OP[0]->getName().str());
	      else
		{
		  ImmValue.setValue(imm->getValueAPF().convertToDouble());
		  Iget[0] = &ImmValue;
		}
	      Mem.getPtr(reg[1]->getAdd())->setData(Iget[0]->getDouble());
	    }
	  break;
	}
      case Instruction::Load:	
	{
	  /*Instruction::Load*/
	  /*Load命令には即値は登場しない*/
	  /*ロードするデータの型*/
	  Type::TypeID OperandType = CurInst->getType()->getTypeID();
	  /*OP[0]はメモリへのポインタのレジスタ 必ず登録済み*/
	  reg[1] = RegT.RegLookUp(OP[0]->getName().str());
	  if(OperandType == Type::IntegerTyID)
	    {
	      reg[0] = RegT.setRegInt(0,CurInst->getName().str());
	      reg[0]->setValue(Mem.getPtr(reg[1]->getAdd())->getInt());
	    }
	  else if(OperandType == Type::DoubleTyID)
	    {
	      reg[0] = RegT.setRegDouble(0,CurInst->getName().str());
	      reg[0]->setValue(Mem.getPtr(reg[1]->getAdd())->getDouble());
	    }
	  break;
	}
      case Instruction::Call:
	{
	  /*Instruction::Call:*/
	  Type::TypeID rtnType = CurInst->getType()->getTypeID();
	  if(rtnType == Type::IntegerTyID)
	    RegT.setRegInt(0,CurInst->getName().str());
	  else if(rtnType == Type::DoubleTyID)
	    RegT.setRegDouble(0,CurInst->getName().str());
	  else
	    RegT.setRegAdd(0,CurInst->getName().str());
	  cerr<<"\tCall "<<oprs<<" ";
	  for(int i = 0;i < oprs;i++)
	    cerr<<OP[i]->getName().str()<<" ";
	  cerr<<endl;
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
