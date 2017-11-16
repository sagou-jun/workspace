int target(void){
  int x[10];
  x[0] = 1;
  x[1] = 1;
  x[2] = x[1] + x[0];
  x[3] = x[2] + x[1];
  x[4] = x[3] + x[2];
  x[5] = x[4] + x[3];
  x[6] = x[5] + x[4];
  x[7] = x[6] + x[5];
  x[8] = x[7] + x[6];
  x[9] = x[8] + x[7];
  return x[9];
}

int main(){
  int i = 0;
  for(i = 0;i < 2;i++)
    target();
  return 0;
}
