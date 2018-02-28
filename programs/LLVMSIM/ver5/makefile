Cpp = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`
MATLABWORK = /usr/local/matlab/

LLVMSim5.exe:LLVMSim5.o IRSim5.o IRSimRegs.o IRSimMems.o Run.o
	$(Cpp) LLVMSim5.o IRSimRegs.o IRSimMems.o IRSim5.o Run.o $(LDflags) -o LLVMSim5.exe

LLVMSim5.o:LLVMSim5.cpp IRSim5.hpp
	$(Cpp) -c $(flags) LLVMSim5.cpp -o LLVMSim5.o

Run.o:Run.cpp IRSim5.hpp
	$(Cpp) -c $(flags) Run.cpp -o Run.o

IRSim5.o:IRSim5.cpp IRSim5.hpp IRSimRegs.hpp IRSimMems.hpp
	$(Cpp) -c $(flags) IRSim5.cpp -o IRSim5.o

IRSimRegs.o:IRSimRegs.hpp IRSimRegs.cpp IRSimKinds.hpp
	$(Cpp) -c $(flags) IRSimRegs.cpp -o IRSimRegs.o

IRSimMems.o:IRSimMems.hpp IRSimMems.cpp IRSimKinds.hpp
	$(Cpp) -c $(flags) IRSimMems.cpp -o IRSimMems.o
