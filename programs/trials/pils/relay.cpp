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
  DataValue in[2],out[1];
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
 
  if((relay_recv = fopen("relay_recv_out.txt","w")) == NULL)
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

      /*MATLAB->relay*/
      /* receive app id */
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(StationB,(void *) &appId,sizeof(appId));
      //rtIOStreamBlockingSend(StationA,(const void *) &appId,sizeof(appId));
      fprintf(relay_recv,"MATLAB>>\n");
      fprintf(relay_recv,"appId %d\n",appId);
      fflush(relay_recv);
      if (rtIOStreamErrorStatus == RTIOSTREAM_ERROR)
	return XILCOMMS_FAILURE;
      
      /* receive size of data contained in the buffer */
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(StationB,(void *) &dataSize,sizeof(dataSize));
      fprintf(relay_recv,"datasize %d\n",dataSize);
      fflush(relay_recv);
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

      fprintf(relay_recv,"DATA ");
      for(uint32_T i = 0;i < dataSize;i++)
	{
	  fprintf(relay_recv,"%x ",xilCommsBuffer[(int)i]);
	}
      if(xilCommsBuffer[0] == 3)
	{
	  for(uint32_T i = 0;i < real_T_Size;i++)
	    {
	      /*偶然オフセットがreal_Tのサイズだったためこの用に記述*/
	      in[0].field[i] = xilCommsBuffer[(real_T_Size+1)+i];
	      in[1].field[i] = xilCommsBuffer[(2*real_T_Size+1)+i];
	    }
	  fprintf(stderr,"in1 = %lf, in2 = %lf\n",in[0].dataValue,in[1].dataValue);
	}
      fprintf(relay_recv,"\n\n");
      fflush(relay_recv);

      /*relay->PILBLOCK*/
      index = 0;
      memcpy(&(SendData[index]),&appId,sizeof(appId));
      index += (int)sizeof(appId);
      memcpy(&(SendData[index]),&dataSize,sizeof(dataSize));
      index += (int)sizeof(dataSize);
      memcpy(&(SendData[index]),&xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      index += (int)dataSize;
      rtIOStreamBlockingSend(StationA,(const void *)SendData,(size_t)index);
      memset(xilCommsBuffer,0,BUFFER_SIZE);
      
      /*PILBLOCK->relay*/
      
      rtIOStreamErrorStatus = rtIOStreamBlockingRecv(StationA,(void *) &appId,sizeof(appId));
      fprintf(relay_recv,"PIL_BLOCK>>\n");
      fprintf(relay_recv,"appID %d\n",appId);
      fflush(relay_recv);

      rtIOStreamBlockingRecv(StationA,(void *) &dataSize,sizeof(dataSize));
      fprintf(relay_recv,"dataSize %d\n",dataSize);
      fflush(relay_recv);

      rtIOStreamBlockingRecv(StationA,(void *) &xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      fprintf(relay_recv,"DATA ");
      for(uint32_T i = 0;i < dataSize;i++)
	{
	  fprintf(relay_recv,"%x ",xilCommsBuffer[(int)i]);
	}
      if(xilCommsBuffer[0] == 1&&xilCommsBuffer[1] == 1)
	{
	  for(int i = 0;i < real_T_Size;i++)
	    {
	      out[0].field[i] = xilCommsBuffer[2+i];
	    }
	}
      fprintf(stderr,"out1 = %lf\n",out[0].dataValue);
      fprintf(relay_recv,"\n\n");
      fflush(relay_recv);

      /*relay->MATLAB*/
      
      index = 0;
      memcpy(&(SendData[index]),&appId,sizeof(appId));
      index += (int)sizeof(appId);
      memcpy(&(SendData[index]),&dataSize,sizeof(dataSize));
      index += (int)sizeof(dataSize);
      memcpy(&(SendData[index]),&xilCommsBuffer[RECV_BUFFER_DATA_IDX],dataSize);
      index += (int)dataSize;
      fprintf(stderr,"Send %d bytes\n",index);
      rtIOStreamBlockingSend(StationB,(const void *)SendData,(size_t)index);
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
  //fclose(relay_recv);
  cerr<<"connection lost"<<endl;
  return 0;
}
