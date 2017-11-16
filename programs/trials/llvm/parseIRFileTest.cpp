#include"llvm/IR/LLVMContext.h"
#include"llvm/IRReader/IRReader.h"
#include"llvm/IR/Module.h"
#include"llvm/Support/SourceMgr.h"
#include"llvm/Support/raw_ostream.h"
#include<iostream>
#include<cstdlib>

using namespace llvm;

int main(int argc,char **argv,char * const *envp){

  if(argc != 2)
    {
      std::cerr<<"no input file"<<std::endl;
      exit(1);
    }

  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  std::unique_ptr<Module> Owner = parseIRFile(argv[1],Err, Context);
  if(!Owner){
    Err.print(argv[0],errs());
    return 1;
  }
  Module *Mod = Owner.get();

}
