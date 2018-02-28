Cpp = g++
IRSIM_DIR = /usr/local/programs/LLVMSIM/ver8/
IRSIM_INCLUDE = -I $(IRSIM_DIR)
LIBLLVMSIM = $(IRSIM_DIR)libLLVMSim.a
MATLABWORK = /usr/local/matlab/
MATLAB_INCLUDE = -I $(MATLABWORK)include/
LDflags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --ldflags --libs` -lxerces-c
flags = `/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/llvm-config --cxxflags`

RunPID_controller.exe:RunPID_controller.o my_rtiostream.o rtIOStream_TCPIP.o rtIOStream_utils.o $(LIBLLVMSim)
	$(Cpp) RunPID_controller.o my_rtiostream.o rtIOStream_TCPIP.o rtIOStream_utils.o $(LIBLLVMSIM) $(LDflags) -o RunPID_controller.exe

RunPID_controller.o:RunPID_controller.cpp
	$(Cpp) -c $(flags) $(IRSIM_INCLUDE) $(MATLAB_INCLUDE) RunPID_controller.cpp -o RunPID_controller.o

my_rtiostream.o:my_rtiostream_wrapper.cpp my_rtiostream.h
	$(Cpp) -c -o my_rtiostream.o $(MATLAB_INCLUDE) my_rtiostream_wrapper.cpp

rtIOStream_TCPIP.o:$(MATLABWORK)include/rtiostream.h $(MATLABWORK)src/rtiostream_tcpip.c
	$(Cpp) -c $(MATLABWORK)src/rtiostream_tcpip.c $(MATLAB_INCLUDE) -o rtIOStream_tcpip.o

rtIOStream_utils.o:$(MATLABWORK)include/rtiostream_utils.h $(MATLABWORK)src/rtiostream_utils.c
	$(Cpp) -c $(MATLABWORK)src/rtiostream_utils.c $(MATLAB_INCLUDE) -o rtIOStream_utils.o
