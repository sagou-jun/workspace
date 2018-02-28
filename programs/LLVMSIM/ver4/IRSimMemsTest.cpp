#include"IRSimMems.hpp"
#include<cmath>

using namespace IRSIM;

int main(){
  SIMMem TestMem;
  unsigned x[10];
  for(int i = 0;i < 10;i++)
    x[i] = TestMem.myAlloc(static_cast<double>(0));
  TestMem.print();
  for(int i = 0;i < 10;i++)
    TestMem.getPtr(x[i])->setData(sqrt(i*2));
  TestMem.print();
  TestMem.myFree(x[1]);
  TestMem.myAlloc("Allocated again");
  TestMem.print();
  cout<<"getDataTest="<<TestMem.getPtr(x[2])->getInt()<<endl;
  return 0;
}
