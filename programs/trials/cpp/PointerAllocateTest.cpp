#include<iostream>

using namespace std;

int main(){
  int a = 100;
  //int **ppa = &&a;		// これはできない 間にポインタ変数をはさむ必要がある
  int *pa = &a;
  int **ppa  = &pa;
  int A[2][2];
  
  cerr<<a<<" "<<pa<<" "<<ppa<<endl;
  cerr<<A<<endl;
  cerr<<A[0]<<" "<<A[1]<<endl;
  cerr<<&A[0][0]<<" "<<&A[0][1]<<endl;

  return 0;
}
