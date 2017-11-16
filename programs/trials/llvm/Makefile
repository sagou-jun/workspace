CC = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`

parseFuntions.o:parseFunctions.cpp
	$(CC) $(flags) parseFunctions.cpp $(LDflags) -o parseFunctions.exe

LLVMSim2.exe:LLVMSim2.o IRSim2.o
	$(CC) $(flags) LLVMSim2.o IRSim2.o $(LDflags) -o LLVMSim2.exe

LLVMSim2.o:LLVMSim2.cpp
	$(CC) $(flags) LLVMSim2.cpp -c -o LLVMSim2.o

IRSim2.o:IRSim2.cpp IRSim2.h
	$(CC) -c IRSim2.cpp -o IRSim2.o

IRSimtest:IRSim2.o IRSimtest.o
	$(CC) $(flags) IRSimtest.o IRSim2.o -o IRSimtest.exe

IRSimtest.o:IRSimtest.cpp
	$(CC) -c IRSimtest.cpp -o IRSimtest.o

Typechecker.exe:Typechecker.hpp Typechecker.cpp
	$(CC) $(flags) Typechecker.cpp $(LDflags) -o Typechecker.exe
