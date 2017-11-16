; ModuleID = 'test_model2.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

%struct.tag_RTM_test_model2_T = type { i8* }
%struct.ExtU_test_model2_T = type { double, double, double }
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
%union.anon.1 = type { double }
%struct.LittleEndianIEEEDouble = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.IEEESingle = type { %union.anon.0.2 }
%union.anon.0.2 = type { float }

@rt_OneStep.OverrunFlag = internal global i8 0, align 1
@.str = private unnamed_addr constant [8 x i8] c"Overrun\00", align 1
@.str1 = private unnamed_addr constant [160 x i8] c"Warning: The simulation will run forever. Generated ERT main won't simulate model step behavior. To change this behavior select the 'MAT-file logging' option.\0A\00", align 1
@test_model2_M_ = common global %struct.tag_RTM_test_model2_T zeroinitializer, align 8
@test_model2_M = constant %struct.tag_RTM_test_model2_T* @test_model2_M_, align 8
@test_model2_U = common global %struct.ExtU_test_model2_T zeroinitializer, align 8
@test_model2_Y = common global %struct.ExtU_test_model2_T zeroinitializer, align 8
@test_model2_P = global %struct.ExtU_test_model2_T { double 0.000000e+00, double 1.000000e+00, double 0x3FE3C6EF372FE94F }, align 8
@rtNaN = common global double 0.000000e+00, align 8
@rtNaNF = common global float 0.000000e+00, align 4
@rtInf = common global double 0.000000e+00, align 8
@rtInfF = common global float 0.000000e+00, align 4
@rtMinusInf = common global double 0.000000e+00, align 8
@rtMinusInfF = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @rt_OneStep() #0 {
entry:
  %0 = load i8* @rt_OneStep.OverrunFlag, align 1
  %tobool = icmp ne i8 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.tag_RTM_test_model2_T** @test_model2_M, align 8
  %errorStatus = getelementptr inbounds %struct.tag_RTM_test_model2_T* %1, i32 0, i32 0
  store volatile i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8** %errorStatus, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i8 1, i8* @rt_OneStep.OverrunFlag, align 1
  call void @test_model2_step()
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
  call void @test_model2_initialize()
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([160 x i8]* @.str1, i32 0, i32 0))
  %call1 = call i32 @fflush(%struct.__sFILE* null)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.tag_RTM_test_model2_T** @test_model2_M, align 8
  %errorStatus = getelementptr inbounds %struct.tag_RTM_test_model2_T* %2, i32 0, i32 0
  %3 = load volatile i8** %errorStatus, align 8
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @test_model2_terminate()
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct.__sFILE*) #1

; Function Attrs: nounwind uwtable
define void @test_model2_step() #0 {
entry:
  %rtb_Abs = alloca double, align 8
  %0 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_U, i32 0, i32 0), align 8
  %1 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_U, i32 0, i32 1), align 8
  %add = fadd double %0, %1
  store double %add, double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_Y, i32 0, i32 0), align 8
  %2 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_U, i32 0, i32 1), align 8
  %3 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_P, i32 0, i32 0), align 8
  %cmp = fcmp ogt double %2, %3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_P, i32 0, i32 0), align 8
  store double %4, double* %rtb_Abs, align 8
  br label %if.end4

if.else:                                          ; preds = %entry
  %5 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_U, i32 0, i32 1), align 8
  %6 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_P, i32 0, i32 1), align 8
  %cmp1 = fcmp olt double %5, %6
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  %7 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_P, i32 0, i32 1), align 8
  store double %7, double* %rtb_Abs, align 8
  br label %if.end

