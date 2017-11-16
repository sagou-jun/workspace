#ifndef MYSTACK_H
#define MYSTACK_H

#include<deque>

using std::deque;

/*
 *2017/2/28 sagou jun
 *�I�u�W�F�N�g�̃|�C���^���Ǘ�����X�^�b�N
 *new�œ��I�Ɋm�ۂ����I�u�W�F�N�g���Ǘ��\
 *stl��stack�̓f�X�g���N�^��virtual�łȂ��C
 *��{�^�ȊO�̃f�[�^���i�[�����ۂ̓��삪����`�ƕ������̂ō쐬
*/

template<class T>
class myStack{
private:
  deque<T *> stack;
  /*�R�s�[�͋֎~*/
  myStack(const myStack &obj){};
  operator =(const myStack &obj){};
public:
  myStack(){};
  virtual ~myStack(){};
  typename deque<T *>::size_type size(){return stack.size();};
  bool empty(){return stack.empty();};
  void push(T *obj){stack.push_back(obj);};
  void pop(){delete(stack.back());stack.pop_back();};
  T * get(){return stack.back();};
};

#endif
