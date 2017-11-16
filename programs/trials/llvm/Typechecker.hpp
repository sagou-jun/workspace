#ifndef TYPECHECKER_H
#define TYPECHECKER_H

#include<string>
#include<iostream>
#include<vector>
#include<sstream>
#include<cstdlib>
#include<new>

namespace TYPECHECKER{
  using std::string;
  using std::cout ;
  using std::cerr ;
  using std::cin;
  using std::endl ;
  using std::string ;
  using std::ostream;
  using std::vector;

  class Type{
  private:
    unsigned ID;
  public:
    Type():ID(0){};
    Type(unsigned id):ID(id){};
    unsigned getTypeID(){return ID;};
  };

  class Value{
  public:
    Type _Type;
    Type *getType(){return &_Type;};
    virtual void dump() = 0;
  };
  
  class IntValue:public Value{
  private:
    int _Value;
  public:
    IntValue(int value):_Value(value){Value::_Type = 1;};
    void dump(){cerr<<"IntValue"<<endl;}
  };
    
  class DoubleValue:public Value{
  private:
    double _Value;
  public:
    DoubleValue(double value):_Value(value){Value::_Type = 2;};
    void dump(){cerr<<"DoubleValue"<<endl;}
  };
    
  class MyType{
  private:
    operator=(const MyType &obj){};
    MyType(const MyType &obj){};
  public:
    MyType(){};
    virtual ~MyType(){};
    friend MyType *TypeChecker(Type type,Value *value);
    virtual void dump() = 0;
    virtual unsigned AllocateMemory() = 0;
    virtual unsigned AllocateRegister() = 0; 
  };

  MyType *TypeChecker(Type *type, Value *value);
  
  class MyInt : public MyType{
  private:
    void dump();
    unsigned AllocateMemory();
    unsigned AllocateRegister();
  public:
    MyInt(){};
  };
  
  class MyDouble : public MyType{
  private:
    void dump();
    unsigned AllocateMemory();
    unsigned AllocateRegister();
  public:
    MyDouble(){};
  };
  
  class MyOther : public MyType{
  private:
    void dump();
    unsigned AllocateMemory();
    unsigned AllocateRegister();
  public:
    MyOther(){};
  };
}
#endif
