; ModuleID = 'GlobalVariables.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@global_int1 = common global i32 0, align 4
@global_int2 = common global i32 0, align 4
@global_double1 = common global double 0.000000e+00, align 8
@global_double2 = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 2, i32* @global_int1, align 4
  %0 = load i32* @global_int1, align 4
  %mul = mul nsw i32 3, %0
  store i32 %mul, i32* @global_int2, align 4
  store double 2.500000e+00, double* @global_double1, align 8
  %1 = load double* @global_double1, align 8
  %mul1 = fmul double 4.200000e+00, %1
  store double %mul1, double* @global_double2, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