if.else3:                                         ; preds = %if.else
  %8 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_U, i32 0, i32 1), align 8
  store double %8, double* %rtb_Abs, align 8
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %9 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_U, i32 0, i32 0), align 8
  %10 = load double* %rtb_Abs, align 8
  %div = fdiv double %9, %10
  store double %div, double* %rtb_Abs, align 8
  %11 = load double* %rtb_Abs, align 8
  store double %11, double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_Y, i32 0, i32 1), align 8
  %12 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_U, i32 0, i32 2), align 8
  %13 = load double* %rtb_Abs, align 8
  %sub = fsub double %13, %12
  store double %sub, double* %rtb_Abs, align 8
  %14 = load double* %rtb_Abs, align 8
  %cmp2 = fcmp olt double %14, 0.000000e+00
  br i1 %cmp2, label %fabs.if.then, label %fabs.if.end

fabs.if.then:                                          ; preds = %entry
  %15 = load double* %rtb_Abs, align 8
  %sub1 = fsub double -0.000000e+00, %15
  store double %sub1, double* %rtb_Abs, align 8
  br label %fabs.if.end

fabs.if.end:                                           ; preds = %if.then, %entry
  %call = load double* %rtb_Abs, align 8
  store double %call, double* %rtb_Abs, align 8
  %16 = load double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_P, i32 0, i32 2), align 8
  %17 = load double* %rtb_Abs, align 8
  %mul = fmul double %16, %17
  store double %mul, double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_Y, i32 0, i32 2), align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @test_model2_initialize() #0 {
entry:
  call void @rt_InitInfAndNaN(i64 8)
  %0 = load double* @rtInf, align 8
  store double %0, double* getelementptr inbounds (%struct.ExtU_test_model2_T* @test_model2_P, i32 0, i32 0), align 8
  %1 = load %struct.tag_RTM_test_model2_T** @test_model2_M, align 8
  %errorStatus = getelementptr inbounds %struct.tag_RTM_test_model2_T* %1, i32 0, i32 0
  store volatile i8* null, i8** %errorStatus, align 8
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.ExtU_test_model2_T* @test_model2_U to i8*), i8 0, i64 24, i32 1, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.ExtU_test_model2_T* @test_model2_Y to i8*), i8 0, i64 24, i32 1, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @test_model2_terminate() #0 {
entry:
  ret void
}

; Function Attrs: nounwind uwtable
define double @rtGetInf() #0 {
entry:
  %bitsPerReal = alloca i64, align 8
  %inf = alloca double, align 8
  %tmpVal = alloca %union.anon.1, align 8
  store i64 64, i64* %bitsPerReal, align 8
  store double 0.000000e+00, double* %inf, align 8
  %0 = load i64* %bitsPerReal, align 8
  %cmp = icmp eq i64 %0, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call float @rtGetInfF()
  %conv = fpext float %call to double
  store double %conv, double* %inf, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %bitVal = bitcast %union.anon.1* %tmpVal to %struct.LittleEndianIEEEDouble*
  %words = getelementptr inbounds %struct.LittleEndianIEEEDouble* %bitVal, i32 0, i32 0
  %wordH = getelementptr inbounds %struct.anon* %words, i32 0, i32 1
  store i32 2146435072, i32* %wordH, align 4
  %bitVal1 = bitcast %union.anon.1* %tmpVal to %struct.LittleEndianIEEEDouble*
  %words2 = getelementptr inbounds %struct.LittleEndianIEEEDouble* %bitVal1, i32 0, i32 0
  %wordL = getelementptr inbounds %struct.anon* %words2, i32 0, i32 0
  store i32 0, i32* %wordL, align 4
  %fltVal = bitcast %union.anon.1* %tmpVal to double*
  %1 = load double* %fltVal, align 8
  store double %1, double* %inf, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load double* %inf, align 8
  ret double %2
}

; Function Attrs: nounwind uwtable
define float @rtGetInfF() #0 {
entry:
  %infF = alloca %struct.IEEESingle, align 4
  %wordL = getelementptr inbounds %struct.IEEESingle* %infF, i32 0, i32 0
  %wordLuint = bitcast %union.anon.0.2* %wordL to i32*
  store i32 2139095040, i32* %wordLuint, align 4
  %wordL1 = getelementptr inbounds %struct.IEEESingle* %infF, i32 0, i32 0
  %wordLreal = bitcast %union.anon.0.2* %wordL1 to float*
  %0 = load float* %wordLreal, align 4
  ret float %0
}

