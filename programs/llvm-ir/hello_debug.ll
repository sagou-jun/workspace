; ModuleID = 'hello.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-cygnus"

@.str = private unnamed_addr constant [9 x i8] c"Hello!!\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata i32* %i, metadata !12, metadata !13), !dbg !14
  store i32 0, i32* %i, align 4, !dbg !15
  br label %for.cond, !dbg !15

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4, !dbg !17
  %cmp = icmp slt i32 %0, 100, !dbg !17
  br i1 %cmp, label %for.body, label %for.end, !dbg !21

for.body:                                         ; preds = %for.cond
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0)), !dbg !22
  br label %for.inc, !dbg !22

for.inc:                                          ; preds = %for.body
  %1 = load i32* %i, align 4, !dbg !23
  %inc = add nsw i32 %1, 1, !dbg !23
  store i32 %inc, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !24

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/usr/local/programs/llvm-ir/hello.c] [DW_LANG_C99]
!1 = !{!"hello.c", !"/usr/local/programs/llvm-ir"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00main\00main\00\003\000\001\000\000\000\000\003", !1, !5, !6, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 3] [def] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/usr/local/programs/llvm-ir/hello.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 2}
!11 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!12 = !{!"0x100\00i\004\000", !4, !5, !8}         ; [ DW_TAG_auto_variable ] [i] [line 4]
!13 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!14 = !MDLocation(line: 4, column: 7, scope: !4)
!15 = !MDLocation(line: 5, column: 7, scope: !16)
!16 = !{!"0xb\005\003\000", !1, !4}               ; [ DW_TAG_lexical_block ] [/usr/local/programs/llvm-ir/hello.c]
!17 = !MDLocation(line: 5, column: 13, scope: !18)
!18 = !{!"0xb\002", !1, !19}                      ; [ DW_TAG_lexical_block ] [/usr/local/programs/llvm-ir/hello.c]
!19 = !{!"0xb\001", !1, !20}                      ; [ DW_TAG_lexical_block ] [/usr/local/programs/llvm-ir/hello.c]
!20 = !{!"0xb\005\003\001", !1, !16}              ; [ DW_TAG_lexical_block ] [/usr/local/programs/llvm-ir/hello.c]
!21 = !MDLocation(line: 5, column: 3, scope: !16)
!22 = !MDLocation(line: 6, column: 5, scope: !20)
!23 = !MDLocation(line: 5, column: 21, scope: !20)
!24 = !MDLocation(line: 5, column: 3, scope: !20)
!25 = !MDLocation(line: 7, column: 3, scope: !4)
