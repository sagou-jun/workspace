#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/InstIterator.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"
#include"llvm/IR/ValueSymbolTable.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include<iostream>
#include<cstdlib>
#include<cstdio>

using namespace llvm;

int main(int argc,char **argv,char * const *envp){
  if(argc != 2)
    {
      std::cerr<<"no input file"<<std::endl;
      exit(1);
    }

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  std::unique_ptr<Module> Owner = parseIRFile(argv[1],Err,Context);
  if(!Owner){
    Err.print(argv[0],errs());
    return 1;
  }

  Module *Mod = Owner.get();
  outs()<<"Module:"<<Mod->getName()<<"\n";
  outs()<<"Global Variables:\n";
  for(Module::global_iterator GLIte = Mod->global_begin(),GLIteEnd = Mod->global_end();
      GLIte != GLIteEnd;
      GLIte++)
    {
      outs()<<"\t"<<GLIte->getName()<<"\n";
    }
  outs()<<"Functions:\n";
  for(Module::iterator FNIte = Mod->begin(),FNIteEnd = Mod->end();
      FNIte != FNIteEnd;
      FNIte++)
    {
      outs()<<"\t"<<FNIte->getName()<<"\n\t[";
      outs()<<"\tBasicBlocks\n";
      for(Function::iterator BBIte = FNIte->begin(),BBIteEnd = FNIte->end();
	  BBIte != BBIteEnd;
	  BBIte++)
	{
	  outs()<<"\t[\t|\t"<<BBIte->getName()<<"\n";
	  for(BasicBlock::iterator INIte = BBIte->begin(),INIteEnd = BBIte->end();
	      INIte != INIteEnd;
	      INIte++)
	    {
	      Instruction *CurInst = INIte;
	      outs()<<"\t[\t|\t\t"<<*CurInst<<"\n";
	    }
	}
      outs()<<"\n";
    }
  return 0;
}
