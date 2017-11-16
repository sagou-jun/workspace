#include<iostream>

using namespace std;

class SuperClass{
protected:
  string msg;
  int count;
public:
  SuperClass():msg("SuperClass"),count(0){};
  ~SuperClass(){};
  operator=(const SuperClass &obj)
  {cerr<<"SuperClass operator="<<endl;
    this->msg = obj.msg;
    this->count = obj.count;};
  int CountUp(){return ++count;};
  void setMsg(string text){msg = text;};
  friend ostream &operator<<(ostream &out,SuperClass &obj){
    return out<<obj.msg<<" "<<obj.count;
  };
};

class SubClass :public SuperClass{
public:
  SubClass(SuperClass &obj)
  {
    this->setMsg("SubClass");
    this->CountUp();
  };
  SubClass(const SubClass &obj)
  {
    this->SuperClass::msg = obj.SuperClass::msg;
    this->SuperClass::count = obj.SuperClass::count;
    this->CountUp();
  };
  operator=(const SubClass &obj){
    this->SuperClass::msg = obj.SuperClass::msg;
    this->SuperClass::count = obj.SuperClass::count;
    this->CountUp();
  }
  ~SubClass(){};
};

class ExternalClass :public SuperClass{
public:
  ExternalClass(const SubClass &obj){
    cerr<<"ExternalClass"<<endl;
  };
};

int main(){
  SuperClass super;
  SubClass sub(super);
  ExternalClass Ext1(super);
  cout<<super<<endl;
  cout<<sub<<endl;
  cout<<Ext1<<endl;
}
