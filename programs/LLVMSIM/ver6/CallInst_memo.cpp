void memo(){
  StackELE *NewStackELE = new StackELE;
  /*�Ō�ɓo�^�������W�X�^(�߂�l)��ID�Ɩ��߂��L�^*/
  NewStackELE->RegID = RegT.getLastRegID();
  NewStackELE->Inst = CurInst;
  /*�f�[�^���X�^�b�N�ɐς�*/
  FunctionStack.push(NewStackELE);
  if(callinst == NULL)
    {
      cerr<<"IRSIM::RunInstruction::CallInst dyn_cast error"<<endl;
      exit(1);
    }
  Function *calledfunction = callinst->getCalledFunction();
  FunctionType *FnType = calledfunction->getFunctionType();
  /*�߂�l�̌^�̔���*/
  /*FunctionType�̖߂�l�̌^�Ɩ߂�l���i�[����ϐ��̌^����v���Ă��Ȃ��ꍇ�͓��얢��`*/
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
  /*�������̃��W�X�^�o�^�ƒl�̐ݒ�*/
  /*3.6.2��llvm�ł�CallInst�Ɉ�����iterator�����݂��Ȃ�*/
  unsigned ArgNum = callinst->getNumArgOperands();/*�������̐��擾*/
  unsigned ParamNum = FnType->getNumParams();/*�������̐��擾*/
  if(ArgNum < ParamNum)
    {
	    /*�������̐� < �������̐��̏ꍇ�̓G���[�Ƃ���*/
      cerr<<"CallInst::Num of Args and Params does not match"<<endl;
      exit(1);
    }
  {
    /*���[�J���ϐ��̃X�R�[�v�����p�R�[�h�u���b�N*/
    /*���ۂɈӖ������邩�ǂ����͌��؂��Ă��Ȃ�*/
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
	    //���l
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
	    //���l
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
  /*���s����֐���ύX���邽�߂̐���M���̐���*/
  rtn.Result = FUNCTION_RUNINST;
  rtn.NextFunc = calledfunction;
  //exit(1);
  break;
  return ;
}
