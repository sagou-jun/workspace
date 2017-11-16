#include"IRSim.h"
#include"MyOPCODE.h"
#include<iostream>
#include<sstream>

using namespace std;

int main(){
  IRSim SIM;
  unsigned op1,op2,op3,op4;
  ostringstream oss;

  op1 = SIM.setReg(2,"reg1",INTEGER)->getRegID();
  op2 = SIM.setReg(2,"reg2",INTEGER)->getRegID();
  op3 = SIM.setReg(977,"reg3",INTEGER)->getRegID();
  op4 = SIM.setReg(0,"ptr1",POINTER)->getRegID();
  SIM.print_RegT();
  SIM.setOpration(ALLOC,op4,op1);
  SIM.setOpration(STORE,op3,op4);
  SIM.setOpration(LOAD,op2,op4);
  SIM.Run();
  SIM.print_RegT();
  SIM.print_Mem();
  oss<<"test"<<op1;
  cerr<<oss.str();
  return 0;
}
