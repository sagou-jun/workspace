#ifndef MY_RTIOSTREM_WRAPPER
#define MY_RTIOSTREM_WRAPPER
#ifdef _cplusplus
extern "C"
{
#endif
#include<string>

#define default_buf_max 256

extern int my_rtIOStreamOpen(const char *PORT = "8765");
extern int my_rtIOStreamOpen_client(const char *PORT = "8765");
extern size_t my_rtIOStreamRecv(int Station,size_t size,void *recv);
extern size_t my_rtIOStreamRecv(int Station,void *recv);
extern void my_rtIOStreamSend(int Station,const void *send);
extern int my_rtIOStreamClose(int Station);
#ifdef _cplusplus
}
#endif
#endif
