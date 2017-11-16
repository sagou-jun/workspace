; ModuleID = 'add.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %Da = alloca double, align 8
  %Db = alloca double, align 8
  store i32 0, i32* %retval
  store i32 1, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store double 3.450000e-01, double* %Da, align 8
  store double -6.900000e-01, double* %Db, align 8
  %0 = load i32* %a, align 4
  %1 = load i32* %b, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* %a, align 4
  %2 = load double* %Da, align 8
  %3 = load double* %Db, align 8
  %add1 = fadd double %2, %3
  store double %add1, double* %Da, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
