#include"IRSim3.h"

using namespace llvm;

void IRSim::Run(std::string FileName){
  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  std::unique_ptr<Module> Owner = parseIRFile(FileName.c_str(),Err,Context);
  if(!Owner){
    Err.print(FileName.c_str(),errs());
    return ;
  }
  

  Module *Mod = Owner.get();
  /*
  for(Module::global_iterator GLIte = Mod->global_begin(),GLIteEnd = Mod->global_end();
      GLIte != GLIteEnd;
      GLIte++)
    {
      
    }
  */
  for(Module::iterator FNIte = Mod->begin(),FNIteEnd = Mod->end();
      FNIte != FNIteEnd;
      FNIte++)
    {
      RunFunction(FNIte);
    }
  outs()<<"--------Run End--------\n\n";
  //dump();
  return;
}

int IRSim::RunFunction(llvm::Function *CurFn){
  RunInstResult rtn;
  outs()<<"\n"<<CurFn->getName()<<"\n";
  int count = 0;
  for(Function::iterator BBIte = CurFn->begin(),BBIteEnd = CurFn->end();
      BBIte != BBIteEnd;
      BBIte++)
    {
      rtn = RunBasicBlock(BBIte);
      switch(rtn.InstResult){
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

RunInstResult IRSim::RunBasicBlock(llvm::BasicBlock *CurBB){
  RunInstResult rtn;
  outs()<<"\n"<<CurBB->getName()<<"\n";
  for(BasicBlock::iterator INIte = CurBB->begin(),INIteEnd = CurBB->end();
      INIte != INIteEnd;
      INIte++)
    {
      rtn = RunInstruction(INIte);
      if(rtn.InstResult == FUNCTION_RUNINST)/*call 命令*/
	RunFunction(rtn.NextFunc);
    }
  return rtn;
}

RunInstResult IRSim::RunInstruction(Instruction *CurInst){
  RegTableELE *OP[3];
  //int value[3];
  int IMM[3];
  unsigned oprs = CurInst->getNumOperands();
  RunInstResult rtn;
  int immcount;
  rtn.NextBB = NULL;
  rtn.NextFunc = NULL;
  /*
  static bool traceflag = false;
  if(!traceflag)
    {
      string traceName = "inc";
      RegTableELE *cmp = RegLookUp(traceName);
      if(cmp != NULL)
	{
	  cmp->setTrace();
	  cerr<<"trace start "<<cmp->getName()<<endl;
	  traceflag = true;
	}
    }
  */
  //outs()<<*CurInst<<"\t:"<<CurInst->getOpcodeName()<<" "<<oprs<<" ";
  switch(CurInst->getOpcode()){
  case Instruction::Alloca:
    {
      //outs()<<"ALLOCA\n";
      if(CurInst->hasName())/*代入先のレジスタに名前がついているか判定する*/
	OP[0] = setReg(CurInst->getName(),POINTER);
      else
	{
	  /*レジスタの命名*/
	  std::string testname = RegNameGen();
	  StringRef RN(testname);
	  Twine RegName(RN);
	  CurInst->setName(RegName);
	  OP[0] = setReg(0,CurInst->getName(),POINTER);
	}
      AllocaInst *alo = dyn_cast<AllocaInst>(CurInst);
      if(alo->isArrayAllocation())/*複数の領域を確保する場合*/
	{
	  ConstantInt *imm = dyn_cast<ConstantInt>(alo->getArraySize());
	  if(imm != NULL)
	    {
	      IMM[1] = static_cast<int>(imm->getSExtValue());
	      PC++;
	      OP[0]->setAddress(Mem->myAlloc(IMM[1]));
	    }
	}
      else
	{
	  IMM[1] = 0;
	  //setOpration(ALLOC,OP[0],IMM[1]);
	  PC++;
	  OP[0]->setAddress(Mem->myAlloc(0));
	}
      break;
    }
  case Instruction::Store:
    {
      //errs()<<"STORE";
      /*ストア先のレジスタが登録されていなければエラー*/
      /*
      if(CurInst->getOperand(1)->hasName())
	{
	  if((OP[0] = RegLookUp(CurInst->getOperand(1)->getName().str())) == NULL)
	    {
	      errs()<<"STORE::invaild operand\n";
	    }
	}
      */
      OP[0] = RegLookUp(CurInst->getOperand(1)->getName().str);
      ConstantInt *imm = dyn_cast<ConstantInt>(CurInst->getOperand(0));
      Type::TypeID OperandType = CurInst->getOperand(0)->getType()->getTypeID();
      if(imm == NULL)/*オペランドがレジスタの場合*/
	{
	  if(CurInst->getOperand(0)->hasName())/*レジスタに名前がついている場合*/
	    {
	      if((OP[1] = RegLookUp(CurInst->getOperand(0)->getName().str())) == NULL)/*未登録の場合*/
		{
		  if(OperandType == Type::IntegerTyID)
		    OP[1] = setReg(0,CurInst->getOperand(0)->getName(),INTEGER);
		  else if(OperandType == Type::DoubleTyID)
		    OP[1] = setReg(0,CurInst->getOperand(0)->getName(),DOUBLE);
	        }
	      PC++;
	      if(OperandType == Type::IntegerTyID)
		Mem->setData(OP[0]->getAddress(),OP[1]->getValue());
	      else if(OperandType == Type::DoubleTyID)
		Mem->setData(OP[0]->getAddress(),OP[1]->getDValue());
	    }
	  else/*オペランドに名前がついていない場合はparseの時点ででエラーが出る*/
	    {
	      errs()<<"STORE:invalid operands\n";
	    }
	  //setOpration(STORE,OP[0],OP[1]);
	}
      else/*即値の場合*/
	{
	  IMM[1] = static_cast<int>(imm->getSExtValue());
	  //errs()<<"IMM="<<imm->getSExtValue()<<" ";
	  //fprintf(stderr," %lf\n",IMM[1]);
	  PC++;
	  Mem->setData(OP[0]->getAddress(),IMM[1]);
	}
      break;
    }
  case Instruction::ICmp:
    {
      //outs()<<"ICmp";
      int oprand[2];
      int result;
      if(CurInst->hasName())/*代入先のレジスタに名前がついているか判定する*/
	{
	  OP[0] = setReg(CurInst->getName(),INTEGER);
	}
      else			/*名前がついていなければ名前をつける*/
	{
	  /*レジスタの命名*/
	  std::string testname = RegNameGen();
	  StringRef RN(testname);
	  Twine RegName(RN);
	  CurInst->setName(RegName);
	  OP[0] = setReg(0,CurInst->getName(),INTEGER);
	}
      for(unsigned i = 1;i <= oprs;i++)
	{
	  ConstantInt *imm = dyn_cast<ConstantInt>(CurInst->getOperand(i-1));
	  if(imm == NULL)	/*オペランドがレジスタの場合*/
	    {
	      if(CurInst->getOperand(i-1)->hasName())
		{
		  OP[i] = setReg(CurInst->getOperand(i-1)->getName(),INTEGER);
		}
	      else	         /*オペランドに名前がついていない場合はparseでエラーが出る*/
		{
		  errs()<<"ICMP:Invalid operands\n";
		}
	      //outs()<<" "<<i<<":"<<CurInst->getOperand(i-1)->getName()<<" ";
	      oprand[i-1] = OP[i]->getValue();
	    }
	  else			/* オペランドが即値の場合*/
	    {
	      //outs()<<" IMM ";
	      IMM[i] = static_cast<int>(imm->getSExtValue());
	      //outs()<<" "<<i<<":"<<imm->getSExtValue();
	      oprand[i-1] = IMM[i];
	    }
	}
      ICmpInst *cmpInst = dyn_cast<ICmpInst>(CurInst);
      //outs()<<oprand[0]<<" "<<oprand[1];
      result = CmpResult(cmpInst,oprand[0],oprand[1]);
      //outs()<<" result="<<result<<"\n";
      OP[0]->setValue(result);
      break;
    }
  case Instruction::Br:
    {
      //outs()<<"Br";
      BranchInst *BrInst = dyn_cast<BranchInst>(CurInst);
      if(BrInst->isUnconditional())
	{
	  //outs()<<" Unconditional "<<BrInst->getSuccessor(0)->getName()<<"\n";
	  rtn.NextBB = BrInst->getSuccessor(0);
	  rtn.InstResult = BRANCH_RUNINST;
	  return rtn;
	}
      else if(BrInst->isConditional())
	{
	  //outs()<<" Conditional ";
	  if(CurInst->getOperand(0)->hasName())//レジスタに名前がついている場合
	    {
	      OP[0] = RegLookUp(CurInst->getOperand(0)->getName().str());
	      //outs()<<CurInst->getOperand(0)->getName();
	    }
	  else		        /*オペランドに名前がついていない場合はparseでエラーが出る*/
	    errs()<<"Br:invalid condition\n";
	  if(OP[0]->getValue())
	    {
	      //outs()<<BrInst->getSuccessor(0)->getName()<<"\n";
	      rtn.NextBB = BrInst->getSuccessor(0);
	      rtn.InstResult = BRANCH_RUNINST;
	      return rtn;
	    }
	  else
	    {
	      //outs()<<BrInst->getSuccessor(1)->getName()<<"\n";
	      rtn.NextBB = BrInst->getSuccessor(1);
	      rtn.InstResult = BRANCH_RUNINST;
	      return rtn;
	    }
	}
      else
	{
	  errs()<<"Br undefined Branch\n";
	  rtn.InstResult = ERROR_RUNINST;
	  return rtn;
	}
      break;
    }
  case Instruction::Add:
    //errs()<<"ADD";
    if(CurInst->hasName())/*代入先のレジスタに名前がついているか確認*/
      OP[0] = setReg(0,CurInst->getName(),INTEGER);
    else
      {
	/*レジスタの命名*/
	std::string testname = RegNameGen();
	StringRef RN(testname);
	Twine regName(RN);
	CurInst->setName(regName);
	OP[0] = setReg(0,CurInst->getName(),INTEGER);
      }
    immcount = 0;
    for(unsigned i = 1;i <= oprs;i++)
      {
	ConstantInt *imm = dyn_cast<ConstantInt>(CurInst->getOperand(i-1));
	if(imm == NULL)/*オペランドがレジスタの場合*/
	  {
	    if(CurInst->getOperand(i-1)->hasName())
	      OP[i] = setReg(CurInst->getOperand(i-1)->getName(),INTEGER);
	    else		/*オペランドに名前がついていない場合はparseでエラーが出る*/ 
	      {
		errs()<<"ADD:invalid operands\n";
	      }
	  }
	else /*オペランドが即値の場合*/
	  {
	    IMM[i] = static_cast<int>(imm->getSExtValue());
	    immcount++;
	  }
      }
    switch(immcount){
    case 0:
      //setOpration(ADD,OP[0],OP[1],OP[2]);
      PC++;
      //outs()<<" "<<OP[1]->getName()<<":"<<OP[1]->getValue()<<" "<<OP[2]->getName()<<":"<<OP[2]->getValue()<<"\n";
      OP[0]->setValue((OP[1]->getValue())+(OP[2]->getValue()));
      break;
    case 1:
      //setOpration(ADD,OP[0],OP[1],IMM[2]);
      PC++;
      //outs()<<" "<<OP[0]->getName()<<":"<<OP[1]->getName()<<"("<<OP[1]->getValue()<<")"
      //<<" "<<static_cast<int>(IMM[2])<<"\n";
      OP[0]->setValue((OP[1]->getValue())+IMM[2]);
      break;
    case 2:
      //setOpration(ADD,OP[0],IMM[1],IMM[2]);
      PC++;
      //outs()<<" "<<static_cast<int>(IMM[1])<<" "<<static_cast<int>(IMM[2])<<"\n";
      OP[0]->setValue(IMM[1]+IMM[2]);
      break;
    default:
      errs()<<"ADD:invalid operands\n";
      rtn.InstResult = ERROR_RUNINST;
      return rtn;
    }
    break;
  case Instruction::Load:
    {
      //errs()<<"LOAD";
      if(CurInst->hasName())/*代入先のレジスタに名前がついているか判定する*/
	OP[0] = setReg(0,CurInst->getName(),INTEGER);
      else			/*名前がついていない場合*/ 
	{
	  std::string testname = RegNameGen();
	  StringRef RN(testname);
	  Twine RegName(RN);
	  CurInst->setName(RegName);
	  if(CurInst->getType()->getTypeID() == Type::IntegerTyID)
	    OP[0] = setReg(0,CurInst->getName(),INTEGER);
	  else if(CurInst->getType()->getTypeID() == Type::DoubleTyID)
	    OP[0] = setReg(0,CurInst->getName(),DOUBLE);
	}
      /*ロード元のポインタを表すレジスタが登録されていなければエラー*/
      if(CurInst->getOperand(0)->hasName())
	{
	  OP[1] = RegLookUp(CurInst->getOperand(0)->getName());
	  if(OP[1] == NULL)
	    {
	      errs()<<"LOAD:invalid operands";
	      rtn.InstResult = ERROR_RUNINST;
	      return rtn;
	    }
	}
      //setOpration(LOAD,OP[0],OP[1]);
      PC++;
      //errs()<<" Memory("<<OP[1]->getAddress()<<")>>"<<OP[0]->getName()<<"\n";
      
      OP[0]->setValue(Mem->getData(OP[1]->getAddress()));
      break;
    }
  case Instruction::Ret:
    {
      //outs()<<"Ret\n";
      break;
    }
  case Instruction::Call:
    {
      //outs()<<"Call\n";
      hello();
      break;
    }
  default:
    errs()<<"Instruction not declare\n";
    rtn.InstResult = ERROR_RUNINST;
    return rtn;
  }

  rtn.InstResult = NORMAL_RUNINST;
  return rtn;
}

int IRSim::CmpResult(CmpInst *cmpInst,int op1,int op2){
  int unsignedop[2] = {abs(op1),abs(op2)};
  int result;
  
  switch(cmpInst->getPredicate()){
  case CmpInst::ICMP_EQ:	//< equal
    {
      //outs()<<" EQ ";
      if(op1 == op2)
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_NE:	//< not equal
    {
      //outs()<<" NEQ ";
      if(op1 != op2)
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_UGT:	//< unsigned greater than
    {
      //outs()<<" UGT ";
      if(unsignedop[0] > unsignedop[1])
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_UGE:	//< unsigned greater or equal
    {
      //outs()<<" UGE ";
      if(unsignedop[0] >= unsignedop[1])
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_ULT:	//< unsigned less than
    {
      //outs()<<" ULT ";
      if(unsignedop[0] < unsignedop[1])
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_ULE:	//< unsigned less or equal
    {
      //outs()<<" ULE ";
      if(unsignedop[0] <= unsignedop[1])
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_SGT:	//< signed greater than
    {
      //outs()<<" SGT ";
      if(op1 > op2)
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_SGE:	//< signed greater or equal
    {
      //outs()<<" SGE ";
      if(op1 >= op2)
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_SLT:	//< signed less than
    {
      //outs()<<" SLT ";
      if(op1 < op2)
	result = 1;
      else
	result = 0;
      break;
    }
  case CmpInst::ICMP_SLE:	//< signed less or equal
    {
      //outs()<<" SLE ";
      if(op1 <= op2)
	result = 1;
      else
	result = 0;
      break;
    }
  default:
    break;
  }
  return result;
}

std::string RegNameGen(){
  static int RegNo = 0;
  ostringstream oss;
  oss<<"reg"<<RegNo;
  RegNo++;
  //fprintf(stderr,"RegNameGen generate %s\n",oss.str().c_str());
  return oss.str();
}

IRSim::IRSim(){
  //OPLIST = new OPList;
  RegT = new RegTable;
  Mem = new myMemory;
  lastRegID = 0;
  PC = 0;
  call_print_hello = 0;
}

IRSim::~IRSim(){
  //delete OPLIST;
  delete RegT;
  delete Mem;
}

void IRSim::dump(){
  cerr<<"RegID:Value:DValue:Address:Name:kind"<<endl;
  for(RegTable::iterator reg_ite = RegT->begin(),reg_ite_end = RegT->end();
      reg_ite != reg_ite_end;
      reg_ite++)
    {
      (*reg_ite).dump();
    }
  Mem->dump();
}

/*レジスタの検索*/
RegTableELE *IRSim::RegLookUp(unsigned OP){
  for(RegTable::iterator RegT_ite = RegT->begin(),RegT_ite_end = RegT->end();
      RegT_ite != RegT_ite_end;
      RegT_ite++)
    {
      if((*RegT_ite).getRegID() == OP)
	return (*RegT_ite).getPointer();
    }
  return NULL;/*見つからなかった場合*/
}

RegTableELE *IRSim::RegLookUp(string regName){
  for(RegTable::iterator RegT_ite = RegT->begin(),RegT_ite_end=RegT->end();
      RegT_ite != RegT_ite_end;
      RegT_ite++)
    {
      if((*RegT_ite).getName() == regName)
	return (*RegT_ite).getPointer();
    }
  return NULL;/*見つからなかった場合*/
}

/*同じ名前のレジスタが登録されていなければその名前のレジスタを登録する*/
RegTableELE *IRSim::setReg(int value,string name,KIND k){
  RegTableELE *temp;
  if((temp = RegLookUp(name)) == NULL)
    {
      RegTableELE NewReg(lastRegID++,value,name,k);
      RegT->push_back(NewReg);
      return (RegT->back()).getPointer();
    }
  else if(temp->getKind() != k)
    return NULL;		/*エラー*/
  return temp;
}

RegTableELE *IRSim::setReg(string name,KIND k){
  RegTableELE *temp;
  if((temp = RegLookUp(name)) == NULL)
    {
      RegTableELE NewReg(lastRegID++,0,name,k);
      RegT->push_back(NewReg);
      return (RegT->back()).getPointer();
    }
  else if(temp->getKind() != k)
    return NULL;		/*エラー*/ 
  return temp;
}

void IRSim::print_RegT(){
  cout<<"RegID:Value:Address:Name:Kind"<<endl;
  for(RegTable::iterator reg_ite = RegT->begin(),reg_ite_end = RegT->end();
      reg_ite != reg_ite_end;
      reg_ite++)
    {
      (*reg_ite).print();
    }
}

void IRSim::print_Mem(){
  Mem->print();
}

RegTableELE::RegTableELE(){
  RegID = 0;
  Value = 0;
  Address = 0;
  //Name = "\0";
  kind = Other;
  trace = false;
}

RegTableELE::RegTableELE(unsigned id,unsigned value,string name,KIND k){
  RegID = id;
  Value = 0;
  DValue = 0;
  Address = value;
  Name = name;
  kind = k;
  trace = false;
}

RegTableELE::RegTableELE(unsigned id,int value,string name,KIND k){
  RegID = id;
  Value = value;
  DValue = 0;
  Address = 0;
  Name = name;
  kind = k;
  trace = false;
}

RegTableELE::RegTableELE(unsigned id,double value,string name,KIND k){
  RegID = id;
  DValue = value;
  Value = 0;
  Address = 0;
  Name = name;
  kind = k;
  trace = false;
}

void RegTableELE::print(){
  cout<<RegID<<":"<<Name<<":";
  switch(kind){
  case INTEGER:
    cout<<Value<<":INTEGER"<<endl;
    break;
  case STRING:
    cout<<Value<<":String"<<endl;
    break;
  case LABEL:
    cout<<"LABEL"<<endl;
    break;
  case POINTER:
    cout<<Address<<":POINTER"<<endl;
    break;
  default:
    cout<<"Other"<<endl;
  }
}

void RegTableELE::dump(){
  cerr<<RegID<<":"<<Value<<":"<<DValue<<":"<<Address<<":"<<Name<<":"<<kind<<endl;
  return;
}

string RegTableELE::str_Kind(){
  switch(kind){
  case INTEGER:
    return "INTEGER";
  case STRING:
    return "String";
  case LABEL:
    cout<<"LABEL";
  case POINTER:
    return "POINTER";
  default:
    return "Other";
  }
}

/*静的メンバ変数の実体*/
unsigned myMemory::MemELE::AddressCounter = 0;

myMemory::MemELE::MemELE(){
  Address = AddressCounter++;
  Data = 0;
  StringData = "\0";
  check = false;
  region = false;
  memKind = mem_none;
}

bool myMemory::MemELE::print(){
  if(check == true)
    {
      if(memKind == mem_string)
	cout<<Address<<":"<<StringData<<"(string)"<<endl;
      else if(memKind == mem_int)
	cout<<Address<<":"<<Data<<"(integer)"<<endl;
      else if(memKind == mem_double)
	fprintf(stdout,"%d:%lf(double)\n",Address,DoubleData);
      return true;
    }
  else
    return false;
}

void myMemory::MemELE::dump(){
  cerr<<Address<<":"<<Data<<":"<<DoubleData<<":"<<StringData<<":"<<check<<":"<<region<<":"<<memKind<<endl;
  return;
}

myMemory::myMemory(){
  /*
  for(unsigned i = 1;i < MemoryMax;i++)
    Memory[i].setAddress(i);
  */
  NumOfData = 0;
}

unsigned myMemory::getData(unsigned addr){
  int i;
  if(addr >= MemoryMax)
    cerr<<"myMemoty::getData specified addr is out of Memory address"<<endl;
  for(i = 0;i < MemoryMax;i++)
    {
      if(Memory[i].getAddress() == addr)
	if(Memory[i].getcheck())/*データが有効な場合*/
	  return Memory[i].getData();
    }
  
  return 0;
}

string myMemory::getStringData(unsigned addr){
  int i;
  string ret;
  if(addr >= MemoryMax)
    cerr<<"myMemoty::getData specified addr is out of Memory address"<<endl;
  for(i = 0;i < MemoryMax;i++)
    {
      if(Memory[i].getAddress() == addr)
	if(Memory[i].getcheck())/*データが有効な場合*/
	  return Memory[i].getStringData();
    }
  
  return "\0";
}

void myMemory::setData(unsigned addr,int data){
  int i;
  if(addr >= MemoryMax)
    cerr<<"myMemoty::getData specified addr is out of Memory address"<<endl;
  else
    for(i = 0;i < MemoryMax;i++)
      {
	if(Memory[i].getAddress() == addr)
	  {
	    return Memory[i].setData(data);
	  }
      }
  
  return ;
}

void myMemory::setData(unsigned addr,string sdata){
  int i;
  if(addr >= MemoryMax)
    cerr<<"myMemoty::getData specified addr is out of Memory address"<<endl;
  else
    for(i = 0;i < MemoryMax;i++)
      {
	if(Memory[i].getAddress() == addr)
	  return Memory[i].setData(sdata);
      }
  
  return ;
}

void myMemory::setData(unsigned addr,double ddata){
  int i;
  if(addr >= MemoryMax)
    cerr<<"myMemoty::getData specified addr is out of Memory address"<<endl;
  else
    for(i = 0;i < MemoryMax;i++)
      {
	if(Memory[i].getAddress() == addr)
	  return Memory[i].setData(ddata);
      }
  
  return ;
}

void myMemory::print(){
  int disp = NumOfData;
  cout<<"Address:Data:NumOfData = "<<NumOfData<<endl;
  for(int i = 1;disp != 0;i++)
    {
      if(Memory[i].print())
	disp--;
      else
	continue;
    }
}

void myMemory::dump(){
  cerr<<"Address:Data:DoubleData:StringData:check:region:memKind"<<endl;
  for(int i = 0;i < NumOfData;i++)
    Memory[i].dump();
  return ;
}


unsigned myMemory::myAlloc(int size){
  unsigned pointer;
  int count = 0;
  int i,j;
  
  size = (size <= 0)? 1:size;
  if(NumOfData + size >= MemoryMax)
    {
      cerr<<"myMemory::myAlloc Memory is full"<<endl;
      return 0;
    }
  else
    {
      for(i = 1;i < MemoryMax;i++)
	{
	  /*連続した空き領域があればメモリ確保*/
	  if(Memory[i].getcheck() == false)
	    count++;
	  else
	    count = 0;
	  if(count == size)
	    break;
	}
      count = 0;
      pointer = Memory[i-size+1].getAddress();
      for(j = i-size+1;count < size;j++)
	{
	  Memory[j].setcheck(true);
	  count++;
	}
      Memory[j].setregion(true);
    }
  NumOfData += size;
  return pointer;
}

void myMemory::myFree(unsigned addr){
  int i,j;
  if(addr >= MemoryMax)
    cerr<<"myMemoty::getData specified addr is out of Memory address"<<endl;
  else
    {
      for(i = 1;i < MemoryMax;i++)
	{
	  if(Memory[i].getAddress() == addr)
	    break;
	}
      for(j = j;j < MemoryMax;j++)
	{
	  Memory[j].setcheck(false);
	  NumOfData--;
	  if(Memory[j].getregion())
	    {
	      Memory[j].setregion(false);
	      break;
	    }
	}
    }
  return;
}
