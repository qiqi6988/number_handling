; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

define signext i16 @istrlen(i8* %s) nounwind uwtable ssp {
  br label %1, !dbg !18

; <label>:1                                       ; preds = %11, %0
  %sc.0 = phi i8* [ %s, %0 ], [ %12, %11 ]
  %2 = load i8* %sc.0, align 1, !dbg !18
  %3 = sext i8 %2 to i32, !dbg !18
  %4 = icmp ne i32 %3, 0, !dbg !18
  br i1 %4, label %5, label %13, !dbg !18

; <label>:5                                       ; preds = %1
  %6 = load i8* %sc.0, align 1, !dbg !21
  %7 = sext i8 %6 to i32, !dbg !21
  %8 = call i32 @isascii(i32 %7), !dbg !21, !intrange !23
  %9 = icmp ne i32 %8, 0, !dbg !21
  br i1 %9, label %11, label %10, !dbg !21

; <label>:10                                      ; preds = %5
  br label %18, !dbg !24

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds i8* %sc.0, i32 1, !dbg !26
  br label %1, !dbg !26

; <label>:13                                      ; preds = %1
  %14 = ptrtoint i8* %sc.0 to i64, !dbg !27
  %15 = ptrtoint i8* %s to i64, !dbg !27
  %16 = sub i64 %14, %15, !dbg !27
  %17 = trunc i64 %16 to i16, !dbg !27
  br label %18, !dbg !27

; <label>:18                                      ; preds = %13, %10
  %.0 = phi i16 [ -4, %10 ], [ %17, %13 ]
  ret i16 %.0, !dbg !28
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !29
  %1 = and i32 %_c1, -128, !dbg !30
  %2 = icmp eq i32 %1, 0, !dbg !30
  %3 = zext i1 %2 to i32, !dbg !30
  ret i32 %3, !dbg !30
}

declare i32 @kint_arg.i32()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"istrlen.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint/istrlen.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"istrlen", metadata !"istrlen", metadata !"", metadata !6, i32 26, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i8*)* @istrlen, null, null, metadata !1, i32 27} ; [ DW_TAG_subprogram ] [line 26] [def] [scope 27] [istrlen]
!6 = metadata !{i32 786473, metadata !"istrlen.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isascii", metadata !"isascii", metadata !"", metadata !14, i32 152, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!14 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint", null} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !17, metadata !17}
!17 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!18 = metadata !{i32 30, i32 8, metadata !19, null}
!19 = metadata !{i32 786443, metadata !20, i32 30, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint/istrlen.c]
!20 = metadata !{i32 786443, metadata !5, i32 27, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint/istrlen.c]
!21 = metadata !{i32 31, i32 10, metadata !22, null}
!22 = metadata !{i32 786443, metadata !19, i32 30, i32 36, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint/istrlen.c]
!23 = metadata !{i32 0, i32 2}
!24 = metadata !{i32 32, i32 4, metadata !25, null}
!25 = metadata !{i32 786443, metadata !22, i32 31, i32 25, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint/istrlen.c]
!26 = metadata !{i32 30, i32 29, metadata !19, null}
!27 = metadata !{i32 36, i32 2, metadata !20, null}
!28 = metadata !{i32 38, i32 1, metadata !20, null}
!29 = metadata !{metadata !"arg._kint.isascii.0"}
!30 = metadata !{i32 154, i32 2, metadata !31, null}
!31 = metadata !{i32 786443, metadata !13, i32 153, i32 1, metadata !14, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_vx73/src/kint//usr/include/ctype.h]
