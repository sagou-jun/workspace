Cpp = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`
MATLABWORK = /usr/local/matlab/

LLVMSim2.exe:LLVMSim2.o IRSim2.o my_rtiostream.o rtIOStream_TCPIP.o
	$(Cpp) $(flags) LLVMSim2.o IRSim2.o my_rtiostream.o rtIOStream_TCPIP.o $(LDflags) -o LLVMSim2.exe

my_rtiostream.o:my_rtiostream_wrapper.cpp my_rtiostream.h
	$(Cpp) -c -o my_rtiostream.o -I $(MATLABWORK)include/ my_rtiostream_wrapper.cpp

rtIOStream_TCPIP.o:$(MATLABWORK)include/rtiostream.h $(MATLABWORK)src/rtiostream_tcpip.c
	$(Cpp) -c $(MATLABWORK)src/rtiostream_tcpip.c -I $(MATLABWORK)include/ -o rtIOStream_tcpip.o

LLVMSim2.o:LLVMSim2.cpp
	$(Cpp) $(flags) LLVMSim2.cpp -c -o LLVMSim2.o

IRSim2.o:IRSim2.cpp IRSim2.h
	$(Cpp) -c IRSim2.cpp -o IRSim2.o

test.exe:my_rtiostream.o test.o rtIOStream_TCPIP.o
	$(Cpp) my_rtiostream.o test.o rtIOStream_TCPIP.o -o test.exe

test.o:test.cpp my_rtiostream.h
	$(Cpp) -c test.cpp -o test.o
