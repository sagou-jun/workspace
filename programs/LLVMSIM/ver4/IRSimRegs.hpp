#ifndef IR_SIM_REGS_H
#define IR_SIM_REGS_H
#include<iostream>
#include<iomanip>
#include<vector>
#include<cstdio>
#include<cstdlib>

namespace IRSIM{
  using std::cout ;
  using std::cerr ;
  using std::endl ;
  using std::string ;
  using std::vector;
  using std::setw;
  using std::setprecision;
  using std::fixed;

#define RegID_width 5
#define Name_width 6
#define Value_width 8
#define default_precision 4
  
  typedef enum{		/*レジスタの型を表す*/
    INTEGER,		/*0*/
    STRING,		/*1*/
    DOUBLE,		/*2*/
    LONGDOUBLE,		/*3*/
    LABEL,		/*4*/
    POINTER,		/*5*/
    ARRAY,		/*6*/
    Other		/*7*/
  }KINDS;

  string str_Kind(KINDS k);

  class IRegs{
  public:
    virtual ~IRegs(){};
    virtual int getInt() = 0;
    virtual double getDouble() = 0;
    virtual unsigned getAdd() = 0;
  };
  
  template<typename t>
  class RegValue;
  
  class RegTableELE:public IRegs{
  protected:
    unsigned RegID;
    string Name;
    KINDS Kind;
    bool trace;
    RegTableELE(unsigned id,string name,KINDS k);
  public:
    virtual ~RegTableELE(){cerr<<"RegTableELE deleted"<<endl;};
    RegTableELE(const RegTableELE &obj);
    virtual void print() = 0;
    virtual void dump() = 0;
    string getName(){return Name;};
    KINDS getKind(){return Kind;};
    void setName(const string name){Name = name;};
    void setKind(const KINDS kind){Kind = kind;};
    void setTrace(){trace = true;};
    virtual void setValue(int i) = 0;
    virtual void setValue(double d) = 0;
    virtual void setValue(unsigned u) = 0;
  };

  class RegTable:vector<RegTableELE *>{
  private:
    unsigned lastRegID;
  public:
    using vector<RegTableELE *>::iterator;
    using vector<RegTableELE *>::begin;
    using vector<RegTableELE *>::end;
    using vector<RegTableELE *>::push_back;
    using vector<RegTableELE *>::back;
    RegTable();
    ~RegTable(){};
    RegTableELE *RegLookUp(string Name);
    /*レジスタの登録を行う、その際RegLookUpで重複の確認を行う*/
    RegTableELE *setRegInt(int value,string Name);
    RegTableELE *setRegDouble(double value,string Name);
    RegTableELE *setRegAdd(unsigned value,string Name);
    void print();
    void dump();
  };
  
  template<typename t>
  class RegValue:public RegTableELE{
  private:
    t Value;
  public:
    RegValue(t value,unsigned id,string name,KINDS k);
    ~RegValue(){};
    RegValue<t> *getPointer(){return this;};
    virtual void print();
    virtual void dump();
    virtual int getInt(){cerr<<"This Class does not have Int Value"<<endl;}
    virtual unsigned getAdd(){cerr<<"This Class does not have Unsigned Value"<<endl;};
    virtual double getDouble(){cerr<<"This Class does not have Double Value"<<endl;};
    virtual void setValue(int i){};
    virtual void setValue(double d){};
    virtual void setValue(unsigned u){};
  };
  
  template<typename t>
  RegValue<t>::RegValue(t value,unsigned id,string name,KINDS k):RegTableELE(id,name,k){
    Value = value;
  }

  template<typename t>
  void RegValue<t>::print(){
    cout<<setw(RegID_width)<<RegTableELE::RegID<<":";
    cout<<setw(Name_width)<<RegTableELE::Name<<":";
    cout<<setw(Value_width)<<fixed<<setprecision(default_precision)<<Value<<":";
    cout<<IRSIM::str_Kind(RegTableELE::Kind)<<endl;
  }

  template<typename t>
  void RegValue<t>::dump()
  {
    cerr<<setw(RegID_width)<<RegTableELE::RegID<<":";
    cerr<<setw(Name_width)<<RegTableELE::Name<<":";
    cerr<<setw(Value_width)<<fixed<<setprecision(default_precision)<<Value<<":";
    cerr<<IRSIM::str_Kind(RegTableELE::Kind)<<endl;
  }
  
  template<>
  int RegValue<int>::getInt();
  template<>
  unsigned RegValue<unsigned>::getAdd();
  template<>
  double RegValue<double>::getDouble();
  template<>
  void RegValue<int>::setValue(int i);
  template<>
  void RegValue<unsigned>::setValue(unsigned u);
  template<>
  void RegValue<double>::setValue(double d);

  class ImmInt:public IRegs{
  private:
    int Value;
  public:
    ImmInt(){};
    ImmInt(int value){Value = value;};
    ~ImmInt(){};
    void setValue(int value){Value = value;};
    int getValue(){return Value;};
    int getInt(){return Value;};
    unsigned getAdd(){cerr<<"This Class does not have Unsigned Value"<<endl;};
    double getDouble(){cerr<<"This Class does not have Double Value"<<endl;};
  };
  
  class ImmDouble:public IRegs{
  private:
    double Value;
  public:
    ImmDouble(){};
    ImmDouble(double value){Value = value;};
    ~ImmDouble(){};
    void setValue(double value){Value = value;};
    double getValue(){return Value;};
    int getInt(){cerr<<"This Class does not have Int Value"<<endl;};
    unsigned getAdd(){cerr<<"This Class does not have Unsigned Value"<<endl;};
    double getDouble(){return Value;};
  };
  //なぜかtemplateを使用するとコンパイルを通らない
  /*
  template<typename t>
  class Imm:public IRegs{
  private:
    t Value;
  public:
    Imm(){};
    Imm(t value){Value = value;};
    ~Imm(){};
    void setValue(t value){Value = value;};
    t getValue(){return Value;};
    virtual int getInt(){cerr<<"This Class does not have Int Value"<<endl;};
    virtual unsigned getAdd(){cerr<<"This Class does not have Unsigned Value"<<endl;};
    virtual double getDouble(){cerr<<"This Class does not have Double Value"<<endl;};
    void testImmClassMethod(void){};
  };

  template<>
  int Imm<int>::getInt();
  template<>
  double Imm<double>::getDouble();
  */  

  //typedef Imm<int> ImmInt;
  //typedef Imm<double> ImmDouble;

} // end namespace IRSIM
#endif
  
