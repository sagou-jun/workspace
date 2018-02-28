#include<string>
#include<iostream>
#include<sstream>
#include<fstream>
#include<iomanip>
#include<vector>
#include<cstdio>
#include<cstdlib>
#include<cstring>
#include<new>
#include<deque>
#include<map>
#include<memory>
#include<utility>
#include<bitset>
#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"
#include"llvm/IR/Constant.h"
#include"llvm/IR/Module.h"
#include"llvm/IR/Function.h"
#include"llvm/IR/BasicBlock.h"
#include"llvm/IR/LLVMContext.h"
#include"llvm/IR/Instructions.h"
#include"llvm/IR/InstrTypes.h"
#include"llvm/IR/Operator.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"

using std::string;
using std::cout ;
using std::cerr ;
using std::cin;
using std::endl ;
using std::string ;
using std::ostream;
using std::ofstream;
using std::ifstream;
using std::stringstream;
using std::ios;
using std::hex;
using std::vector;
using std::map;
using std::pair;
using std::tuple;
using std::make_pair;
using std::setw;
using std::fixed;
using std::setprecision;
using std::deque;
using std::bad_alloc;
using std::shared_ptr;
using std::make_shared;
using std::unique_ptr;
//using std::make_unique; //C++14
using std::move;
using int64 = long long int;
/*Modules*/
using llvm::Function;
using llvm::BasicBlock;
using llvm::Instruction;
/*Types*/
using llvm::Type;
using llvm::ArrayType;
using llvm::StructType;
using llvm::PointerType;
using llvm::FunctionType;
using llvm::IntegerType;
/*Constants*/
using llvm::Constant;
using llvm::ConstantInt;
using llvm::ConstantFP;
using llvm::ConstantArray;
using llvm::ConstantStruct;
using llvm::ConstantDataSequential;
/*Functions*/
using llvm::LLVMContext;
using llvm::SMDiagnostic;
using llvm::getGlobalContext;
using llvm::parseIRFile;
/*Classes*/
using llvm::Value;
using llvm::GlobalValue;
using llvm::StringRef;
using llvm::Twine;
/*LLVMIR Module*/
using llvm::Module;
using llvm::GlobalVariable;
using llvm::Function;
using llvm::BasicBlock;
/*Instructions*/
using llvm::Instruction;
using llvm::BinaryOperator;
using llvm::AllocaInst;
using llvm::BranchInst;
using llvm::ReturnInst;
using llvm::StoreInst;
using llvm::LoadInst;
using llvm::CmpInst;
using llvm::ICmpInst;
using llvm::FCmpInst;
using llvm::CallInst;
using llvm::GetElementPtrInst;
using llvm::CastInst;
using llvm::SExtInst;
using llvm::TruncInst;

using llvm::GEPOperator;
/*streams*/
using llvm::errs;
using llvm::outs;

using llvm::dyn_cast;

class ASMLine{
public:
  using ASMElement = tuple<unsigned,unsigned,string>;
private:
  ASMElement _ASMLine;
  string BasicBlockName;
public: 
  ASMLine(unsigned LineNum,unsigned PC,const string &Code):_ASMLine(make_tuple(LineNum,PC,Code)),BasicBlockName("NoInformation"){};
  ~ASMLine(){};
  bool operator==(const ASMLine &obj){return _ASMLine == obj._ASMLine;};
  bool operator!=(const ASMLine &obj){return _ASMLine != obj._ASMLine;};
  bool operator<(const ASMLine &obj){return _ASMLine < obj._ASMLine;};
  bool operator<=(const ASMLine &obj){return _ASMLine <= obj._ASMLine;};
  const unsigned getLineNum()const{return std::get<0>(_ASMLine);};
  const unsigned getPC()const{return std::get<1>(_ASMLine);};
  const string getCode()const{return std::get<2>(_ASMLine);};
  const string getBasicBlockName()const{return BasicBlockName;};
  void setBasicBlockName(const string &BBName){BasicBlockName = BBName;};
  friend ostream &operator<<(ostream &out,const ASMLine &obj){
    return out<<obj.BasicBlockName<<"\t"<<obj.getLineNum()<<":"<<obj.getPC()<<":"<<obj.getCode();
  };
};

class ASMFunction{
private:
  string FunctionName;
  vector<ASMLine> _ASMFunction;
public:
  using iterator=vector<ASMLine>::iterator;
  using const_iterator=vector<ASMLine>::const_iterator;
  ASMFunction(const string &FnName):FunctionName(FnName){};
  ~ASMFunction(){};
  //void changeFunction(const string &FunctionName)
  void push_back(const ASMLine &obj){_ASMFunction.push_back(obj);};
  iterator begin(){return _ASMFunction.begin();};
  iterator end(){return _ASMFunction.end();};
  const string getFunctionName()const{return FunctionName;};
  void dump()const{
    cerr<<FunctionName<<endl;
    for(const_iterator I = _ASMFunction.cbegin(),End = _ASMFunction.cend();I != End;I++)
      cerr<<"\t"<<*I<<endl;
  };
};

