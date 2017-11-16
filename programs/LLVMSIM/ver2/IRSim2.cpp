#include"IRSim2.h"
#include"MyOPCODE.h"
#include<cstdlib>
#include<cstdio>
#include<cstring>
using namespace std;


std::string RegNameGen(){
  static int RegNo = 0;
  ostringstream oss;
  oss<<"reg"<<RegNo;
  RegNo++;
  //fprintf(stderr,"RegNameGen generate %s\n",oss.str().c_str());
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
  if((temp = RegLookUp(name)) == NULL)
    {
      RegTableELE NewReg(lastRegID++,value,name,k);
      RegT->push_back(NewReg);
      return (RegT->back()).getPointer();
    }
  else if(temp->getKind() == INTEGER)
    temp->setValue(value);
  else if(temp->getKind() == POINTER)
    temp->setAddress(value);
  else
    return NULL;		/*エラー*/ 
  return temp;
}

void IRSim::Run(){
  RegTableELE *OP[3];
  int value[3];

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
	    for(int i = 0;i < (*OPLIST_ite).getNumOPRs();i++)
	      {
		if((*OPLIST_ite).checkImm(i))
		  value[i] = (*OPLIST_ite).getImm(i);
		else
		  value[i] = RegLookUp((*OPLIST_ite).getOperand(1))->getValue();
	      }
	    OP[0]->setValue(value[1]+value[2]);
	  }
	break;
      case SUB:
	//cerr<<"SUB"<<endl;/*debug*/
	if((*OPLIST_ite).getNumOPRs() == 3)/*レジスタへの代入*/
	  {
	    PC++;
	    for(int i = 0;i < (*OPLIST_ite).getNumOPRs();i++)
	      {
		if((*OPLIST_ite).checkImm(i))
		  value[i] = (*OPLIST_ite).getImm(i);
		else
		  value[i] = RegLookUp((*OPLIST_ite).getOperand(1))->getValue();
	      }
	    OP[0]->setValue(value[1]-value[2]);
	  }
	break;
      case MUL:
	//cerr<<"MUL"<<endl;/*debug*/
	if((*OPLIST_ite).getNumOPRs() == 3)/*レジスタへの代入*/
	  {
	    PC++;
	    for(int i = 0;i < (*OPLIST_ite).getNumOPRs();i++)
	      {
		if((*OPLIST_ite).checkImm(i))
		  value[i] = (*OPLIST_ite).getImm(i);
		else
		  value[i] = RegLookUp((*OPLIST_ite).getOperand(1))->getValue();
	      }
	    OP[0]->setValue(value[1]*value[2]);
	  }
	break;
      case UDIV:
	//cerr<<"UDIV"<<endl;/*debug*/
	if((*OPLIST_ite).getNumOPRs() == 3)/*レジスタへの代入*/
	  {
	    PC++;
	    for(int i = 0;i < (*OPLIST_ite).getNumOPRs();i++)
	      {
		if((*OPLIST_ite).checkImm(i))
		  value[i] = (*OPLIST_ite).getImm(i);
		else
		  value[i] = RegLookUp((*OPLIST_ite).getOperand(1))->getValue();
	      }
	    if(value[2] == 0)
	      {
		cerr<<"UDIV::0 div"<<endl;
		exit(1);
	      }
	    OP[0]->setValue(value[1]/value[2]);
	  }
	break;
      case ALLOC:
	//cerr<<"ALLOC"<<endl;
	if((*OPLIST_ite).getNumOPRs() == 2)
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOperand(0));
	    if((*OPLIST_ite).checkImm(1))
	      {
		value[1] = (*OPLIST_ite).getImm(1);
		OP[0]->setAddress(Mem->myAlloc(value[1]));
	      }
	    else
	      {
		OP[1] = RegLookUp((*OPLIST_ite).getOperand(1));
		OP[0]->setAddress(Mem->myAlloc(OP[1]->getValue()));
	      }
	  }
	break;
      case STORE:
	//cerr<<"STORE"<<endl;
	if((*OPLIST_ite).getNumOPRs() == 2)
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOperand(0));
	    if((*OPLIST_ite).checkImm(1))
	      {
		value[1] = (*OPLIST_ite).getImm(1);
		Mem->setData(OP[0]->getAddress(),value[1]);
	      }
	    else
	      {
		OP[1] = RegLookUp((*OPLIST_ite).getOperand(1));
		Mem->setData(OP[0]->getAddress(),OP[1]->getValue());
	      }
	  }
	break;
      case LOAD:
	//cerr<<"LOAD"<<endl;
	if((*OPLIST_ite).getNumOPRs() == 2)
	  {
	    PC++;
	    OP[0] = RegLookUp((*OPLIST_ite).getOperand(0));
	    OP[1] = RegLookUp((*OPLIST_ite).getOperand(1));
	    OP[0]->setValue(Mem->getData(OP[1]->getAddress()));
	  }
	break;
      default:
	cerr<<"undefine Oprations"<<endl;
      }
    }
  
  return ;
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

