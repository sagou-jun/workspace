#include"IRSim2.h"

int main(){
  IRSim SIM;
  for(int i = 0;i < 100;i++)
    {
      SIM.setOpration((unsigned)2,(unsigned)1,(unsigned)2,(unsigned)3);
      SIM.setOpration(1,1,3.3);
      SIM.setOpration(1,2,3.4,32.3);
      SIM.setOpration((unsigned)1,(unsigned)1,(unsigned)2,25.6);
    }
  SIM.print_OPLIST();
  return 0;
}
