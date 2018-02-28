; ModuleID = 'QuickSort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define void @QSort(i32* %x, i32 %left, i32 %right) #0 {
entry:
  %x.addr = alloca i32*, align 8
  %left.addr = alloca i32, align 4
  %right.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pivot = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32 %left, i32* %left.addr, align 4
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %left.addr, align 4
  store i32 %0, i32* %i, align 4
  %1 = load i32* %right.addr, align 4
  store i32 %1, i32* %j, align 4
  %2 = load i32* %left.addr, align 4
  %3 = load i32* %right.addr, align 4
  %add = add nsw i32 %2, %3
  %div = sdiv i32 %add, 2
  %idxprom = sext i32 %div to i64
  %4 = load i32** %x.addr, align 8
  %arrayidx = getelementptr inbounds i32* %4, i64 %idxprom
  %5 = load i32* %arrayidx, align 4
  store i32 %5, i32* %pivot, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end
  br label %while.cond1

while.cond1:                                      ; preds = %while.body4, %while.body
  %6 = load i32* %i, align 4
  %idxprom2 = sext i32 %6 to i64
  %7 = load i32** %x.addr, align 8
  %arrayidx3 = getelementptr inbounds i32* %7, i64 %idxprom2
  %8 = load i32* %arrayidx3, align 4
  %9 = load i32* %pivot, align 4
  %cmp = icmp slt i32 %8, %9
  br i1 %cmp, label %while.body4, label %while.end

while.body4:                                      ; preds = %while.cond1
  %10 = load i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %while.cond1

while.end:                                        ; preds = %while.cond1
  br label %while.cond5

while.cond5:                                      ; preds = %while.body9, %while.end
  %11 = load i32* %pivot, align 4
  %12 = load i32* %j, align 4
  %idxprom6 = sext i32 %12 to i64
  %13 = load i32** %x.addr, align 8
  %arrayidx7 = getelementptr inbounds i32* %13, i64 %idxprom6
  %14 = load i32* %arrayidx7, align 4
  %cmp8 = icmp slt i32 %11, %14
  br i1 %cmp8, label %while.body9, label %while.end10

while.body9:                                      ; preds = %while.cond5
  %15 = load i32* %j, align 4
  %dec = add nsw i32 %15, -1
  store i32 %dec, i32* %j, align 4
  br label %while.cond5

while.end10:                                      ; preds = %while.cond5
  %16 = load i32* %i, align 4
  %17 = load i32* %j, align 4
  %cmp11 = icmp sge i32 %16, %17
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %while.end10
  br label %while.end14

if.end:                                           ; preds = %while.end10
  %18 = load i32** %x.addr, align 8
  %19 = load i32* %i, align 4
  %20 = load i32* %j, align 4
  call void @Swap(i32* %18, i32 %19, i32 %20)
  %21 = load i32* %i, align 4
  %inc12 = add nsw i32 %21, 1
  store i32 %inc12, i32* %i, align 4
  %22 = load i32* %j, align 4
  %dec13 = add nsw i32 %22, -1
  store i32 %dec13, i32* %j, align 4
  br label %while.body

while.end14:                                      ; preds = %if.then
  %23 = load i32* %left.addr, align 4
  %24 = load i32* %i, align 4
  %sub = sub nsw i32 %24, 1
  %cmp15 = icmp slt i32 %23, %sub
  br i1 %cmp15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %while.end14
  %25 = load i32** %x.addr, align 8
  %26 = load i32* %left.addr, align 4
  %27 = load i32* %i, align 4
  %sub17 = sub nsw i32 %27, 1
  call void @QSort(i32* %25, i32 %26, i32 %sub17)
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %while.end14
  %28 = load i32* %j, align 4
  %add19 = add nsw i32 %28, 1
  %29 = load i32* %right.addr, align 4
  %cmp20 = icmp slt i32 %add19, %29
  br i1 %cmp20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end18
  %30 = load i32** %x.addr, align 8
  %31 = load i32* %j, align 4
  %add22 = add nsw i32 %31, 1
  %32 = load i32* %right.addr, align 4
  call void @QSort(i32* %30, i32 %add22, i32 %32)
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end18
  ret void
}

; Function Attrs: nounwind uwtable
define void @Swap(i32* %x, i32 %i, i32 %j) #0 {
entry:
  %x.addr = alloca i32*, align 8
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  %0 = load i32* %i.addr, align 4
  %idxprom = sext i32 %0 to i64
  %1 = load i32** %x.addr, align 8
  %arrayidx = getelementptr inbounds i32* %1, i64 %idxprom
  %2 = load i32* %arrayidx, align 4
  store i32 %2, i32* %temp, align 4
  %3 = load i32* %j.addr, align 4
  %idxprom1 = sext i32 %3 to i64
  %4 = load i32** %x.addr, align 8
  %arrayidx2 = getelementptr inbounds i32* %4, i64 %idxprom1
  %5 = load i32* %arrayidx2, align 4
  %6 = load i32* %i.addr, align 4
  %idxprom3 = sext i32 %6 to i64
  %7 = load i32** %x.addr, align 8
  %arrayidx4 = getelementptr inbounds i32* %7, i64 %idxprom3
  store i32 %5, i32* %arrayidx4, align 4
  %8 = load i32* %temp, align 4
  %9 = load i32* %j.addr, align 4
  %idxprom5 = sext i32 %9 to i64
  %10 = load i32** %x.addr, align 8
  %arrayidx6 = getelementptr inbounds i32* %10, i64 %idxprom5
  store i32 %8, i32* %arrayidx6, align 4
  ret void
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
  call void @QSort(i32* %arraydecay, i32 0, i32 99)
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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
