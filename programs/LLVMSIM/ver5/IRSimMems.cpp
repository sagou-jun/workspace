#include"IRSimMems.hpp"

using namespace IRSIM;

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
MemData<unsigned>::MemData(){Data = 0;mem_Kind = mem_ptr;};
template<>
MemData<unsigned>::MemData(unsigned data){Data = data;mem_Kind = mem_ptr;};

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
inline unsigned MemData<unsigned>::getAdd(){
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
template<>
inline void MemData<unsigned>::setAdd(unsigned u){
  Data = u;
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
  if(addr == 0)
    {
      cerr<<"SIMMem::getPtr NULL Pointer Access"<<endl;
      return NULL;
    }
  return Mems[addr].mem;
}

unsigned SIMMem::myAllocImp(MKINDS m,string sdata,int idata,double ddata,unsigned udata,unsigned Num){
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
  case mem_ptr:
    {
       for(i = rtn;count > 0;count--,i++)
	 {
	  Mems[i].mem = new MemData<unsigned>(udata);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	}
       break;
    }
  }
  NumOfData += Num;
  return rtn;
}

inline CalcArrayRtn SIMMem::CalcArraySize(ArrayType *Array){
  CalcArrayRtn rtn = {0,mem_none};
  if(Array != NULL)
    {
      ArrayType *AT = dyn_cast<ArrayType>(Array->getElementType());
      if(AT != NULL)
	{
	  rtn = CalcArraySize(AT);
	  rtn.size *= Array->getNumElements();
	}
      else
	{
	  if(Array->getElementType()->getTypeID() == Type::IntegerTyID)
	    {
	      unsigned width = dyn_cast<IntegerType>(Array->getElementType())->getBitWidth();
	      if(width == 8)
		rtn.k = mem_string;
	      else
		rtn.k = mem_int;
	    }
	  else if(Array->getElementType()->getTypeID() == Type::DoubleTyID)
	    rtn.k = mem_double;
	  rtn.size = Array->getNumElements();
	}
    }
  return rtn;
}

unsigned SIMMem::myAllocArray(ArrayType *NewArray){
  CalcArrayRtn ArraySize = CalcArraySize(NewArray);
  //cerr<<ArraySize;
  //cerr<<endl;
  switch(ArraySize.k)
    {
    case mem_int:
      return myAllocInt(0,ArraySize.size);
    case mem_string:
      return myAllocString("",ArraySize.size);
    case mem_double:
      return myAllocDouble(0,ArraySize.size);
    default:
      return 0;
    }
}

/*インライン指定子をつけるとバグる*/
unsigned SIMMem::CalcStructSize(StructType *Struct){return Struct->getNumElements();}

unsigned SIMMem::myAllocStruct(StructType *NewStruct){
  unsigned Num = CalcStructSize(NewStruct);
  if(NumOfData+Num >= MemMax)
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
  
  i = rtn;
  for(StructType::element_iterator EleIte = NewStruct->element_begin(),EleIteEnd = NewStruct->element_end();
      (EleIte != EleIteEnd&&0 < count);
      EleIte++,i++,count--)
    {
      switch((*EleIte)->getTypeID())
	{
	case Type::IntegerTyID:
	  Mems[i].mem = new MemData<int>(0);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	  break;
	case Type::FloatTyID:
	case Type::DoubleTyID:
	  Mems[i].mem = new MemData<double>(0);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	  break;
	case Type::StructTyID:
	  Mems[i].mem = new MemData<unsigned>(0);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	  Mems[i].mem->setAdd(myAllocStruct(dyn_cast<StructType>((*EleIte))));
	  break;
	case Type::ArrayTyID:
	  Mems[i].mem = new MemData<unsigned>(0);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	  Mems[i].mem->setAdd(myAllocArray(dyn_cast<ArrayType>((*EleIte))));
	  break;
	case Type::PointerTyID:
	  Mems[i].mem = new MemData<unsigned>(0);
	  Mems[i].check = true;
	  Mems[i].region = (count == 1)?false:true;
	  break;
	default:
	  cerr<<"SIMMem::myAllocaStruct This element Typ is unimmplementede"<<endl;
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
      if(Mems[i].mem->getMemKind() != mem_ptr)
	{
	  /*アドレスが正常な範囲であることを確認する*/
	  if(i >= MemMax)
	    {
	      cerr<<"SIMMem::myFree Error(Abnormaly Data)"<<endl;
	      return false;
	    }
	  /*メモリの解放*/
	  delete Mems[i].mem;
	  Mems[i].check = false;
	}
      else
	if(!myFree(Mems[i].mem->getAdd()))
	  return false;
      /*メモリ上のデータ数のチェック*/
      if(NumOfData == 0)
	cerr<<"SIMMem::myFree Error(Invalid Access)"<<endl;
      NumOfData--;
      /*確保した領域の末端に到達した場合*/
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
  cerr<<"RealAdd    :Address:Data:Kind:NumOfData="<<NumOfData<<endl;
  for(unsigned i = 0,count = 0;(count < NumOfData)&&(i < MemMax);i++)
    if(Mems[i].check)
      {
	cerr<<setw(Address_width)<<Mems[i].mem;
	cerr<<":";
	cerr<<setw(Address_width)<<i<<":";
	if(Mems[i].check&&(!Mems[i].region))
	  cerr<<"(BlockEnd) ";
	else
	  cerr<<"           ";
	cerr<<":";
	Mems[i].mem->dump();	
	count++;
      }
}

void SIMMem::dump(unsigned addr){
  cerr<<"RealAdd    :Address:Data:Kind:NumOfData="<<NumOfData<<endl;
  for(unsigned i = addr,count = 0;(count < NumOfData)&&(i < MemMax);i++)
    if(Mems[i].check)
      {
	cerr<<setw(Address_width)<<Mems[i].mem;
	cerr<<":";
	cerr<<setw(Address_width)<<i<<":";
	if(Mems[i].check&&(!Mems[i].region))
	  cerr<<"(BlockEnd) ";
	else
	  cerr<<"           ";
	cerr<<":";
	Mems[i].mem->dump();	
	count++;
      }
}