void IRSim::setOpration(unsigned opcode,unsigned op1,double imm2,double imm3){
  OPListELE NewOP(opcode,op1,0,0,3);
  NewOP.setImm(imm2,1);
  NewOP.setImm(imm3,2);
  OPLIST->push_back(NewOP);
  return ;
}

void IRSim::setOpration(unsigned opcode,unsigned op1,unsigned op2,double imm3){
  OPListELE NewOP(opcode,op1,op2,0,3);
  NewOP.setImm(imm3,2);
  OPLIST->push_back(NewOP);
  return ;
}

void IRSim::setOpration(unsigned opcode,unsigned op1,double imm2){
  OPListELE NewOP(opcode,op1,0,0,2);
  NewOP.setImm(imm2,1);
  OPLIST->push_back(NewOP);
  return ;
}
								
void IRSim::print_OPLIST(){
  unsigned PC = 0;
  //  cout<<"PC:OPCODE :op1:op2:op3 :Numoprs"<<endl;
  cout<<"PC:OPCODE :op1:op2:op3"<<endl;
  for(OPList::iterator op_ite = OPLIST->begin(),op_ite_end = OPLIST->end();
      op_ite != op_ite_end;
      op_ite++)
    {
      cout<<PC<<":";
      (*op_ite).print();
      PC++;
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

void IRSim::print_Mem(){
  Mem->print();
}

OPListELE::OPListELE(){
  OPCODE = 0;
  OP[0] = 0;
  OP[1] = 0;
  OP[2] = 0;
  NumOPRs = 0;
}

OPListELE::OPListELE(unsigned opcode,unsigned op1,unsigned op2,unsigned op3,unsigned Numoprs){
  OPCODE = opcode;
  OP[0] = op1;
  OP[1] = op2;
  OP[2] = op3;
  NumOPRs = Numoprs;
}

void OPListELE::setImm(double v,unsigned i)
{imm[i].setValue(v);imm[i].setValid(true);};

unsigned OPListELE::getOperand(unsigned i){
  if(0 <= i && i <=2)
    return OP[i];
  else
    cerr<<"OPListELE::getOperand Oprand"<<i<<"not exist"<<endl;
  return 0;
}

void OPListELE::setOperand(unsigned op,unsigned i){
  if(0 <= i && i <=2)
    OP[i] = op;
  else
    cerr<<"OPListELE::getOperand Oprand"<<i<<"not exist"<<endl;
  return ;
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
  cout<<"\t";
  for(int i = 0;i < NumOPRs;i++)
    {
      if(imm[i].getValid())
	//std::printf(" :%lf",imm[i].getValue());
	cout<<" :"<<imm[i].getValue();
      else
	cout<<" :"<<OP[i];
    }
  //cout<<" :"<<NumOPRs<<endl;
  cout<<endl;
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
  default:
    cout<<"Other"<<endl;
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
