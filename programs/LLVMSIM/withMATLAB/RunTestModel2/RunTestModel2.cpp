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
  
  string FileName("C:\\cygwin64\\usr\\local\\programs\\clang_build\\test_model2.ll");
  SIM.setIRFileName(FileName);
  SIM.AllocateGlobalVariables();

  FILE *fp;
  /*ログ出力*/
  if((fp = fopen("C:\\cygwin64\\usr\\local\\programs\\LLVMSIM\\withMATLAB\\RunTestModel2\\RunTestModel2.txt","w")) == NULL)
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

  cerr<<"RunTestModel2::Arguments check"<<endl;
  if(argc < 3)
    {
      cerr<<"RunTestModel2::Invalid arguments"<<endl;
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
  #define InDataNum 4
  #define OutDataNum 3
  DataValue in[InDataNum];
  DataValue out[OutDataNum];
  uint32_T dataIdx;
  
  string ExportData("test_model2_Y");
  string InportData("test_model2_U");

  char Terminate = 1;

  while(Terminate)
    {
      for(int i = 0;i < dataSize;i++)
	fprintf(fp,"%x ",xilCommsBuffer[i]);
      fprintf(fp,"\n");
      fflush(fp);
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)&appId,sizeof(appId));
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)&dataSize,sizeof(dataSize));
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(rtiostream_id,(void *)xilCommsBuffer,dataSize);
      /*受信データの記録*/
      fprintf(fp,"appId %d\n",appId);
      fprintf(fp,"DataSize %d\n",dataSize);
      for(int i = 0;i < dataSize;i++)
	fprintf(fp,"%d ",xilCommsBuffer[i]);
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
      fprintf(fp,"command = %d\n",static_cast<int>(command));
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
	  string FunctionName("test_model2_initialize");
	  SIM.RunThisFunction(rtn,FunctionName);
	  /*data export*/
	  SendData[SendDataIdx++] = 1;
	  for(int i=0;i < OutDataNum;i++)
	    {
	      SIM.MemDataExport(ExportData,out[i].dataValue,i);
	      for(int j = 0;j < sizeof(real_T);j++)
		SendData[2+j] = out[i].field[j];
	      SendDataIdx += sizeof(real_T);
	    }
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
	    cerr<<"!!TERMINATE!! command="<<static_cast<int>(command)<<endl;
	    Terminate = 0;
	    fflush(fp);
	    fclose(fp);
	    FILE *restderr = freopen("C:\\cygwin64\\usr\\local\\programs\\LLVMSIM\\withMATLAB\\RunTestModel2\\RunTestModel2_dump.txt","w",stderr);
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
	  /*Copy TaskID*/
	  memcpy(&TId,&xilCommsBuffer[dataIdx],sizeof(TId));
	  dataIdx += sizeof(TId);
	  SendData[SendDataIdx] = 1;
	  SendDataIdx++;
	  if(command == XIL_STEP_COMMAND)
	    {
	      /*XIL_PROCESS_INPUTS*/
	      /*Data Input*/
	      for(int i = 0;i < InDataNum;i++)
		for(int j = 0;((j < sizeof(real_T))&&(size > 0));j++)
		  {
		    in[i].field[j] = xilCommsBuffer[dataIdx++];
		  }
	      cerr<<"STEP COMMAND"<<endl;
	      SIM.MemDataInport(InportData,in[0].dataValue,0);
	      SIM.MemDataInport(InportData,in[1].dataValue,1);
	      SIM.MemDataInport(InportData,in[2].dataValue,2);
	      SIM.MemDataInport(InportData,in[3].dataValue,3);
	      /*XIL_CALL_INTERFACE*/
	      string FunctionName("test_model2_step");
	      SIM.RunThisFunction(rtn,FunctionName);
	      fprintf(fp,"test\n");
	      fflush(fp);
	      /*XIL_PROCESS_OUTPUTS*/
	      for(int i=0;i < OutDataNum;i++)
		{
		  SIM.MemDataExport(ExportData,out[i].dataValue,i);
		  cerr<<"Step DataExPort Success"<<endl;
		  for(int j = 0;j < sizeof(real_T);j++)
		    SendData[2+j+sizeof(real_T)*i] = out[i].field[j];
		  SendDataIdx += sizeof(real_T);
		}
	    }
	  fprintf(fp,"SendDataIdx=%d\n",SendDataIdx);
	  for(int i = 0;i < SendDataIdx;i++)
	    fprintf(fp,"%d ",SendData[i]);
	  fprintf(fp,"\n");
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
      for(int i = 0;i < SendBufferIdx;i++)
	fprintf(fp,"%d ",SendBuffer[i]);
      fprintf(fp,"\n");
      
    }
  cerr<<"LoopEnd"<<endl;
  my_rtIOStreamClose(rtiostream_id);
 
  return 0;
}
