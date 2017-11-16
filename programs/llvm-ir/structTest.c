#include<stdio.h>

struct TestST{
  int mem1;
  char mem2;
  double mem3;
};

int main(){
  struct TestST st;

  st.mem1 = 1;
  st.mem2 = 'a';
  st.mem3 = 1.345;
  return 0;
}
