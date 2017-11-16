; ModuleID = 'CForest_loop_test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@main.x = private unnamed_addr constant [10 x i32] [i32 100, i32 200, i32 300, i32 400, i32 500, i32 600, i32 700, i32 800, i32 900, i32 1000], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca [10 x i32], align 16
  store i32 0, i32* %retval
  %0 = bitcast [10 x i32]* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([10 x i32]* @main.x to i8*), i64 40, i32 16, i1 true)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* %x, i32 0, i64 %idxprom
  %3 = load volatile i32* %arrayidx, align 4
  %4 = load i32* %i, align 4
  %idxprom1 = sext i32 %4 to i64
  %arrayidx2 = getelementptr inbounds [10 x i32]* %x, i32 0, i64 %idxprom1
  %5 = load volatile i32* %arrayidx2, align 4
  %add = add nsw i32 %5, %3
  store volatile i32 %add, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
