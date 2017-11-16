#include"SeparateCompile.hpp"

int main(){
  myClass Test1(1,2);
  myClass Test2(3,4);
  myClass Test3(5,6);
  myClass Test4(7,8);

  std::cout<<Test1+Test2;
  (Test3+Test4).print_alter();
  (Test3+Test4).print();
  
  return 0;
}
