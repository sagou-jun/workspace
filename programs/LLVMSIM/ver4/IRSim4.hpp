#ifndef IR_SIM_H
#define IR_SIM_H
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
#include"IRSimRegs.hpp"
#include"IRSimMems.hpp"
#include<iostream>
#include<vector>
#include<string>
#include<sstream>
#include<cstdio>
#include<cmath>

namespace IRSIM{
  using std::cout;
  using std::cerr;
  using std::endl;
  using std::string;
  using std::vector;
  using std::fmod;
  using std::abs;
  using std::fabs;
  using std::isnan;
  /*Functions*/
  using llvm::LLVMContext;
  using llvm::SMDiagnostic;
  using llvm::getGlobalContext;
  using llvm::parseIRFile;
  using llvm::dyn_cast;
  /*Classes*/
  using llvm::Value;
  using llvm::StringRef;
  using llvm::Twine;
  using llvm::Type;
  using llvm::FunctionType;
  using llvm::Module;
  using llvm::GlobalVariable;
  using llvm::Function;
  using llvm::BasicBlock;
  using llvm::Instruction;
  using llvm::AllocaInst;
  using llvm::BranchInst;
  using llvm::ReturnInst;
  using llvm::CmpInst;
  using llvm::CallInst;
  
  using llvm::ConstantInt;
  using llvm::ConstantFP;
  /*streams*/
  using llvm::errs;
  using llvm::outs;
  
#define NORMAL_RUNINST		0
#define BRANCH_RUNINST		1
#define FUNCTION_RUNINST	2
#define RETURN_RUNINST		3
#define ERROR_RUNINST		-1
  
  /*���̍\���̂̃|�C���^�ɓ��I�Ɋm�ۂ����̈��ݒ肵�Ȃ�*/
  struct RunInstResult{
    int Result;
    llvm::BasicBlock *NextBB;
    llvm::Function *NextFunc;
  };
  
  string RegNameGen();
  
  class IRSim{
    RegTable RegT;
    SIMMem Mem;
    string IRFile;
    Module *Mod;
    unsigned PC;			/*�[���v���O�����J�E���^,���݂͓��ɈӖ��̂Ȃ��l�@�����l��0*/
    int call_print_hello; /*�f�o�b�O�p*/
    void AllocateGlobalVariables(llvm::Module *Mod);
    int RunFunction(llvm::Function *CurFn);
    RunInstResult RunBasicBlock(llvm::BasicBlock *CurBB);
    RunInstResult RunInstruction(llvm::Instruction *CurInst);
  public:
    IRSim();
    IRSim(string &FileName);
    ~IRSim();
    unsigned getPC(){return PC;};
    /*���s�R�}���h*/
    void Run(string &FileName);
    void Run();
    /*���̓t�@�C���̐ݒ�*/
    void setIRFileName(string &FileName){IRFile = FileName;};
    /*�w�肵�Ċ֐��̎��s*/
    int RunThisFunction(Type *rtnType,string &FunctionName);
    /*�f�o�b�O�p�֐�*/
    void dump();
    void hello(){cerr<<"hello_called"<<endl;call_print_hello++;};
    int say_hello(){return call_print_hello;};
  };
}
#endif /*IR_SIM_H*/
