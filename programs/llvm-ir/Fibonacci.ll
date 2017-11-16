; ModuleID = 'Fibonacci.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@.str = private unnamed_addr constant [14 x i8] c"fib(%d) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @fib(i32 %n) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  %cmp = icmp sge i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32* %n.addr, align 4
  %sub = sub nsw i32 %1, 1
  %call = call i32 @fib(i32 %sub)
  %2 = load i32* %n.addr, align 4
  %sub1 = sub nsw i32 %2, 2
  %call2 = call i32 @fib(i32 %sub1)
  %add = add nsw i32 %call, %call2
  store i32 %add, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32* %n.addr, align 4
  %cmp3 = icmp eq i32 %3, 1
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then4, %if.then
  %4 = load i32* %retval
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %Fibonacci = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @fib(i32 16)
  store i32 %call, i32* %Fibonacci, align 4
  %0 = load i32* %Fibonacci, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i32 5, i32 %0)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
