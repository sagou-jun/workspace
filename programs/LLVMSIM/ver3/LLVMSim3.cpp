#include"IRSim3.h"
#include<iostream>
#include"my_rtiostream.h"
#include<cstring>

using namespace std;

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
      if(!strcmp(argv[2],"-rtIOStream"))
	{
	  if(argc >= 4)
	    {
	      cout<<"PORT="<<argv[3]<<endl;
	      Station = my_rtIOStreamOpen(static_cast<const char *>(argv[3]));
	    }
	  else
	    {
	      cout<<"PORT=8765"<<endl;
	      Station = my_rtIOStreamOpen();
	    }
	  my_rtIOStreamRecv(Station,(void *)recv);
	  my_rtIOStreamSend(Station,(void *)recv);
	}
    }
  string FileName(argv[1]);
  SIM.Run(FileName);
  for(int i = 0;i < SIM.say_hello();i++)
    {
      llvm::outs()<<"HELLO"<<i<<"\n";
    }
  SIM.print_RegT();
  SIM.print_Mem();

  
  return 0;
}
