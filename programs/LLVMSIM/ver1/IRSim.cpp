#include"IRSim.h"
#include"MyOPCODE.h"
#include<cstdlib>

using namespace std;

std::string RegNameGen(bool isImm){
  static int RegNo = 0;
  static int ImmNo = 0;
  ostringstream oss;
  if(!isImm)
    {
      oss<<"reg"<<RegNo;
      RegNo++;
    }
  else
    {
      oss<<"imm"<<ImmNo;
      ImmNo++;
    }
  return oss.str();
}

IRSim::IRSim(){
  OPLIST = new OPList;
  RegT = new RegTable;
  Mem = new myMemory;
  lastRegID = 0;
  PC = 0;
}

IRSim::~IRSim(){
  delete OPLIST;
  delete RegT;
  delete Mem;
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
/*即値の場合は必ず新しいレジスタとして登録する*/
RegTableELE *IRSim::setReg(unsigned value,string name,KIND k){
  RegTableELE *temp;
  if(k != IMMEDIATE)		/*即値以外*/
    {
      if((temp = RegLookUp(name)) == NULL)
	{
	  RegTableELE NewReg(lastRegID++,value,name,k);
	  RegT->push_back(NewReg);
	  return (RegT->back()).getPointer();
	}
      if(temp->getKind() == INTEGER || temp->getKind() == IMMEDIATE)
	temp->setValue(value);
      else if(temp->getKind() == POINTER)
	temp->setAddress(value);
      return temp;
    }
  else				/*即値*/
    {
      RegTableELE NewReg(lastRegID++,value,name,k);
      RegT->push_back(NewReg);
      return (RegT->back()).getPointer();
    }
  
  return NULL;			/*エラー*/ 
}
  
void IRSim::Run(){
  RegTableELE *OP[3];/*オペランドのレジスタ*/
  RegTableELE *reg1 = RegLookUp(0);
  
  for(OPList::iterator OPLIST_ite = OPLIST->begin(),OPLIST_ite_end = OPLIST->end();
      OPLIST_ite != OPLIST_ite_end;
      OPLIST_ite++)
    {
      switch((*OPLIST_ite).getOPCODE()){
      case ADD:
	//cerr<<"ADD"<<endl;/*debug*/
	if((*OPLIST_ite).getNumOPRs() == 3)/*レジスタへの代入*/
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOprand(1));
	    OP[1] = RegLookUp((*OPLIST_ite).getOprand(2));
	    OP[2] = RegLookUp((*OPLIST_ite).getOprand(3));
	    if(OP[0]->getKind() != INTEGER
	       || (OP[1]->getKind() != INTEGER && OP[1]->getKind() != IMMEDIATE)
	       || (OP[2]->getKind() != INTEGER && OP[2]->getKind() != IMMEDIATE))
	      {
		cerr<<"ADD::Invaild register type op0:"<<OP[0]->str_Kind()
		    <<" op1:"<<OP[1]->str_Kind()
		    <<" op2:"<<OP[2]->str_Kind()<<endl;
		exit(1);
	      }
	    OP[0]->setValue((OP[1]->getValue()+OP[2]->getValue()));
	  }
	break;
      case SUB:
	//cerr<<"SUB"<<endl;/*debug*/
	if((*OPLIST_ite).getNumOPRs() == 3)/*レジスタへの代入*/
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOprand(1));
	    OP[1] = RegLookUp((*OPLIST_ite).getOprand(2));
	    OP[2] = RegLookUp((*OPLIST_ite).getOprand(3));
	    if(OP[0]->getKind() != INTEGER
	       || (OP[1]->getKind() != INTEGER && OP[1]->getKind() != IMMEDIATE)
	       || (OP[2]->getKind() != INTEGER && OP[2]->getKind() != IMMEDIATE))
	      {
		cerr<<"SUB::Invaild register type"<<endl;
		exit(1);
	      }
	    OP[0]->setValue((OP[1]->getValue()-OP[2]->getValue()));
	  }
	break;
      case MUL:
	//cerr<<"MUL"<<endl;/*debug*/
	if((*OPLIST_ite).getNumOPRs() == 3)/*レジスタへの代入*/
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOprand(1));
	    OP[1] = RegLookUp((*OPLIST_ite).getOprand(2));
	    OP[2] = RegLookUp((*OPLIST_ite).getOprand(3));
	    if(OP[0]->getKind() != INTEGER
	       || (OP[1]->getKind() != INTEGER && OP[1]->getKind() != IMMEDIATE)
	       || (OP[2]->getKind() != INTEGER && OP[2]->getKind() != IMMEDIATE))
	      {
		cerr<<"MUL::Invaild register type"<<endl;
		exit(1);
	      }
	    OP[0]->setValue((OP[1]->getValue()*OP[2]->getValue()));
	  }
	break;
      case UDIV:
	//cerr<<"UDIV"<<endl;/*debug*/
	if((*OPLIST_ite).getNumOPRs() == 3)/*レジスタへの代入*/
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOprand(1));
	    OP[1] = RegLookUp((*OPLIST_ite).getOprand(2));
	    OP[2] = RegLookUp((*OPLIST_ite).getOprand(3));
	    if(OP[0]->getKind() != INTEGER
	       || (OP[1]->getKind() != INTEGER && OP[1]->getKind() != IMMEDIATE)
	       || (OP[2]->getKind() != INTEGER && OP[2]->getKind() != IMMEDIATE))
	      {
		cerr<<"UDIV::Invaild register type"<<endl;
		exit(1);
	      }
	    if(OP[2]->getValue() == 0)
	      {
		cerr<<"UDIV::0 div"<<endl;
		exit(1);
	      }
	    OP[0]->setValue((OP[1]->getValue()/OP[2]->getValue()));
	  }
	break;
      case ALLOC:
	//cerr<<"ALLOC"<<endl;
	if((*OPLIST_ite).getNumOPRs() == 2)
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOprand(1));
	    OP[1] = RegLookUp((*OPLIST_ite).getOprand(2));
	    if(OP[0]->getKind() != POINTER || (OP[1]->getKind() != IMMEDIATE && OP[1]->getKind() != INTEGER))
	      {
		cerr<<"ALLOCA::Invaild register type op0:"<<OP[0]->str_Kind()<<" op1:"<<OP[1]->str_Kind();
		exit(1);
	      }
	    OP[0]->setAddress(Mem->myAlloc(OP[1]->getValue()));
	  }
	break;
      case STORE:
	//cerr<<"STORE"<<endl;
	if((*OPLIST_ite).getNumOPRs() == 2)
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOprand(1));
	    OP[1] = RegLookUp((*OPLIST_ite).getOprand(2));
	    if((OP[0]->getKind() != INTEGER && OP[0]->getKind() != IMMEDIATE) || OP[1]->getKind() != POINTER)
	      {
		cerr<<"STORE::Invaild register type"<<endl;
		exit(1);
	      }
	    Mem->setData(OP[1]->getAddress(),OP[0]->getValue());
	  }
	break;
      case LOAD:
	//cerr<<"LOAD"<<endl;
	if((*OPLIST_ite).getNumOPRs() == 2)
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOprand(1));
	    OP[1] = RegLookUp((*OPLIST_ite).getOprand(2));
	    if(OP[0]->getKind() != INTEGER || OP[1]->getKind() != POINTER)
	      {
		cerr<<"LOAD::Invaild register type"<<endl;
		exit(1);
	      }
	    OP[0]->setValue(Mem->getData(OP[1]->getAddress()));
	  }
	break;
      default:
	cerr<<"undefine Oprations"<<endl;
      }
    }
}

