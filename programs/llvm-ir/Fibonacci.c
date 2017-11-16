#include<stdio.h>

int fib(int n){
  if(n >= 2)
    return fib(n-1)+fib(n-2);
  if(n == 1)
    return 1;
  else
    return 0;
}

int main(){
  int Fibonacci = fib(8);
  printf("fib(%d) = %d\n",5,Fibonacci);
  return 0;
}
