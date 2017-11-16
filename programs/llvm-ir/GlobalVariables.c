#include<stdio.h>

int global_int1;
int global_int2;
double global_double1;
double global_double2;

int main(){
  global_int1 = 2;
  global_int2 = 3 * global_int1;
  global_double1 = 2.5;
  global_double2 = 4.2 * global_double1;

  return 0;
}
