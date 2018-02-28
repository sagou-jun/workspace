int div2(int n){
  int X = 100;
  int Y = 200;
  int Z = 300;
  int A,B,C;

  A = 100/3;
  B = 100/2;
  C = 100/4;

  X = Y+Z;
  Y = Z+X;
  Z = Y-X;

  if(n >= 2)
    div2(n-1);
  
  return 0;
}

int main(){
  div2(3);
  return 0;
}
