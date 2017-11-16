#ifndef IR_SIM_KINDS_H
#define IR_SIM_KINDS_H

#include<string>
#include<iostream>
#include<iomanip>
#include<vector>
#include<sstream>
#include<cstdio>
#include<cstdlib>
#include<cmath>
#include<new>
#include<deque>
#include<map>
#include<utility>
#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/Function.h"
#include"llvm/IR/BasicBlock.h"

namespace IRSIM{
  using std::string;
  using std::cout ;
  using std::cerr ;
  using std::endl ;
  using std::string ;
  using std::ostream;
  using std::vector;
  using std::map;
  using std::pair;
  using std::make_pair;
  using std::setw;
  using std::fixed;
  using std::setprecision;
  using std::fmod;
  using std::abs;
  using std::fabs;
  using std::isnan;
  using std::deque;
  using std::bad_alloc;
  /*Modules*/
  using llvm::Function;
  using llvm::BasicBlock;
  using llvm::Instruction;
  /*Types*/
  using llvm::Type;
  using llvm::ArrayType;
  using llvm::StructType;
  using llvm::PointerType;
  using llvm::FunctionType;
  using llvm::IntegerType;
  /*Constants*/
  using llvm::ConstantInt;
  using llvm::ConstantFP;

  
  using llvm::dyn_cast;
  
  typedef enum{		/*レジスタの型を表す*/
    VOID,		/*0*/
    INTEGER,		/*1*/
    DOUBLE,		/*2*/
    LONGDOUBLE,		/*3*/
    LABEL,		/*4*/
    POINTER,		/*5*/
    ARRAY,		/*6*/
    STRING,		/*7 文字のARRAY*/
    STRUCT,		/*8*/
    Other		/*9*/
  }KINDS;

  typedef enum{
    ERROR_RUNINST = -1,
    NORMAL_RUNINST,
    BRANCH_RUNINST,
    FUNCTION_RUNINST,
    RETURN_RUNINST,
    EXIT_RUNINST,
  }RunInstResultCode;
  
  /*実行制御信号のデータ型*/
  struct RunInstResult{
    RunInstResultCode Result;
    BasicBlock *NextBB;
    Function *NextFunc;
  };

  std::ostream &operator<<(std::ostream &out,const RunInstResult &target);
    
  /*表示用関数*/
  inline string str_Kind(KINDS k){
    switch(k){
    case INTEGER:
      return "INTEGER"; 
    case STRING:
      return "STRING";
    case DOUBLE:
      return "DOUBLE";
    case LONGDOUBLE:
      return "LONGDOUBLE";
    case LABEL:
      return "LABEL";
    case POINTER:
      return "POINTER";
    case ARRAY:
      return "ARRAY";
    case STRUCT:
      return "STRUCT";
    case Other:
      return "Other";
    default :
      return "VOID";
    }
  }

  typedef enum{			/*メモリのデータ型を表す*/
    mem_void,			/*0*/
    mem_string,			/*1*/
    mem_int,			/*2*/
    mem_double,			/*3*/
    mem_ptr
  }MKINDS;

  /*表示用関数*/
  inline string str_MKind(MKINDS k){
    switch(k){
    case mem_string:
      return "string";
    case mem_double:
      return "DOUBLE";
    case mem_int:
      return "INT";
    case mem_ptr:
      return "POINTER";
    default:
      return "VOID";
    }
  }

  /*動的確保した領域を扱うためのコンテナクラスの拡張*/
  template<class T>
  class PtrVec{
  public:
    using iterator = typename vector<T *>::iterator;
    using const_iterator = typename vector<T *>::const_iterator;
    using size_type = typename vector<T *>::size_type;
  private:
    vector<T *> _PtrVec;
    PtrVec(const PtrVec &obj){};
    operator =(const PtrVec &obj){};
  public:
    PtrVec(){};
    virtual ~PtrVec(){
      for(iterator I = begin(),IEND = end();
	  I != IEND;
	  I++)
	{
	  delete (*I);
	}
    };
    size_type size(){return _PtrVec.size();};
    iterator begin(){return _PtrVec.begin();};
    iterator end(){return _PtrVec.end();};
    const_iterator const_begin(){return _PtrVec.cbegin();};
    const_iterator const_end(){return _PtrVec.cend();};
    void push_back(T *obj){_PtrVec.push_back(obj);};
    T *back(){return _PtrVec.back();};
  };

  template<typename t,class T>
  class PtrMap{
  public:
    using iterator  = typename map<t,T *>::iterator;
    using size_type = typename map<t,T *>::size_type;
    using const_iterator = typename map<t,T *>::const_iterator;
  private:
    map<t,T *> _PtrMap;
    PtrMap(const PtrMap &obj){};
    operator =(const PtrMap &obj){};
  public:
    PtrMap(){
    };
    virtual ~PtrMap(){
      for(iterator I = begin(),IEND = end();
	  I != IEND;
	  I++)
	{
	  delete I->second;
	}
    };
    iterator begin(){return _PtrMap.begin();};
    iterator end(){return _PtrMap.end();};
    const_iterator const_begin(){return _PtrMap.cbegin();};
    const_iterator const_end(){return _PtrMap.cend();};
    bool empty(){return _PtrMap.empty();};
    size_type size(){return _PtrMap.size();};
    iterator insert(pair<t,T *> obj){_PtrMap.insert(obj);};
    iterator find(t key){return _PtrMap.find(key);};
    T *at(t key){return _PtrMap.at(key);};
    /*_PtrMap.eraseだけを呼び出すと正しくデストラクタが呼ばれない*/
    /*mapの内部構造で使用されているpairのデストラクタがvirtualではないからと考えられる*/
    size_type erase(const t key){
      delete find(key)->second;
      _PtrMap.erase(key);
    };
  };
  
  /*Stack上のデータ構造*/
  /*call命令を呼び出した時点でのfunction,BasicBlock,Instractionのiteratorを記録する*/
  class StackELE{
  private:
    StackELE(const StackELE &obj){};
    operator =(const StackELE &obj){};
  public:
    llvm::Function* Fn;
    unsigned RegID;		// 戻り値のレジスタのID
    StackELE(Function *fn,unsigned id):Fn(fn),RegID(id){};
    StackELE():Fn(NULL),RegID(0){};
    ~StackELE(){Fn = NULL;};
    void dump(){cerr<<Fn->getName().str()<<endl;};
  };

  StackELE *GetStackELEInstance(Function *Fn,unsigned RegID);
  
  /*関数呼出用のスタック*/
  /*newで確保した領域へのポインタか，静的に確保したデータへのポインタをpushし，*/
  /*先頭のデータをbackで取り出し，popする*/
  /*メンバ関数はstdライブラリの流用*/
  template<class T>
  class Stack{
  private:
    deque<T *> stack;
    Stack(const Stack &obj){};
    operator =(const Stack &obj){};
  public:
    Stack(){};
    virtual ~Stack(){};
    typename deque<T *>::size_type size(){return stack.size();};
    bool empty(){return stack.empty();};
    void push(T *obj){stack.push_back(obj);};
    void push();
    void pop(){delete stack.back();stack.pop_back();};
    T *back(){return stack.back();};
    void dump();
  };
  
  template<>
  void Stack<StackELE>::dump();

  template<>
  void Stack<StackELE>::push();

}
#endif
