; ModuleID = 'ArrayTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@IArray = common global [20 x i32] zeroinitializer, align 16
@IArray2 = common global [10 x [10 x [5 x i32]]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %CArray = alloca [20 x i8], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 20
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 97, %1
  %conv = trunc i32 %add to i8
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [20 x i8]* %CArray, i32 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  %3 = load i32* %i, align 4
  %4 = load i32* %i, align 4
  %mul = mul nsw i32 %3, %4
  %5 = load i32* %i, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds [20 x i32]* @IArray, i32 0, i64 %idxprom1
  store i32 %mul, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc19, %for.end
  %7 = load i32* %i, align 4
  %cmp4 = icmp slt i32 %7, 10
  br i1 %cmp4, label %for.body6, label %for.end21

for.body6:                                        ; preds = %for.cond3
  store i32 0, i32* %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc16, %for.body6
  %8 = load i32* %j, align 4
  %cmp8 = icmp slt i32 %8, 5
  br i1 %cmp8, label %for.body10, label %for.end18

for.body10:                                       ; preds = %for.cond7
  %9 = load i32* %i, align 4
  %10 = load i32* %j, align 4
  %mul11 = mul nsw i32 %9, %10
  %11 = load i32* %j, align 4
  %idxprom12 = sext i32 %11 to i64
  %12 = load i32* %i, align 4
  %idxprom13 = sext i32 %12 to i64
  %arrayidx14 = getelementptr inbounds [10 x [5 x i32]]* getelementptr inbounds ([10 x [10 x [5 x i32]]]* @IArray2, i32 0, i64 1), i32 0, i64 %idxprom13
  %arrayidx15 = getelementptr inbounds [5 x i32]* %arrayidx14, i32 0, i64 %idxprom12
  store i32 %mul11, i32* %arrayidx15, align 4
  br label %for.inc16

for.inc16:                                        ; preds = %for.body10
  %13 = load i32* %j, align 4
  %inc17 = add nsw i32 %13, 1
  store i32 %inc17, i32* %j, align 4
  br label %for.cond7

for.end18:                                        ; preds = %for.cond7
  br label %for.inc19

for.inc19:                                        ; preds = %for.end18
  %14 = load i32* %i, align 4
  %inc20 = add nsw i32 %14, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond3

for.end21:                                        ; preds = %for.cond3
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
