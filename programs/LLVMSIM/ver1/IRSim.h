#ifndef SIM_LLVM_H
#define SIM_LLVM_H
#include<iostream>
#include<vector>
#include<list>
#include<string>
#include<sstream>

#define MemoryMax 1000
#define Imm_Name true
#define reg_Name false

typedef enum{		/*���W�X�^�̌^��\��*/
  INTEGER,
  IMMEDIATE,
  STRING,
  LABEL,
  POINTER,
  Other
}KIND;

using namespace std;

string RegNameGen(bool isImm);

class myMemory;
class OPListELE;
class RegTableELE;
typedef list<OPListELE> OPList;
typedef list<RegTableELE> RegTable;

class IRSim{
  OPList *OPLIST;
  RegTable *RegT;
  myMemory *Mem;
  unsigned lastRegID;		/*�Ō�ɓo�^����regID�̒l,�����l��0*/
  unsigned PC;			/*�[���v���O�����J�E���^,�Ō�Ɏ��s�������߂�OPLIST�̉��Ԗڂł��邩�������Ă��� �����l��0*/
 public:
  IRSim();
  ~IRSim();
  OPList &getOPLIST();
  RegTable &getRegT();
  myMemory &getMen();
  RegTableELE *RegLookUp(unsigned OP); /*���W�X�^�e�[�u���̌���*/
  RegTableELE *RegLookUp(string regName);
  /*���s�R�}���h*/
  void Run();
  /*���W�X�^�o�^�C���^�[�t�F�[�X*/
  RegTableELE *setReg(unsigned value,string name,KIND k);
  /*���ߓo�^�C���^�[�t�F�[�X*/
  void setOpration(unsigned opcode,unsigned op1,unsigned op2,unsigned op3);
  void setOpration(unsigned opcode,unsigned op1,unsigned op2);
  void print_OPLIST();
  void print_RegT();
  void print_RegT_NoImm();	/*���l�̃��W�X�^��\�����Ȃ�*/
  void print_Mem();
  void memdebug();
};

/*���߃��X�g�̗v�f*/
class OPListELE{
 private:
  unsigned OPCODE;	/*���ߔ��ʗp�R�[�h*/
  unsigned OP1,OP2,OP3;	/*�I�y�����h*/
  unsigned NumOPRs;	/*�I�y�����h�̐�*/
  
 public:
  OPListELE();
  OPListELE(unsigned opcode,unsigned op1,unsigned op2,unsigned op3,unsigned Numoprs);
  //~OPListELE();
  unsigned getNumOPRs(){return NumOPRs;};
  unsigned getOPCODE(){return OPCODE;};
  unsigned getOprand(unsigned i);/*������1����*/
  void setNumOPRs(unsigned numoprs){NumOPRs = numoprs;};
  void setOprand(unsigned op,unsigned i);
  void setOprand(unsigned op1,unsigned op2,unsigned op3){OP1 = op1;OP2 = op2;OP3 = op3;};
  void setOPCODE(unsigned opcode){OPCODE = opcode;};
  void print();
};
 
/*���W�X�^�e�[�u���̗v�f*/
class RegTableELE{
 private:
  unsigned RegID;	/*ID,���߃��X�g���ŃI�y�����h�Ƃ��Đݒ肳���l 0����n�܂�*/
  int Value;	/*INTEGER�^�Ŏg�p*/
  unsigned Address;	/*POINTER�^�Ŏg�p*/
  string Name;		/*���W�X�^�̖��O*/
  KIND kind;		/*���W�X�^�̌^*/
  //RegTableELE *P;	/*���g�ւ̃|�C���^*/
    
 public:
  RegTableELE();
  RegTableELE(unsigned id,unsigned value,string name,KIND k);

  //~RegTableELE();
  unsigned getRegID(){return RegID;};
  unsigned getValue(){return Value;};
  unsigned getAddress(){return Address;};
  string getName(){return Name;};
  KIND getKind(){return kind;};
  void setRegID(unsigned id){RegID = id;};
  void setValue(unsigned value){Value = value;};
  void setAddress(unsigned address){Address = address;};
  void setName(string name){Name = name;};
  void setKind(KIND k){kind = k;};
  RegTableELE *getPointer(){return this;};
  void print();
  void print_NoImm();		/*���l�̃��W�X�^��\�����Ȃ�*/
  string str_Kind();
};

/*SIM�̃�����*/
class myMemory{
 private:
  class MemELE{
  private:
    static unsigned AddressCounter;
    unsigned Address;	 /*�������̃A�h���X 0����n�܂邪�A�h���X��0�̗̈�ɂ̓f�[�^�͏������܂Ȃ�*/
    int Data;
    string StringData;
    bool check;			/*�f�[�^���L���ł���ꍇ:true*/
    bool region;		/*myAlloc�Ŋm�ۂ����̈�̏I�[:false*/
    bool isString;		/*�f�[�^��������ł���ꍇ*/
  public:
    MemELE();
    //~MemELE();
    unsigned getAddress(){return Address;};
    unsigned getData(){return (check == 1)?Data:0;};
    string getStringData(){return (check == 1)?StringData:"\0";};
    void setData(unsigned data){check = 1;Data = data;};
    void setData(string sdata){check = 1;StringData = sdata;};
    bool getcheck(){return check;};
    void setcheck(bool c){check = c;};
    bool getregion(){return region;};
    void setregion(bool r){region = r;};
    bool getisString(){return isString;};
    void setisString(bool s){isString = s;};
    bool print();
  };
  MemELE Memory[MemoryMax];
  int NumOfData;
 public:
  myMemory();
  //~myMemory(); 
  unsigned getData(unsigned addr);
  string getStringData(unsigned addr);
  void setData(unsigned addr,unsigned data);
  void setData(unsigned addr,string sdata);
  unsigned myAlloc(int size);/*�������̈�̊m��*/
  void myFree(unsigned addr);/*�������̈�̉�@*/
  void print();
  void printAddress();
};
#endif /*SIM_LLVM_H*/
