#include<stdio.h>

struct ST{
  int i1;
  int i2;
};

struct RT{
  int i1;
  struct ST st;
};

struct HT{
  struct ST X[3][4];
};

int main(){
  struct ST st;
  struct RT rt;
  struct HT ht;
  
  st.i1 = 2;
  st.i2 = 3;
  rt.i1 = st.i1 + st.i2;
  rt.st.i1 = st.i2;
  rt.st.i2 = st.i1;
  ht.X[2][2].i1 = 1;
  
  return 0;
}
