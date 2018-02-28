#include"my_rtiostream.h"
#include<iostream>
#include<cstdlib>

using namespace std;

#define size 256

int main(int argc,char *argv[]){
  int Station;

  if(argc != 2)
    {
      cerr<<"Usage:rtiostream_close port"<<endl;
      exit(1);
    }
  Station = my_rtIOStreamOpen_client(argv[1]);
  my_rtIOStreamClose(Station);
  
 
  return 0;
}
