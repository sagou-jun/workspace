; ModuleID = './GlobalVariableInitializer.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@A = global [5 x [5 x i32]] [[5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 10], [5 x i32] [i32 11, i32 12, i32 13, i32 14, i32 15], [5 x i32] [i32 16, i32 17, i32 18, i32 19, i32 20], [5 x i32] [i32 21, i32 22, i32 23, i32 24, i32 25]], align 16
@B = global [5 x [5 x double]] [[5 x double] [double 0.000000e+00, double 1.000000e-01, double 2.000000e-01, double 3.000000e-01, double 4.000000e-01], [5 x double] [double 5.000000e-01, double 6.000000e-01, double 7.000000e-01, double 8.000000e-01, double 9.000000e-01], [5 x double] [double 1.000000e+00, double 1.100000e+00, double 1.200000e+00, double 1.300000e+00, double 1.400000e+00], [5 x double] [double 1.500000e+00, double 1.600000e+00, double 1.700000e+00, double 1.800000e+00, double 1.900000e+00], [5 x double] [double 2.000000e+00, double 2.100000e+00, double 2.200000e+00, double 2.300000e+00, double 2.400000e+00]], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 3, i32* %x, align 4
  store i32 4, i32* %y, align 4
  %0 = load i32* %y, align 4
  %1 = load i32* %x, align 4
  %mul = mul nsw i32 %0, %1
  store i32 %mul, i32* %x, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
