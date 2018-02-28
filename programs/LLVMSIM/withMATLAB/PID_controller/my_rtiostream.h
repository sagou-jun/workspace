#ifndef MY_RTIOSTREM_WRAPPER
#define MY_RTIOSTREM_WRAPPER
#include<string>

#define default_buf_max 256
int my_rtIOStreamOpen(const char *PORT = "8765");
int my_rtIOStreamOpen_client(const char *PORT = "8765");
size_t my_rtIOStreamRecv(int Station,size_t size,void *recv);
size_t my_rtIOStreamRecv(int Station,void *recv);
void my_rtIOStreamSend(int Station,const void *send);
int my_rtIOStreamClose(int Station);
#endif
