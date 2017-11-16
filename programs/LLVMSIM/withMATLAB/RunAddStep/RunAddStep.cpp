#include"IRSim5.hpp"
#include"rtiostream_utils.h"
#include"rtwtypes.h"
#include"my_rtiostream.h"
#include<iostream>
#include<cstring>
#include"rtiostream.h"
#include<fstream>
#include<time.h>
typedef uint8_T MemUnit_T;
#include"xil_interface_common.h"

using namespace IRSIM;

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

int main(int argc,char *argv[],const *envp){
  IRSim SIM;
  Type *rtn;
  std::time_t timer = time(NULL);
  
  string FileName("C:\\cygwin64\\usr\\local\\programs\\clang_build\\test_model.ll");
  SIM.setIRFileName(FileName);
  SIM.AllocateGlobalVariables();

  FILE *fp;
  /*ログ出力*/
  if((fp = fopen("C:\\cygwin64\\usr\\local\\programs\\LLVMSIM\\withMATLAB\\RunAddStep\\RunAddStep.txt","w")) == NULL)
    {
      cerr<<"File not open"<<endl;
      exit(1);
    }

  fprintf(fp,"%s",std::asctime(std::localtime(&timer)));
  fflush(fp);
  
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
      for(int i = 0;i < dataSize;i++)
	fprintf(fp,"%x ",xilCommsBuffer[i]);
      fprintf(fp,"\n");
      fflush(fp);
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)&appId,sizeof(appId));
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)&dataSize,sizeof(dataSize));
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)xilCommsBuffer,dataSize);
      /*データ作成*/
      memset(SendData,0,sizeof(SendData));
      SendData[0] = 1;
      SendDataIdx = 1;
      dataIdx = 0;
      memcpy(&command,&xilCommsBuffer[dataIdx],sizeof(command));
      dataIdx += sizeof(command);
      memcpy(&FcnId,&xilCommsBuffer[dataIdx],sizeof(FcnId));
      dataIdx += sizeof(FcnId);

      /*状態遷移*/
      switch(command) {
      case XIL_INIT_COMMAND:
	fprintf(fp,"XIL_INIT_COMMAND\n");
	fflush(fp);
	SendData[1] = XIL_RESPONSE_TYPE_SIZE;
	SendData[2] = 0;
	SendData[3] = sizeof(double);
	SendDataIdx += 3;
	break;
      case XIL_CONST_OUTPUT_COMMAND:
	fprintf(fp,"XIL_CONST_OUTPUT_COMMAND\n");
	fflush(fp);
	break;
      case XIL_INITIALIZE_COMMAND:
	{
	  /*test_model_initialize*/
	  fprintf(fp,"XIL_INITIALIZE_COMMNAD\n");
	  fflush(fp);
	  string FunctionName("test_model_initialize");
	  SIM.RunThisFunction(rtn,FunctionName);
	  /**/
	  out.dataValue = SIM.test_model_Y();
	  for(int i = 0;i < sizeof(real_T);i++)
	    SendData[2+i] = out.field[i];
	  SendDataIdx += sizeof(real_T);
	}
      case XIL_INITIALIZE_CONDITIONS_COMMAND:
	fprintf(fp,"XIL_INITIALIZE_CONDITIONS_COMMAND\n");
	fflush(fp);
	break;
      case XIL_TERMINATE_COMMAND:
	fprintf(fp,"XIL_TERMINATE_COMMAND\n");
	fflush(fp);
	if(command == XIL_TERMINATE_COMMAND)
	  {
	    Terminate = 0;
	    fflush(fp);
	    fclose(fp);
	    FILE *restderr = freopen("C:\\cygwin64\\usr\\local\\programs\\LLVMSIM\\withMATLAB\\RunAddStep\\RunAddStep_dump.txt","w",stderr);
	    std::setbuf(restderr,NULL);
	    SIM.dump();
	    fclose(restderr);
	  }
	break;
      case XIL_PROCESS_PARAMS_COMMAND:
	break;
      case XIL_STEP_COMMAND:
      case XIL_ENABLE_COMMAND:
      case XIL_DISABLE_COMMAND:
	{
	  fprintf(fp,"XIL_STEP_COMMAND\n");
	  fflush(fp);
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
	      SIM.test_model_U_In1(in1.dataValue);
	      SIM.test_model_U_In2(in2.dataValue);
	      /*XIL_CALL_INTERFACE*/
	      string FunctionName("test_model_step");
	      SIM.RunThisFunction(rtn,FunctionName);
	      /*XIL_PROCESS_OUTPUTS*/
	      out.dataValue = SIM.test_model_Y();
	      for(int i = 0;i < sizeof(real_T);i++)
		SendData[SendDataIdx++] = out.field[i];
	    }
	  break;
	}
      default:
	my_rtIOStreamClose(rtiostream_id);
	exit(1);
      }
      /*送信*/
      SendBufferIdx = 0;
      memcpy(&SendBuffer[SendBufferIdx],&appId,sizeof(appId));
      SendBufferIdx += (uint32_T)sizeof(appId);
      memcpy(&SendBuffer[SendBufferIdx],&SendDataIdx,sizeof(SendDataIdx));
      SendBufferIdx += (uint32_T)sizeof(SendDataIdx);
      memcpy(&SendBuffer[SendBufferIdx],&SendData,SendDataIdx);
      SendBufferIdx += SendDataIdx;
      
      rtIOStreamBlockingSend(rtiostream_id,(const void *)&SendBuffer,(size_t)SendBufferIdx);
      
    }
  my_rtIOStreamClose(rtiostream_id);
 
  return 0;
}
