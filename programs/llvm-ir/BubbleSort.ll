; ModuleID = 'BubbleSort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32* @bubbleSort(i32* %N, i32 %len) #0 {
entry:
  %N.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32* %N, i32** %N.addr, align 8
  store i32 %len, i32* %len.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %len.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  %2 = load i32* %len.addr, align 4
  %sub = sub nsw i32 %2, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %4 = load i32* %i, align 4
  %cmp2 = icmp sgt i32 %3, %4
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %5 = load i32* %j, align 4
  %idxprom = sext i32 %5 to i64
  %6 = load i32** %N.addr, align 8
  %arrayidx = getelementptr inbounds i32* %6, i64 %idxprom
  %7 = load i32* %arrayidx, align 4
  %8 = load i32* %j, align 4
  %sub4 = sub nsw i32 %8, 1
  %idxprom5 = sext i32 %sub4 to i64
  %9 = load i32** %N.addr, align 8
  %arrayidx6 = getelementptr inbounds i32* %9, i64 %idxprom5
  %10 = load i32* %arrayidx6, align 4
  %cmp7 = icmp slt i32 %7, %10
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %11 = load i32* %j, align 4
  %idxprom8 = sext i32 %11 to i64
  %12 = load i32** %N.addr, align 8
  %arrayidx9 = getelementptr inbounds i32* %12, i64 %idxprom8
  %13 = load i32* %arrayidx9, align 4
  store i32 %13, i32* %temp, align 4
  %14 = load i32* %j, align 4
  %sub10 = sub nsw i32 %14, 1
  %idxprom11 = sext i32 %sub10 to i64
  %15 = load i32** %N.addr, align 8
  %arrayidx12 = getelementptr inbounds i32* %15, i64 %idxprom11
  %16 = load i32* %arrayidx12, align 4
  %17 = load i32* %j, align 4
  %idxprom13 = sext i32 %17 to i64
  %18 = load i32** %N.addr, align 8
  %arrayidx14 = getelementptr inbounds i32* %18, i64 %idxprom13
  store i32 %16, i32* %arrayidx14, align 4
  %19 = load i32* %temp, align 4
  %20 = load i32* %j, align 4
  %sub15 = sub nsw i32 %20, 1
  %idxprom16 = sext i32 %sub15 to i64
  %21 = load i32** %N.addr, align 8
  %arrayidx17 = getelementptr inbounds i32* %21, i64 %idxprom16
  store i32 %19, i32* %arrayidx17, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %22 = load i32* %j, align 4
  %dec = add nsw i32 %22, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %23 = load i32* %i, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end19:                                        ; preds = %for.cond
  %24 = load i32** %N.addr, align 8
  ret i32* %24
}

; Function Attrs: nounwind uwtable
define i32 @data(double %x) #0 {
entry:
  %x.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double* %x.addr, align 8
  %1 = load double* %x.addr, align 8
  %mul = fmul double %0, %1
  %2 = load double* %x.addr, align 8
  %conv = fptosi double %2 to i32
  %rem = srem i32 %conv, 13
  %conv1 = sitofp i32 %rem to double
  %mul2 = fmul double %mul, %conv1
  %3 = load double* %x.addr, align 8
  %4 = load double* %x.addr, align 8
  %mul3 = fmul double %3, %4
  %add = fadd double %mul3, 1.000000e+03
  %div = fdiv double %mul2, %add
  %mul4 = fmul double %div, 1.000000e+02
  %5 = load double* %x.addr, align 8
  %add5 = fadd double %mul4, %5
  %conv6 = fptosi double %add5 to i32
  ret i32 %conv6
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %target = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %conv = sitofp i32 %1 to double
  %call = call i32 @data(double %conv)
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [100 x i32]* %target, i32 0, i64 %idxprom
  store i32 %call, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32]* %target, i32 0, i32 0
  %call1 = call i32* @bubbleSort(i32* %arraydecay, i32 100)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