; Function Attrs: nounwind uwtable
define double @rtGetMinusInf() #0 {
entry:
  %bitsPerReal = alloca i64, align 8
  %minf = alloca double, align 8
  %tmpVal = alloca %union.anon.1, align 8
  store i64 64, i64* %bitsPerReal, align 8
  store double 0.000000e+00, double* %minf, align 8
  %0 = load i64* %bitsPerReal, align 8
  %cmp = icmp eq i64 %0, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call float @rtGetMinusInfF()
  %conv = fpext float %call to double
  store double %conv, double* %minf, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %bitVal = bitcast %union.anon.1* %tmpVal to %struct.LittleEndianIEEEDouble*
  %words = getelementptr inbounds %struct.LittleEndianIEEEDouble* %bitVal, i32 0, i32 0
  %wordH = getelementptr inbounds %struct.anon* %words, i32 0, i32 1
  store i32 -1048576, i32* %wordH, align 4
  %bitVal1 = bitcast %union.anon.1* %tmpVal to %struct.LittleEndianIEEEDouble*
  %words2 = getelementptr inbounds %struct.LittleEndianIEEEDouble* %bitVal1, i32 0, i32 0
  %wordL = getelementptr inbounds %struct.anon* %words2, i32 0, i32 0
  store i32 0, i32* %wordL, align 4
  %fltVal = bitcast %union.anon.1* %tmpVal to double*
  %1 = load double* %fltVal, align 8
  store double %1, double* %minf, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load double* %minf, align 8
  ret double %2
}

; Function Attrs: nounwind uwtable
define float @rtGetMinusInfF() #0 {
entry:
  %minfF = alloca %struct.IEEESingle, align 4
  %wordL = getelementptr inbounds %struct.IEEESingle* %minfF, i32 0, i32 0
  %wordLuint = bitcast %union.anon.0.2* %wordL to i32*
  store i32 -8388608, i32* %wordLuint, align 4
  %wordL1 = getelementptr inbounds %struct.IEEESingle* %minfF, i32 0, i32 0
  %wordLreal = bitcast %union.anon.0.2* %wordL1 to float*
  %0 = load float* %wordLreal, align 4
  ret float %0
}

; Function Attrs: nounwind uwtable
define void @rt_InitInfAndNaN(i64 %realSize) #0 {
entry:
  %realSize.addr = alloca i64, align 8
  store i64 %realSize, i64* %realSize.addr, align 8
  %0 = load i64* %realSize.addr, align 8
  %call = call double @rtGetNaN()
  store double %call, double* @rtNaN, align 8
  %call1 = call float @rtGetNaNF()
  store float %call1, float* @rtNaNF, align 4
  %call2 = call double @rtGetInf()
  store double %call2, double* @rtInf, align 8
  %call3 = call float @rtGetInfF()
  store float %call3, float* @rtInfF, align 4
  %call4 = call double @rtGetMinusInf()
  store double %call4, double* @rtMinusInf, align 8
  %call5 = call float @rtGetMinusInfF()
  store float %call5, float* @rtMinusInfF, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i8 @rtIsInf(double %value) #0 {
entry:
  %value.addr = alloca double, align 8
  store double %value, double* %value.addr, align 8
  %0 = load double* %value.addr, align 8
  %1 = load double* @rtInf, align 8
  %cmp = fcmp oeq double %0, %1
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load double* %value.addr, align 8
  %3 = load double* @rtMinusInf, align 8
  %cmp1 = fcmp oeq double %2, %3
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %4 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %cond = select i1 %4, i32 1, i32 0
  %conv = trunc i32 %cond to i8
  ret i8 %conv
}

