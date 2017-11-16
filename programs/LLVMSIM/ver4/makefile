Cpp = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`
MATLABWORK = /usr/local/matlab/

LLVMSim4.exe:LLVMSim4.o IRSim4.o IRSimRegs.o IRSimMems.o Run.o
	$(Cpp) LLVMSim4.o IRSimRegs.o IRSimMems.o IRSim4.o Run.o $(LDflags) -o LLVMSim4.exe

LLVMSim4.o:LLVMSim4.cpp IRSim4.hpp
	$(Cpp) -c $(flags) LLVMSim4.cpp -o LLVMSim4.o

Run.o:Run.cpp IRSim4.hpp
	$(Cpp) -c $(flags) Run.cpp -o Run.o

IRSim4.o:IRSim4.cpp IRSim4.hpp IRSimRegs.hpp IRSimMems.hpp
	$(Cpp) -c $(flags) IRSim4.cpp -o IRSim4.o

IRSimRegs.o:IRSimRegs.hpp IRSimRegs.cpp
	$(Cpp) -c IRSimRegs.cpp -o IRSimRegs.o

IRSimMems.o:IRSimMems.hpp IRSimMems.cpp
	$(Cpp) -c $(flags) IRSimMems.cpp -o IRSimMems.o
