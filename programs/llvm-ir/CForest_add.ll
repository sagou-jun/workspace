; ModuleID = 'CForest_add.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store volatile i32 3400, i32* %x, align 4
  store volatile i32 2300, i32* %y, align 4
  %x.0.x.0. = load volatile i32* %x, align 4
  %y.0.y.0. = load volatile i32* %y, align 4
  %add = add nsw i32 %y.0.y.0., %x.0.x.0.
  store volatile i32 %add, i32* %z, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
