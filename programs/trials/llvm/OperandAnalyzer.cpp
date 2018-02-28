#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"
#include"llvm/IR/Constant.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/Function.h"
#include"llvm/IR/BasicBlock.h"
#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/InstrTypes.h"
#include"llvm/IR/Operator.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include<iostream>
#include<memory>
#include<string>
#include<stdlib.h>
#include<iomanip>

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
using llvm::Constant;
using llvm::ConstantInt;
using llvm::ConstantFP;
using llvm::ConstantArray;
using llvm::ConstantStruct;
using llvm::ConstantDataSequential;
/*Functions*/
using llvm::LLVMContext;
using llvm::SMDiagnostic;
using llvm::getGlobalContext;
using llvm::parseIRFile;
/*Classes*/
using llvm::Value;
using llvm::GlobalValue;
using llvm::StringRef;
using llvm::Twine;
/*LLVMIR Module*/
using llvm::Module;
using llvm::GlobalVariable;
using llvm::Function;
using llvm::BasicBlock;
/*Instructions*/
using llvm::Instruction;
using llvm::BinaryOperator;
using llvm::AllocaInst;
using llvm::BranchInst;
using llvm::ReturnInst;
using llvm::StoreInst;
using llvm::LoadInst;
using llvm::CmpInst;
using llvm::ICmpInst;
using llvm::FCmpInst;
using llvm::CallInst;
using llvm::GetElementPtrInst;
using llvm::CastInst;
using llvm::SExtInst;
using llvm::TruncInst;

using llvm::GEPOperator;
/*streams*/
using llvm::errs;
using llvm::outs;

using llvm::dyn_cast;

using std::cout ;
using std::cerr ;
using std::cin;
using std::endl ;
using std::unique_ptr;
using std::string;
using std::setw;
using std::fixed;
using std::setprecision;

int main(int argc,char *argv[]){
  std::unique_ptr<Module> Owner;
  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;

  if(argc != 2)
    {
      cerr<<"Invalid Arguments"<<endl;
      exit(1);
    }

  string FileName(argv[1]);
  Owner = parseIRFile(FileName.c_str(),Err,Context);
  if(!Owner){
    Err.print(FileName.c_str(),errs());
    return 1;
  }
  cerr<<"Module get"<<endl;
  Module *Mod = Owner.get();
  for(Module::iterator I = Mod->begin(),End = Mod->end();
      I != End;
      I++)
    {
      for(Function::iterator BBI = I->begin(),BBI_End = I->end();
	  BBI != BBI_End;
	  BBI++)
	{
	  for(BasicBlock::iterator InstI = BBI->begin(),InstI_End = BBI->end();
	      InstI != InstI_End;
	      InstI++)
	    {
	      errs()<<(*InstI)<<"\t|";
	      for(unsigned i = 0;i < InstI->getNumOperands();i++)
		errs()<<"\t"<<*(InstI->getOperand(i));
	      errs()<<"\n";
	    }
	}
    }

  return 0;
}
