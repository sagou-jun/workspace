; ModuleID = 'PassingStructArguments.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

%struct.ArgumentST = type { i32, i8, double }

@main.st = private unnamed_addr constant %struct.ArgumentST { i32 1, i8 97, double 3.140000e+00 }, align 8

; Function Attrs: nounwind uwtable
define i32 @StructArgument1(%struct.ArgumentST* %st) #0 {
entry:
  %m1 = getelementptr inbounds %struct.ArgumentST* %st, i32 0, i32 0
  %0 = load i32* %m1, align 4
  %mul = mul nsw i32 %0, 2
  %m11 = getelementptr inbounds %struct.ArgumentST* %st, i32 0, i32 0
  store i32 %mul, i32* %m11, align 4
  %m2 = getelementptr inbounds %struct.ArgumentST* %st, i32 0, i32 1
  %1 = load i8* %m2, align 1
  %conv = sext i8 %1 to i32
  %mul2 = mul nsw i32 %conv, 2
  %conv3 = trunc i32 %mul2 to i8
  %m24 = getelementptr inbounds %struct.ArgumentST* %st, i32 0, i32 1
  store i8 %conv3, i8* %m24, align 1
  %m3 = getelementptr inbounds %struct.ArgumentST* %st, i32 0, i32 2
  %2 = load double* %m3, align 8
  %mul5 = fmul double %2, 2.000000e+00
  %m36 = getelementptr inbounds %struct.ArgumentST* %st, i32 0, i32 2
  store double %mul5, double* %m36, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @StructArgument2(%struct.ArgumentST* %st) #0 {
entry:
  %st.addr = alloca %struct.ArgumentST*, align 8
  store %struct.ArgumentST* %st, %struct.ArgumentST** %st.addr, align 8
  %0 = load %struct.ArgumentST** %st.addr, align 8
  %m1 = getelementptr inbounds %struct.ArgumentST* %0, i32 0, i32 0
  %1 = load i32* %m1, align 4
  %mul = mul nsw i32 %1, 2
  %2 = load %struct.ArgumentST** %st.addr, align 8
  %m11 = getelementptr inbounds %struct.ArgumentST* %2, i32 0, i32 0
  store i32 %mul, i32* %m11, align 4
  %3 = load %struct.ArgumentST** %st.addr, align 8
  %m2 = getelementptr inbounds %struct.ArgumentST* %3, i32 0, i32 1
  %4 = load i8* %m2, align 1
  %conv = sext i8 %4 to i32
  %mul2 = mul nsw i32 %conv, 2
  %conv3 = trunc i32 %mul2 to i8
  %5 = load %struct.ArgumentST** %st.addr, align 8
  %m24 = getelementptr inbounds %struct.ArgumentST* %5, i32 0, i32 1
  store i8 %conv3, i8* %m24, align 1
  %6 = load %struct.ArgumentST** %st.addr, align 8
  %m3 = getelementptr inbounds %struct.ArgumentST* %6, i32 0, i32 2
  %7 = load double* %m3, align 8
  %mul5 = fmul double %7, 2.000000e+00
  %8 = load %struct.ArgumentST** %st.addr, align 8
  %m36 = getelementptr inbounds %struct.ArgumentST* %8, i32 0, i32 2
  store double %mul5, double* %m36, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %st = alloca %struct.ArgumentST, align 8
  %tmp = alloca %struct.ArgumentST, align 8
  %0 = bitcast %struct.ArgumentST* %st to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.ArgumentST* @main.st to i8*), i64 16, i32 8, i1 false)
  %1 = bitcast %struct.ArgumentST* %tmp to i8*
  %2 = bitcast %struct.ArgumentST* %st to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 16, i32 8, i1 false)
  %call = call i32 @StructArgument1(%struct.ArgumentST* %tmp)
  %call1 = call i32 @StructArgument2(%struct.ArgumentST* %st)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
