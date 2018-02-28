Cpp = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`
MATLABWORK = /usr/local/matlab/
CONFIGS = -fexceptions

LLVMSim6.exe:LLVMSim6.o IRSim6.o IRSimRegs.o IRSimMems.o Run.o IRSimKinds.o
	$(Cpp) LLVMSim6.o IRSimRegs.o IRSimMems.o IRSim6.o Run.o IRSimKinds.o $(LDflags) -o LLVMSim6.exe

LLVMSim6.o:LLVMSim6.cpp IRSim6.hpp IRSimKinds.hpp IRSimMems.hpp IRSimRegs.hpp
	$(Cpp) -c $(flags) LLVMSim6.cpp -o LLVMSim6.o

Run.o:Run.cpp IRSim6.hpp IRSimKinds.hpp IRSimMems.hpp IRSimRegs.hpp
	$(Cpp) -c $(flags) Run.cpp -o Run.o

IRSim6.o:IRSim6.cpp IRSim6.hpp IRSimRegs.hpp IRSimMems.hpp IRSimKinds.hpp
	$(Cpp) -c $(flags) IRSim6.cpp -o IRSim6.o

IRSimRegs.o:IRSimRegs.hpp IRSimRegs.cpp IRSimKinds.hpp
	$(Cpp) -c $(flags) IRSimRegs.cpp -o IRSimRegs.o

IRSimMems.o:IRSimMems.hpp IRSimMems.cpp IRSimKinds.hpp
	$(Cpp) -c $(flags) IRSimMems.cpp -o IRSimMems.o

IRSimKinds.o:IRSimKinds.hpp IRSimKinds.cpp
	$(Cpp) -c $(flags) IRSimKinds.cpp -o IRSimKinds.o

debug:DLLVMSim6.o DIRSim6.o DIRSimRegs.o DIRSimMems.o DRun.o DIRSimKinds.o
	$(Cpp) -g DLLVMSim6.o DIRSimRegs.o DIRSimMems.o DIRSim6.o DRun.o DIRSimKinds.o $(LDflags) -o DLLVMSim6.exe
	rm DLLVMSim6.o DIRSim6.o DIRSimRegs.o DIRSimMems.o DRun.o DIRSimKinds.o

DLLVMSim6.o:LLVMSim6.cpp IRSim6.hpp
	$(Cpp) -g -c $(flags)  LLVMSim6.cpp -o DLLVMSim6.o

DRun.o:Run.cpp IRSim6.hpp
	$(Cpp) -g -c $(flags) $(CONFIGS) Run.cpp -o DRun.o

DIRSim6.o:IRSim6.cpp IRSim6.hpp IRSimRegs.hpp IRSimMems.hpp
	$(Cpp) -g -c $(flags) IRSim6.cpp -o DIRSim6.o

DIRSimRegs.o:IRSimRegs.hpp IRSimRegs.cpp IRSimKinds.hpp
	$(Cpp) -g -c $(flags) $(CONFIGS) IRSimRegs.cpp -o DIRSimRegs.o

DIRSimMems.o:IRSimMems.hpp IRSimMems.cpp IRSimKinds.hpp
	$(Cpp) -g -c $(flags)  IRSimMems.cpp -o DIRSimMems.o

DIRSimKinds.o:IRSimKinds.hpp IRSimKinds.cpp
	$(Cpp) -g -c $(flags) IRSimKinds.cpp -o DIRSimKinds.o

RegsTest:RegsTest.cpp IRSimRegs.o
	$(Cpp) -c $(flags) RegsTest.cpp -o RegsTest.o
	$(Cpp) RegsTest.o IRSimRegs.o $(LDflags) -o RegsTest.exe
