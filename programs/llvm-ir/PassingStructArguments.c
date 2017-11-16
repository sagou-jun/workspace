struct ArgumentST{
  int m1;
  char m2;
  double m3;
};

int StructArgument1(struct ArgumentST st){
  st.m1 = st.m1*2;
  st.m2 = st.m2*2;
  st.m3 = st.m3*2;
  return 0;
}

int StructArgument2(struct ArgumentST *st){
  st->m1 = st->m1*2;
  st->m2 = st->m2*2;
  st->m3 = st->m3*2;
  return 0;
}

int main(){
  struct ArgumentST st = {1,'a',3.14};
  StructArgument1(st);
  StructArgument2(&st);
}
