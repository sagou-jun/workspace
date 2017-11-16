#define NUM 10

int arraycheck(int array[],int n){
  int i;
  for(i = 0;i < n;i++)
    if(array[i] != i)
      return 0;
  return 1;
}

int main(){
  int argumentArray[NUM];
  int constArray[5] = {0,1,2,3,4};
  int i;

  argumentArray[0] = 1;
  for(i = 1;i < NUM;i++)
    argumentArray[i] = argumentArray[i-1] + i;
  arraycheck(argumentArray,NUM);
  arraycheck(constArray,5);
  return 0;
}
