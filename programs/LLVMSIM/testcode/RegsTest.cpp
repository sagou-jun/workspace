#include"IRSimRegs.hpp"
#include<iostream>

using namespace IRSIM;

int main(int argc,char *argv[]){
  RegTable RegT;
  RegT.setRegInt(100,"reg1");
  RegT.setRegInt(200,"reg2");
  RegT.setRegInt(300,"reg3");
  cerr<<"CallProcess"<<endl;
  RegT.CallProcess();
  RegT.setRegInt(100,"reg4");
  RegT.setRegInt(200,"reg5");
  RegT.setRegInt(300,"reg6");
  RegT.setRegInt(500,"reg1");
  unsigned reg4id = RegT.setRegInt(600,"reg4")->getRegID();
  RegT.setRegInt(700,"reg5");
  cerr<<"CallProcess"<<endl;
  RegT.CallProcess();
  RegT.PassingArgument("reg2","reg5",IRSimTypes::INTEGER);
  RegT.PassingArgument("reg4","reg4",IRSimTypes::INTEGER);
  ImmediateValue<double> imm(123.456);
  IRegs *IValue = &imm;
  RegT.PassingArgument(IValue,"reg6",IRSimTypes::DOUBLE);
  RegT.setRegDouble(3.24,"Double1");
  RegT.setRegDouble(56.3,"Double2");
  RegT.setRegDouble(78.5,"Double3");
  RegT.setRegInt(1234,"reg2");
  RegT.setRegInt(900,"reg4");
  cerr<<"======================Test"<<endl;
  RegT.dump();
  /*reg4‚Ì’l‚ð–ß‚è’l‚Æ‚µ‚ÄCreg4‚É“n‚·*/
  RegT.ReturnValue("reg4",reg4id);
  RegT.RetProcess();
  cerr<<"RetProcess"<<endl;
  RegT.dump();
  return 0;
}
