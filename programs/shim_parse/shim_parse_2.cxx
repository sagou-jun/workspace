#include "shim_parse_2.hxx"


using namespace SHIM_PARSE;


bool shim_parse::go_ComSet(ComponentSet &ComSet,const char* Comname)
{
  ComponentSet::ComponentSet1_sequence ComSet1;
  ComSet1 = ComSet.ComponentSet1();
  ComponentSet::ComponentSet1_iterator itr;

  for(itr = ComSet1.begin(); itr != ComSet1.end(); itr++)
    {
      ComponentSet ComSet2 (*itr);
      if(ComSet2.name() == Comname)
	{
	  ComSet = ComSet2;
	  return true;
	}
    }
  return false;
}

float shim_parse::get_latency(const char *funcname ,int type,char *ComList,...)
{ 
  auto_ptr<SystemConfiguration> SysCon;
  SysCon = SystemConfiguration_(filename_shim,xml_schema::flags::dont_validate);//全体を取ってくる
  ComponentSet ComSet (SysCon->ComponentSet());
  char* Comname = ComList;
  
  if(*Comname != '\0')
    {
      va_list args;

      va_start(args, ComList);
      while(*Comname != '|')
	{
	  go_ComSet(ComSet,Comname);
	  Comname = va_arg(args, char*);
	}
      Comname = va_arg(args,char*);
      
      AccessTypeSet ATS;                        //引数に与えるためにMComの入れ物を作る
      MasterComponent MCom (ATS,"","0","PU","");
      const char *MCom_name = Comname;

      if(go_Mcomponent(ComSet,MCom_name,MCom,funcname)==false)
	{
	  cout << "not found MasterComponent:"<< MCom_name << endl;
	  return -1;
	}
      float latency = get_funcl(funcname,MCom,type);
      if(latency < 0)
	{
	  cout << "not found this function in " << MCom_name << endl;
	  return -1;
	}
      va_end(args);
      return latency;   
    }
  else
    {
      AccessTypeSet ATS;                        //引数に与えるためにMComの入れ物を作る
      MasterComponent MCom (ATS,"","0","PU","");
     
      const char* MCom_name = "\0";
      if(go_Mcomponent(ComSet,MCom_name,MCom,funcname)==false)
	{
	  cout << "not found MasterComponent" << endl;
	  return -1;
	}

      float latency = get_funcl(funcname,MCom,type);
      if(latency < 0)
	{
	  cout << "not found this function " << endl;
	  return -1;
	}
      return latency;
    }
}

float shim_parse::get_pitch(const char *funcname ,int type,char *ComList,...)
{ 
  auto_ptr<SystemConfiguration> SysCon;
  SysCon = SystemConfiguration_(filename_shim,xml_schema::flags::dont_validate);//全体を取ってくる
  ComponentSet ComSet (SysCon->ComponentSet());
  char* Comname = ComList;
  
  if(*Comname != '\0')
    {
      va_list args;
      
      va_start(args, ComList);
      while(*Comname != '|')
	{
	  go_ComSet(ComSet,Comname);
	  Comname = va_arg(args, char*);
	}
      Comname = va_arg(args,char*);
      
      AccessTypeSet ATS;                        //引数に与えるためにMComの入れ物を作る
      MasterComponent MCom (ATS,"","0","PU","");
      const char *MCom_name = Comname;
      
      if(go_Mcomponent(ComSet,MCom_name,MCom,funcname)==false)
	{
	  cout << "not found MasterComponent:"<< MCom_name << endl;
	  return -1;
	}
      float pitch = get_function_pitch(funcname,MCom,type);
      if(pitch < 0)
	{
	  cout << "not found this function in " << MCom_name << endl;
	  return -1;
	}
      va_end(args);
      return pitch;   
    }
  else
    {
      AccessTypeSet ATS;                        //引数に与えるためにMComの入れ物を作る
      MasterComponent MCom (ATS,"","0","PU","");
     
      const char* MCom_name = "\0";
      if(go_Mcomponent(ComSet,MCom_name,MCom,funcname)==false)
	{
	  cout << "not found MasterComponent" << endl;
	  return -1;
	}

      float pitch = get_function_pitch(funcname,MCom,type);
      if(pitch < 0)
	{
	  cout << "not found this function " << endl;
	  return -1;
	}
      return pitch;
    }
}

