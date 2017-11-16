#include"IRSim4.hpp"

using namespace IRSIM;

IRSim::IRSim():IRFile(""){
  PC = 0;
  call_print_hello = 0;
}

IRSim::IRSim(string &FileName):IRFile(FileName){
  PC = 0;
  call_print_hello = 0;
}

void IRSim::AllocateGlobalVariables(llvm::Module *Mod){
  //cerr<<"AllocateGlobalVariables"<<endl;
  Module::GlobalListType &ListOfGlobal = Mod->getGlobalList();
  cerr<<"GlobalList size ="<<ListOfGlobal.size()<<" ";
  for(Module::global_iterator GI = Mod->global_begin(),GIEnd = Mod->global_end();
      GI != GIEnd;
      GI++)
    {
      if(GI->hasName())
	cerr<<GI->getName().str()<<endl;
      else
	cerr<<"This Varialbe doesn't have name"<<endl;
    }
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
  cerr<<"RegID:Value:DValue:Address:Name:kind"<<endl;
  for(RegTable::iterator reg_ite = RegT.begin(),reg_ite_end = RegT.end();
      reg_ite != reg_ite_end;
      reg_ite++)
    {
      (*reg_ite)->dump();
    }
  Mem.dump();
}
