; ModuleID = 'SwitchTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %flag = alloca i8, align 1
  store i32 0, i32* %retval
  store volatile i8 0, i8* %flag, align 1
  %0 = load volatile i32* %x, align 4
  switch i32 %0, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  store volatile i8 97, i8* %flag, align 1
  store i32 1, i32* %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  store volatile i8 98, i8* %flag, align 1
  store i32 2, i32* %retval
  br label %return

sw.bb2:                                           ; preds = %entry
  store i32 3, i32* %retval
  br label %return

sw.bb3:                                           ; preds = %entry
  store i32 4, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  store volatile i8 99, i8* %flag, align 1
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %sw.default, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %1 = load i32* %retval
  ret i32 %1
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
