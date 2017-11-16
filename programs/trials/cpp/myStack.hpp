#ifndef MYSTACK_H
#define MYSTACK_H

#include<deque>

using std::deque;

/*
 *2017/2/28 sagou jun
 *オブジェクトのポインタを管理するスタック
 *newで動的に確保したオブジェクトも管理可能
 *stlのstackはデストラクタがvirtualでなく，
 *基本型以外のデータを格納した際の動作が未定義と聞いたので作成
*/

template<class T>
class myStack{
private:
  deque<T *> stack;
  /*コピーは禁止*/
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
