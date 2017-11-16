#ifndef
#define PIL_BLOCK_H
#include"rtiostream_utils.h"
#include"rtwtypes.h"
#include"my_rtiostream.h"
#inlcude"rtiostream.h"
typedef uint8_T MemUnit_T;
#include"xil_interface_common.h"
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<cstdio>

using namespace std;

#define XILCOMMS_FAILURE 0
#define XILCOMMS_SUCCESS 1
#define SENDDATA_SIZE 256
#define BUFFER_SIZE (SENDDATA_SIZE+sizeof(MemUnit_T)+sizeof(uint32_T))
#define RECV_BUFFER_DATA_IDX 0
#define XIL_APPLICATION_ID 1

typedef union{
  real_T dataValue;
  MemUnit_T field[sizeof(real_T)];
}DataValue;

class PILBlock{
  int rtiostream_id;
  MemUnit_T xilCommsBuffer[BUFFER_SIZE];
  int rtIOStreamErrorStatus;
  uint32_T dataSize;
  MemUnit_T appId;
  MemUnit_T SendData[SENDDATA_SIZE];
  uint32_T SendDataIdx;
  MemUnit_T SendBuffer[BUFFER_SIZE];
  uint32_T SendBufferIdx;
  bool Terminate;

  bool setInitialize(Function<>)
  
}

#endif
