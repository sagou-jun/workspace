#include<iostream>

using namespace std;

template<class F,typename Args,typename ...RestArgs>
Args setFunction(F f,Args first,RestArgs ... rest){
  return f(first,rest...);
}

template<typename T>
class TestFunction{
public:
  T operator()(T t1,T t2,T t3);
};

template<typename T>
T TestFunction<T>::operator()(T t1,T t2,T t3){
  return t1+t2+t3;
}

int main(){
  TestFunction<int> test;
  cout<<setFunction(test,1,2,3)<<endl;
  return 0;
}
