; ModuleID = 'PID_controller_PILS.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

%struct.tag_RTM_PID_controller_PILS_T = type { i8* }
%struct.ExtU_PID_controller_PILS_T = type { double }
%struct.DW_PID_controller_PILS_T = type { double, double }
%struct.P_PID_controller_PILS_T_ = type { double, double, double, double, double, double, double, double }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)*, i64 (%struct._reent*, i8*, i64, i32)*, i32 (%struct._reent*, i8*)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct._reent*, i8*, %struct._mbstate_t, i32 }
%struct.__sbuf = type { i8*, i32 }
%struct._reent = type { i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], i32, %struct.__locale_t*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, %union.anon.0, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__sFILE] }
%struct.__locale_t = type opaque
%struct._Bigint = type { %struct._Bigint*, i32, i32, i32, i32, [1 x i32] }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [30 x i8*], [30 x i32] }
%struct._atexit = type { %struct._atexit*, i32, [32 x void ()*], %struct._on_exit_args }
%struct._on_exit_args = type { [32 x i8*], [32 x i8*], i32, i32 }
%struct._glue = type { %struct._glue*, i32, %struct.__sFILE* }
%struct._mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }

@rt_OneStep.OverrunFlag = internal global i8 0, align 1
@.str = private unnamed_addr constant [8 x i8] c"Overrun\00", align 1
@.str1 = private unnamed_addr constant [160 x i8] c"Warning: The simulation will run forever. Generated ERT main won't simulate model step behavior. To change this behavior select the 'MAT-file logging' option.\0A\00", align 1
@PID_controller_PILS_M_ = common global %struct.tag_RTM_PID_controller_PILS_T zeroinitializer, align 8
@PID_controller_PILS_M = constant %struct.tag_RTM_PID_controller_PILS_T* @PID_controller_PILS_M_, align 8
@PID_controller_PILS_U = common global %struct.ExtU_PID_controller_PILS_T zeroinitializer, align 8
@PID_controller_PILS_DW = common global %struct.DW_PID_controller_PILS_T zeroinitializer, align 8
@PID_controller_PILS_Y = common global %struct.ExtU_PID_controller_PILS_T zeroinitializer, align 8
@PID_controller_PILS_P = global %struct.P_PID_controller_PILS_T_ { double 0x3F51B1215A71DE27, double 0x407417F936BAE4C3, double 0x40B8190C1F016E19, double 0x3FF489BD822437F8, double 1.000000e+00, double 0.000000e+00, double 1.000000e+00, double 0.000000e+00 }, align 8

; Function Attrs: nounwind uwtable
define void @rt_OneStep() #0 {
entry:
  %0 = load i8* @rt_OneStep.OverrunFlag, align 1
  %tobool = icmp ne i8 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.tag_RTM_PID_controller_PILS_T** @PID_controller_PILS_M, align 8
  %errorStatus = getelementptr inbounds %struct.tag_RTM_PID_controller_PILS_T* %1, i32 0, i32 0
  store volatile i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8** %errorStatus, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i8 1, i8* @rt_OneStep.OverrunFlag, align 1
  call void @PID_controller_PILS_step()
  store i8 0, i8* @rt_OneStep.OverrunFlag, align 1
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32* %argc.addr, align 4
  %1 = load i8*** %argv.addr, align 8
  call void @PID_controller_PILS_initialize()
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([160 x i8]* @.str1, i32 0, i32 0))
  %call1 = call i32 @fflush(%struct.__sFILE* null)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.tag_RTM_PID_controller_PILS_T** @PID_controller_PILS_M, align 8
  %errorStatus = getelementptr inbounds %struct.tag_RTM_PID_controller_PILS_T* %2, i32 0, i32 0
  %3 = load volatile i8** %errorStatus, align 8
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @PID_controller_PILS_terminate()
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct.__sFILE*) #1

