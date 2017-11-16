CPP = g++

SeparateCompile.exe:SeparateCompileMain.o SeparateCompile1.o SeparateCompile2.o
	$(CPP) SeparateCompileMain.o SeparateCompile1.o SeparateCompile2.o -o SeparateCompile.exe

SeparateCompileMain.o:SeparateCompileMain.cpp SeparateCompile.hpp
	$(CPP) -c SeparateCompileMain.cpp -o SeparateCompileMain.o

SeparateCompile1.o:SeparateCompile1.cpp SeparateCompile.hpp
	$(CPP) -c SeparateCompile1.cpp -o SeparateCompile1.o

SeparateCompile2.o:SeparateCompile2.cpp SeparateCompile.hpp
	$(CPP) -c SeparateCompile2.cpp -o SeparateCompile2.o
