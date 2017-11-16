#include"IRSimMems.hpp"
#include<cmath>

using namespace IRSIM;

int main(){
  SIMMem TestMem;
  unsigned x[30];
  for(int i = 0;i < 10;i++)
    x[i] = TestMem.myAllocDouble(0);
  for(int i = 10;i < 20;i++)
    x[i] = TestMem.myAllocInt(i*2);
  for(int i = 0;i < 10;i++)
    TestMem.getPtr(x[i])->setData(i*1.5);
  for(int i = 20;i < 30;i++)
    x[i] = TestMem.myAllocChar('a'+i-20);
  TestMem.dump();
  TestMem.myFree(x[1]);
  TestMem.dump();
  cout<<"getDataTest="<<TestMem.getPtr(x[2])->getDouble()<<endl;
  TestMem.dump();
  for(int i = 0;i < 30;i++)
    TestMem.myFree(x[i]);
  TestMem.dump();
  return 0;
}
