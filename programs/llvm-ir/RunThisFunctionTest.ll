; ModuleID = 'RunThisFunctionTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

%struct.ST = type { double, double }
%struct.RT = type { double }

@st = common global %struct.ST zeroinitializer, align 8
@rt = common global %struct.RT zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define void @add_step() #0 {
entry:
  %0 = load double* getelementptr inbounds (%struct.ST* @st, i32 0, i32 0), align 8
  %1 = load double* getelementptr inbounds (%struct.ST* @st, i32 0, i32 1), align 8
  %add = fadd double %0, %1
  %2 = load double* getelementptr inbounds (%struct.RT* @rt, i32 0, i32 0), align 8
  %add1 = fadd double %2, %add
  store double %add1, double* getelementptr inbounds (%struct.RT* @rt, i32 0, i32 0), align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store double 0.000000e+00, double* getelementptr inbounds (%struct.RT* @rt, i32 0, i32 0), align 8
  store double 1.000000e+00, double* getelementptr inbounds (%struct.ST* @st, i32 0, i32 0), align 8
  store double 2.000000e+00, double* getelementptr inbounds (%struct.ST* @st, i32 0, i32 1), align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @add_step()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
