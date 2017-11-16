; ModuleID = 'test_model.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

%struct.tag_RTM_test_model_T = type { i8* }
%struct.ExtU_test_model_T = type { double, double }
%struct.ExtY_test_model_T = type { double }
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
@test_model_M_ = common global %struct.tag_RTM_test_model_T zeroinitializer, align 8
@test_model_M = constant %struct.tag_RTM_test_model_T* @test_model_M_, align 8
@test_model_U = common global %struct.ExtU_test_model_T zeroinitializer, align 8
@test_model_Y = common global %struct.ExtY_test_model_T zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define void @rt_OneStep() #0 {
entry:
  %0 = load i8* @rt_OneStep.OverrunFlag, align 1
  %tobool = icmp ne i8 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.tag_RTM_test_model_T** @test_model_M, align 8
  %errorStatus = getelementptr inbounds %struct.tag_RTM_test_model_T* %1, i32 0, i32 0
  store volatile i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8** %errorStatus, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i8 1, i8* @rt_OneStep.OverrunFlag, align 1
  call void @test_model_step()
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
  call void @test_model_initialize()
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([160 x i8]* @.str1, i32 0, i32 0))
  %call1 = call i32 @fflush(%struct.__sFILE* null)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.tag_RTM_test_model_T** @test_model_M, align 8
  %errorStatus = getelementptr inbounds %struct.tag_RTM_test_model_T* %2, i32 0, i32 0
  %3 = load volatile i8** %errorStatus, align 8
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @test_model_terminate()
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct.__sFILE*) #1

; Function Attrs: nounwind uwtable
define void @test_model_step() #0 {
entry:
  %0 = load double* getelementptr inbounds (%struct.ExtU_test_model_T* @test_model_U, i32 0, i32 0), align 8
  %1 = load double* getelementptr inbounds (%struct.ExtU_test_model_T* @test_model_U, i32 0, i32 1), align 8
  %add = fadd double %0, %1
  store double %add, double* getelementptr inbounds (%struct.ExtY_test_model_T* @test_model_Y, i32 0, i32 0), align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @test_model_initialize() #0 {
entry:
  ret void
}

; Function Attrs: nounwind uwtable
define void @test_model_terminate() #0 {
entry:
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
