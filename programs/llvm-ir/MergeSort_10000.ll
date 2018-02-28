; ModuleID = 'MergeSort_10000.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %target = alloca [10000 x i32], align 16
  %target2 = alloca [10000 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %conv = sitofp i32 %1 to double
  %call = call i32 @data(double %conv)
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [10000 x i32]* %target, i32 0, i64 %idxprom
  store i32 %call, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10000 x i32]* %target, i32 0, i32 0
  call void @MergeSort(i32* %arraydecay, i32 0, i32 9999)
  ret i32 0
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
define void @MergeSort(i32* %x, i32 %left, i32 %right) #0 {
entry:
  %x.addr = alloca i32*, align 8
  %left.addr = alloca i32, align 4
  %right.addr = alloca i32, align 4
  %mid = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %buf = alloca [10000 x i32], align 16
  store i32* %x, i32** %x.addr, align 8
  store i32 %left, i32* %left.addr, align 4
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %left.addr, align 4
  %1 = load i32* %right.addr, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32* %left.addr, align 4
  %3 = load i32* %right.addr, align 4
  %add = add nsw i32 %2, %3
  %div = sdiv i32 %add, 2
  store i32 %div, i32* %mid, align 4
  %4 = load i32** %x.addr, align 8
  %5 = load i32* %left.addr, align 4
  %6 = load i32* %mid, align 4
  call void @MergeSort(i32* %4, i32 %5, i32 %6)
  %7 = load i32** %x.addr, align 8
  %8 = load i32* %mid, align 4
  %add1 = add nsw i32 %8, 1
  %9 = load i32* %right.addr, align 4
  call void @MergeSort(i32* %7, i32 %add1, i32 %9)
  %10 = load i32* %left.addr, align 4
  store i32 %10, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i32* %i, align 4
  %12 = load i32* %mid, align 4
  %cmp2 = icmp sle i32 %11, %12
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32* %i, align 4
  %idxprom = sext i32 %13 to i64
  %14 = load i32** %x.addr, align 8
  %arrayidx = getelementptr inbounds i32* %14, i64 %idxprom
  %15 = load i32* %arrayidx, align 4
  %16 = load i32* %i, align 4
  %idxprom3 = sext i32 %16 to i64
  %arrayidx4 = getelementptr inbounds [10000 x i32]* %buf, i32 0, i64 %idxprom3
  store i32 %15, i32* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load i32* %mid, align 4
  %add5 = add nsw i32 %18, 1
  store i32 %add5, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc13, %for.end
  %19 = load i32* %i, align 4
  %20 = load i32* %right.addr, align 4
  %cmp7 = icmp sle i32 %19, %20
  br i1 %cmp7, label %for.body8, label %for.end15

for.body8:                                        ; preds = %for.cond6
  %21 = load i32* %i, align 4
  %idxprom9 = sext i32 %21 to i64
  %22 = load i32** %x.addr, align 8
  %arrayidx10 = getelementptr inbounds i32* %22, i64 %idxprom9
  %23 = load i32* %arrayidx10, align 4
  %24 = load i32* %i, align 4
  %idxprom11 = sext i32 %24 to i64
  %arrayidx12 = getelementptr inbounds [10000 x i32]* %buf, i32 0, i64 %idxprom11
  store i32 %23, i32* %arrayidx12, align 4
  br label %for.inc13

for.inc13:                                        ; preds = %for.body8
  %25 = load i32* %i, align 4
  %inc14 = add nsw i32 %25, 1
  store i32 %inc14, i32* %i, align 4
  br label %for.cond6

for.end15:                                        ; preds = %for.cond6
  %26 = load i32* %left.addr, align 4
  store i32 %26, i32* %i, align 4
  %27 = load i32* %mid, align 4
  %add16 = add nsw i32 %27, 1
  store i32 %add16, i32* %j, align 4
  %28 = load i32* %left.addr, align 4
  store i32 %28, i32* %k, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc55, %for.end15
  %29 = load i32* %k, align 4
  %30 = load i32* %right.addr, align 4
  %cmp18 = icmp sle i32 %29, %30
  br i1 %cmp18, label %for.body19, label %for.end57

