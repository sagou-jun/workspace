int main(){
  int x = 1000;
  int y = 2000;
  int *p = &x;

  *p += y;
  p = &y;
  *p += x;
  
  return 0;
}
