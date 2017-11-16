#include"rtiostream.h"
#include<cstdio>
#include<cstdlib>
#include<cstring>
#include<iostream>
#include<string>

using namespace std;


#define port "8765"

int main(int argc,char *argv[]){
  char rev[256];		/*受信バッファ*/
  char sed[256];		/*送信バッファ*/
  size_t recv_num = 0;		/*受信したデータのバイト数*/
  size_t send_num = 0;		/*送信したデータのバイト数*/
  int stationA;			/*ディスクリプタ*/
  char **Args = NULL;		/*rtIOStreamOpenの引数*/
  int i,j;
  
  if((Args = (char **)malloc(sizeof(char *)*4)) == NULL)
    {
      fprintf(stderr,"malloc error\n");
      exit(1);
    }
  
  Args[0] = (char *)"-port";
  Args[1] = (char *)port;
  Args[2] = (char *)"-blocking";
  Args[3] = (char *)"1";

  fprintf(stderr,"rtIOStreamOpen -port 8765 -blocking 1\n");
  
  if((stationA = rtIOStreamOpen(4,(void **)Args)) < 0)
    {
      //fprintf(stderr,"rtIOStreamOpen failed\n");
      printf("rtIOStreamOpen failed\n");
      exit(1);
    }
  printf("Stream Open\n");

  memset(rev,0,sizeof(rev));
  memset(sed,0,sizeof(sed));
  if(rtIOStreamRecv(stationA,rev,256,&recv_num) != 0)
    {
      fprintf(stderr,"rtIOStreamRecv failed\n");
      exit(1);
    }
  
  printf("Recv(%d bytes)>>%s\n",recv_num,rev);
  printf("input message>>");
  fgets(sed,256,stdin);
  if(rtIOStreamSend(stationA,sed,strlen(sed),&send_num) != 0)
    {
      fprintf(stderr,"rtIOStreamSend failed\n");
      exit(1);
    }
  printf("Send(%d bytes)>>%s",send_num,sed);
  return 0;
}
