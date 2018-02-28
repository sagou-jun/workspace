int main(){
  volatile int x;
  volatile char flag = '\0';
  switch(x){
  case 0:
    {
      flag = 'a';
      return 1;
    }
  case 1:
    {
      flag = 'b';
      return 2;
    }
  case 2:
    {
      return 3;
    }
  case 3:
    {
      return 4;
    }
  default:
    {
      flag = 'c';
      return 0;
    }
  }
  return 0;
}