for.body19:                                       ; preds = %for.cond17
  %31 = load i32* %i, align 4
  %32 = load i32* %mid, align 4
  %cmp20 = icmp sgt i32 %31, %32
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %for.body19
  %33 = load i32* %j, align 4
  %inc22 = add nsw i32 %33, 1
  store i32 %inc22, i32* %j, align 4
  %idxprom23 = sext i32 %33 to i64
  %arrayidx24 = getelementptr inbounds [10000 x i32]* %buf, i32 0, i64 %idxprom23
  %34 = load i32* %arrayidx24, align 4
  %35 = load i32* %k, align 4
  %idxprom25 = sext i32 %35 to i64
  %36 = load i32** %x.addr, align 8
  %arrayidx26 = getelementptr inbounds i32* %36, i64 %idxprom25
  store i32 %34, i32* %arrayidx26, align 4
  br label %if.end54

if.else:                                          ; preds = %for.body19
  %37 = load i32* %j, align 4
  %38 = load i32* %right.addr, align 4
  %cmp27 = icmp sgt i32 %37, %38
  br i1 %cmp27, label %if.then28, label %if.else34

if.then28:                                        ; preds = %if.else
  %39 = load i32* %i, align 4
  %inc29 = add nsw i32 %39, 1
  store i32 %inc29, i32* %i, align 4
  %idxprom30 = sext i32 %39 to i64
  %arrayidx31 = getelementptr inbounds [10000 x i32]* %buf, i32 0, i64 %idxprom30
  %40 = load i32* %arrayidx31, align 4
  %41 = load i32* %k, align 4
  %idxprom32 = sext i32 %41 to i64
  %42 = load i32** %x.addr, align 8
  %arrayidx33 = getelementptr inbounds i32* %42, i64 %idxprom32
  store i32 %40, i32* %arrayidx33, align 4
  br label %if.end53

if.else34:                                        ; preds = %if.else
  %43 = load i32* %i, align 4
  %idxprom35 = sext i32 %43 to i64
  %arrayidx36 = getelementptr inbounds [10000 x i32]* %buf, i32 0, i64 %idxprom35
  %44 = load i32* %arrayidx36, align 4
  %45 = load i32* %j, align 4
  %idxprom37 = sext i32 %45 to i64
  %arrayidx38 = getelementptr inbounds [10000 x i32]* %buf, i32 0, i64 %idxprom37
  %46 = load i32* %arrayidx38, align 4
  %cmp39 = icmp sle i32 %44, %46
  br i1 %cmp39, label %if.then40, label %if.else46

if.then40:                                        ; preds = %if.else34
  %47 = load i32* %i, align 4
  %inc41 = add nsw i32 %47, 1
  store i32 %inc41, i32* %i, align 4
  %idxprom42 = sext i32 %47 to i64
  %arrayidx43 = getelementptr inbounds [10000 x i32]* %buf, i32 0, i64 %idxprom42
  %48 = load i32* %arrayidx43, align 4
  %49 = load i32* %k, align 4
  %idxprom44 = sext i32 %49 to i64
  %50 = load i32** %x.addr, align 8
  %arrayidx45 = getelementptr inbounds i32* %50, i64 %idxprom44
  store i32 %48, i32* %arrayidx45, align 4
  br label %if.end52

if.else46:                                        ; preds = %if.else34
  %51 = load i32* %j, align 4
  %inc47 = add nsw i32 %51, 1
  store i32 %inc47, i32* %j, align 4
  %idxprom48 = sext i32 %51 to i64
  %arrayidx49 = getelementptr inbounds [10000 x i32]* %buf, i32 0, i64 %idxprom48
  %52 = load i32* %arrayidx49, align 4
  %53 = load i32* %k, align 4
  %idxprom50 = sext i32 %53 to i64
  %54 = load i32** %x.addr, align 8
  %arrayidx51 = getelementptr inbounds i32* %54, i64 %idxprom50
  store i32 %52, i32* %arrayidx51, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.else46, %if.then40
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then28
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then21
  br label %for.inc55

for.inc55:                                        ; preds = %if.end54
  %55 = load i32* %k, align 4
  %inc56 = add nsw i32 %55, 1
  store i32 %inc56, i32* %k, align 4
  br label %for.cond17

for.end57:                                        ; preds = %for.cond17
  br label %return

return:                                           ; preds = %for.end57, %if.then
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
