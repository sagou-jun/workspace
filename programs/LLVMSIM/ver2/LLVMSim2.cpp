#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/InstIterator.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include"IRSim2.h"
#include"MyOPCODE.h"
#include<iostream>
#include<cstdlib>
#include<cstdio>
#include"my_rtiostream.h"

using namespace llvm;

int main(int argc,char **argv,char * const *envp){
  IRSim SIM;
  unsigned OP[3];/*SIM�̃��W�X�^�p�I�y�����h�w��q*/
  double IMM[3]; /*SIM�̑��l�w��q*/
  int RegNo = 0;
  char immcount = 0;
  
  int Station;
  char recv[256];
  
  if(argc != 2)
    {
      cerr<<"no input file"<<std::endl;
      exit(1);
    }

  Station = my_rtIOStreamOpen();
  my_rtIOStreamRecv(Station,recv);
  my_rtIOStreamSend(Station,recv);
  //my_rtIOStreamClose(Station);
  
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
	      if(CurInst->hasName())/*�����̃��W�X�^�ɖ��O�����Ă��邩���肷��*/
		OP[0] = SIM.setReg(0,CurInst->getName().lower(),POINTER)->getRegID();
	      else
		{
		  std::string testname = RegNameGen();
		  /*StringRef RN(RegNameGen()); // �Ȃ����o�O��*/
		  StringRef RN(testname);
		  Twine RegName(RN);
		  CurInst->setName(RegName);
		  OP[0] = SIM.setReg(0,CurInst->getName(),POINTER)->getRegID();
		}
	      AllocaInst *alo = dyn_cast<AllocaInst>(CurInst);
	      if(alo->isArrayAllocation())/*�����̗̈���m�ۂ���ꍇ*/
		{
		  ConstantInt *imm = dyn_cast<ConstantInt>(alo->getArraySize());
		  IMM[1] = static_cast<double>(imm->getSExtValue());
		}
	      else
		IMM[1] = 0.0;
	      SIM.setOpration(ALLOC,OP[0],IMM[1]);
	      break;
	    }
	  case Instruction::Store:
	    {
	      outs()<<"STORE";
	      /*�X�g�A��̃��W�X�^���o�^����Ă��Ȃ���΃G���[*/
	      if(CurInst->getOperand(1)->hasName())
		{
		  RegTableELE *OPR = SIM.RegLookUp(CurInst->getOperand(1)->getName());
		  if(OPR != NULL)
		    {
		      OP[0] = OPR->getRegID();
		    }
		  else
		    errs()<<"STORE::invaild operand\n";
		}
	      ConstantInt *imm = dyn_cast<ConstantInt>(CurInst->getOperand(0));
	      if(imm == NULL)/*�I�y�����h�����W�X�^�̏ꍇ*/
		{
		  if(CurInst->getOperand(0)->hasName())/*���W�X�^�ɖ��O�����Ă���ꍇ*/
		    OP[1] = SIM.setReg(0,CurInst->getOperand(0)->getName().lower(),INTEGER)->getRegID();
		  else
		    {
		      /*���W�X�^�̖���*/
		      std::string testname = RegNameGen();
		      /*StringRef RN(RegNameGen()); // �Ȃ����o�O��*/
		      StringRef RN(testname);
		      Twine regName(RN);
		      CurInst->getOperand(0)->setName(regName);
		      OP[1] = SIM.setReg(0,CurInst->getOperand(0)->getName().lower(),INTEGER)->getRegID();
		    }
		  SIM.setOpration(STORE,OP[0],OP[1]);
		}
	      else
		{
		  IMM[1] = static_cast<double>(imm->getSExtValue());
		  errs()<<imm->getSExtValue()<<" ";
		  fprintf(stderr,"%lf\n",IMM[1]);
		  SIM.setOpration(STORE,OP[0],IMM[1]);
		}
	      break;
	    }
	  case Instruction::Ret:
	    break;
	  case Instruction::Br:
	    break;
	  case Instruction::Add:
	    outs()<<"ADD";
	    OP[0] = SIM.setReg(0,CurInst->getName().lower(),INTEGER)->getRegID();
	    for(unsigned i = 1;i <= oprs;i++)
	      {
		ConstantInt *imm = dyn_cast<ConstantInt>(CurInst->getOperand(i-1));
		if(imm == NULL)/*�I�y�����h�����W�X�^�̏ꍇ*/
		  {
		    if(CurInst->getOperand(i-1)->hasName())
		      OP[i] = SIM.setReg(0,CurInst->getOperand(i-1)->getName().lower(),INTEGER)->getRegID();
		    else
		      {
			/*���W�X�^�̖���*/
			std::string testname = RegNameGen();
			/*StringRef RN(RegNameGen()); // �Ȃ����o�O��*/
			StringRef RN(testname);
			Twine regName(RN);
			CurInst->getOperand(i-1)->setName(regName);
			OP[i] = SIM.setReg(0,CurInst->getOperand(i-1)->getName().lower(),INTEGER)->getRegID();
		      }
		    outs()<<" "<<i<<":"<<CurInst->getOperand(i-1)->getName()<<" ";
		  }
		else /*�I�y�����h�����l�̏ꍇ*/
		  {
		    IMM[i] = static_cast<double>(imm->getSExtValue());
		    outs()<<" "<<i<<":"<<imm->getSExtValue();
		    immcount++;
		  }
	      }
	    switch(immcount){
	    case 0:
	      SIM.setOpration(ADD,OP[0],OP[1],OP[2]);
	      break;
	    case 1:
	      SIM.setOpration(ADD,OP[0],OP[1],IMM[2]);
	      break;
	    case 2:
	      SIM.setOpration(ADD,OP[0],IMM[1],IMM[2]);
	      break;
	    default:
	      errs()<<"ADD:invalid operands\n";
	    }
	    break;
	  case Instruction::Load:
	    {
	      outs()<<"LOAD";
	      if(CurInst->hasName())/*�����̃��W�X�^�ɖ��O�����Ă��邩���肷��*/
		OP[0] = SIM.setReg(0,CurInst->getName().lower(),INTEGER)->getRegID();
	      else
		{
		  std::string testname = RegNameGen();
		  /*StringRef RN(RegNameGen()); // �Ȃ����o�O��*/
		  StringRef RN(testname);
		  Twine RegName(RN);
		  CurInst->setName(RegName);
		  OP[0] = SIM.setReg(0,CurInst->getName(),INTEGER)->getRegID();
		}
	      /*���W�X�^���o�^����Ă��Ȃ���΃G���[*/
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
  
  SIM.print_RegT();
  SIM.print_OPLIST();
  SIM.print_Mem();
  SIM.Run();
  SIM.print_RegT();
  SIM.print_Mem();

  my_rtIOStreamClose(Station);
  
  return 0;
}
