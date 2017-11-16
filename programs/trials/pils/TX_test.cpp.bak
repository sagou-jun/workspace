#include"rtiostream_utils.h"
#include"rtwtypes.h"
#include"my_rtiostream.h"
#include"test_model.h"
#include"rtiostream.h"
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
#define size 256
#define BUFFER_SIZE 128
#define RECV_BUFFER_DATA_IDX 0
#define XIL_APPLICATION_ID 1

typedef union {
  real_T dataValue;
  MemUnit_T field[sizeof(real_T)];
}DataValue;

typedef union{
  uint32_T idx;
  MemUnit_T field[sizeof(uint32_T)];
}IDX;

int main(int argc,char *argv[]){
  int rtiostream_id;
  MemUnit_T xilCommsBuffer[BUFFER_SIZE];
  char port[10];

  int rtIOStreamErrorStatus;
  uint32_T dataSize;
  MemUnit_T appId;

  MemUnit_T SendData[BUFFER_SIZE];
  uint32_T SendDataIdx;

  MemUnit_T SendBuffer[BUFFER_SIZE];
  uint32_T SendBufferIdx;
  char Terminate = 1;

  //IDX idx_sending_data;
  
  FILE *fp;
  if((fp = fopen("C:\\cygwin64\\usr\\local\\programs\\trials\\pils\\TX_test.txt","w")) == NULL)
    {
      cerr<<"File not open"<<endl;
      exit(1);
    }

  if(argc < 3)
    {
      cerr<<"Invalid arguments"<<endl;
      exit(1);
    }

  for(int i = 1;i < argc;i++)
    if(!strcmp(argv[i],"-port"))
      {
	strcpy(port,argv[++i]);
	break;
      }
  rtiostream_id = my_rtIOStreamOpen(port);
  fprintf(fp,"rtIOStreamOpen port=%s\n",port);
  fflush(fp);
  memset(xilCommsBuffer,0,sizeof(xilCommsBuffer));

  MemUnit_T command;
  uint32_T FcnId;
  uint32_T TId;
  DataValue in1,in2,out;
  uint32_T dataIdx;
  
  while(Terminate)
    {
      /*受信*/
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)&appId,sizeof(appId));
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)&dataSize,sizeof(dataSize));
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)xilCommsBuffer,dataSize);
      fprintf(fp,"MATLAB(%d bytes)>>%x %x ",(sizeof(appId)+sizeof(dataSize)+dataSize),appId,dataSize);
      for(int i = 0;i < dataSize;i++)
	fprintf(fp,"%x ",xilCommsBuffer[i]);
      fprintf(fp,"\n");
      fflush(fp);
      /*データ作成*/
      memset(SendData,0,sizeof(SendData));
      SendData[0] = 1;
      SendDataIdx = 1;
      dataIdx = 0;
      memcpy(&command,&xilCommsBuffer[dataIdx],sizeof(command));
      dataIdx += sizeof(command);
      memcpy(&FcnId,&xilCommsBuffer[dataIdx],sizeof(FcnId));
      dataIdx += sizeof(FcnId);
      switch(command) {
      case XIL_INIT_COMMAND:
	fprintf(fp,"INIT\n");
	SendData[1] = XIL_RESPONSE_TYPE_SIZE;
	SendData[2] = 0;
	SendData[3] = sizeof(double);
	SendDataIdx += 3;
	break;
      case XIL_CONST_OUTPUT_COMMAND:
	fprintf(fp,"OUTPUT\n");
	break;
      case XIL_INITIALIZE_COMMAND:
	fprintf(fp,"INITIALIZE\n");
	test_model_Y.Out1 = 0;
	test_model_U.In1 = 0;
	test_model_U.In2 = 0;
	out.dataValue = test_model_Y.Out1;
	for(int i = 0;i < sizeof(real_T);i++)
	  SendData[2+i] = out.field[i];
	SendDataIdx += sizeof(real_T);
      case XIL_INITIALIZE_CONDITIONS_COMMAND:
	fprintf(fp,"INIT_COND\n");
	break;
      case XIL_TERMINATE_COMMAND:
	if(command == XIL_TERMINATE_COMMAND)
	  {
	    fprintf(fp,"TERMINATE\n");
	    Terminate = 0;
	  }
	break;
      case XIL_PROCESS_PARAMS_COMMAND:
	fprintf(fp,"PROCESS\n");
	break;
      case XIL_STEP_COMMAND:
	fprintf(fp,"STEP\n");
      case XIL_ENABLE_COMMAND:
	fprintf(fp,"ENABLE\n");
      case XIL_DISABLE_COMMAND:
	fprintf(fp,"DISABLE\n");
	memcpy(&TId,&xilCommsBuffer[dataIdx],sizeof(TId));
	dataIdx += sizeof(TId);
	SendData[SendDataIdx] = 1;
	SendDataIdx++;
	if(command == XIL_STEP_COMMAND)
	  {
	    /*XIL_PROCESS_INPUTS*/
	    for(int i = 0;((i < sizeof(real_T))&&(size > 0));i++)
	      {
		in1.field[i] = xilCommsBuffer[dataIdx++];
	      }
	    for(int i = 0;((i < sizeof(real_T))&&(size > 0));i++)
	      {
		in2.field[i] = xilCommsBuffer[dataIdx++];
	      }
	    fprintf(fp,"in1=%lf,in2=%lf\n",in1.dataValue,in2.dataValue);
	    fflush(fp);
	    test_model_U.In1 = in1.dataValue;
	    test_model_U.In2 = in2.dataValue;
	    /*XIL_CALL_INTERFACE*/
	    test_model_step();
	    /*XIL_PROCESS_OUTPUTS*/
	    out.dataValue = test_model_Y.Out1;
	    for(int i = 0;i < sizeof(real_T);i++)
	      SendData[SendDataIdx++] = out.field[i];
	  }
	break;
      default:
	fprintf(fp,"INVALID\n");
	my_rtIOStreamClose(rtiostream_id);
	fflush(fp);
	exit(1);
      }
      SendBufferIdx = 0;
      memcpy(&SendBuffer[SendBufferIdx],&appId,sizeof(appId));
      SendBufferIdx += (uint32_T)sizeof(appId);
      memcpy(&SendBuffer[SendBufferIdx],&SendDataIdx,sizeof(SendDataIdx));
      SendBufferIdx += (uint32_T)sizeof(SendDataIdx);
      memcpy(&SendBuffer[SendBufferIdx],&SendData,SendDataIdx);
      SendBufferIdx += SendDataIdx;
      /*
      for(uint32_T i = 0;i < SendDataIdx;i++)
	SendBuffer[SendBufferIdx++] = SendData[i];
      */
      rtIOStreamBlockingSend(rtiostream_id,(const void *)&SendBuffer,(size_t)SendBufferIdx);
      fprintf(fp,"PIL(%d bytes)>>",SendBufferIdx);
      for(int i = 0;i < SendBufferIdx;i++)
	fprintf(fp,"%x ",SendBuffer[i]);
      fprintf(fp,"\n");
      fflush(fp);
    }
  my_rtIOStreamClose(rtiostream_id);
  fclose(fp);
  return 0;
}
