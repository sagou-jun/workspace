; ModuleID = '/usr/local/matlab/test_model_ert_rtw/test_model.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

%struct.tag_RTM_test_model_T = type { i8* }
%struct.ExtU_test_model_T = type { double, double }
%struct.ExtY_test_model_T = type { double }

@test_model_M_ = common global %struct.tag_RTM_test_model_T zeroinitializer, align 8
@test_model_M = constant %struct.tag_RTM_test_model_T* @test_model_M_, align 8
@test_model_U = common global %struct.ExtU_test_model_T zeroinitializer, align 8
@test_model_Y = common global %struct.ExtY_test_model_T zeroinitializer, align 8

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

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
