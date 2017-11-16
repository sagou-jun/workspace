#include"IRSimMems.hpp"

using namespace IRSIM;

inline string IRSIM::str_MKind(MKINDS k){
  switch(k){
  case mem_none:
    return "NONE"; 
  case mem_string:
    return "STRING";
  case mem_double:
    return "DOUBLE";
  case mem_int:
    return "INT";
  }
}

MemELE::MemELE(){
  mem_Kind = mem_none;
}

template<>
MemData<string>::MemData(){Data = "";mem_Kind = mem_string;};
template<>
MemData<string>::MemData(string data){Data = data;mem_Kind = mem_string;};
template<>
MemData<int>::MemData(){Data = 0;mem_Kind = mem_int;};
template<>
MemData<int>::MemData(int data){Data = data;mem_Kind = mem_int;};
template<>
MemData<double>::MemData(){Data = 0;mem_Kind = mem_double;};
template<>
MemData<double>::MemData(double data){Data = data;mem_Kind = mem_double;};

template<>
inline string MemData<string>::getString(){
  return Data;
}
template<>
inline int MemData<int>::getInt(){
  return Data;
}
template<>
inline double MemData<double>::getDouble(){
  return Data;
}
template<>
inline void MemData<string>::setData(string s){
  Data = s;
}
template<>
inline void MemData<int>::setData(int i){
  Data = i;
}
template<>
inline void MemData<double>::setData(double d){
  Data = d;
}

SIMMem::SIMMem(){
  NumOfData = 0;
  
  for(unsigned i = 0;i < MemMax;i++)
    {
      Mems[i].check = false;
      Mems[i].region = false;
    }
}

SIMMem::~SIMMem(){
  for(unsigned i = 0;i < MemMax;i++)
    if(Mems[i].check)
      delete Mems[i].mem;
}

MemELE *SIMMem::getPtr(unsigned addr){
  return Mems[addr].mem;
}

unsigned SIMMem::myAllocImp(MKINDS m,string sdata,int idata,double ddata,unsigned Num){
  if((NumOfData+Num) > MemMax)
    {
      cerr<<"SIMMem::myAlloc Error(Insufficient Memory 1)"<<endl;
      return 0;
    }
  
  int count = 1;
  unsigned rtn = 1;/*メモリの先頭に未使用の領域があった場合1が返る*/
  unsigned i = 1;//アドレスが0のメモリには割り当てない
  for(;i < MemMax;i++)
    {
      /*引数Numと同じ数の連続した未使用の領域を探す*/
      if(!Mems[i].check)
	{
	  if(count == Num)
	    break;
	  count++;
	}
      else
	{
	  count = 1;
	  rtn = i + 1;
	}
      if((i + Num - count) >= MemMax)
	{
	  cerr<<"SIMMem::myAlloc Error(Insufficient Memory 2)"<<endl;
	  return 0;
	}
    }
  switch(m){
  case mem_string:
    {
      for(i = rtn;count > 0;count--,i++)
	{
	  Mems[i].mem = new MemData<string>(sdata);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	}
      break;
    }
  case mem_int:
    {
      for(i = rtn;count > 0;count--,i++)
	{
	  Mems[i].mem = new MemData<int>(idata);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	}
      break;
    }
  case mem_double:
    {
      for(i = rtn;count > 0;count--,i++)
	{
	  Mems[i].mem = new MemData<double>(ddata);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	}
	  break;
    }
  }
  NumOfData += Num;
  return rtn;
}    


bool SIMMem::myFree(unsigned addr){
  /*addrがメモリの範囲外あるいはそのアドレスのメモリが未使用の場合エラー*/
  if((addr <= 0&&MemMax <= addr)||(!Mems[addr].check))
    {
      cerr<<"SIMMem::myFree Error(Invalid Address)"<<endl;
      return false;
    }
  for(int i = addr;Mems[i].check;i++)
    {
      if(i >= MemMax)
	{
	  cerr<<"SIMMem::myFree Error(Abnormaly Data)"<<endl;
	  return false;
	}
      delete Mems[i].mem;
      Mems[i].check = false;
      if(NumOfData == 0)
	cerr<<"SIMMem::myFree Error(Invalid Access)"<<endl;
      NumOfData--;
      if(!Mems[i].region)
	break;
    }
  return true;
}

void SIMMem::print(){
  cout<<"Address:Data:Kind:NumOfData="<<NumOfData<<endl;
  for(unsigned i = 0,count = 0;(count < NumOfData)&&(i < MemMax);i++)
    if(Mems[i].check)
      {
	cout<<setw(Address_width)<<i<<":";
	Mems[i].mem->print();
	count++;
	}
}

void SIMMem::dump(){
  cerr<<"RealAdd:Address:Data:Kind:NumOfData="<<NumOfData<<endl;
  for(unsigned i = 0,count = 0;(count < NumOfData)&&(i < MemMax);i++)
    if(Mems[i].check)
      {
	cerr<<setw(Address_width)<<Mems[i].mem;
	cerr<<":";
	cerr<<setw(Address_width)<<i;
	if(Mems[i].check&&(!Mems[i].region))
	  cerr<<"(BlockEnd) ";
	cerr<<":";
	Mems[i].mem->dump();	
	count++;
      }
}
