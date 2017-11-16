#include "Typechecker.hpp"

using namespace TYPECHECKER;

MyType *TypeChecker(Type *type,Value *value){
  MyType *rtn;
  switch(type->getTypeID()){
  case 1:
    rtn = new MyInt();
    return rtn;
  case 2:
    rtn = new MyDouble();
    return rtn;
  default:
    rtn = new MyOther();
    return rtn;
  }
}

void MyInt::dump(){cerr<<"MyInt"<<endl;};
unsigned MyInt::AllocateMemory()
{};
unsigned MyInt::AllocateRegister(){};

void MyDouble::dump(){cerr<<"MyDouble"<<endl;};
unsigned MyDouble::AllocateMemory(){};
unsigned MyDouble::AllocateRegister(){};

void MyOther::dump(){cerr<<"MyOther"<<endl;};
unsigned MyOther::AllocateMemory(){};
unsigned MyOther::AllocateRegister(){};



int main(){
  Value *Int1 = new IntValue(1);
  Value *Double1 = new DoubleValue(2);
  
  Int1->dump();
  Double1->dump();

  TypeChecker(Int1->getType(),Int1)->dump();
  
  return 0;
}
