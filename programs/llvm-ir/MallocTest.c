#include<stdio.h>
#include<stdlib.h>

int main(){
  int *p;

  if((p = (int *)malloc(sizeof(int))))
    {
      return -1;
    }
  
  return 0;
}
