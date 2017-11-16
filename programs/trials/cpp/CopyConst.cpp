#include<iostream>
#include<string>
#include<vector>

using std::vector;

int ID;

class source{
protected:
  source(){std::cerr<<"source Constructor called"<<std::endl;};
public:
  virtual ~source(){std::cerr<<"source destructor called"<<std::endl;};
  virtual void print() = 0;
  
};

class Parent:public source{
public:
  int i;
  int j;
  int id;
  Parent():i(100),j(200),id(ID++){std::cerr<<id<<"Parent Constructor called"<<std::endl;};
  Parent(int a,int b):i(a),j(b),id(ID++){std::cerr<<id<<"Parent Constructor called"<<std::endl;};
  virtual ~Parent(){std::cerr<<id<<"Parent Destructor called"<<std::endl;};
  Parent(const Parent &obj){i = obj.i;j = obj.j;id = ID++;std::cerr<<id<<"Parent CopyConstructor called"<<std::endl;};
  friend std::ostream &operator <<(std::ostream &os,const Parent &P){os<<"ID="<<P.id<<":"<<P.i<<" "<<P.j<<std::endl;};
  void print(){std::cout<<"Parent"<<std::endl;};
};

class Child:public Parent{
public:
  std::string str;
  char *ch;
  Child():str("Hello"){ch = new char('A');std::cerr<<Parent::id<<"Child Constructor called"<<std::endl;};
  Child(int i,int j):Parent(i,j),str("World"){ch = new char('B');std::cerr<<Parent::id<<"Child Constructor called"<<std::endl;};
  ~Child(){delete ch;std::cerr<<Parent::id<<"Child Destructor called"<<std::endl;};
  Child(const Child &obj){ch = new char(*(obj.ch));str = obj.str;std::cerr<<Parent::id<<"Child CopyCosntructor called"<<std::endl;};
  friend std::ostream &operator <<(std::ostream &os,const Child &C){os<<"ID="<<C.id<<":"<<C.str<<" "<<C.i<<" "<<C.j<<"char ="<<*(C.ch)<<std::endl;};
  void print(){std::cout<<"Child"<<std::endl;};
};

int main(void){
  ID = 0;
  Child C;
  Child C2(2017,1);
  Child C3 = C2;
  source *PC = &C;
  std::cerr<<"new"<<std::endl;
  source *PC2 = new Parent;
  PC->print();PC2->print();
  delete PC2;
  std::cerr<<C3<<std::endl;
  return 0;
}
  
