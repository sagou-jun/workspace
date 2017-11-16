#define dim 100

int data(double x);
void MergeSort(int x[], int left, int right);

int main(){
  int target[dim];
  int i;
  int x = 2;
  
  for(i = 0;i < dim;i++)
    target[i] = data(i);

  return 0;
}

int data(double x){
  return x*x*((int)x%13)/(x*x+1000)*100+x;
}
