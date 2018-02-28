#include"IRSimRegs.hpp"

using namespace IRSIM;

RegTableELE::RegTableELE(unsigned id,string name,KINDS k):RegID(id),Name(name),Kind(k),trace(false){
  //cerr<<"RegTableELE constructor"<<endl;
}

RegTableELE::~RegTableELE(){
  //cerr<<"RegTableELE deleted"<<endl;
}

RegTableELE *RegTable::RegLookUp(string Name){
  if(Name.empty())
    {
      cerr<<"RegTable::RegLookUp Invalid argument Name is empty"<<endl;
      exit(1);
    }
  for(RegTableVec::iterator RegTI = GlobalTable->begin(),RegTIend = GlobalTable->end();
      RegTI != RegTIend;
      RegTI++)
    {
      if((*RegTI)->getName() == Name)
	return (*RegTI);
    }
  for(RegTableVec::iterator RegTI = CurrentTable->begin(),RegTIend = CurrentTable->end();
      RegTI != RegTIend;
      RegTI++)
    {
      if((*RegTI)->getName() == Name)
	return (*RegTI);
    }
  //cerr<<"RegTable::RegLookUp ("<<Name<<") is Not found"<<endl;
  return NULL;
}

RegTableELE *RegTable::RegLookUp(unsigned RegisterID){
  for(RegTableVec::iterator RegTI = GlobalTable->begin(),RegTIend = GlobalTable->end();
      RegTI != RegTIend;
      RegTI++)
    {
      if((*RegTI)->getRegID() == RegisterID)
	return (*RegTI);
    }
  
  for(RegTableVec::iterator RegTI = CurrentTable->begin(),RegTIend = CurrentTable->end();
      RegTI != RegTIend;
      RegTI++)
    {
      if((*RegTI)->getRegID() == RegisterID)
	return (*RegTI);
    }
  cerr<<"RegTable::RegLookUp (id="<<RegisterID<<") is Not found"<<endl;
  dump();
  return NULL;
}

RegTable::RegTable(){
  lastRegID = 0U;
  lastRegTableID = 0U;
  GlobalTable = new RegTableVec;  
  RTMap.insert(make_pair(0U,GlobalTable));
  CurrentTableID = 0U;
  RegTableIDStack.push_back(0U);
  CurrentTable = GlobalTable;
}


/*ほぼ同じルーチンが記述されているのでリファクタリング推奨*/
/*グローバルレジスタを登録したい場合はCurrentTableをGlobalTableにすること*/
RegTableELE *RegTable::setRegInt(int value,string name,bool setValue){
  RegTableELE *q;
  if((q = RegLookUp(name)) == NULL)
    {
      //cerr<<"RegTable::setRegInt set Register ("<<name<<")"<<endl; 
      RegValue<int> *p = new RegValue<int>(value,lastRegID++,name,INTEGER);
      CurrentTable->push_back(p);
      return CurrentTable->back();
    }
  else if(setValue)
    q->setValue(value);
  return q;
}

RegTableELE *RegTable::setRegDouble(double value,string name,bool setValue){
  RegTableELE *q;
  if((q = RegLookUp(name)) == NULL)
    {
      //cerr<<"RegTable::setRegDouble set Register ("<<name<<")"<<endl;
      RegValue<double> *p = new RegValue<double>(value,lastRegID++,name,DOUBLE);
      CurrentTable->push_back(p);
      return CurrentTable->back();
    }
  else if(setValue)
    q->setValue(value);
  return q;
}

RegTableELE *RegTable::setRegAdd(unsigned value,string name,bool setValue){
  RegTableELE *q;
  if((q = RegLookUp(name)) == NULL)
    {
      //cerr<<"RegTable::setRegAdd set Register ("<<name<<")"<<endl;
      RegValue<unsigned> *p = new RegValue<unsigned>(value,lastRegID++,name,POINTER);
      CurrentTable->push_back(p);
      return CurrentTable->back();
    }
  else if(setValue)
    q->setValue(value);
  return q;
}

void RegTable::print(){
  for(iterator map_ite = begin(),map_ite_end = end();
      map_ite != map_ite_end;
      map_ite++)
    {
      cout<<"TableID = "<<map_ite->first<<endl;
      cout<<setw(RegID_width)<<"RegID"<<":";
      cout<<setw(Name_width)<<"Name"<<":";
      cout<<setw(Value_width)<<"Value"<<":";
      cout<<"KIND"<<endl;
      for(RegTableVec::iterator vec_ite = map_ite->second->begin(),vec_ite_end = map_ite->second->end();
	  vec_ite != vec_ite_end;
	  vec_ite++)
	(*vec_ite)->print();
    }
}

void RegTable::dump(){
  cerr<<"-----RegTable::dump size="<<RTMap.size()<<"-----"<<endl;
  for(iterator map_ite = begin(),map_ite_end = end();
      map_ite != map_ite_end;
      map_ite++)
    {
      cerr<<"TableID = "<<map_ite->first<<endl;
      cerr<<setw(RegID_width)<<"RegID"<<":";
      cerr<<setw(Name_width)<<"Name"<<":";
      cerr<<setw(Value_width)<<"Value"<<":";
      cerr<<"KIND"<<endl;
      for(RegTableVec::iterator vec_ite = map_ite->second->begin(),vec_ite_end = map_ite->second->end();
	  vec_ite != vec_ite_end;
	  vec_ite++)
	(*vec_ite)->dump();
    }
  cerr<<"----------"<<endl;
}