; Function Attrs: nounwind uwtable
define void @PID_controller_PILS_step() #0 {
entry:
  %rtb_FilterCoefficient = alloca double, align 8
  %0 = load double* getelementptr inbounds (%struct.P_PID_controller_PILS_T_* @PID_controller_PILS_P, i32 0, i32 0), align 8
  %1 = load double* getelementptr inbounds (%struct.ExtU_PID_controller_PILS_T* @PID_controller_PILS_U, i32 0, i32 0), align 8
  %mul = fmul double %0, %1
  %2 = load double* getelementptr inbounds (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW, i32 0, i32 1), align 8
  %sub = fsub double %mul, %2
  %3 = load double* getelementptr inbounds (%struct.P_PID_controller_PILS_T_* @PID_controller_PILS_P, i32 0, i32 2), align 8
  %mul1 = fmul double %sub, %3
  store double %mul1, double* %rtb_FilterCoefficient, align 8
  %4 = load double* getelementptr inbounds (%struct.P_PID_controller_PILS_T_* @PID_controller_PILS_P, i32 0, i32 3), align 8
  %5 = load double* getelementptr inbounds (%struct.ExtU_PID_controller_PILS_T* @PID_controller_PILS_U, i32 0, i32 0), align 8
  %mul2 = fmul double %4, %5
  %6 = load double* getelementptr inbounds (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW, i32 0, i32 0), align 8
  %add = fadd double %mul2, %6
  %7 = load double* %rtb_FilterCoefficient, align 8
  %add3 = fadd double %add, %7
  store double %add3, double* getelementptr inbounds (%struct.ExtU_PID_controller_PILS_T* @PID_controller_PILS_Y, i32 0, i32 0), align 8
  %8 = load double* getelementptr inbounds (%struct.P_PID_controller_PILS_T_* @PID_controller_PILS_P, i32 0, i32 1), align 8
  %9 = load double* getelementptr inbounds (%struct.ExtU_PID_controller_PILS_T* @PID_controller_PILS_U, i32 0, i32 0), align 8
  %mul4 = fmul double %8, %9
  %10 = load double* getelementptr inbounds (%struct.P_PID_controller_PILS_T_* @PID_controller_PILS_P, i32 0, i32 4), align 8
  %mul5 = fmul double %mul4, %10
  %11 = load double* getelementptr inbounds (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW, i32 0, i32 0), align 8
  %add6 = fadd double %11, %mul5
  store double %add6, double* getelementptr inbounds (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW, i32 0, i32 0), align 8
  %12 = load double* getelementptr inbounds (%struct.P_PID_controller_PILS_T_* @PID_controller_PILS_P, i32 0, i32 6), align 8
  %13 = load double* %rtb_FilterCoefficient, align 8
  %mul7 = fmul double %12, %13
  %14 = load double* getelementptr inbounds (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW, i32 0, i32 1), align 8
  %add8 = fadd double %14, %mul7
  store double %add8, double* getelementptr inbounds (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW, i32 0, i32 1), align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @PID_controller_PILS_initialize() #0 {
entry:
  %0 = load %struct.tag_RTM_PID_controller_PILS_T** @PID_controller_PILS_M, align 8
  %errorStatus = getelementptr inbounds %struct.tag_RTM_PID_controller_PILS_T* %0, i32 0, i32 0
  store volatile i8* null, i8** %errorStatus, align 8
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW to i8*), i8 0, i64 16, i32 1, i1 false)
  store double 0.000000e+00, double* getelementptr inbounds (%struct.ExtU_PID_controller_PILS_T* @PID_controller_PILS_U, i32 0, i32 0), align 8
  store double 0.000000e+00, double* getelementptr inbounds (%struct.ExtU_PID_controller_PILS_T* @PID_controller_PILS_Y, i32 0, i32 0), align 8
  %1 = load double* getelementptr inbounds (%struct.P_PID_controller_PILS_T_* @PID_controller_PILS_P, i32 0, i32 5), align 8
  store double %1, double* getelementptr inbounds (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW, i32 0, i32 0), align 8
  %2 = load double* getelementptr inbounds (%struct.P_PID_controller_PILS_T_* @PID_controller_PILS_P, i32 0, i32 7), align 8
  store double %2, double* getelementptr inbounds (%struct.DW_PID_controller_PILS_T* @PID_controller_PILS_DW, i32 0, i32 1), align 8
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @PID_controller_PILS_terminate() #0 {
entry:
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0, !0, !0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
