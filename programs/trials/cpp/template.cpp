#include<iostream>

using namespace std;

inline void printArgs(){
  cout<<endl;
  return ;
}

template<typename FIRST,typename... REST>
void printArgs(FIRST T,REST ... U){
  cout<<T;
  printArgs(U...);
  return ;
}

int main(){

  printArgs(1,2,3,4,5,string("6")+string("7"),8+9);
  printArgs("test"," print"," Args");
  
  return 0;
}
