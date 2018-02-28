; ModuleID = 'Fibonacci.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @fib(i32 %i) #0 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %cmp = icmp sle i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %1 = load i32* %i.addr, align 4
  %sub = sub nsw i32 %1, 1
  %call = call i32 @fib(i32 %sub)
  %2 = load i32* %i.addr, align 4
  %sub1 = sub nsw i32 %2, 2
  %call2 = call i32 @fib(i32 %sub1)
  %add = add nsw i32 %call, %call2
  store i32 %add, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32* %retval
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %fib17 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @fib(i32 17)
  store i32 %call, i32* %fib17, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
