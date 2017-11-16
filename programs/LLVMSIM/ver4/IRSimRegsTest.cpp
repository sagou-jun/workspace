#include"IRSimRegs.hpp"
#include<cstdlib>

using namespace IRSIM;

int main(int argc,char *argv[]){
  RegTable TestRegTable;
  unsigned lastRegID = 0;
  ImmInt testInt(1);
  ImmDouble testDouble(1.234);
  string test[0];
  double test2[0];
  int test3[0];
  string Name1 = "reg1";
  string Name2 = "reg2";
  string Name3 = "reg3";
  TestRegTable.setRegInt(1,Name1);
  TestRegTable.setRegInt(2,Name2);
  TestRegTable.setRegDouble(3.45,Name3);
  TestRegTable.setRegAdd(4,Name1);
  TestRegTable.setRegInt(3,Name2);

  IRegs *iregs = &testInt;
  cerr<<iregs->getInt()<<endl;
  
  for(RegTable::iterator Ite = TestRegTable.begin(),end = TestRegTable.end();
      Ite != end;
      Ite++)
    {
      RegTableELE *Preg = (*Ite);
      switch(Preg->getKind())
	{
	case INTEGER:
	  {
	    cout<<Preg->getInt()<<endl;
	    break;
	  }
	case DOUBLE:
	  {
	    cout<<Preg->getDouble()<<endl;
	    break;
	  }
	case POINTER:
	  {
	    cout<<Preg->getAdd()<<endl;
	    break;
	  }
	default:
	  {
	    break;
	  }
	}
    }
  TestRegTable.print();
  return 0;
}
