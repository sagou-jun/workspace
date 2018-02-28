#include"my_rtiostream.h"
#include<iostream>
#include<fstream>
#include<cstring>

using namespace std;

#define size 256

int main(int argc,char *argv[]){
  int Station;
  char recv[size];  int flag = 0;
  size_t datasize;

  switch(argc){
  case 1:
    Station = my_rtIOStreamOpen();
    break;
  case 2:
    if(!strcmp(argv[1],"client"))
      {
	Station = my_rtIOStreamOpen_client(argv[1]);
	flag = 1;
      }
    else
      Station = my_rtIOStreamOpen(argv[1]);
    break;
  case 3:
    if(!strcmp(argv[1],"client"))
      Station = my_rtIOStreamOpen_client(argv[2]);
    else if(!strcmp(argv[2],"client"))
      Station = my_rtIOStreamOpen_client(argv[1]);
    flag = 1;
    break;
  default:
    break;
  }
  if(flag == 0)
    {
      ofstream server_recv;
      server_recv.open("server_recv_out",ios::out);
      server_recv<<"size:data"<<endl;
      while(1)
	{
	  datasize = my_rtIOStreamRecv(Station,recv);
	  server_recv<<datasize<<":"<<recv<<endl;
	  cout<<datasize<<":"<<recv<<endl;
	  cout<<"connection close"<<endl;
	  server_recv.close();
	}
      
    }
  else
    {
      ofstream client_recv;
      client_recv.open("client_recv_out",ios::out);
      client_recv<<"size:data"<<endl;
      cout<<"connected"<<endl;
      while(1)
	{
	  datasize = my_rtIOStreamRecv(Station,recv);
	  client_recv<<datasize<<":"<<recv<<endl;
	  cout<<datasize<<":"<<recv<<endl;
	}
      my_rtIOStreamClose(Station);
      cout<<"connection close"<<endl;
      client_recv.close();
    }
  //my_rtIOStreamSend(Station,);
  
  return 0;
}
