#include<iostream>

using namespace std;

class myValues{
public:
  virtual double stdDouble(void) = 0;
  virtual int stdInt(void) = 0;
  virtual unsigned stdUnsigned(void) = 0;
};

class myDouble:public myValues{
private:
  double value;
public:
  myDouble(){value = 0;};
  myDouble(double v){value = v;};
  ~myDouble(){};
  double stdDouble(){cerr<<"return double"<<endl;return value;};
  virtual int stdInt(){};
  virtual unsigned stdUnsigned(){};
};

class myInt:public myValues{
private:
  int value;
public:
  myInt(){value = 0;};
  myInt(int i){value = i;};
  ~myInt(){};
  virtual double stdDouble(){};
  int stdInt(){cerr<<"return int"<<endl;return value;};
  virtual unsigned stdUnsigned(){};
};

class myUnsigned:public myValues{
private:
  unsigned value;
public:
  myUnsigned(){value = 0;}
  myUnsigned(unsigned u){value = u;};
  ~myUnsigned(){};
  virtual double stdDouble(){};
  virtual int stdInt(){};
  unsigned stdUnsigned(){return value;};
};

class ISample{
protected:
  ISample(){};
public:
  virtual ~ISample(){};
  virtual myValues *getValue(void) = 0;
};

template<class T,typename t>
class C:public ISample{
private:
  T *ref;
public:
  C(){ref = new T(0);};
  C(t i){ref = new T(i);};
  ~C(){delete ref;};
  T *getValue(void){return ref;};
};

int main(){
  C<myInt,int> test1(100);
  C<myDouble,double> test2(2.13);
  ISample *list[2] = {&test1,&test2};
  cout<<list[0]->getValue()->stdInt()<<endl;
  cout<<list[1]->getValue()->stdDouble()<<endl;
  return 0;
}
