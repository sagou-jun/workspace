#ifndef MY_RTIOSTREM_WRAPPER
#define MY_RTIOSTREM_WRAPPER
#include<string>

#define default_buf_max 256

extern int my_rtIOStreamOpen();
//extern std::string my_rtIOStreamRecv(int Station,size_t size);
//extern std::string my_rtIOStreamRecv(int Station);
extern void my_rtIOStreamRecv(int Station,size_t size,char *recv);
extern void my_rtIOStreamRecv(int Station,char *recv);
extern void my_rtIOStreamSend(int Station,char *send);
extern void my_rtIOStreamSend(int Station,std::string str);
extern int my_rtIOStreamClose(int Station);
#endif
