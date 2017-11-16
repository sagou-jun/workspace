#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/InstIterator.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"
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
	  unsigned oprs = CurInst->getNumOperands();
	  errs()<<*CurInst<<"\t:"<<CurInst->getOpcodeName()<<" "<<oprs<<" ";
	  switch(CurInst->getOpcode()){
	  case Instruction::Alloca:
	    {
	      errs()<<" "<<0<<":"<<CurInst->getOperand(0)->getType()->getTypeID()<<" ";
	      AllocaInst *alo = dyn_cast<AllocaInst>(CurInst);
	      if(alo->isArrayAllocation())
		{
		  ConstantInt *imm = dyn_cast<ConstantInt>(alo->getArraySize());
		  errs()<<imm->getZExtValue();
		}
	      else
		{
		  errs()<<"is not ArrayAllocation";
		}
	      break;
	    }
	  case Instruction::Store:
	    break;
	  case Instruction::Ret:
	    break;
	  case Instruction::Br:
	    break;
	  case Instruction::Add:
	    errs()<<"add";
	    for(unsigned i = 0;i < oprs;i++)
	      {
		
		errs()<<" "<<i<<":"<<CurInst->getOperand(i)->getType()->getTypeID()<<" ";
		ConstantInt *imm = dyn_cast<ConstantInt>(CurInst->getOperand(i));
		if(imm == NULL)/*オペランドがレジスタの場合*/
		  {
		    if(CurInst->getOperand(i)->hasName())
		      errs()<<CurInst->getOperand(i)->getName();
		    else
		      {
			Twine regName("reg0");
			CurInst->getOperand(i)->setName(regName);
			errs()<<CurInst->getOperand(i)->getName();
			//std::cout<<CurInst->getOperand(i)->getName().lower()<<std::endl;
		      }
		  }
		else
		  errs()<<imm->getValue().getZExtValue();
	      }
	    break;
	  case Instruction::Load:
	    break;
	  case Instruction::ICmp:
	    break;
	  case Instruction::Call:
	    break;
	  default:
	    errs()<<"Instruction not declare\n";
	    break;
	  }
	  errs()<<"\n";
	}
    }

  return 0;
}
