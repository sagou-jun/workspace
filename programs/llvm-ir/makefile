.SUFFIXES :.ll
LLVMCC=/usr/local/llvm/llvm-3.6.2-build/Release+Asserts/bin/clang -S -emit-llvm

.c.ll:
	$(LLVMCC) $<
