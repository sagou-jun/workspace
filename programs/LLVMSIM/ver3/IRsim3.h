#ifndef SIM_LLVM_H
#define SIM_LLVM_H
#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/InstIterator.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/InstrTypes.h"
#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include"IRSim3.h"
#include"ResultState.h"
#include<iostream>
#include<vector>
#include<list>
#include<string>
#include<sstream>
#include<cstdio>

#define MemoryMax 1000

typedef enum{		/*レジスタの型を表す*/
  INTEGER,		/*0*/
  STRING,		/*1*/
  DOUBLE,		/*2*/
  LONGDOUBLE,		/*3*/
  LABEL,		/*4*/
  POINTER,		/*5*/
  Other			/*6*/
}KIND;

typedef struct {
  int InstResult;
  llvm::BasicBlock *NextBB;
  llvm::Function *NextFunc;
}RunInstResult;

using namespace std;

string RegNameGen();

class myMemory;
class OPListELE;
class RegTableELE;
typedef list<OPListELE> OPList;
typedef list<RegTableELE> RegTable;

class IRSim{
  //  OPList *OPLIST;
  RegTable *RegT;
  myMemory *Mem;
  string IRFile;
  unsigned lastRegID;		/*最後に登録したregIDの値,初期値は0*/
  unsigned PC;			/*擬似プログラムカウンタ,現在は特に意味のない値　初期値は0*/
  int call_print_hello; /*デバッグ用*/
  int RunFunction(llvm::Function *CurFn);
  RunInstResult RunBasicBlock(llvm::BasicBlock *CurBB);
  RunInstResult RunInstruction(llvm::Instruction *CurInst);
  int CmpResult(llvm::CmpInst *cmpInst,int op1,int op2); /* CmpInstの結果の判定 TUREなら1FALSEなら0を返す */
 public:
  IRSim();
  ~IRSim();
  //OPList &getOPLIST();
  RegTable &getRegT();
  myMemory &getMen();
  RegTableELE *RegLookUp(unsigned OP); /*レジスタテーブルの検索*/
  RegTableELE *RegLookUp(string regName);
  unsigned getPC(){return PC;};
  /*実行コマンド*/
  void Run(string FileName);
  /*レジスタ登録インターフェース*/
  RegTableELE *setReg(double value,string name,KIND k);
  RegTableELE *setReg(int value,string name,KIND k);
  RegTableELE *setReg(string name,KIND k);
  /*入力ファイルの設定*/
  void setIRFileName(string FileName);
  
  /*デバッグ用関数*/
  void print_RegT();
  void print_Mem();
  void dump();
  void hello(){call_print_hello++;};
  int say_hello(){return call_print_hello;};
};
 
/*レジスタテーブルの要素*/
class RegTableELE{
 private:
  unsigned RegID;	/*ID,命令リスト内でオペランドとして設定される値 0から始まる*/
  int Value;		/*INTEGER型で使用*/
  double DValue;	/*DOUBLE型で使用*/
  unsigned Address;	/*POINTER型で使用*/
  string Name;		/*レジスタの名前*/
  KIND kind;		/*レジスタの型*/
  bool trace;		/*デバッグ用情報*/
    
 public:
  RegTableELE();
  RegTableELE(unsigned id,unsigned value,string name,KIND k);
  RegTableELE(unsigned id,int value,string name,KIND k);
  RegTableELE(unsigned id,double value,string name,KIND k);
  
  //~RegTableELE();
  unsigned getRegID(){return RegID;};
  int getValue(){return Value;};
  double getDValue(){return DValue;};
  unsigned getAddress(){return Address;};
  string getName(){return Name;};
  KIND getKind(){return kind;};
  void setRegID(unsigned id){RegID = id;};
  void setValue(int value){if(trace)fprintf(stderr,"%d->%d\n",Value,value);Value = value;};
  void setDValue(double dvalue){if(trace)fprintf(stderr,"%lf->%lf\n",DValue,dvalue);DValue = dvalue;};
  void setAddress(unsigned address){Address = address;};
  void setName(string name){Name = name;};
  void setKind(KIND k){kind = k;};
  RegTableELE *getPointer(){return this;};
  void print();
  void dump();
  void setTrace(){trace = true;return;};
  string str_Kind();
};

#define mem_none 0
#define mem_string 1
#define mem_int 2
#define mem_double 3

/*SIMのメモリ*/
class myMemory{
 private:
  class MemELE{
  private:
    static unsigned AddressCounter;
    unsigned Address;	 /*メモリのアドレス 0から始まるがアドレスが0の領域にはデータは書き込まない*/
    int Data;
    double DoubleData;
    string StringData;
    bool check;			/*データが有効である場合:true*/
    bool region;		/*myAllocで確保した領域の終端:false*/
    char memKind;		/*データの種類*/
  public:
    MemELE();
    //~MemELE();
    unsigned getAddress(){return Address;};
    int getData(){return (check == true)?Data:0;};
    string getStringData(){string str("");return (check == true)?StringData:str;};
    double getDoubleData(){return (check == true)?DoubleData:0;};
    void setData(int data){check = true;Data = data;memKind = mem_int;};
    void setData(string sdata){check = true;StringData = sdata;memKind = mem_string;};
    void setData(double ddata){check = true;DoubleData = ddata;memKind = mem_double;};
    bool getcheck(){return check;};
    void setcheck(bool c){check = c;};
    bool getregion(){return region;};
    void setregion(bool r){region = r;};
    bool getMemKind(){return memKind;};
    bool print();
    void dump();
  };
  MemELE Memory[MemoryMax];
  int NumOfData;
 public:
  myMemory();
  //~myMemory(); 
  unsigned getData(unsigned addr);
  string getStringData(unsigned addr);
  void setData(unsigned addr,int data);
  void setData(unsigned addr,string sdata);
  void setData(unsigned addr,double ddata);
  unsigned myAlloc(int size);/*メモリ領域の確保*/
  void myFree(unsigned addr);/*メモリ領域の解法*/
  void print();
  void dump();
};
#endif /*SIM_LLVM_H*/
