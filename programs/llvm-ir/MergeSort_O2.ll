; ModuleID = 'MergeSort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %target = alloca [100 x i32], align 16
  %0 = bitcast [100 x i32]* %target to i8*
  call void @llvm.lifetime.start(i64 400, i8* %0) #1
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.1, %for.body ]
  %1 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %1 to double
  %mul.i = fmul double %conv, %conv
  %rem.i = srem i32 %1, 13
  %conv1.i = sitofp i32 %rem.i to double
  %mul2.i = fmul double %mul.i, %conv1.i
  %add.i = fadd double %mul.i, 1.000000e+03
  %div.i = fdiv double %mul2.i, %add.i
  %mul4.i = fmul double %div.i, 1.000000e+02
  %add5.i = fadd double %conv, %mul4.i
  %conv6.i = fptosi double %add5.i to i32
  %arrayidx = getelementptr inbounds [100 x i32]* %target, i64 0, i64 %indvars.iv
  store i32 %conv6.i, i32* %arrayidx, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %2 to double
  %mul.i.1 = fmul double %conv.1, %conv.1
  %rem.i.1 = srem i32 %2, 13
  %conv1.i.1 = sitofp i32 %rem.i.1 to double
  %mul2.i.1 = fmul double %mul.i.1, %conv1.i.1
  %add.i.1 = fadd double %mul.i.1, 1.000000e+03
  %div.i.1 = fdiv double %mul2.i.1, %add.i.1
  %mul4.i.1 = fmul double %div.i.1, 1.000000e+02
  %add5.i.1 = fadd double %conv.1, %mul4.i.1
  %conv6.i.1 = fptosi double %add5.i.1 to i32
  %arrayidx.1 = getelementptr inbounds [100 x i32]* %target, i64 0, i64 %indvars.iv.next
  store i32 %conv6.i.1, i32* %arrayidx.1, align 4, !tbaa !1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 100
  br i1 %exitcond.1, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %arraydecay = getelementptr inbounds [100 x i32]* %target, i64 0, i64 0
  call void @MergeSort(i32* %arraydecay, i32 0, i32 99)
  call void @llvm.lifetime.end(i64 400, i8* %0) #1
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone uwtable
define i32 @data(double %x) #2 {
entry:
  %mul = fmul double %x, %x
  %conv = fptosi double %x to i32
  %rem = srem i32 %conv, 13
  %conv1 = sitofp i32 %rem to double
  %mul2 = fmul double %mul, %conv1
  %add = fadd double %mul, 1.000000e+03
  %div = fdiv double %mul2, %add
  %mul4 = fmul double %div, 1.000000e+02
  %add5 = fadd double %mul4, %x
  %conv6 = fptosi double %add5 to i32
  ret i32 %conv6
}

; Function Attrs: nounwind uwtable
define void @MergeSort(i32* %x, i32 %left, i32 %right) #0 {
entry:
  %buf = alloca [100 x i32], align 16
  %0 = bitcast [100 x i32]* %buf to i8*
  call void @llvm.lifetime.start(i64 400, i8* %0) #1
  %cmp = icmp slt i32 %left, %right
  br i1 %cmp, label %if.end, label %cleanup

if.end:                                           ; preds = %entry
  %add = add nsw i32 %right, %left
  %div = sdiv i32 %add, 2
  tail call void @MergeSort(i32* %x, i32 %left, i32 %div)
  %add1 = add nsw i32 %div, 1
  tail call void @MergeSort(i32* %x, i32 %add1, i32 %right)
  %cmp2103 = icmp slt i32 %div, %left
  br i1 %cmp2103, label %for.cond6.preheader, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.end
  %1 = sext i32 %left to i64
  %scevgep113 = getelementptr [100 x i32]* %buf, i64 0, i64 %1
  %scevgep113114 = bitcast i32* %scevgep113 to i8*
  %scevgep115 = getelementptr i32* %x, i64 %1
  %scevgep115116 = bitcast i32* %scevgep115 to i8*
  %2 = icmp sgt i32 %div, %left
  %smax = select i1 %2, i32 %div, i32 %left
  %3 = sub i32 %smax, %left
  %4 = zext i32 %3 to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep113114, i8* %scevgep115116, i64 %6, i32 4, i1 false)
  br label %for.cond6.preheader

for.cond6.preheader:                              ; preds = %for.body.lr.ph, %if.end
  %cmp7101 = icmp slt i32 %div, %right
  br i1 %cmp7101, label %for.body8.lr.ph, label %for.cond17.preheader

