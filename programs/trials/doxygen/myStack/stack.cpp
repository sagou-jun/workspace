#include<iostream>
#include<string>
#include"mystack.hpp"

using namespace std;

/**
 * @file stack.cpp
 *
 * @mainpage
 * doxygenのテスト<br>
 * 試しに適当なプログラムでdoxygenを使ってみた
 * */

/**
 * スタックに積むデータ構造のクラス
 */
 class myData{
  int myInt;
  double myDouble;
  string myString;
  myData(const myData &obj){cerr<<"myData CopyConst"<<endl;myInt = obj.myInt;myDouble = obj.myDouble;myString = obj.myString;};
  operator =(const myData &obj){cerr<<"myData CopyConst"<<endl;myInt = obj.myInt;myDouble = obj.myDouble;myString = obj.myString;};
public:
  myData():myInt(0),myDouble(0),myString(""){};
  myData(int i,double d,string str):myInt(i),myDouble(d),myString(str){};
  ~myData(){cerr<<"myData destructor called"<<endl;};
  //myData(int i = 0,double d = 0,string s = ""){myInt = i;myDouble = d;myString = s;};
  void set(int i = 0,double d = 0,string s = ""){myInt = i;myDouble = d;myString = s;};
  void print(){cout<<"myInt: "<<myInt<<", myDouble: "<<myDouble<<", myString: "<<myString<<endl;};
};

/*
class myStack{
private:
  deque<myData *> s;
  myStack(const myStack &obj){};
  operator =(const myStack &obj){};
public:
  myStack(){};
  ~myStack(){};
  deque<myData *>::size_type size(){return s.size();};
  bool empty(){return s.empty();};
  void push(myData *obj){s.push_back(obj);};
  void pop(){s.pop_back();};
  myData *get(){return s.back();};
};

int main(){
  myData data[5];
  data[0].set(1,0.5,"data1");
  data[1].set(2,0.25,"data2");
  data[2].set(3,0.125,"data3");
  data[3].set(4,0.0625,"data4");
  data[4].set(5,0.03125,"data5");
  myStack<myData> S;
  cout<<S.empty()<<endl;
  for(int i=0;i < 5;i++)
    {
      S.push(&data[i]);
    }
  cout<<S.empty()<<"Size ="<<S.size()<<endl;
  for(int i=0;i < 5;i++)
    {
      S.get()->print();
      S.pop();
    }
  return 0;
}
*/
/*動的確保したクラスに対するテスト*/
int main(){
  myData *data_ptr[5];
  myStack<myData> S;
  for(int i = 0;i < 5;i++)
    {
      data_ptr[i] = new myData(i,static_cast<double>(1/(i+1)),"");
      S.push(data_ptr[i]);
    }
  cout<<S.empty()<<"Size ="<<S.size()<<endl;
  for(int i = 0;i < 5;i++)
    {
      S.get()->print();
      S.pop();
    }
  return 0;
}
