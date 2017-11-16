#include<stdio.h>

int IArray[20];
int IArray2[10][10][5];

int main(){
  char CArray[20];
  int i,j;

  for(i = 0;i < 20;i++)
    {
      CArray[i] = 'a' + i;
      IArray[i] = i*i;
    }

  for(i = 0;i < 10;i++)
    for(j = 0;j < 5;j++)
      IArray2[1][i][j] = i*j;
  
  return 0;
}
