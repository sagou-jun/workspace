#include<iostream>

using namespace std;

enum kinds{
  INT,
  UNSIGNED,
  FLOAT,
  LONGLONG,
  ULL,
  DOUBLE
};

struct MyData32bit{
  union{
    unsigned udata;
    float fdata;
  }_MyData32bit;
  operator=(const MyData32bit &obj){
    this->_MyData32bit.udata = obj._MyData32bit.udata;
    this->_MyData32bit.fdata = obj._MyData32bit.fdata;
  };
};

struct MyData64bit{
  union{
    unsigned long long uldata;
    double ddata;
  }_MyData64bit;
  operator=(const MyData64bit &obj){
    this->_MyData64bit.uldata = obj._MyData64bit.uldata;
    this->_MyData64bit.ddata = obj._MyData64bit.ddata;
  };
};

class MyData{
private:
  MyData64bit _MyData64bit;
  MyData32bit _MyData32bit;
  kinds k;
public:
  MyData(unsigned u){
    _MyData32bit._MyData32bit.udata = u;
    k = UNSIGNED;};
  MyData(int i){
    _MyData32bit._MyData32bit.udata = i;
    k = INT;};
  MyData(float f){
    _MyData32bit._MyData32bit.fdata = f;
    k = FLOAT;};
  MyData(long long ll){
    _MyData64bit._MyData64bit.uldata = ll;
    k = LONGLONG;};
  MyData(unsigned long long ul){
    _MyData64bit._MyData64bit.uldata = ul;
    k = ULL;};
  MyData(double d){
    _MyData64bit._MyData64bit.ddata = d;
    k = DOUBLE;};
  operator =(const MyData &obj){
    this->_MyData64bit = obj._MyData64bit;
    this->_MyData32bit = obj._MyData32bit;
    this->k = obj.k;
  };
  friend ostream& operator<<(ostream &out,MyData &obj);
  operator int();
};

ostream& operator<<(ostream &out,MyData &obj){
  switch(obj.k){
  case INT:
    out<<static_cast<int>(obj._MyData32bit._MyData32bit.udata);
    break;
  case UNSIGNED:
    out<<obj._MyData32bit._MyData32bit.udata;
    break;
 case FLOAT:
   out<<obj._MyData32bit._MyData32bit.fdata;
   break;
  case LONGLONG:
    out<<static_cast<long long>(obj._MyData64bit._MyData64bit.uldata);
    break;
  case ULL:
    out<<obj._MyData64bit._MyData64bit.uldata;
    break;
  case DOUBLE:
    out<<obj._MyData64bit._MyData64bit.ddata;
    break;
  }
  return out;
};

MyData::operator int(){
  cerr<<"test"<<endl;
  return 100;
};

int main(){
  MyData D1(2),D2(-3),D3(3.14),D4(3000);
  D3 = D4;
  cout<<D1<<" "<<D2<<" "<<D3<<endl;
  return 0;
}
