Cpp = g++
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs`
MATLABWORK = /usr/local/matlab/
MATLABINCLUDE = -I $(MATLABWORK)include/
IRSIMDIR = /usr/local/programs/LLVMSIM/ver5/
IRSIMDIRINCLUDE = -I $(IRSIMDIR)

RunAddStep.exe:RunAddStep.o IRSim5.o IRSimRegs.o IRSimMems.o Run.o my_rtiostream.o rtIOStream_TCPIP.o rtIOStream_utils.o
	$(Cpp) RunAddStep.o IRSimRegs.o IRSimMems.o IRSim5.o Run.o my_rtiostream.o rtIOStream_TCPIP.o rtIOStream_utils.o $(LDflags) -o RunAddStep.exe

RunAddStep.o:RunAddStep.cpp $(IRSIMDIR)IRSim5.hpp
	$(Cpp) -c $(flags) $(IRSIMDIRINCLUDE) $(MATLABINCLUDE) RunAddStep.cpp -o RunAddStep.o

Run.o:$(IRSIMDIR)Run.cpp $(IRSIMDIR)IRSim5.hpp
	$(Cpp) -c $(flags) $(IRSIMDIRINCLUDE) $(IRSIMDIR)Run.cpp -o Run.o

IRSim5.o:$(IRSIMDIR)IRSim5.cpp $(IRSIMDIR)IRSim5.hpp $(IRSIMDIR)IRSimRegs.hpp $(IRSIMDIR)IRSimMems.hpp
	$(Cpp) -c $(flags) $(IRSIMDIRINCLUDE) $(IRSIMDIR)IRSim5.cpp -o IRSim5.o

IRSimRegs.o:$(IRSIMDIR)IRSimRegs.hpp $(IRSIMDIR)IRSimRegs.cpp $(IRSIMDIR)IRSimKinds.hpp
	$(Cpp) -c $(flags) $(IRSIMDIRINCLUDE) $(IRSIMDIR)IRSimRegs.cpp -o IRSimRegs.o

IRSimMems.o:$(IRSIMDIR)IRSimMems.hpp $(IRSIMDIR)IRSimMems.cpp $(IRSIMDIR)IRSimKinds.hpp
	$(Cpp) -c $(flags) $(IRSIMDIRINCLUDE) $(IRSIMDIR)IRSimMems.cpp -o IRSimMems.o

my_rtiostream.o:my_rtiostream_wrapper.cpp my_rtiostream.h
	$(Cpp) -c -o my_rtiostream.o $(MATLABINCLUDE) my_rtiostream_wrapper.cpp

rtIOStream_TCPIP.o:$(MATLABWORK)include/rtiostream.h $(MATLABWORK)src/rtiostream_tcpip.c
	$(Cpp) -c $(MATLABWORK)src/rtiostream_tcpip.c $(MATLABINCLUDE) -o rtIOStream_tcpip.o

rtIOStream_utils.o:$(MATLABWORK)include/rtiostream_utils.h $(MATLABWORK)src/rtiostream_utils.c
	$(Cpp) -c $(MATLABWORK)src/rtiostream_utils.c $(MATLABINCLUDE) -o rtIOStream_utils.o
