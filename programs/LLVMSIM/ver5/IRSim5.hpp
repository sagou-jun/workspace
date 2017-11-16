#ifndef IR_SIM_H
#define IR_SIM_H
#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/InstIterator.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/Operator.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include"IRSimRegs.hpp"
#include"IRSimMems.hpp"
#include"IRSimKinds.hpp"

namespace IRSIM{
  /*Functions*/
  using llvm::LLVMContext;
  using llvm::SMDiagnostic;
  using llvm::getGlobalContext;
  using llvm::parseIRFile;
  /*Classes*/
  using llvm::Value;
  using llvm::StringRef;
  using llvm::Twine;
  /*LLVMIR Module*/
  using llvm::Module;
  using llvm::GlobalVariable;
  using llvm::Function;
  using llvm::BasicBlock;
  /*Instructions*/
  using llvm::Instruction;
  using llvm::AllocaInst;
  using llvm::BranchInst;
  using llvm::ReturnInst;
  using llvm::CmpInst;
  using llvm::CallInst;
  using llvm::GetElementPtrInst;
  using llvm::SExtInst;

  using llvm::GEPOperator;
  /*streams*/
  using llvm::errs;
  using llvm::outs;
  
#define NORMAL_RUNINST		0
#define BRANCH_RUNINST		1
#define FUNCTION_RUNINST	2
#define RETURN_RUNINST		3
#define ERROR_RUNINST		-1
  
  /*この構造体のポインタに動的に確保した領域を設定しない*/
  struct RunInstResult{
    int Result;
    llvm::BasicBlock *NextBB;
    llvm::Function *NextFunc;
  };
  
  string RegNameGen();
  
  class IRSim{
    RegTable RegT;
    SIMMem Mem;
    std::unique_ptr<Module> Owner;			/*読み込んだLLVM-IRのModule*/
    unsigned PC;			/*擬似プログラムカウンタ,現在は特に意味のない値　初期値は0*/
    int call_print_hello; /*デバッグ用*/
    unsigned myGetElementPtr(Value *OP[],unsigned oprs);
    int RunFunction(llvm::Function *CurFn);
    RunInstResult RunBasicBlock(llvm::BasicBlock *CurBB);
    RunInstResult RunInstruction(llvm::Instruction *CurInst);
  public:
    IRSim();
    IRSim(string &FileName);
    ~IRSim();
    unsigned getPC(){return PC;};
    /*実行コマンド*/
    void Run(string &FileName);
    void Run();
    /*入力ファイルの設定*/
    void setIRFileName(string &FileName);
    /*グローバル変数の確保*/
    void AllocateGlobalVariables();
    /*指定した関数の実行*/
    int RunThisFunction(Type *rtnType,string &FunctionName);
    /*デバッグ用関数*/
    void RegDump(){RegT.dump();};
    void MemDump(){Mem.dump();};
    void dump();
    /*特殊用途*/
    void hello(){cerr<<"hello_called"<<endl;call_print_hello++;};
    int say_hello(){return call_print_hello;};
    bool test_model_U_In1(double in){Mem.getPtr(170)->setData(in);};
    bool test_model_U_In2(double in){Mem.getPtr(171)->setData(in);};
    double test_model_Y(){return Mem.getPtr(172)->getDouble();};
    bool MemDataInport(string &RegName,double Data,unsigned offset = 0);
    bool MemDataExport(string &RegName,double &Data,unsigned offset = 0);
  };
}
#endif /*IR_SIM_H*/
