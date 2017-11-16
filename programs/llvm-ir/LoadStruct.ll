; ModuleID = 'LoadStruct.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

%struct.ST = type { i32, i32 }
%struct.RT = type { i32, %struct.ST }
%struct.HT = type { [3 x [4 x %struct.ST]] }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %st = alloca %struct.ST, align 4
  %rt = alloca %struct.RT, align 4
  %ht = alloca %struct.HT, align 4
  store i32 0, i32* %retval
  %i1 = getelementptr inbounds %struct.ST* %st, i32 0, i32 0
  store i32 2, i32* %i1, align 4
  %i2 = getelementptr inbounds %struct.ST* %st, i32 0, i32 1
  store i32 3, i32* %i2, align 4
  %i11 = getelementptr inbounds %struct.ST* %st, i32 0, i32 0
  %0 = load i32* %i11, align 4
  %i22 = getelementptr inbounds %struct.ST* %st, i32 0, i32 1
  %1 = load i32* %i22, align 4
  %add = add nsw i32 %0, %1
  %i13 = getelementptr inbounds %struct.RT* %rt, i32 0, i32 0
  store i32 %add, i32* %i13, align 4
  %i24 = getelementptr inbounds %struct.ST* %st, i32 0, i32 1
  %2 = load i32* %i24, align 4
  %st5 = getelementptr inbounds %struct.RT* %rt, i32 0, i32 1
  %i16 = getelementptr inbounds %struct.ST* %st5, i32 0, i32 0
  store i32 %2, i32* %i16, align 4
  %i17 = getelementptr inbounds %struct.ST* %st, i32 0, i32 0
  %3 = load i32* %i17, align 4
  %st8 = getelementptr inbounds %struct.RT* %rt, i32 0, i32 1
  %i29 = getelementptr inbounds %struct.ST* %st8, i32 0, i32 1
  store i32 %3, i32* %i29, align 4
  %X = getelementptr inbounds %struct.HT* %ht, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x [4 x %struct.ST]]* %X, i32 0, i64 2
  %arrayidx10 = getelementptr inbounds [4 x %struct.ST]* %arrayidx, i32 0, i64 2
  %i111 = getelementptr inbounds %struct.ST* %arrayidx10, i32 0, i32 0
  store i32 1, i32* %i111, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