float shim_parse::get_funcl(const char* funcname,MasterComponent MCom,int type)
{
  if(!MCom.CommonInstructionSet())
    return -1;
  CommonInstructionSet CISet (*MCom.CommonInstructionSet());
  CommonInstructionSet::Instruction_sequence Inst_seq;
  Inst_seq = CISet.Instruction();
  CommonInstructionSet::Instruction_sequence::iterator itr;
  itr = Inst_seq.begin();
  Instruction Inst (*itr);
  for(; itr != Inst_seq.end(); itr++)
    {
      Inst = (*itr);
      if(Inst.name() == funcname)
	{
	  break;
	}
    }
  Performance Perf (Inst.Performance());
  Latency latency (Perf.Latency());
  switch(type)
    {
    case BEST:
      return *latency.best();
    case WORST:
      return *latency.worst();
    case TYPICAL:
      return latency.typical();
    default:
      return -1;
    }
  
}

bool shim_parse::find_funcl(const char* funcname,MasterComponent MCom)
{
  if(!MCom.CommonInstructionSet())
    return false;
  CommonInstructionSet CISet (*MCom.CommonInstructionSet());
  CommonInstructionSet::Instruction_sequence Inst_seq;
  Inst_seq = CISet.Instruction();
  CommonInstructionSet::Instruction_sequence::iterator itr;
  itr = Inst_seq.begin();
  Instruction Inst (*itr);
  for(; itr != Inst_seq.end(); itr++)
    {
      Inst = (*itr);
      if(Inst.name() == funcname)
	{
	  return true;
	}
    }
  return false;
}

float shim_parse::get_function_pitch(const char* funcname,MasterComponent MCom,int type)
{
  if(!MCom.CommonInstructionSet())
    return -1;
  CommonInstructionSet CISet (*MCom.CommonInstructionSet());
  CommonInstructionSet::Instruction_sequence Inst_seq;
  Inst_seq = CISet.Instruction();
  CommonInstructionSet::Instruction_sequence::iterator itr;
  itr = Inst_seq.begin();
  Instruction Inst (*itr);
  for(; itr != Inst_seq.end(); itr++)
    {
      Inst = (*itr);
      if(Inst.name() == funcname)
	{
	  break;
	}
    }
  Performance Perf (Inst.Performance());
  Pitch pitch (Perf.Pitch());
  switch(type)
    {
    case BEST:
      return *pitch.best();
    case WORST:
      return *pitch.worst();
    case TYPICAL:
      return pitch.typical();
    default:
      return -1;
    }
  
}

/*ComponentSetにMCom＿nameがあればtrueを返し、なければfalseを返す*/
bool shim_parse::find_Mcomponent(ComponentSet ComSet,const char *MCom_name,MasterComponent &MCom)
{
  ComponentSet::MasterComponent_sequence MCom_seq;
  MCom_seq = ComSet.MasterComponent();
  ComponentSet::MasterComponent_sequence::iterator itr;
  if(*MCom_name != '\0')
    {
      for(itr = MCom_seq.begin(); itr != MCom_seq.end(); itr++)
	{
	  MasterComponent MCom2 (*itr);
	  if(MCom2.name() == MCom_name)
	    {
	      MCom=MCom2;
	      return true;
	    }
	}
    }
  else
    {
      itr = MCom_seq.begin();
      if(itr != MCom_seq.end())//beginとendがいっしょ＝MCom_seqが空
	{
	  MasterComponent MCom2 (*itr);
	  MCom=MCom2;
	  return true;
	}
      else return false;
    }
  return false;
}

/*ComponentSetから目的のMasterComponentを探し、それを返す*/
bool shim_parse::go_Mcomponent(ComponentSet ComSet,const char *MCom_name,MasterComponent &MCom,const char* funcname)
{
  if((find_Mcomponent(ComSet,MCom_name,MCom)) == true )
    {
      if(find_funcl(funcname,MCom) == true)
	 return true;
    }
  
  ComponentSet::ComponentSet1_sequence ComSet1;
  ComSet1 = ComSet.ComponentSet1();
  
  ComponentSet::ComponentSet1_iterator itr;
  for(itr = ComSet1.begin(); itr != ComSet1.end(); itr++)
    {
      ComponentSet ComSet2 (*itr);
      if(go_Mcomponent(ComSet2,MCom_name,MCom,funcname)==true)
	return true;
    }
  
  return false;  
}


