#ifndef IR_SIM_MEMS_H
#define IR_SIM_MEMS_H
#include<cstdio>
#include<iostream>
#include<iomanip>

namespace IRSIM{
  using std::cout ;
  using std::cerr ;
  using std::endl ;
  using std::string ;
  using std::setw;
  using std::fixed;
  using std::setprecision;

#define Address_width 4
#define Data_width 5
  
  typedef enum{
    mem_none,			/*0*/
    mem_string,			/*1*/
    mem_int,			/*2*/
    mem_double			/*3*/ 
  }MKINDS;

  string str_MKind(MKINDS k);
  
  // 抽象クラス
  class MemELE{
  protected:
    MKINDS mem_Kind;
    MemELE();
  public:
    virtual ~MemELE(){};
    MKINDS getMemKind(){return mem_Kind;};
    //void setMemKind(MKINDS Kind){memKind = Kind;};
    /*サブクラス用インターフェース*/
    virtual string getString() = 0;
    virtual int getInt() = 0;
    virtual double getDouble() = 0;
    virtual void setData(string s) = 0;
    virtual void setData(int i) = 0;
    virtual void setData(double d) = 0;
    virtual void print() = 0;
    virtual void dump() = 0;
  };
  
  template<typename t>
  class MemData:public MemELE{
  private:
    t Data;
  public:
    MemData(){};
    MemData(t data){};
    ~MemData(){};
    /*特殊化によって実装する*/
    virtual string getString()		{cerr<<"This Object doesnot have String Value"<<endl;};
    virtual int getInt()		{cerr<<"This Object doesnot have Int Value"<<endl;};
    virtual double getDouble()		{cerr<<"This Object doesnot have Double Value"<<endl;};
    virtual void setData(string s)	{cerr<<"This Object doesnot have String Value"<<endl;};
    virtual void setData(int i)		{cerr<<"This Object doesnot have Int Value"<<endl;};
    virtual void setData(double d)	{cerr<<"This Object doesnot have Double Value"<<endl;};
    void print();
    void dump();
  };

  template<typename t>
  void MemData<t>::print(){
    cout<<setw(Data_width)<<fixed<<Data<<":";
    cout<<str_MKind(MemELE::mem_Kind)<<endl;
  }

  template<typename t>
  void MemData<t>::dump(){
    cerr<<setw(Data_width)<<fixed<<Data<<":";
    cerr<<str_MKind(MemELE::mem_Kind)<<endl;
  }
  
  template<>
  MemData<string>::MemData();
  template<>
  MemData<string>::MemData(string data);
  template<>
  MemData<int>::MemData();
  template<>
  MemData<int>::MemData(int data);
  template<>
  MemData<double>::MemData();
  template<>
  MemData<double>::MemData(double data);
  template<>
  
  string MemData<string>::getString();
  template<>
  int MemData<int>::getInt();
  template<>
  double MemData<double>::getDouble();
  template<>
  void MemData<string>::setData(string s);
  template<>
  void MemData<int>::setData(int i);
  template<>
  void MemData<double>::setData(double d);

  /*メモリアドレスの上限*/
#define MemMax		1000
  
  struct Memory {
  public:
    MemELE *mem;
    bool check;			// true:使用中 false:未使用
    bool region;		// check == trueのとき true:割り当てた領域の一部 false:割り当てた領域の末端
				// check == falseのとき　未定義
    Memmory(const Memory &ref){cerr<<"Memory copy Constructor called"<<endl;};
  };

  class SIMMem{
  private:
    unsigned NumOfData;	// 使用中のデータの数
    Memory Mems[MemMax];// この配列の添え字をアドレスとし、アドレスが０のメモリは使用しない
    unsigned myAllocImp(MKINDS m,string sdata,int idata,double ddata,unsigned Num = 1);
  public:
    SIMMem();
    ~SIMMem();
    MemELE *getPtr(unsigned addr);
    unsigned myAllocString(string data = "",unsigned Num = 1){return myAllocImp(mem_string,data,0,0,Num);};
    unsigned myAllocInt(int data = 0,unsigned Num = 1){return myAllocImp(mem_int,"",data,0,Num);};
    unsigned myAllocDouble(double data = 0,unsigned Num = 1){return myAllocImp(mem_double,"",0,data,Num);};
    unsigned getNumOfData(){return NumOfData;};
    bool myFree(unsigned addr);
    void print();
    void dump();
  };
  
}
#endif
