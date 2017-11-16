; ModuleID = 'structTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

%struct.TestST = type { i32, i8, double }
%struct.ExtU_test_model_T = type { double, double }
%struct.ExtY_test_model_T = type { double }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %st = alloca %struct.TestST, align 8
  store i32 0, i32* %retval
  %mem1 = getelementptr inbounds %struct.TestST* %st, i32 0, i32 0
  store i32 1, i32* %mem1, align 4
  %mem2 = getelementptr inbounds %struct.TestST* %st, i32 0, i32 1
  store i8 97, i8* %mem2, align 1
  %mem3 = getelementptr inbounds %struct.TestST* %st, i32 0, i32 2
  store double 1.345000e+00, double* %mem3, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
