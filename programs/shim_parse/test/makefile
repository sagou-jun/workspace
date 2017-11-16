CXX = g++
SHIM_PARSE_DIR = /usr/local/programs/shim_parse/

test.exe:test.o shim_parse_2.o shim.o
	$(CXX) test.o shim_parse_2.o shim.o -lxerces-c -o test.exe

test.o:test.cpp $(SHIM_PARSE_DIR)shim_parse_2.hxx
	$(CXX) -c -I $(SHIM_PARSE_DIR)  test.cpp -o test.o

shim_parse_2.o:$(SHIM_PARSE_DIR)shim_parse_2.cxx $(SHIM_PARSE_DIR)shim.hxx $(SHIM_PARSE_DIR)shim_parse_2.hxx
	$(CXX) -I $(SHIM_PARSE_DIR) -c $(SHIM_PARSE_DIR)shim_parse_2.cxx -o shim_parse_2.o

shim.o:$(SHIM_PARSE_DIR)shim.cxx $(SHIM_PARSE_DIR)shim.hxx
	$(CXX) -I $(SHIM_PARSE_DIR) -c $(SHIM_PARSE_DIR)shim.cxx -o shim.o
