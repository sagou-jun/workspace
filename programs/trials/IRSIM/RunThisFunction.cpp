#include"IRSim5.hpp"

using namespace IRSIM;

int main(int argc,char *argv[]){
  IRSim SIM;
  Type *rtn;

  if(argc != 3)
    {
      cerr<<"Invalid args"<<endl;
      exit(1);
    }
  string FileName(argv[1]);
  SIM.setIRFileName(FileName);
  SIM.AllocateGlobalVariables();
  string FunctionName(argv[2]);
  SIM.RunThisFunction(rtn,FunctionName);
  SIM.dump();
  return 0;
}
