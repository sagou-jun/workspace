//#include"/usr/local/matlab/include/rtiostream.h"
#include"rtiostream.h"
#include"my_rtiostream.h"
#include<cstdio>
#include<cstdlib>
#include<cstring>
#include<iostream>

using namespace std;

#define port "8765"

int my_rtIOStreamOpen(){
  char **Args = NULL;
  int Station;
  
  if((Args = (char **)malloc(sizeof(char *)*10)) == NULL)
    {
      fprintf(stderr,"malloc error\n");
      exit(1);
    }
  
  Args[0] = (char *)"-port";			// �|�[�g�ԍ�
  Args[1] = (char *)port;
  Args[2] = (char *)"-blocking";		// �u���b�L���O�f�B�X�N���v�^
  Args[3] = (char *)"1";			// �u���b�L���O���[�h
  Args[4] = (char *)"-client";			// �N���C�A���g�w��q
  Args[5] = (char *)"0";			// �T�[�o��
  Args[6] = (char *)"-recv_timeout_secs"; 	// ��M���̃^�C���A�E�g����
  Args[7] = (char *)"-2";		 	//�f�t�H���g�̒l�B�T�[�o���͖������A�N���C�A���g����1�b
  Args[8] = (char *)"-protocol";		// �g�p����v���g�R��
  Args[9] = (char *)"TCP";			// TCP
  
  fprintf(stderr,"rtIOStreamOpen\n");
  
  if((Station = rtIOStreamOpen(10,(void **)Args)) < 0)
    {
      fprintf(stderr,"rtIOStreamOpen failed\n");
      exit(1);
    }

  free(Args);
  Args = NULL;
  return Station;
}

void my_rtIOStreamRecv(int Station,size_t size,char *recv){
  size_t recv_num;

  if(rtIOStreamRecv(Station,recv,size,&recv_num) != 0)
    {
      fprintf(stderr,"rtIOStreamRecv failed\n");
      exit(1);
    }

  return ;
}

void my_rtIOStreamRecv(int Station,char *recv){
  size_t recv_num;

  if(rtIOStreamRecv(Station,recv,default_buf_max,&recv_num) != 0)
    {
      fprintf(stderr,"rtIOStreamRecv failed\n");
      exit(1);
    }
  
  return ;
}

void my_rtIOStreamSend(int Station,char *send){
  size_t send_len = strlen(send);
  size_t send_num;

  if(rtIOStreamSend(Station,send,send_len,&send_num) != 0)
    {
      fprintf(stderr,"rtIOStreamSend failed\n");
      exit(1);
    }
  fprintf(stderr,"send %d bytes\n",send_num);
  return ;
}

void my_rtIOStreamSend(int Station,string str){
  char send[str.length()+1];
  strcpy(send,str.c_str());
  my_rtIOStreamSend(Station,send);
}

int my_rtIOStreamClose(int Station){
  return rtIOStreamClose(Station);
}
