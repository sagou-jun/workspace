#include"IRSim6.hpp"

using namespace IRSIM;

IRSim::IRSim(){
  PC = 0;
}

void IRSim::AllocateGlobalVariables(){
  Module *Mod = Owner.get();
  Module::GlobalListType &ListOfGlobal = Mod->getGlobalList();
  cerr<<"GlobalList size ="<<ListOfGlobal.size()<<endl;
  int count = 0;
  for(Module::global_iterator GI = Mod->global_begin(),GIEnd = Mod->global_end();
      GI != GIEnd;
      GI++)
    {
      //cerr<<"Operand Num ="<<GI->getNumOperands()<<endl;
      Value *GV = GI->getOperand(0);
      cerr<<count++<<":"<<GI->getName().str()<<endl;
      switch(GV->getType()->getTypeID()){
      case Type::IntegerTyID:
	{
	  ConstantInt *CI = dyn_cast<ConstantInt>(GV);
	  RegT.setRegAdd(Mem.myAllocInt(CI->getSExtValue()),GI->getName().str());
	  break;
	}
      case Type::DoubleTyID:
     	{
	  ConstantFP *CF = dyn_cast<ConstantFP>(GV);
	  RegT.setRegAdd(Mem.myAllocDouble(CF->getValueAPF().convertToDouble()),GI->getName().str());
	  break;
	}
      case Type::FloatTyID:
	{
	  ConstantFP *CF = dyn_cast<ConstantFP>(GV);
	  RegT.setRegAdd(Mem.myAllocDouble(CF->getValueAPF().convertToFloat()),GI->getName().str());
	  break;
	}
      case Type::ArrayTyID:
	{
	  ArrayType *AT = dyn_cast<ArrayType>(GV->getType());
	  RegT.setRegAdd(Mem.myAllocArray(AT),GI->getName().str())->setKind(ARRAY);
	  break;
	}
      case Type::StructTyID:
	{
	  StructType *ST = dyn_cast<StructType>(GV->getType());
	  RegT.setRegAdd(Mem.myAllocStruct(ST),GI->getName().str())->setKind(STRUCT);
	  break;
	}
      case Type::PointerTyID:
	{
	  //ポインタが指しているレジスタの取得
	  RegTableELE *reg = RegT.RegLookUp(GI->getOperand(0)->getName().str());
	  RegT.setRegAdd(reg->getAdd(),GI->getName().str())->setKind(POINTER);
	  break;
	}
      default:
	cerr<<"IRSim::AllocateGlobalVariables>>Undefined Types"<<endl;
	GV->dump();
      }
    }
  RegT.dump();
  return ;
}

IRSim::~IRSim(){
}

string IRSIM::RegNameGen(){
  static int RegNo = 0;
  std::ostringstream oss;
  oss<<"reg"<<RegNo;
  RegNo++;
  //fprintf(stderr,"RegNameGen generate %s\n",oss.str().c_str());
  return oss.str();
}

void IRSim::dump(){
  if(FunctionStack.size() > 1)
    FunctionStack.dump();
  RegT.dump();
  Mem.dump();
}

bool IRSim::MemDataInport(string &RegName,double Data,unsigned offset)
{
  cerr<<"IRSim::MemDataInport "<<RegName<<" "<<offset<<" "<<Data<<endl;
  RegTableELE *reg = RegT.RegLookUp(RegName);
  if(reg != NULL&&Mem.getPtr(reg->getAdd()) != NULL)
    {
      Mem.getPtr(reg->getAdd()+offset)->setData(Data);
      return true;
    }
  cerr<<"IRSim::MemDataInport Error"<<endl;
  return false;
}

bool IRSim::MemDataExport(string &RegName,double &Data,unsigned offset)
{
  cerr<<"IRSim::MemDataExport "<<RegName<<" "<<offset<<" ";
  RegTableELE *reg = RegT.RegLookUp(RegName);
  if(reg != NULL&&Mem.getPtr(reg->getAdd()) != NULL)
    {
      Data = Mem.getPtr(reg->getAdd()+offset)->getDouble();
      cerr<<"Data="<<Data<<endl;
      return true;
    }
  cerr<<"IRSim::MemDataExport Error"<<endl;
  return false;
}
