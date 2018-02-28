; ModuleID = 'div2Test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

; Function Attrs: nounwind uwtable
define i32 @div2(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %X = alloca i32, align 4
  %Y = alloca i32, align 4
  %Z = alloca i32, align 4
  %A = alloca i32, align 4
  %B = alloca i32, align 4
  %C = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 100, i32* %X, align 4
  store i32 200, i32* %Y, align 4
  store i32 300, i32* %Z, align 4
  store i32 33, i32* %A, align 4
  store i32 50, i32* %B, align 4
  store i32 25, i32* %C, align 4
  %0 = load i32* %Y, align 4
  %1 = load i32* %Z, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, i32* %X, align 4
  %2 = load i32* %Z, align 4
  %3 = load i32* %X, align 4
  %add1 = add nsw i32 %2, %3
  store i32 %add1, i32* %Y, align 4
  %4 = load i32* %Y, align 4
  %5 = load i32* %X, align 4
  %sub = sub nsw i32 %4, %5
  store i32 %sub, i32* %Z, align 4
  %6 = load i32* %n.addr, align 4
  %cmp = icmp sge i32 %6, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i32* %n.addr, align 4
  %sub2 = sub nsw i32 %7, 1
  %call = call i32 @div2(i32 %sub2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @div2(i32 3)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
