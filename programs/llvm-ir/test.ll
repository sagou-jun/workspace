; ModuleID = 'test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define void @target() #0 {
entry:
  %w = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store volatile i32 5000, i32* %w, align 4
  store volatile i32 2000, i32* %x, align 4
  store volatile i32 3000, i32* %y, align 4
  store volatile i32 4000, i32* %z, align 4
  store volatile i32 500, i32* %a, align 4
  store volatile i32 800, i32* %b, align 4
  %0 = load volatile i32* %y, align 4
  %1 = load volatile i32* %z, align 4
  %add = add nsw i32 %0, %1
  store volatile i32 %add, i32* %x, align 4
  %2 = load volatile i32* %a, align 4
  %3 = load volatile i32* %b, align 4
  %add1 = add nsw i32 %2, %3
  store volatile i32 %add1, i32* %w, align 4
  %4 = load volatile i32* %z, align 4
  %5 = load volatile i32* %x, align 4
  %add2 = add nsw i32 %4, %5
  store volatile i32 %add2, i32* %c, align 4
  %6 = load volatile i32* %a, align 4
  %7 = load volatile i32* %w, align 4
  %add3 = add nsw i32 %6, %7
  store volatile i32 %add3, i32* %y, align 4
  %8 = load volatile i32* %a, align 4
  %9 = load volatile i32* %b, align 4
  %add4 = add nsw i32 %8, %9
  %10 = load volatile i32* %x, align 4
  %add5 = add nsw i32 %add4, %10
  store volatile i32 %add5, i32* %z, align 4
  %11 = load volatile i32* %c, align 4
  %12 = load volatile i32* %y, align 4
  %add6 = add nsw i32 %11, %12
  store volatile i32 %add6, i32* %w, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @target()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
