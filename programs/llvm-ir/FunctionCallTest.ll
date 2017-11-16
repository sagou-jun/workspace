; ModuleID = 'FunctionCallTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@count = common global i32 0, align 4
@.str = private unnamed_addr constant [20 x i8] c"fn1 = %d,fn2 = %lf\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @test(i32 %a1, i32 %a2, double %a3) #0 {
entry:
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %a3.addr = alloca double, align 8
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store double %a3, double* %a3.addr, align 8
  %0 = load i32* %a1.addr, align 4
  %1 = load i32* %a2.addr, align 4
  %add = add nsw i32 %0, %1
  %conv = sitofp i32 %add to double
  %2 = load double* %a3.addr, align 8
  %add1 = fadd double %conv, %2
  %conv2 = fptosi double %add1 to i32
  ret i32 %conv2
}

; Function Attrs: nounwind uwtable
define i32 @fn1(i32 %a1, i32 %a2) #0 {
entry:
  %retval = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  %0 = load i32* %a2.addr, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %a1.addr, align 4
  %2 = load i32* %a1.addr, align 4
  %3 = load i32* %a2.addr, align 4
  %sub = sub nsw i32 %3, 1
  %call = call i32 @fn1(i32 %2, i32 %sub)
  %add = add nsw i32 %1, %call
  store i32 %add, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %4 = load i32* %retval
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define double @fn2(double %a1, double %a2) #0 {
entry:
  %a1.addr = alloca double, align 8
  %a2.addr = alloca double, align 8
  %i = alloca i32, align 4
  %rtn = alloca double, align 8
  store double %a1, double* %a1.addr, align 8
  store double %a2, double* %a2.addr, align 8
  store double 0.000000e+00, double* %rtn, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load double* %a1.addr, align 8
  %2 = load i32* %i, align 4
  %conv = sitofp i32 %2 to double
  %mul = fmul double %1, %conv
  %3 = load double* %a2.addr, align 8
  %div = fdiv double %mul, %3
  %4 = load double* %rtn, align 8
  %add = fadd double %4, %div
  store double %add, double* %rtn, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load double* %rtn, align 8
  ret double %6
}

; Function Attrs: nounwind uwtable
define void @fn3() #0 {
entry:
  %0 = load i32* @count, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32* @count, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* @count, align 4
  call void @fn3()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %fn1_result = alloca i32, align 4
  %fn2_result = alloca double, align 8
  store i32 0, i32* %retval
  %call = call i32 @test(i32 1, i32 3, double 4.660000e+00)
  %call1 = call i32 @fn1(i32 25, i32 4)
  store i32 %call1, i32* %fn1_result, align 4
  %call2 = call double @fn2(double 2.000000e+00, double 4.000000e+00)
  store double %call2, double* %fn2_result, align 8
  store i32 5, i32* @count, align 4
  call void @fn3()
  %0 = load i32* %fn1_result, align 4
  %1 = load double* %fn2_result, align 8
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %0, double %1)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
