void target(void){
  volatile int x = 3400,y = 2300;
  volatile int z,w;
  int i;
  for(i = 0;i < 100;++i)
    {
      z = x + 10000;
      w = y + 20000;
    }
  return;
}

int main(){
  int i;
  for(i = 0;i < 2;++i)
	target();
  return 0;
}
