; ModuleID = 'PointerTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 1000, i32* %x, align 4
  store i32 2000, i32* %y, align 4
  store i32* %x, i32** %p, align 8
  %0 = load i32* %y, align 4
  %1 = load i32** %p, align 8
  %2 = load i32* %1, align 4
  %add = add nsw i32 %2, %0
  store i32 %add, i32* %1, align 4
  store i32* %y, i32** %p, align 8
  %3 = load i32* %x, align 4
  %4 = load i32** %p, align 8
  %5 = load i32* %4, align 4
  %add1 = add nsw i32 %5, %3
  store i32 %add1, i32* %4, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
