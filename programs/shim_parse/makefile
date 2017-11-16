CXX = g++
Cpp = g++

flags = `/home/numakuro620/llvm_s/llvm-3.6.2_build/Release+Asserts/bin/llvm-config --cxxflags`
LDflags = `/home/numakuro620/llvm_s/llvm-3.6.2_build/Release+Asserts/bin/llvm-config --ldflags --libs`

all:
	make shim_parse_2.o
	make shim.o

shim_parse_2.o:shim_parse_2.cxx shim.hxx shim_parse_2.hxx
	$(CXX) -I.../libxsd -c shim_parse_2.cxx -o shim_parse_2.o

shim.o:shim.hxx shim.cxx
	$(CXX) shim.cxx -c -o shim.o

clean:
	$(RM) *.o
	$(RM) shim_measure
