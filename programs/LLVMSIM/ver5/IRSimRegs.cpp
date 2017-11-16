#include"IRSimRegs.hpp"

using namespace IRSIM;

RegTableELE::RegTableELE(unsigned id,string name,KINDS k):RegID(id),Name(name),Kind(k),trace(false){}
/*
RegTableELE::RegTableELE(const RegTableELE &obj){
  cerr<<"copy constructer called"<<endl;
}
*/
RegTableELE *RegTable::RegLookUp(string Name){
  if(Name.empty())
    {
      cerr<<"RegTable::RegLookUp Invalid argument Name is empty"<<endl;
      exit(1);
    }
  for(iterator RegTI = this->begin(),RegTIend = this->end();
      RegTI != RegTIend;
      RegTI++)
    {
      if((*RegTI)->getName() == Name)
	return (*RegTI);
    }
  //cerr<<"RegTable::RegLookUp ("<<Name<<") is Not found"<<endl;
  return NULL;
}

RegTable::RegTable():vector<RegTableELE *>(){
  lastRegID = 0;
}

RegTableELE *RegTable::setRegInt(int value,string name,bool setValue){
  RegTableELE *q;
  if((q = RegLookUp(name)) == NULL)
    {
      //cerr<<"RegTable::setRegInt set Register ("<<name<<")"<<endl; 
      RegValue<int> *p = new RegValue<int>(value,lastRegID++,name,INTEGER);
      this->push_back(p);
      return this->back();
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
      this->push_back(p);
      return this->back();
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
      this->push_back(p);
      return this->back();
    }
  else if(setValue)
    q->setValue(value);
    return q;
}

void RegTable::print(){
  cout<<setw(RegID_width)<<"RegID"<<":";
  cout<<setw(Name_width)<<"Name"<<":";
  cout<<setw(Value_width)<<"Value"<<":";
  cout<<"KIND"<<endl;
  for(iterator RegTI = this->begin(),RegTIend = this->end();
      RegTI != RegTIend;
      RegTI++)
    (*RegTI)->print();
}

void RegTable::dump(){
  cerr<<setw(RegID_width)<<"RegID"<<":";
  cerr<<setw(Name_width)<<"Name"<<":";
  cerr<<setw(Value_width)<<"Value"<<":";
  cerr<<"KIND"<<endl;
  for(iterator RegTI = this->begin(),RegTIend = this->end();
      RegTI != RegTIend;
      RegTI++)
    (*RegTI)->dump();
}

template<>
inline int RegValue<int>::getInt(){return Value;}
template<>
inline unsigned RegValue<unsigned>::getAdd(){return Value;}
template<>
inline double RegValue<double>::getDouble(){return Value;}
template<>
inline void RegValue<int>::setValue(int i){Value = i;}
template<>
inline void RegValue<unsigned>::setValue(unsigned u){Value = u;}
template<>
inline void RegValue<double>::setValue(double d){Value = d;}
/*
template<>
inline  int Imm<int>::getInt(){return Value;}
template<>
inline  double Imm<double>::getDouble(){return Value;}
*/
