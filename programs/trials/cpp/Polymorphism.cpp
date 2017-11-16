#include<iostream>

using std::cout;
using std::endl;
using std::cerr;

class InterFace{
public:
  InterFace(){};
  virtual ~InterFace(){cerr<<"InterFace destructor called"<<endl;};
  virtual void print() = 0;
};

class Sub1:public InterFace{
public:
  Sub1(){};
  ~Sub1(){cerr<<"Sub1 destructor called"<<endl;};
  void print(){cout<<"Sub1::print"<<endl;};
};

class Sub2:public InterFace{
public:
  Sub2(){};
  ~Sub2(){cerr<<"Sub2 destructor called"<<endl;};
  void print(){cout<<"Sub2::print"<<endl;};
};

int main(){
  InterFace *p[4] = {new Sub1,new Sub2,new Sub2,new Sub1};
  for(int i = 0;i < 4;i++)
    p[i]->print();
  return 0;
}
