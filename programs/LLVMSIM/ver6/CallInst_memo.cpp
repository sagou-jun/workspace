void memo(){
  StackELE *NewStackELE = new StackELE;
  /*最後に登録したレジスタ(戻り値)のIDと命令を記録*/
  NewStackELE->RegID = RegT.getLastRegID();
  NewStackELE->Inst = CurInst;
  /*データをスタックに積む*/
  FunctionStack.push(NewStackELE);
  if(callinst == NULL)
    {
      cerr<<"IRSIM::RunInstruction::CallInst dyn_cast error"<<endl;
      exit(1);
    }
  Function *calledfunction = callinst->getCalledFunction();
  FunctionType *FnType = calledfunction->getFunctionType();
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
    Function::ArgumentListType::iterator Param_Ite = calledfunction->arg_begin(),
      Param_Ite_End = calledfunction->arg_end();
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
	switch(ArgValue->getType()->getTypeID()){
	case Type::IntegerTyID:
	  {
	    ConstantInt *imm = dyn_cast<ConstantInt>(ArgValue);
	    //即値
	    if(imm != NULL)
		    {
		      immi.setValue( imm->getSExtValue());
		      Iget = &immi;
		    }
	    else
	      Iget = RegT.RegLookUp(ArgValue->getName().str());
	    if(ParamValue->hasName())
	      RegT.setRegInt(Iget->getInt(),ParamValue->getName().str());
	    else
	      cerr<<"This Function is not defined"<<endl;
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
		Iget = &immd;
	      }
	    else
	      Iget = RegT.RegLookUp(ArgValue->getName().str());
	    if(ParamValue->hasName())
	      RegT.setRegInt(Iget->getDouble(),ParamValue->getName().str());
	    else
	      cerr<<"This Function is not defined"<<endl;
	    break;
	  }
	case Type::ArrayTyID:
	  break;
	case Type::StructTyID:
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
  rtn.NextFunc = calledfunction;
  //exit(1);
  break;
  return ;
}
