#ifndef SEPARATE_COMPILE_H
#define SEPARATE_COMPILE_H
#include<iostream>

/*���郁���o�֐��݂̂�ʂ̃t�@�C���ɒ�`���邱�Ƃ͂ł��Ȃ�*/

class myClass{
public:
  int A;
  int B;
  myClass();
  myClass(int a,int b);
  ~myClass();
  void print();
  void print_alter();
  myClass operator+(const myClass &y);
};
std::ostream &operator<<(std::ostream &os,const myClass &y);

#endif
