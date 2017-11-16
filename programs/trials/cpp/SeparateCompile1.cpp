#include"SeparateCompile.hpp"

myClass::myClass(){
  A = 0;
  B = 0;
}

myClass::myClass(int a,int b){
  A = a;B = b;
}

myClass::~myClass(){}
	       
myClass myClass::operator+(const myClass &y){
  myClass temp;
  temp.A = A + y.A;
  temp.B = B + y.B;
  return temp;
}

std::ostream &operator<<(std::ostream &os,const myClass &y){
  os<<y.A<<":"<<y.B;
  return os;
}
