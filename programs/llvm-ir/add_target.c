void target(void){
  volatile int x = 3400,y = 2300;
  volatile int z = x+y;
  return;
}

int main(){
  int i;
  for(i = 0;i < 2;++i)
    target();
  return 0;
}
