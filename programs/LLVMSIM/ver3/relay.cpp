#include"rtiostream_utils.h"
#include"xil_common.h"
#include"rtwtypes.h"
#include"my_rtiostream.h"
#include"rtiostream.h"
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

typedef uint8_T MemUnit_T;

typedef union {
  real_T dataValue;
  MemUnit_T field[8];
} DataValue;

int main(int argc,char *argv[]){
  int StationA,StationB;
  FILE *relay_recv;
  DataValue in1,in2,out;
  const size_t real_T_Size = sizeof(real_T);
  MemUnit_T xilCommsBuffer[BUFFER_SIZE];
  
  int rtIOStreamErrorStatus;    
  uint32_T dataSize;
  MemUnit_T appId;

  char SendData[BUFFER_SIZE];
  int index;

  if(argc != 3)
    {
      cerr<<"Invalid arguments"<<endl;
      exit(1);
    }

  memset(xilCommsBuffer,0,sizeof(xilCommsBuffer));
  if((relay_recv = fopen("relay_recv_out","w")) == NULL)
    {
      cerr<<"fopen error"<<endl;
      exit(1);
    }
  cerr<<"file open"<<endl;
  cerr<<"sizeof MemUnit_T = "<<sizeof(MemUnit_T)<<endl;
  cerr<<"sizeof uint32_T = "<<sizeof(uint32_T)<<endl;
  cerr<<"sizeof real_T = "<<sizeof(real_T)<<endl;
  StationA = my_rtIOStreamOpen_client(argv[1]); //PILブロック側
  StationB = my_rtIOStreamOpen(argv[2]);	//MATLAB側
  cerr<<"connected"<<endl;
  cerr<<"size data"<<endl;

  while(1)
    {
      /* receive app id */
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(StationB,(void *) &appId,sizeof(appId));
      //rtIOStreamBlockingSend(StationA,(const void *) &appId,sizeof(appId));
      fprintf(relay_recv,"MATLAB>>%d %d\n",sizeof(appId),appId);
      fflush(relay_recv);
      //fprintf(stderr,"%d %d\n",sizeof(appId),(uint8_T)appId);
      if (rtIOStreamErrorStatus == RTIOSTREAM_ERROR)
	return XILCOMMS_FAILURE;
      
      /* receive size of data contained in the buffer */
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(StationB,(void *) &dataSize,sizeof(dataSize));
      //rtIOStreamBlockingSend(StationA,(const void *) &dataSize,sizeof(dataSize));
      fprintf(relay_recv,"%d %d\n",sizeof(dataSize),dataSize);
      fflush(relay_recv);
      //fprintf(stderr,"%d %d\n",sizeof(dataSize),dataSize);
      if (rtIOStreamErrorStatus == RTIOSTREAM_ERROR)
	return XILCOMMS_FAILURE;
      
#ifdef HOST_WORD_ADDRESSABLE_TESTING
      /* dataSize is in terms of MemUnit_T - convert to IOUnit_T (uint8_T). Note
       * that dataSize will not overflow since the host already divided dataSize 
       * by memUnit_T before transmission, so this multiplication should be safe
       * and won't overflow.
       */
      dataSize *= MEM_UNIT_BYTES;
#endif
      
      /* receive the data */
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(StationB,(void *) &xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      //rtIOStreamBlockingSend(StationA,(const void *) &xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      //fwrite(&xilCommsBuffer,sizeof(MemUnit_T),dataSize,relay_recv);
      //fflush(relay_recv);
      //fprintf(stderr,"%d ",dataSize);
      for(uint32_T i = 0;i < dataSize;i++)
	{
	  //fprintf(stderr,"%d ",xilCommsBuffer[(int)i]);
	  fprintf(relay_recv,"%x ",xilCommsBuffer[(int)i]);
	}
      if(xilCommsBuffer[0] == 3)
	{
	  for(uint32_T i = 0;i < real_T_Size;i++)
	    {
	      /*偶然オフセットがreal_Tのサイズだったためこの用に記述*/
	      in1.field[i] = xilCommsBuffer[(real_T_Size+1)+i];
	      in2.field[i] = xilCommsBuffer[(2*real_T_Size+1)+i];
	    }
	  fprintf(stderr,"in1 = %lf, in2 = %lf",in1.dataValue,in2.dataValue);
	}
      fprintf(relay_recv,"\n");
      fflush(relay_recv);
      fprintf(stderr,"\n");

      index = 0;
      memcpy(&(SendData[index]),&appId,sizeof(appId));
      index += (int)sizeof(appId);
      memcpy(&(SendData[index]),&dataSize,sizeof(dataSize));
      index += (int)sizeof(dataSize);
      memcpy(&(SendData[index]),&xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      index += (int)dataSize;
      //fprintf(stderr,"Send %d bytes\n",index);
      rtIOStreamBlockingSend(StationA,(const void *)SendData,(size_t)index);
      memset(xilCommsBuffer,0,BUFFER_SIZE);
      
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(StationA,(void *) &appId,sizeof(appId));
      //rtIOStreamBlockingSend(StationA,(const void *) &appId,sizeof(appId));
      //fprintf(relay_recv,"PIL_BLOCK>>%d %d\n",sizeof(appId),appId);
      //fflush(relay_recv);
      fprintf(relay_recv,"PIL_BLOCK>>");
      //fprintf(stderr,"%d %d\n",sizeof(appId),(uint8_T)appId);

      rtIOStreamBlockingRecv(StationA,(void *) &dataSize,sizeof(dataSize));
      //rtIOStreamBlockingSend(StationB,(const void *) &dataSize,sizeof(dataSize));
      //fprintf(relay_recv,"%d %d\n",sizeof(dataSize),dataSize);
      //fflush(relay_recv);
      //fprintf(stderr,"%d %d\n",sizeof(dataSize),dataSize);

      rtIOStreamBlockingRecv(StationA,(void *) &xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      //rtIOStreamBlockingSend(StationB,(const void *) &xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      //fwrite(&xilCommsBuffer,sizeof(MemUnit_T),dataSize,relay_recv);
      //fflush(relay_recv);
      //fprintf(stderr,"%d ",dataSize);
      /*
      for(uint32_T i = 0;i < dataSize;i++)
	{
	  //fprintf(stderr,"%d ",xilCommsBuffer[(int)i]);
	  fprintf(relay_recv,"%x ",xilCommsBuffer[(int)i]);
	}
      if(xilCommsBuffer[0] == 1&&xilCommsBuffer[1] == 1)
	{
	  for(int i = 0;i < real_T_Size;i++)
	    out.field[i] = xilCommsBuffer[2+i];
	}
      fprintf(stderr,"out = %lf",out.dataValue);
      fprintf(relay_recv,"\n");
      fflush(relay_recv);
      */
      fprintf(stderr,"\n");

      index = 0;
      memcpy(&(SendData[index]),&appId,sizeof(appId));
      index += (int)sizeof(appId);
      memcpy(&(SendData[index]),&dataSize,sizeof(dataSize));
      index += (int)sizeof(dataSize);
      memcpy(&(SendData[index]),&xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      index += (int)dataSize;
      //fprintf(stderr,"Send %d bytes\n",index);
      rtIOStreamBlockingSend(StationB,(const void *)SendData,(size_t)index);
      for(int i = 0;i < dataSize + sizeof(appId) + sizeof(dataSize);i++)
	fprintf(relay_recv,"%x ",SendData[i]);
      fprintf(relay_recv,"\n");
      fflush(relay_recv);
      memset(xilCommsBuffer,0,BUFFER_SIZE);

      memset(xilCommsBuffer,0,BUFFER_SIZE);
      
      if (rtIOStreamErrorStatus == RTIOSTREAM_ERROR)
	return XILCOMMS_FAILURE;
      
      /* dispatch buffer to owning application */
      /*
      switch(appId) {
      case XIL_APPLICATION_ID:
   
      default:
	//return XILCOMMS_FAILURE;
      }
      return XILCOMMS_SUCCESS;
      */
      //break;
    }
  fclose(relay_recv);
  cerr<<"connection lost"<<endl;
  return 0;
}
