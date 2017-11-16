#ifndef IR_SIM_KINDS_H
#define IR_SIM_KINDS_H

#include<string>
#include<iostream>
#include<vector>
#include<sstream>
#include<cstdio>
#include<cmath>
#include"llvm/IR/Type.h"
#include"llvm/IR/Constants.h"

namespace IRSIM{
  using std::string;
  using std::cout ;
  using std::cerr ;
  using std::endl ;
  using std::string ;
  using std::ostream;
  using std::vector;
  using std::setw;
  using std::fixed;
  using std::setprecision;
  using std::fmod;
  using std::abs;
  using std::fabs;
  using std::isnan;
  /*Types*/
  using llvm::Type;
  using llvm::ArrayType;
  using llvm::StructType;
  using llvm::PointerType;
  using llvm::FunctionType; 
  using llvm::ConstantInt;
  using llvm::ConstantFP;
  using llvm::IntegerType;
  
  using llvm::dyn_cast;
  
  typedef enum{		/*レジスタの型を表す*/
    None,		/*0*/
    INTEGER,		/*1*/
    DOUBLE,		/*2*/
    LONGDOUBLE,		/*3*/
    LABEL,		/*4*/
    POINTER,		/*5*/
    ARRAY,		/*6*/
    STRING,		/*7 文字のARRAY*/
    STRUCT,		/*8*/
    Other		/*9*/
  }KINDS;

  inline string str_Kind(KINDS k){
    switch(k){
    case INTEGER:
      return "INTEGER"; 
    case STRING:
      return "STRING";
    case DOUBLE:
      return "DOUBLE";
    case LONGDOUBLE:
      return "LONGDOUBLE";
    case LABEL:
      return "LABEL";
    case POINTER:
      return "POINTER";
    case ARRAY:
      return "ARRAY";
    case STRUCT:
      return "STRUCT";
    case Other:
      return "Other";
    default :
      return "None";
    }
  }

  typedef enum{
    mem_none,			/*0*/
    mem_string,			/*1*/
    mem_int,			/*2*/
    mem_double,			/*3*/
    mem_ptr
  }MKINDS;

  inline string str_MKind(MKINDS k){
    switch(k){
    case mem_string:
      return "string";
    case mem_double:
      return "DOUBLE";
    case mem_int:
      return "INT";
    case mem_ptr:
      return "POINTER";
    default:
      return "NONE";
    }
  }
}
#endif
