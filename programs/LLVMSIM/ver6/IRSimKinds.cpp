#include"IRSimKinds.hpp"

using namespace IRSIM;

template<>
void Stack<StackELE>::dump(){
  int stacksize = stack.size();
  cerr<<"Stack dump (size = "<<stacksize<<")"<<endl;
  for(deque<StackELE *>::const_iterator Ite = stack.begin(),IteEnd = stack.end();
      Ite != IteEnd;
      Ite++)
    {
      cerr<<stacksize--<<":";
      (*Ite)->dump();
    }
};

template<>
void Stack<StackELE>::push(){
  StackELE *NewObj = new StackELE();
  push(NewObj);
}

StackELE *IRSIM::GetStackELEInstance(Function *Fn,unsigned RegID){
  return new StackELE(Fn,RegID);
}

std::ostream &IRSIM::operator<<(std::ostream &out,const RunInstResult &target){
  switch(target.Result)
    {
    case ERROR_RUNINST:
      out<<"ERROR_RUNINST";
      break;
    case NORMAL_RUNINST:
      out<<"NORMAL_RUNINST";
      break;
    case BRANCH_RUNINST:
      out<<"BRANCH_RUNINST";
      break;
    case FUNCTION_RUNINST:
      out<<"FUNCTION_RUNINST";
      break;
    case RETURN_RUNINST:
      out<<"RETURN_RUNINST";
      break;
    case EXIT_RUNINST:
      out<<"EXIT_RUNINST";
      break;
    }
  return out;
}