/*構文解析部分からのインターフェース*/
/*この関数を呼び出す前にレジスタを登録しておく必要がある*/
void IRSim::setOpration(unsigned opcode,unsigned op1,unsigned op2,unsigned op3){
  OPListELE NewOP(opcode,op1,op2,op3,3);
  OPLIST->push_back(NewOP);
  return;
}

void IRSim::setOpration(unsigned opcode,unsigned op1,unsigned op2){
  OPListELE NewOP(opcode,op1,op2,0,2);
  OPLIST->push_back(NewOP);
  return ;
}

void IRSim::print_OPLIST(){
  cout<<"OPCODE:op1:op2:op3:Numoprs"<<endl;
  for(OPList::iterator op_ite = OPLIST->begin(),op_ite_end = OPLIST->end();
      op_ite != op_ite_end;
      op_ite++)
    {
      (*op_ite).print();
    }
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

void IRSim::print_RegT_NoImm(){
  cout<<"RegID:Value:Address:Name:Kind"<<endl;
  for(RegTable::iterator reg_ite = RegT->begin(),reg_ite_end = RegT->end();
      reg_ite != reg_ite_end;
      reg_ite++)
    {
      (*reg_ite).print_NoImm();
    }
}

void IRSim::print_Mem(){
  Mem->print();
}

OPListELE::OPListELE(){
  OPCODE = 0;
  OP1 = 0;
  OP2 = 0;
  OP3 = 0;
  NumOPRs = 0;
}

OPListELE::OPListELE(unsigned opcode,unsigned op1,unsigned op2,unsigned op3,unsigned Numoprs){
  OPCODE = opcode;
  OP1 = op1;
  OP2 = op2;
  OP3 = op3;
  NumOPRs = Numoprs;
}

unsigned OPListELE::getOprand(unsigned i){
  switch(i){
  case 1:
    return OP1;
  case 2:
    return OP2;
  case 3:
    return OP3;
  default:
    cerr<<"OPListELE::getOprand Oprand"<<i<<"not exist"<<endl;
      return 0;
  }
}

void OPListELE::setOprand(unsigned op,unsigned i){
  switch(i){
  case 1:
    OP1 = op;
    break;
  case 2:
    OP2 = op;
    break;
  case 3:
    OP3 = op;
    break;
  default:
    cerr<<"OPListELE::setOprand Oprand"<<i<<"not exist"<<endl;
    break;
  }
  return;
}

void OPListELE::print(){
  switch(OPCODE){
  case ADD:
    cout<<"ADD";
    break;
  case SUB:
    cout<<"SUB";
    break;
  case MUL:
    cout<<"MUL";
    break;
  case UDIV:
    cout<<"UDIV";
    break;
  case ALLOC:
    cout<<"ALLOC";
    break;
  case STORE:
    cout<<"STORE";
    break;
  case LOAD:
    cout<<"LOAD";
    break;
  default:
    cout<<"undefine";
  }
  cout<<":"<<OP1<<":"<<OP2<<":"<<OP3<<":"<<NumOPRs<<endl;
}

RegTableELE::RegTableELE(){
  RegID = 0;
  Value = 0;
  Address = 0;
  //Name = "\0";
  kind = Other;
}

RegTableELE::RegTableELE(unsigned id,unsigned value,string name,KIND k){
  RegID = id;
  if(k != Other)
    if(k != POINTER)
      Value = value;
    else
      Address = value;
  else
    {
      Value = 0;
      Address = 0;
    }
  Name = name;
  kind = k;
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
  case IMMEDIATE:
    cout<<Value<<":IMMEDIATE"<<endl;
    break;
  default:
    cout<<"Other"<<endl;
  }
}

void RegTableELE::print_NoImm(){
  if(kind!=IMMEDIATE)
    {
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
  case IMMEDIATE:
    return "IMMEDIATE";
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
  isString = false;
}

bool myMemory::MemELE::print(){
  if(check == true)
    {
      if(isString)
	cout<<Address<<":"<<StringData<<endl;
      else
	cout<<Address<<":"<<Data<<endl;
      return true;
    }
  else
    return false;
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

void myMemory::setData(unsigned addr,unsigned data){
  int i;
  if(addr >= MemoryMax)
    cerr<<"myMemoty::getData specified addr is out of Memory address"<<endl;
  else
    for(i = 0;i < MemoryMax;i++)
      {
	if(Memory[i].getAddress() == addr)
	  return Memory[i].setData(data);
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

void myMemory::print(){
  int disp = NumOfData;
  cout<<"Address:Data"<<endl;
  for(int i = 0;disp != 0;i++)
    {
      if(Memory[i].print())
	disp--;
      else
	continue;
    }
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
      
void myMemory::printAddress(){
  for(int i = 0;i < 10;i++)
    cerr<<Memory[i].getAddress()<<endl;

  return ;
}

void IRSim::memdebug(){
  Mem->printAddress();
}
