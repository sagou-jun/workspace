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

typedef enum{		/*���W�X�^�̌^��\��*/
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
  unsigned lastRegID;		/*�Ō�ɓo�^����regID�̒l,�����l��0*/
  unsigned PC;			/*�[���v���O�����J�E���^,���݂͓��ɈӖ��̂Ȃ��l�@�����l��0*/
  int call_print_hello; /*�f�o�b�O�p*/
  int RunFunction(llvm::Function *CurFn);
  RunInstResult RunBasicBlock(llvm::BasicBlock *CurBB);
  RunInstResult RunInstruction(llvm::Instruction *CurInst);
  int CmpResult(llvm::CmpInst *cmpInst,int op1,int op2); /* CmpInst�̌��ʂ̔��� TURE�Ȃ�1FALSE�Ȃ�0��Ԃ� */
 public:
  IRSim();
  ~IRSim();
  //OPList &getOPLIST();
  RegTable &getRegT();
  myMemory &getMen();
  RegTableELE *RegLookUp(unsigned OP); /*���W�X�^�e�[�u���̌���*/
  RegTableELE *RegLookUp(string regName);
  unsigned getPC(){return PC;};
  /*���s�R�}���h*/
  void Run(string FileName);
  /*���W�X�^�o�^�C���^�[�t�F�[�X*/
  RegTableELE *setReg(double value,string name,KIND k);
  RegTableELE *setReg(int value,string name,KIND k);
  RegTableELE *setReg(string name,KIND k);
  /*���̓t�@�C���̐ݒ�*/
  void setIRFileName(string FileName);
  
  /*�f�o�b�O�p�֐�*/
  void print_RegT();
  void print_Mem();
  void dump();
  void hello(){call_print_hello++;};
  int say_hello(){return call_print_hello;};
};
 
/*���W�X�^�e�[�u���̗v�f*/
class RegTableELE{
 private:
  unsigned RegID;	/*ID,���߃��X�g���ŃI�y�����h�Ƃ��Đݒ肳���l 0����n�܂�*/
  int Value;		/*INTEGER�^�Ŏg�p*/
  double DValue;	/*DOUBLE�^�Ŏg�p*/
  unsigned Address;	/*POINTER�^�Ŏg�p*/
  string Name;		/*���W�X�^�̖��O*/
  KIND kind;		/*���W�X�^�̌^*/
  bool trace;		/*�f�o�b�O�p���*/
    
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

/*SIM�̃�����*/
class myMemory{
 private:
  class MemELE{
  private:
    static unsigned AddressCounter;
    unsigned Address;	 /*�������̃A�h���X 0����n�܂邪�A�h���X��0�̗̈�ɂ̓f�[�^�͏������܂Ȃ�*/
    int Data;
    double DoubleData;
    string StringData;
    bool check;			/*�f�[�^���L���ł���ꍇ:true*/
    bool region;		/*myAlloc�Ŋm�ۂ����̈�̏I�[:false*/
    char memKind;		/*�f�[�^�̎��*/
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
  unsigned myAlloc(int size);/*�������̈�̊m��*/
  void myFree(unsigned addr);/*�������̈�̉�@*/
  void print();
  void dump();
};
#endif /*SIM_LLVM_H*/
