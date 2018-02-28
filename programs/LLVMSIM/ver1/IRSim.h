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

typedef enum{		/*レジスタの型を表す*/
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
  unsigned lastRegID;		/*最後に登録したregIDの値,初期値は0*/
  unsigned PC;			/*擬似プログラムカウンタ,最後に実行した命令がOPLISTの何番目であるかを示している 初期値は0*/
 public:
  IRSim();
  ~IRSim();
  OPList &getOPLIST();
  RegTable &getRegT();
  myMemory &getMen();
  RegTableELE *RegLookUp(unsigned OP); /*レジスタテーブルの検索*/
  RegTableELE *RegLookUp(string regName);
  /*実行コマンド*/
  void Run();
  /*レジスタ登録インターフェース*/
  RegTableELE *setReg(unsigned value,string name,KIND k);
  /*命令登録インターフェース*/
  void setOpration(unsigned opcode,unsigned op1,unsigned op2,unsigned op3);
  void setOpration(unsigned opcode,unsigned op1,unsigned op2);
  void print_OPLIST();
  void print_RegT();
  void print_RegT_NoImm();	/*即値のレジスタを表示しない*/
  void print_Mem();
  void memdebug();
};

/*命令リストの要素*/
class OPListELE{
 private:
  unsigned OPCODE;	/*命令判別用コード*/
  unsigned OP1,OP2,OP3;	/*オペランド*/
  unsigned NumOPRs;	/*オペランドの数*/
  
 public:
  OPListELE();
  OPListELE(unsigned opcode,unsigned op1,unsigned op2,unsigned op3,unsigned Numoprs);
  //~OPListELE();
  unsigned getNumOPRs(){return NumOPRs;};
  unsigned getOPCODE(){return OPCODE;};
  unsigned getOprand(unsigned i);/*数字は1から*/
  void setNumOPRs(unsigned numoprs){NumOPRs = numoprs;};
  void setOprand(unsigned op,unsigned i);
  void setOprand(unsigned op1,unsigned op2,unsigned op3){OP1 = op1;OP2 = op2;OP3 = op3;};
  void setOPCODE(unsigned opcode){OPCODE = opcode;};
  void print();
};
 
/*レジスタテーブルの要素*/
class RegTableELE{
 private:
  unsigned RegID;	/*ID,命令リスト内でオペランドとして設定される値 0から始まる*/
  int Value;	/*INTEGER型で使用*/
  unsigned Address;	/*POINTER型で使用*/
  string Name;		/*レジスタの名前*/
  KIND kind;		/*レジスタの型*/
  //RegTableELE *P;	/*自身へのポインタ*/
    
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
  void print_NoImm();		/*即値のレジスタを表示しない*/
  string str_Kind();
};

/*SIMのメモリ*/
class myMemory{
 private:
  class MemELE{
  private:
    static unsigned AddressCounter;
    unsigned Address;	 /*メモリのアドレス 0から始まるがアドレスが0の領域にはデータは書き込まない*/
    int Data;
    string StringData;
    bool check;			/*データが有効である場合:true*/
    bool region;		/*myAllocで確保した領域の終端:false*/
    bool isString;		/*データが文字列である場合*/
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
  unsigned myAlloc(int size);/*メモリ領域の確保*/
  void myFree(unsigned addr);/*メモリ領域の解法*/
  void print();
  void printAddress();
};
#endif /*SIM_LLVM_H*/
