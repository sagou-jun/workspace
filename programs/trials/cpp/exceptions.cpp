#include<iostream>

using namespace std;

void throwTest(){
  throw 1;
  return;
}

int main(int argc,char *argv[]){
  int test = 1;

  try
    {
      throwTest();
    }
  catch(int i)
    {
      cerr<<"exception occured"<<endl;
    }
  return 0;
}
