#ifndef IR_SIM_H
#define IR_SIM_H
#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/Operator.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include"IRSimKinds.hpp"
#include"IRSimRegs.hpp"
#include"IRSimMems.hpp"

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
    
  string RegNameGen();
  
  class IRSim{
    RegTable RegT;
    SIMMem Mem;
    std::unique_ptr<Module> Owner;			/*読み込んだLLVM-IRのModule*/
    unsigned PC;			/*擬似プログラムカウンタ,現在は特に意味のない値　初期値は0*/
    Stack<StackELE> FunctionStack;		/*関数呼出用のスタック*/
    unsigned myGetElementPtr(Value *OP[],unsigned oprs);
    int RunFunction(llvm::Function *CurFn);
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
    bool MemDataInport(string &RegName,double Data,unsigned offset = 0);
    bool MemDataExport(string &RegName,double &Data,unsigned offset = 0);
  };
}
#endif /*IR_SIM_H*/
