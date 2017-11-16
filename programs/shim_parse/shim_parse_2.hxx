#ifndef SHIM_PARSE_2_HXX
#define SHIM_PARSE_2_HXX

#include <iostream>
#include <stdarg.h>
#include "shim.hxx"


  

namespace SHIM_PARSE{
#define BEST 0
#define WORST 1
#define TYPICAL 2
using std::string;
using std::endl;
using std::cout;
using std::auto_ptr;
  class shim_parse{
  private:
    string Filename;
    const char* filename_shim;
  public:
    shim_parse(string filename):Filename(filename),filename_shim(Filename.c_str()){};
    ~shim_parse(){};
    bool find_Mcomponent(ComponentSet ComSet,const char *MCom_name,MasterComponent &MCom);
    bool go_Mcomponent(ComponentSet ComSet,const char *MCom_name,MasterComponent &MCom,const char* funcname);
    float get_latency(const char* funcname,int type,char* ComList,...);
    float get_funcl(const char* funcname,MasterComponent MCom,int type);
    bool go_ComSet(ComponentSet &ComSet,const char *Comname);
    bool find_funcl(const char* funcname,MasterComponent MCom);
  };
  

}
#endif
