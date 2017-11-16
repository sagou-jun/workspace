#include<iostream>
#include"shim_parse_2.hxx"

using std::cout;
using std::endl;
using namespace SHIM_PARSE;

int main(int argc,char *argv[]){
  shim_parse shim(argv[1]);
  cout<<"GetLatency Test"<<endl;
  cout<<"add "<<shim.get_latency("add",BEST,"\0")<<endl;
  cout<<"fadd "<<shim.get_latency("fadd",BEST,"\0")<<endl;
  cout<<"sub "<<shim.get_latency("sub",BEST,"\0")<<endl;
  cout<<"fsub "<<shim.get_latency("fsub",BEST,"\0")<<endl;
  return 0;
}