class ASMCode{
public:
  using iterator=vector<ASMFunction>::iterator;
  using const_iterator=vector<ASMFunction>::const_iterator;
private:
  vector<ASMFunction> _ASMCode;
  unsigned FunctionIndex;
public:
  ASMCode():FunctionIndex(-1){};
  ~ASMCode(){};
  void changeFunction(const string &FunctionName){
    ASMFunction NewFunction(FunctionName);
    _ASMCode.push_back(NewFunction);
    ++FunctionIndex;
  };
  void push_back(const ASMLine &obj){_ASMCode[FunctionIndex].push_back(obj);};
  iterator begin(){return _ASMCode.begin();};
  iterator end(){return _ASMCode.end();};
  void dump()const{
    for(const_iterator I = _ASMCode.cbegin(),End = _ASMCode.cend();I != End;I++)
      I->dump();
  };
};

bool stoi_hex(const char buf[],int num,unsigned *ui,int limit=3){
  unsigned u = 0;
  int count = 0;
  for(int i = 0;i < num;i++)
    {
      if(count > limit)
	break;
      if('0'<=buf[i]&&buf[i]<='9')
	{
	  u = (unsigned)(buf[i] - 48) + (u<<4);
	  ++count;
	}
      else if('a'<=buf[i]&&buf[i]<='f')
	{
	  u = (unsigned)(buf[i] - 'a' + 10) + (u<<4);
	  ++count;
	}
      else
	continue;
    }
  *ui = u;
  return true;
}

int main(int argc,char *argv[]){

  if(argc != 3)
    {
      cerr<<"Usage::IRASMAssociater.exe IRFile ASMFile"<<endl;
      exit(1);
    }

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  unique_ptr<Module> Owner(parseIRFile(argv[1],Err,Context));
  if(!Owner){
    Err.print(argv[1],errs());
    exit(1);
  }

  vector<string> FunctionNameVector;
  Module *Mod = Owner.get();
  for(Module::iterator FnI = Mod->begin(),FnEnd = Mod->end();FnI != FnEnd;FnI++)
    {
      if(!FnI->isDeclaration())
	{
	  stringstream ss(FnI->getName().str());
	  ss<<'_'<<ss.str(); 
	  FunctionNameVector.push_back(ss.str());
	  cerr<<FnI->getName().str()<<endl;
	}
    }
    
  ifstream AsmFile(argv[2]);
  if(AsmFile.fail())
    {
      cerr<<"File Open Error"<<endl;
      exit(1);
    }
  ASMCode _ASMCode;
  string buf;
  string split[2];//split[0]:PC split[1]:Code
  string FunctionName;
  unsigned lineNum = 0;
  unsigned PC = 0;
  bool FunctionFlag = false;
  while(getline(AsmFile,buf))
    {
      lineNum++;
      if(buf.length() == 0)
	continue;
      
      stringstream ss(buf);
      getline(ss,split[0],':');
      ss.ignore(20,'\t');
      ss.ignore(20,'\t');
      getline(ss,split[1]);
      stoi_hex(split[0].c_str(),split[0].length(),&PC);
      if(PC == 0)
	{
	  stringstream ss2(split[0]);
	  ss2.ignore(30,'<');
	  getline(ss2,FunctionName,'>');
	  cerr<<"\t\tFunction="<<FunctionName<<endl;
	  FunctionFlag = (FunctionFlag)? false:false;
	  vector<string>::iterator I = find(FunctionNameVector.begin(),FunctionNameVector.end(),FunctionName);
	  //ユーザー定義関数を発見
	  if(I != FunctionNameVector.end())
	    {
	      _ASMCode.changeFunction(FunctionName);
	      FunctionFlag = !FunctionFlag;
	      FunctionNameVector.erase(I);
	      continue;
	    }
	  if(FunctionNameVector.empty())
	    break;
	}
      
      if(FunctionFlag)
	{
	  ASMLine New(lineNum,PC,split[1]);
	  _ASMCode.push_back(New);
	}
    }
  _ASMCode.dump();

  for(ASMCode::iterator CodeI = _ASMCode.begin(),CodeEnd = _ASMCode.end();CodeI != CodeEnd;CodeI++)
    {
      cerr<<CodeI->getFunctionName()<<endl;
      string BlockName = Mod->getFunction(CodeI->getFunctionName().substr(1,CodeI->getFunctionName().length()))->getEntryBlock().getName().str();
      for(ASMFunction::iterator FnI = CodeI->begin(),FnEnd = CodeI->end();FnI != FnEnd;FnI++)
	{
	  FnI->setBasicBlockName(BlockName);
	}
    }
  _ASMCode.dump();
  return 0;
}

