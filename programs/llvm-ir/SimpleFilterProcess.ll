; ModuleID = 'SimpleFilterProcess.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@Data = common global [1000 x i32] zeroinitializer, align 16

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
define i32 @SimpleFilter(i32 %x) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %x.addr, align 4
  %div = sdiv i32 %1, 5
  %2 = load i32* %x.addr, align 4
  %add = add nsw i32 %2, 100
  %call = call i32 @SimpleFilter(i32 %add)
  %add1 = add nsw i32 %div, %call
  store i32 %add1, i32* %temp, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32* %x.addr, align 4
  %div2 = sdiv i32 %3, 4
  store i32 %div2, i32* %temp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32* %temp, align 4
  %cmp3 = icmp sgt i32 %4, 1023
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.end
  store i32 1023, i32* %retval
  br label %return

if.else5:                                         ; preds = %if.end
  %5 = load i32* %temp, align 4
  store i32 %5, i32* %retval
  br label %return

return:                                           ; preds = %if.else5, %if.then4
  %6 = load i32* %retval
  ret i32 %6
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
  %cmp = icmp slt i32 %0, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %conv = sitofp i32 %1 to double
  %call = call i32 @data(double %conv)
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [1000 x i32]* @Data, i32 0, i64 %idxprom
  store i32 %call, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc10, %for.end
  %4 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %4, 1000
  br i1 %cmp2, label %for.body4, label %for.end12

for.body4:                                        ; preds = %for.cond1
  %5 = load i32* %i, align 4
  %idxprom5 = sext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds [1000 x i32]* @Data, i32 0, i64 %idxprom5
  %6 = load i32* %arrayidx6, align 4
  %call7 = call i32 @SimpleFilter(i32 %6)
  %7 = load i32* %i, align 4
  %idxprom8 = sext i32 %7 to i64
  %arrayidx9 = getelementptr inbounds [1000 x i32]* @Data, i32 0, i64 %idxprom8
  store i32 %call7, i32* %arrayidx9, align 4
  br label %for.inc10

for.inc10:                                        ; preds = %for.body4
  %8 = load i32* %i, align 4
  %inc11 = add nsw i32 %8, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond1

for.end12:                                        ; preds = %for.cond1
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
