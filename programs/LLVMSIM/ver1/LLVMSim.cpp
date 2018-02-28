#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/InstIterator.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include"IRSim.h"
#include"MyOPCODE.h"
#include<iostream>
#include<cstdlib>

using namespace llvm;

int main(int argc,char **argv,char * const *envp){
  IRSim SIM;
  unsigned OP[3];/*SIMのオペランド指定子*/
  int RegNo = 0;
  int immcount = 0;
  
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
      outs()<<CurBB->getName()<<"\n";
      for(BasicBlock::iterator BBIte = CurBB->begin(),BBIteEnd = CurBB->end();BBIte != BBIteEnd;++BBIte)
	{
	  Instruction *CurInst = BBIte;
	  unsigned oprs = CurInst->getNumOperands();
	  outs()<<*CurInst<<"\t:"<<CurInst->getOpcodeName()<<" "<<oprs<<" ";
	  switch(CurInst->getOpcode()){
	  case Instruction::Alloca:
	    {
	      outs()<<"ALLOCA";
	      if(CurInst->hasName())/*代入先のレジスタに名前がついているか判定する*/
		OP[0] = SIM.setReg(0,CurInst->getName().lower(),POINTER)->getRegID();
	      else
		{
		  StringRef RN(RegNameGen(reg_Name));
		  Twine RegName(RN);
		  CurInst->setName(RegName);
		  OP[0] = SIM.setReg(0,CurInst->getName(),POINTER)->getRegID();
		}
	      AllocaInst *alo = dyn_cast<AllocaInst>(CurInst);
	      if(alo->isArrayAllocation())/*複数の領域を確保する場合*/
		{
		  ConstantInt *imm = dyn_cast<ConstantInt>(alo->getArraySize());
		  OP[1] = SIM.setReg(imm->getSExtValue(),RegNameGen(Imm_Name),IMMEDIATE)->getRegID();
		}
	      else
		OP[1] = SIM.setReg(0,RegNameGen(Imm_Name),IMMEDIATE)->getRegID();
	      SIM.setOpration(ALLOC,OP[0],OP[1]);
	      break;
	    }
	  case Instruction::Store:
	    {
	      outs()<<"STORE";
	      ConstantInt *imm = dyn_cast<ConstantInt>(CurInst->getOperand(0));
	      if(imm == NULL)/*オペランドがレジスタの場合*/
		{
		  if(CurInst->getOperand(0)->hasName())
		    OP[0] = SIM.setReg(0,CurInst->getOperand(0)->getName().lower(),INTEGER)->getRegID();
		  else
		    {
		      /*レジスタの命名*/
		      StringRef RN(RegNameGen(reg_Name));
		      Twine regName(RN);
		      CurInst->getOperand(0)->setName(regName);
		      OP[0] = SIM.setReg(0,CurInst->getOperand(0)->getName().lower(),INTEGER)->getRegID();
		    }
		}
	      else
		OP[0] = SIM.setReg(imm->getSExtValue(),RegNameGen(Imm_Name),IMMEDIATE)->getRegID();
	      /*レジスタが登録されていなければエラー*/
	      if(CurInst->getOperand(1)->hasName())
		{
		  RegTableELE *OPR = SIM.RegLookUp(CurInst->getOperand(1)->getName());
		  if(OPR != NULL)
		    OP[1] = OPR->getRegID();
		}
	      else
		errs()<<"STORE::invaild operand\n";
	      SIM.setOpration(STORE,OP[0],OP[1]);
	      break;
	    }
	  case Instruction::Ret:
	    break;
	  case Instruction::Br:
	    break;
	  case Instruction::Add:
	    outs()<<"add";
	    OP[0] = SIM.setReg(0,CurInst->getName().lower(),INTEGER)->getRegID();
	    for(unsigned i = 0;i < oprs;i++)
	      {
		ConstantInt *imm = dyn_cast<ConstantInt>(CurInst->getOperand(i));
		if(imm == NULL)/*オペランドがレジスタの場合*/
		  {
		    if(CurInst->getOperand(i)->hasName())
		      OP[i+1] = SIM.setReg(0,CurInst->getOperand(i)->getName().lower(),INTEGER)->getRegID();
		    else
		      {
			/*レジスタの命名*/
			StringRef RN(RegNameGen(reg_Name));
			Twine regName(RN);
			CurInst->getOperand(i)->setName(regName);
			OP[i+1] = SIM.setReg(0,CurInst->getOperand(i)->getName().lower(),INTEGER)->getRegID();
		      }
		    outs()<<" "<<i<<":"<<CurInst->getOperand(i)->getName()<<" ";
		  }
		else /*オペランドが即値の場合*/
		  {
		    if(immcount == 0)
		      {
			OP[i+1] = SIM.setReg(imm->getSExtValue(),RegNameGen(Imm_Name),IMMEDIATE)->getRegID();
			immcount = 1;
		      }
		    else
		      {
			OP[i+1] = SIM.setReg(imm->getSExtValue(),RegNameGen(Imm_Name),IMMEDIATE)->getRegID();
			immcount = 0;
		      }
		    
		    outs()<<" "<<i<<":"<<imm->getSExtValue();
		  }
	      }
	    SIM.setOpration(ADD,OP[0],OP[1],OP[2]);
	    break;
	  case Instruction::Load:
	    {
	      outs()<<"LOAD";
	      if(CurInst->hasName())/*代入先のレジスタに名前がついているか判定する*/
		OP[0] = SIM.setReg(0,CurInst->getName().lower(),INTEGER)->getRegID();
	      else
		{
		  StringRef RN(RegNameGen(reg_Name));
		  Twine RegName(RN);
		  CurInst->setName(RegName);
		  OP[0] = SIM.setReg(0,CurInst->getName(),INTEGER)->getRegID();
		}
	      /*レジスタが登録されていなければエラー*/
	      if(CurInst->getOperand(0)->hasName())
		{
		  RegTableELE *OPR = SIM.RegLookUp(CurInst->getOperand(0)->getName());
		  if(OPR != NULL)
		    OP[1] = OPR->getRegID();
		}
	      SIM.setOpration(LOAD,OP[0],OP[1]);
	      break;
	    }
	  case Instruction::ICmp:
	    break;
	  case Instruction::Call:
	    break;
	  default:
	    errs()<<"Instruction not declare\n";
	    break;
	  }
	  outs()<<"\n";
	}
    }
  SIM.print_RegT_NoImm();
  SIM.print_OPLIST();
  SIM.print_Mem();
  SIM.Run();
  SIM.print_RegT_NoImm();
  SIM.print_Mem();
  
  return 0;
}
