void target(){
  volatile int w = 5000,x = 2000,y = 3000,z = 4000;
  volatile int a = 500,b = 800,c;
  x = y + z;
  w = a + b;
  c = z + x;
  y = a + w;
  z = a + b + x;
  w = c + y;
  return;
}

int main(){
  int i;
  for(i = 0;i < 2;i++)
    target();
  return 0;
}