for.body8.lr.ph:                                  ; preds = %for.cond6.preheader
  %7 = sext i32 %div to i64
  %8 = add nsw i64 %7, 1
  %scevgep = getelementptr [100 x i32]* %buf, i64 0, i64 %8
  %scevgep108 = bitcast i32* %scevgep to i8*
  %scevgep109 = getelementptr i32* %x, i64 %8
  %scevgep109110 = bitcast i32* %scevgep109 to i8*
  %9 = add i32 %right, -1
  %10 = sub i32 %9, %div
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 2
  %13 = add nuw nsw i64 %12, 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep108, i8* %scevgep109110, i64 %13, i32 4, i1 false)
  br label %for.cond17.preheader

for.cond17.preheader:                             ; preds = %for.cond6.preheader, %for.body8.lr.ph
  %cmp1897 = icmp sgt i32 %left, %right
  br i1 %cmp1897, label %cleanup, label %for.body19.lr.ph

for.body19.lr.ph:                                 ; preds = %for.cond17.preheader
  %14 = sext i32 %left to i64
  %15 = sext i32 %right to i64
  br label %for.body19

for.body19:                                       ; preds = %for.inc55, %for.body19.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc55 ], [ %14, %for.body19.lr.ph ]
  %j.099 = phi i32 [ %j.1, %for.inc55 ], [ %add1, %for.body19.lr.ph ]
  %i.298 = phi i32 [ %i.3, %for.inc55 ], [ %left, %for.body19.lr.ph ]
  %cmp20 = icmp sgt i32 %i.298, %div
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %for.body19
  %inc22 = add nsw i32 %j.099, 1
  %idxprom23 = sext i32 %j.099 to i64
  %arrayidx24 = getelementptr inbounds [100 x i32]* %buf, i64 0, i64 %idxprom23
  %16 = load i32* %arrayidx24, align 4, !tbaa !1
  %arrayidx26 = getelementptr inbounds i32* %x, i64 %indvars.iv
  store i32 %16, i32* %arrayidx26, align 4, !tbaa !1
  br label %for.inc55

if.else:                                          ; preds = %for.body19
  %cmp27 = icmp sgt i32 %j.099, %right
  br i1 %cmp27, label %if.then28, label %if.else34

if.then28:                                        ; preds = %if.else
  %inc29 = add nsw i32 %i.298, 1
  %idxprom30 = sext i32 %i.298 to i64
  %arrayidx31 = getelementptr inbounds [100 x i32]* %buf, i64 0, i64 %idxprom30
  %17 = load i32* %arrayidx31, align 4, !tbaa !1
  %arrayidx33 = getelementptr inbounds i32* %x, i64 %indvars.iv
  store i32 %17, i32* %arrayidx33, align 4, !tbaa !1
  br label %for.inc55

if.else34:                                        ; preds = %if.else
  %idxprom35 = sext i32 %i.298 to i64
  %arrayidx36 = getelementptr inbounds [100 x i32]* %buf, i64 0, i64 %idxprom35
  %18 = load i32* %arrayidx36, align 4, !tbaa !1
  %idxprom37 = sext i32 %j.099 to i64
  %arrayidx38 = getelementptr inbounds [100 x i32]* %buf, i64 0, i64 %idxprom37
  %19 = load i32* %arrayidx38, align 4, !tbaa !1
  %cmp39 = icmp sgt i32 %18, %19
  br i1 %cmp39, label %if.else46, label %if.then40

if.then40:                                        ; preds = %if.else34
  %inc41 = add nsw i32 %i.298, 1
  %arrayidx45 = getelementptr inbounds i32* %x, i64 %indvars.iv
  store i32 %18, i32* %arrayidx45, align 4, !tbaa !1
  br label %for.inc55

if.else46:                                        ; preds = %if.else34
  %inc47 = add nsw i32 %j.099, 1
  %arrayidx51 = getelementptr inbounds i32* %x, i64 %indvars.iv
  store i32 %19, i32* %arrayidx51, align 4, !tbaa !1
  br label %for.inc55

for.inc55:                                        ; preds = %if.then21, %if.then40, %if.else46, %if.then28
  %i.3 = phi i32 [ %i.298, %if.then21 ], [ %inc29, %if.then28 ], [ %inc41, %if.then40 ], [ %i.298, %if.else46 ]
  %j.1 = phi i32 [ %inc22, %if.then21 ], [ %j.099, %if.then28 ], [ %j.099, %if.then40 ], [ %inc47, %if.else46 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp18 = icmp slt i64 %indvars.iv, %15
  br i1 %cmp18, label %for.body19, label %cleanup.loopexit

cleanup.loopexit:                                 ; preds = %for.inc55
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %for.cond17.preheader, %entry
  call void @llvm.lifetime.end(i64 400, i8* %0) #1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
