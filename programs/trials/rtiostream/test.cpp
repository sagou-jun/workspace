#include"my_rtiostream.h"
#include<iostream>
#include<string>

using namespace std;

#define size 256

int main(){
  int Station;
  string str;

  Station = my_rtIOStreamOpen();
  str = my_rtIOStreamRecv(Station,size);
  cout<<str<<endl;
  my_rtIOStreamSend(Station,str);

  return 1;
}
