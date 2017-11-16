; ModuleID = 'Estimation.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @target() #0 {
entry:
  %x = alloca [10 x i32], align 16
  %arrayidx = getelementptr inbounds [10 x i32]* %x, i32 0, i64 0
  store i32 1, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 1
  store i32 1, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 1
  %0 = load i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 0
  %1 = load i32* %arrayidx3, align 4
  %add = add nsw i32 %0, %1
  %arrayidx4 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 2
  store i32 %add, i32* %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 2
  %2 = load i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 1
  %3 = load i32* %arrayidx6, align 4
  %add7 = add nsw i32 %2, %3
  %arrayidx8 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 3
  store i32 %add7, i32* %arrayidx8, align 4
  %arrayidx9 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 3
  %4 = load i32* %arrayidx9, align 4
  %arrayidx10 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 2
  %5 = load i32* %arrayidx10, align 4
  %add11 = add nsw i32 %4, %5
  %arrayidx12 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 4
  store i32 %add11, i32* %arrayidx12, align 4
  %arrayidx13 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 4
  %6 = load i32* %arrayidx13, align 4
  %arrayidx14 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 3
  %7 = load i32* %arrayidx14, align 4
  %add15 = add nsw i32 %6, %7
  %arrayidx16 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  store i32 %add15, i32* %arrayidx16, align 4
  %arrayidx17 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  %8 = load i32* %arrayidx17, align 4
  %arrayidx18 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 4
  %9 = load i32* %arrayidx18, align 4
  %add19 = add nsw i32 %8, %9
  %arrayidx20 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 6
  store i32 %add19, i32* %arrayidx20, align 4
  %arrayidx21 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 6
  %10 = load i32* %arrayidx21, align 4
  %arrayidx22 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 5
  %11 = load i32* %arrayidx22, align 4
  %add23 = add nsw i32 %10, %11
  %arrayidx24 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 7
  store i32 %add23, i32* %arrayidx24, align 4
  %arrayidx25 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 7
  %12 = load i32* %arrayidx25, align 4
  %arrayidx26 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 6
  %13 = load i32* %arrayidx26, align 4
  %add27 = add nsw i32 %12, %13
  %arrayidx28 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 8
  store i32 %add27, i32* %arrayidx28, align 4
  %arrayidx29 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 8
  %14 = load i32* %arrayidx29, align 4
  %arrayidx30 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 7
  %15 = load i32* %arrayidx30, align 4
  %add31 = add nsw i32 %14, %15
  %arrayidx32 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 9
  store i32 %add31, i32* %arrayidx32, align 4
  %arrayidx33 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 9
  %16 = load i32* %arrayidx33, align 4
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i32 @target()
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