void RegTable::CallProcess(){
  RegTableVec *CalleeFunctionRegTable = new RegTableVec;
  RTMap.insert(make_pair(static_cast<unsigned>(++lastRegTableID),CalleeFunctionRegTable));
  RegTableIDStack.push_back(CurrentTableID);
  CurrentTableID = lastRegTableID;
  CurrentTable = CalleeFunctionRegTable;
  return ;
}

void RegTable::RetProcess(){
  if(RegTableIDStack.size() == 1)
    {
      cerr<<"RegTable::RetProcess There is no Table on Stack"<<endl;
      return;
    }
  unsigned CallerFunctionRegTableID = RegTableIDStack.back();
  RegTableIDStack.pop_back();
  RTMap.erase(CurrentTableID);
  CurrentTable = RTMap.at(CallerFunctionRegTableID);
  CurrentTableID = CallerFunctionRegTableID;
}

void RegTable::PassingArgument(IRegs *TX,string RXRegName,KINDS k){
  RegTableVec *RXTable = CurrentTable;
  if(TX == NULL)
    {
      cerr<<"RegTable::PassingArgument::Argument TX is null"<<endl;
      exit(1);
    }
  switch(k){
  case INTEGER:
    setRegInt(TX->getInt(),RXRegName);
    break;
  case DOUBLE:
    setRegDouble(TX->getDouble(),RXRegName);
    break;
  case POINTER:
    setRegAdd(TX->getAdd(),RXRegName);
    break;
  }
  return;
}

/*引数を渡す場合はレジスタを新たに定義しなければならないので型の情報が必要になる*/
void RegTable::PassingArgument(string TXRegName,string RXRegName,KINDS k){
  RegTableVec *TXTable = RTMap.find(RegTableIDStack.back())->second;
  RegTableVec *RXTable = CurrentTable;
  RegTableELE *TX;
  CurrentTable = TXTable;
  TX = RegLookUp(TXRegName);
  CurrentTable = RXTable;
  if(TX == NULL)
    {
      cerr<<"RegTable::PassingArgument::"<<TXRegName<<" is not found"<<endl;
      exit(1);
    }
  switch(k){
  case INTEGER:
    setRegInt(TX->getInt(),RXRegName);
    break;
  case DOUBLE:
    setRegDouble(TX->getDouble(),RXRegName);
    break;
  case POINTER:
    setRegAdd(TX->getAdd(),RXRegName);
    break;
  }
  return;
}

void RegTable::ReturnValue(string TXRegName,unsigned RXRegID){
  RegTableVec *TXTable = CurrentTable;
  RegTableVec *RXTable = RTMap.find(RegTableIDStack.back())->second;
  RegTableELE *TX = NULL,*RX = NULL;
  TX = RegLookUp(TXRegName);
  CurrentTable = RXTable;
  RX = RegLookUp(RXRegID);
  CurrentTable = TXTable;
  if(TX == NULL||RX == NULL)
    {
      cerr<<"RegTable::ReturnValue::"<<TXRegName<<" or RegsiterID = "<<RXRegID<<" is not found"<<endl;
      exit(1);
    }
  TX->ValueTransfer(RX);
  return;
}

void RegTable::ReturnValue(IRegs *TX,unsigned RXRegID){
  RegTableVec *TXTable = CurrentTable;
  RegTableVec *RXTable = RTMap.find(RegTableIDStack.back())->second;
  RegTableELE *RX = NULL;
  CurrentTable = RXTable;
  RX = RegLookUp(RXRegID);
  CurrentTable = TXTable;
  if(TX == NULL||RX == NULL)
    {
      cerr<<"RegTable::ReturnValue::RegisterID = "<<RXRegID<<" is not found"<<endl;
      exit(1);
    }
  TX->ValueTransfer(RX);
  return;
}

template<>
int RegValue<int>::getInt(){return Value;}
template<>
unsigned RegValue<unsigned>::getAdd(){return Value;}
template<>
double RegValue<double>::getDouble(){return Value;}
template<>
void RegValue<int>::setValue(int i){Value = i;}
template<>
void RegValue<unsigned>::setValue(unsigned u){Value = u;}
template<>
void RegValue<double>::setValue(double d){Value = d;}

template<>
void RegValue<int>::ValueTransfer(RegTableELE *RXRegister){
  RXRegister->setValue(this->getInt());  
}
template<>
void RegValue<unsigned>::ValueTransfer(RegTableELE *RXRegister){
  RXRegister->setValue(this->getAdd());  
}
template<>
void RegValue<double>::ValueTransfer(RegTableELE *RXRegister){
  RXRegister->setValue(this->getDouble());
}

template<>
int ImmediateValue<int>::getInt(){return Value;};
template<>
double ImmediateValue<double>::getDouble(){return Value;};
template<>
unsigned ImmediateValue<unsigned>::getAdd(){return Value;};

template<>
void ImmediateValue<int>::ValueTransfer(RegTableELE *RXRegister){
  RXRegister->setValue(this->getInt());
}
template<>
void ImmediateValue<unsigned>::ValueTransfer(RegTableELE *RXRegister){
  RXRegister->setValue(this->getAdd());  
}
template<>
void ImmediateValue<double>::ValueTransfer(RegTableELE *RXRegister){
  RXRegister->setValue(this->getDouble());
}
