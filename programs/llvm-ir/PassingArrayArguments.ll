; ModuleID = 'PassingArrayArguments.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@main.constArray = private unnamed_addr constant [5 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4], align 16

; Function Attrs: nounwind uwtable
define i32 @arraycheck(i32* %array, i32 %n) #0 {
entry:
  %retval = alloca i32, align 4
  %array.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %array, i32** %array.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32** %array.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  %5 = load i32* %i, align 4
  %cmp1 = icmp ne i32 %4, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %7 = load i32* %retval
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %argumentArray = alloca [10 x i32], align 16
  %constArray = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [5 x i32]* %constArray to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @main.constArray to i8*), i64 20, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [10 x i32]* %argumentArray, i32 0, i64 0
  store i32 1, i32* %arrayidx, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %sub = sub nsw i32 %2, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx1 = getelementptr inbounds [10 x i32]* %argumentArray, i32 0, i64 %idxprom
  %3 = load i32* %arrayidx1, align 4
  %4 = load i32* %i, align 4
  %add = add nsw i32 %3, %4
  %5 = load i32* %i, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds [10 x i32]* %argumentArray, i32 0, i64 %idxprom2
  store i32 %add, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i32]* %argumentArray, i32 0, i32 0
  %call = call i32 @arraycheck(i32* %arraydecay, i32 10)
  %arraydecay4 = getelementptr inbounds [5 x i32]* %constArray, i32 0, i32 0
  %call5 = call i32 @arraycheck(i32* %arraydecay4, i32 5)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