; Function Attrs: nounwind uwtable
define i8 @rtIsInfF(float %value) #0 {
entry:
  %value.addr = alloca float, align 4
  store float %value, float* %value.addr, align 4
  %0 = load float* %value.addr, align 4
  %1 = load float* @rtInfF, align 4
  %cmp = fcmp oeq float %0, %1
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load float* %value.addr, align 4
  %3 = load float* @rtMinusInfF, align 4
  %cmp1 = fcmp oeq float %2, %3
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %4 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %cond = select i1 %4, i32 1, i32 0
  %conv = trunc i32 %cond to i8
  ret i8 %conv
}

; Function Attrs: nounwind uwtable
define i8 @rtIsNaN(double %value) #0 {
entry:
  %value.addr = alloca double, align 8
  store double %value, double* %value.addr, align 8
  %0 = load double* %value.addr, align 8
  %1 = load double* %value.addr, align 8
  %cmp = fcmp une double %0, %1
  %cond = select i1 %cmp, i32 1, i32 0
  %conv = trunc i32 %cond to i8
  ret i8 %conv
}

; Function Attrs: nounwind uwtable
define i8 @rtIsNaNF(float %value) #0 {
entry:
  %value.addr = alloca float, align 4
  store float %value, float* %value.addr, align 4
  %0 = load float* %value.addr, align 4
  %1 = load float* %value.addr, align 4
  %cmp = fcmp une float %0, %1
  %cond = select i1 %cmp, i32 1, i32 0
  %conv = trunc i32 %cond to i8
  ret i8 %conv
}

; Function Attrs: nounwind uwtable
define double @rtGetNaN() #0 {
entry:
  %bitsPerReal = alloca i64, align 8
  %nan = alloca double, align 8
  %tmpVal = alloca %union.anon.1, align 8
  store i64 64, i64* %bitsPerReal, align 8
  store double 0.000000e+00, double* %nan, align 8
  %0 = load i64* %bitsPerReal, align 8
  %cmp = icmp eq i64 %0, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call float @rtGetNaNF()
  %conv = fpext float %call to double
  store double %conv, double* %nan, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %bitVal = bitcast %union.anon.1* %tmpVal to %struct.LittleEndianIEEEDouble*
  %words = getelementptr inbounds %struct.LittleEndianIEEEDouble* %bitVal, i32 0, i32 0
  %wordH = getelementptr inbounds %struct.anon* %words, i32 0, i32 1
  store i32 -524288, i32* %wordH, align 4
  %bitVal1 = bitcast %union.anon.1* %tmpVal to %struct.LittleEndianIEEEDouble*
  %words2 = getelementptr inbounds %struct.LittleEndianIEEEDouble* %bitVal1, i32 0, i32 0
  %wordL = getelementptr inbounds %struct.anon* %words2, i32 0, i32 0
  store i32 0, i32* %wordL, align 4
  %fltVal = bitcast %union.anon.1* %tmpVal to double*
  %1 = load double* %fltVal, align 8
  store double %1, double* %nan, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load double* %nan, align 8
  ret double %2
}

; Function Attrs: nounwind uwtable
define float @rtGetNaNF() #0 {
entry:
  %nanF = alloca %struct.IEEESingle, align 4
  %0 = bitcast %struct.IEEESingle* %nanF to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 4, i32 4, i1 false)
  %wordL = getelementptr inbounds %struct.IEEESingle* %nanF, i32 0, i32 0
  %wordLuint = bitcast %union.anon.0.2* %wordL to i32*
  store i32 -4194304, i32* %wordLuint, align 4
  %wordL1 = getelementptr inbounds %struct.IEEESingle* %nanF, i32 0, i32 0
  %wordLreal = bitcast %union.anon.0.2* %wordL1 to float*
  %1 = load float* %wordLreal, align 4
  ret float %1
}

; Function Attrs: nounwind readnone uwtable
define double @fabs(double %x) #3 {
entry:
  %x.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double* %x.addr, align 8
  %cmp = fcmp olt double %0, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load double* %x.addr, align 8
  %sub = fsub double -0.000000e+00, %1
  store double %sub, double* %x.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load double* %x.addr, align 8
  ret double %2
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
