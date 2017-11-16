struct ST{
  double u1;
  double u2;
}st;

struct RT{
  double y;
}rt;

void add_step(){
  rt.y += st.u1 + st.u2;
}

int main(){
  int i;
  rt.y = 0;
  st.u1 = 1;
  st.u2 = 2;
  for(i = 0;i < 3;i++)
	add_step();
  return 0;
}
