int main(){
  int i;
  volatile int x[10] = {100,200,300,400,500,600,700,800,900,1000};
  for(i = 0;i < 10;i++)
    {
      x[i] += x[i];
    }
  return 0;
}
