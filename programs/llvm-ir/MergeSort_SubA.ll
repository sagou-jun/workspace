; ModuleID = './MergeSort_SubA.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %target = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 2, i32* %x, align 4
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
