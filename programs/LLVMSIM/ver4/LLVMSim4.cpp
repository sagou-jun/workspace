#include"IRSim4.hpp"
#include<iostream>
#include"my_rtiostream.h"
#include<cstring>

using namespace IRSIM;

int main(int argc,char *argv[],const *envp){
  IRSim SIM;
  char recv[256];
  int Station;
  if(argc < 2)
    {
      cerr<<"no input file"<<std::endl;
      exit(1);
    }
  else if(argc >= 3)
    {
    }
  string FileName(argv[1]);
  SIM.Run(FileName);
  for(int i = 0;i < SIM.say_hello();i++)
    cout<<"HELLO WORLD"<<endl;
  return 0;
}
