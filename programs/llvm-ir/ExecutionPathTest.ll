; ModuleID = 'ExecutionPathTest.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval
  store volatile i32 1, i32* %x, align 4
  store volatile i32 0, i32* %a, align 4
  store volatile i32 0, i32* %b, align 4
  store volatile i32 0, i32* %c, align 4
  store volatile i32 0, i32* %d, align 4
  %0 = load volatile i32* %x, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store volatile i32 10, i32* %a, align 4
  store volatile i32 10, i32* %b, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store volatile i32 10, i32* %c, align 4
  store volatile i32 10, i32* %d, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
