
int main(int argc,char *argv[]){
  LLVMContext &Context = getGlobalContext();
  SMDiagnostic Err;
  std::unique_ptr<Module> Owner = parseIRFile(IRFile.c_str(),Err,Context);
  if(!Owner){
    Err.print(IRFile.c_str(),errs());
    return ;
  }
  
  
  Mod = Owner.get();
  AllocateGlobalVariables(Mod);
  for(Module::iterator FNIte = Mod->begin(),FNIteEnd = Mod->end();
      FNIte != FNIteEnd;
      FNIte++)
    {
      RunFunction(FNIte);
    }
  outs()<<"--------Run End--------\n\n";
  dump();
  return 0;
}
