#ifndef IR_SIM_MEMS_H
#define IR_SIM_MEMS_H
#include<cstdio>
#include<iostream>
#include<iomanip>
#include"IRSimKinds.hpp"

namespace IRSIM{
#define Address_width 4
#define Data_width 5
  
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
    virtual unsigned getAdd() = 0;
    virtual void setData(string s) = 0;
    virtual void setData(int i) = 0;
    virtual void setData(double d) = 0;
    virtual void setAdd(unsigned u) = 0;
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
    virtual unsigned getAdd()		{cerr<<"This Object doesnot have Unsigned Value"<<endl;};
    virtual void setData(string s)	{cerr<<"This Object doesnot have String Value"<<endl;};
    virtual void setData(int i)		{cerr<<"This Object doesnot have Int Value"<<endl;};
    virtual void setData(double d)	{cerr<<"This Object doesnot have Double Value"<<endl;};
    virtual void setAdd(unsigned u)	{cerr<<"This Object doesnot have Unsigned Value"<<endl;}
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
  MemData<unsigned>::MemData();
  template<>
  MemData<unsigned>::MemData(unsigned data);
  template<>  
  string MemData<string>::getString();
  template<>
  int MemData<int>::getInt();
  template<>
  double MemData<double>::getDouble();
  template<>
  unsigned MemData<unsigned>::getAdd();
  template<>
  void MemData<string>::setData(string s);
  template<>
  void MemData<int>::setData(int i);
  template<>
  void MemData<double>::setData(double d);
  template<>
  void MemData<unsigned>::setAdd(unsigned u);

  /*メモリアドレスの上限*/
#define MemMax		1000
  
  struct Memory {
  public:
    MemELE *mem;
    bool check;			// true:使用中 false:未使用
    bool region;		// check == trueのとき true:割り当てた領域の一部 false:割り当てた領域の末端
				// check == falseのとき　未定義
  };
  
  struct CalcArrayRtn{
    unsigned size;/*メモリ上に確保する領域の大きさ*/
    MKINDS k;/*メモリ上に確保した領域を構成する型*/
    friend ostream &operator<<(ostream &os,const CalcArrayRtn &obj)
    {
      os<<"print ArrayAllocRtn\n";
      os<<"size = "<<obj.size<<", KIND = "<<str_MKind(obj.k);
    }
  };

  
  class SIMMem{
  private:
    unsigned NumOfData;	// 使用中のデータの数
    Memory Mems[MemMax];// この配列の添え字をアドレスとし、アドレスが０のメモリは使用しない
    unsigned myAllocImp(MKINDS m,string sdata,int idata,double ddata,unsigned udata,unsigned Num = 1);
  public:
    SIMMem();
    ~SIMMem();
    MemELE *getPtr(unsigned addr);
    unsigned myAllocString(string data = "",unsigned Num = 1){return myAllocImp(mem_string,data,0,0,0,Num);};
    unsigned myAllocInt(int data = 0,unsigned Num = 1){return myAllocImp(mem_int,"",data,0,0,Num);};
    unsigned myAllocDouble(double data = 0,unsigned Num = 1){return myAllocImp(mem_double,"",0,data,0,Num);};
    unsigned myAllocPtr(unsigned data = 0,unsigned Num = 1){return myAllocImp(mem_ptr,"",0,0,data,Num);};
    /*配列のサイズ計算用*/
    CalcArrayRtn CalcArraySize(ArrayType *Array);
    unsigned CalcStructSize(StructType *Struct);
    unsigned myAllocStruct(StructType *NewStruct);
    unsigned myAllocArray(ArrayType *NewArray);
    unsigned getNumOfData(){return NumOfData;};
    bool myFree(unsigned addr);
    void print();
    void dump();
    void dump(unsigned addr);
  };
  
}
#endif
