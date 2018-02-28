int main(){
  volatile int x = 1;
  volatile int a = 0,b = 0,c = 0,d = 0;

  if(x == 1)
    {
      a = 10;
      b = 10;
    }
  else
    {
      c = 10;
      d = 10;
    }
  return 0;
}
