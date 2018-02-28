Cpp = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`
MATLABWORK = /usr/local/matlab/

LLVMSim3.exe:LLVMSim3.o IRSim3.o my_rtiostream.o rtIOStream_TCPIP.o rtIOStream_utils.o
	$(Cpp)  LLVMSim3.o IRSim3.o my_rtiostream.o rtIOStream_TCPIP.o $(LDflags) -o LLVMSim3.exe

my_rtiostream.o:my_rtiostream_wrapper.cpp my_rtiostream.h
	$(Cpp) -c -o my_rtiostream.o -I $(MATLABWORK)include/ my_rtiostream_wrapper.cpp

rtIOStream_TCPIP.o:$(MATLABWORK)include/rtiostream.h $(MATLABWORK)src/rtiostream_tcpip.c
	$(Cpp) -c $(MATLABWORK)src/rtiostream_tcpip.c -I $(MATLABWORK)include/ -o rtIOStream_tcpip.o

rtIOStream_utils.o:$(MATLABWORK)include/rtiostream_utils.h $(MATLABWORK)src/rtiostream_utils.c
	$(Cpp) -c $(MATLABWORK)src/rtiostream_utils.c -I $(MATLABWORK)include/ -o rtIOStream_utils.o

LLVMSim3.o:LLVMSim3.cpp
	$(Cpp) $(flags) LLVMSim3.cpp -c -o LLVMSim3.o

IRSim3.o:IRSim3.cpp IRSim3.h
	$(Cpp) $(flags) IRSim3.cpp -c -o IRSim3.o

test.exe:my_rtiostream.o test.o rtIOStream_TCPIP.o
	$(Cpp) my_rtiostream.o test.o rtIOStream_TCPIP.o -o test.exe

test.o:test.cpp my_rtiostream.h
	$(Cpp) -c test.cpp -o test.o

relay.exe:relay.o my_rtiostream.o rtIOStream_TCPIP.o rtIOStream_utils.o
	$(Cpp) relay.o my_rtiostream.o rtIOStream_TCPIP.o rtIOStream_utils.o -o relay.exe

relay.o:relay.cpp my_rtiostream.h $(MATLABWORK)include/rtwtypes.h
	$(Cpp) -c relay.cpp -I $(MATLABWORK)include/ -o relay.o

rtIOStream_close.exe:rtIOStream_close.o rtIOStream_TCPIP.o my_rtiostream.o
	$(Cpp) rtIOStream_close.o rtIOStream_TCPIP.o my_rtiostream.o -o rtIOStream_close.exe

rtIOStream_close.o:rtIOStream_close.cpp my_rtiostream.h
	$(Cpp) -c rtIOStream_close.cpp -o rtIOStream_close.o
