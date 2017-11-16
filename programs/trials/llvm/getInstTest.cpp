#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/InstIterator.h"
#include"llvm/IR/Type.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include<iostream>
#include<cstdlib>


using namespace llvm;

int main(int argc,char **argv,char * const *envp){
  
  if(argc != 2)
    {
      std::cerr<<"no input file"<<std::endl;
      exit(1);
    }

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  std::unique_ptr<Module> Owner = parseIRFile(argv[1],Err, Context);
  if(!Owner){
    Err.print(argv[0],errs());
    return 1;
  }
  Module *Mod = Owner.get();
  //std::cout<<Mod->getModuleIdentifier();
  Function *EntryFn = Mod->getFunction("main");
  for(Function::iterator FIte = EntryFn->begin(),FIteEnd = EntryFn->end();FIte != FIteEnd;++FIte)
    {
      BasicBlock *CurBB = FIte;
      errs()<<CurBB->getName()<<"\n";
      for(BasicBlock::iterator BBIte = CurBB->begin(),BBIteEnd = CurBB->end();BBIte != BBIteEnd;++BBIte)
	{
	  Instruction *CurInst = BBIte;
	  unsigned int oprs = CurInst->getNumOperands();
	  errs()<<*CurInst<<"\t:"<<CurInst->getName()<<"\t"<<CurInst->getOpcode()<<" "<<oprs<<"\t";
	  for(int i = 0;i < oprs;i++)
	    {
	      if(CurInst->getOperand(i)->hasName())
		{
		  errs()<< CurInst->getOperand(i)->getName()<<"("<<CurInst->getOperand(i)->getType()->getTypeID()<<")";
		}
	      else
		{
		  errs()<< CurInst->getOperand(i)->getValueID()<<"("<<CurInst->getOperand(i)->getType()->getTypeID()<<")";
		}
	    }
	  errs()<<"\n";
	}
      
    }

  return 0;
}
