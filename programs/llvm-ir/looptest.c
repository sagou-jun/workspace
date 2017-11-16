#include<stdio.h>
 
int main(void){
  int i;
  int ans = 0;
  
  for(i = 0;ans >= 0;i++)
    {
      ans += i;
      ans = ans-3*i;
    }
  return 0;
}
