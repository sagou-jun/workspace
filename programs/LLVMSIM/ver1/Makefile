CC = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`
#targetはコンパイルしたいファイルをmake実行時に指定する
#target = LLVMSim

LLVMSim.exe:LLVMSim.o IRSim.o
	$(CC) $(flags) LLVMSim.o IRSim.o $(LDflags) -o LLVMSim.exe

LLVMSim.o:LLVMSim.cpp
	$(CC) $(flags) LLVMSim.cpp -c -o LLVMSim.o

IRSimTest:IRSimTest.o IRSim.o
	$(CC) IRSim.o IRSimTest.o -o IRSimTest.exe

IRSimTest.o:IRSimTest.cpp
	$(CC) -c IRSimTest.cpp -I /usr/local/llvm/program

IRSim.o:IRSim.cpp IRSim.h
	$(CC) -c IRSim.cpp -o IRSim.o
