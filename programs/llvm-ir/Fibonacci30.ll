; ModuleID = 'Fibonacci30.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

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
define i32 @fib_memo(i32 %n) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %memo = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  %cmp = icmp sge i32 %0, 100
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %1 = load i32* %n.addr, align 4
  %cmp1 = icmp sle i32 %1, 1
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end
  %arrayidx = getelementptr inbounds [100 x i32]* %memo, i32 0, i64 0
  store i32 1, i32* %arrayidx, align 4
  %arrayidx4 = getelementptr inbounds [100 x i32]* %memo, i32 0, i64 1
  store i32 1, i32* %arrayidx4, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i32* %i, align 4
  %3 = load i32* %n.addr, align 4
  %cmp5 = icmp slt i32 %2, %3
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4
  %sub = sub nsw i32 %4, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx6 = getelementptr inbounds [100 x i32]* %memo, i32 0, i64 %idxprom
  %5 = load i32* %arrayidx6, align 4
  %6 = load i32* %i, align 4
  %sub7 = sub nsw i32 %6, 2
  %idxprom8 = sext i32 %sub7 to i64
  %arrayidx9 = getelementptr inbounds [100 x i32]* %memo, i32 0, i64 %idxprom8
  %7 = load i32* %arrayidx9, align 4
  %add = add nsw i32 %5, %7
  %8 = load i32* %i, align 4
  %idxprom10 = sext i32 %8 to i64
  %arrayidx11 = getelementptr inbounds [100 x i32]* %memo, i32 0, i64 %idxprom10
  store i32 %add, i32* %arrayidx11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32* %i, align 4
  %sub12 = sub nsw i32 %10, 1
  %idxprom13 = sext i32 %sub12 to i64
  %arrayidx14 = getelementptr inbounds [100 x i32]* %memo, i32 0, i64 %idxprom13
  %11 = load i32* %arrayidx14, align 4
  store i32 %11, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then2, %if.then
  %12 = load i32* %retval
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @fib_memo(i32 30)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
