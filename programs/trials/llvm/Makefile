.SUFFIXES:.cpp .exe
CXX = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`
#LDflags += 

target = OperandAnalyzer.cpp
target_hex = $(patsubst %.cpp,%.exe,$(target))

$(target_hex):$(target)

.cpp.exe:
	$(CXX) $(flags) $< $(LDflags) -o $@

parseFuntions.o:parseFunctions.cpp
	$(CXX) $(flags) parseFunctions.cpp $(LDflags) -o parseFunctions.exe

LLVMSim2.exe:LLVMSim2.o IRSim2.o
	$(CXX) $(flags) LLVMSim2.o IRSim2.o $(LDflags) -o LLVMSim2.exe

LLVMSim2.o:LLVMSim2.cpp
	$(CXX) $(flags) LLVMSim2.cpp -c -o LLVMSim2.o

IRSim2.o:IRSim2.cpp IRSim2.h
	$(CXX) -c IRSim2.cpp -o IRSim2.o

IRSimtest:IRSim2.o IRSimtest.o
	$(CXX) $(flags) IRSimtest.o IRSim2.o -o IRSimtest.exe

IRSimtest.o:IRSimtest.cpp
	$(CXX) -c IRSimtest.cpp -o IRSimtest.o

Typechecker.exe:Typechecker.hpp Typechecker.cpp
	$(CXX) $(flags) Typechecker.cpp $(LDflags) -o Typechecker.exe
