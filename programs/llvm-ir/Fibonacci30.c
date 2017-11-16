int fib(int n){
  if(n >= 2)
    return fib(n-1)+fib(n-2);
  if(n == 1)
    return 1;
  else
    return 0;
}

int fib_memo(int n){
  int memo[100];
  int i;
  if(n>=100)
    return 0;
  else if(n <= 1)
    return 1;
  memo[0] = 1;memo[1] = 1;
  for(i = 2;i < n;i++)
    memo[i] = memo[i-1]+memo[i-2];
  return memo[i-1];
}

int main(){
  fib_memo(30);
  return 0;
}
