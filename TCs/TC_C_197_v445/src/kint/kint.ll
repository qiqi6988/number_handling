; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

@.str = private unnamed_addr constant [28 x i8] c"use one numerical argument\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str2 = private unnamed_addr constant [40 x i8] c"ERROR: Calloc memory allocation failed\0A\00", align 1

define i32 @v445foo(i32 %x, i32 %s.coerce) nounwind uwtable ssp {
  %s.coerce2 = call i32 @kint_arg.i32(), !id !28
  %x1 = call i32 @kint_arg.i32(), !id !29
  %1 = call i32 @v445bar(i32 %s.coerce2, i32 %x1), !dbg !30
  ret i32 %1, !dbg !30
}

define i32 @v445bar(i32 %x, i32 %s.coerce) nounwind uwtable ssp {
  %s.coerce2 = call i32 @kint_arg.i32(), !id !32
  %x1 = call i32 @kint_arg.i32(), !id !33
  %1 = icmp sgt i32 %x1, 0, !dbg !34
  br i1 %1, label %2, label %5, !dbg !34

; <label>:2                                       ; preds = %0
  %3 = sub nsw i32 %x1, 1, !dbg !36
  %4 = call i32 @v445foo(i32 %x1, i32 %3), !dbg !38
  br label %5, !dbg !39

; <label>:5                                       ; preds = %2, %0
  %y.0 = phi i32 [ %4, %2 ], [ %s.coerce2, %0 ]
  ret i32 %y.0, !dbg !40
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !41
  %1 = icmp ne i32 %argc1, 2, !dbg !42
  br i1 %1, label %2, label %4, !dbg !42

; <label>:2                                       ; preds = %0
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0)), !dbg !44
  call void @exit(i32 1) noreturn, !dbg !46
  unreachable, !dbg !46

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8** %argv, i64 1, !dbg !47
  %6 = load i8** %5, align 8, !dbg !47
  %7 = call i32 @atoi(i8* %6), !dbg !47
  %8 = call i32 @v445foo(i32 %7, i32 %7), !dbg !48
  br label %9, !dbg !49

; <label>:9                                       ; preds = %12, %4
  %j.0 = phi i32 [ 0, %4 ], [ %15, %12 ]
  %llik.0 = phi i64 [ 0, %4 ], [ %14, %12 ]
  %10 = mul nsw i32 %8, %8, !dbg !49
  %11 = icmp slt i32 %j.0, %10, !dbg !49
  br i1 %11, label %12, label %16, !dbg !49

; <label>:12                                      ; preds = %9
  %13 = add nsw i64 %llik.0, 1, !dbg !51
  %14 = mul nsw i64 2, %13, !dbg !51
  %15 = add nsw i32 %j.0, 1, !dbg !53
  br label %9, !dbg !53

; <label>:16                                      ; preds = %9
  %17 = trunc i64 %llik.0 to i32, !dbg !54
  %18 = sext i32 %17 to i64, !dbg !55
  %19 = icmp ne i64 %18, %llik.0, !dbg !55
  br i1 %19, label %20, label %31, !dbg !55

; <label>:20                                      ; preds = %16
  %21 = mul nsw i32 %17, %17, !dbg !56
  br label %22, !dbg !58

; <label>:22                                      ; preds = %24, %20
  %ik.0 = phi i32 [ %21, %20 ], [ %25, %24 ]
  %23 = icmp sgt i32 %ik.0, 0, !dbg !58
  br i1 %23, label %24, label %31, !dbg !58

; <label>:24                                      ; preds = %22
  %25 = add nsw i32 %ik.0, -1, !dbg !59
  %26 = call i32 (...)* @sleep(i32 40), !dbg !61
  %27 = icmp sgt i64 %llik.0, 100, !dbg !62
  br i1 %27, label %28, label %22, !dbg !62

; <label>:28                                      ; preds = %28, %24
  %ik.1 = phi i32 [ %25, %24 ], [ %30, %28 ]
  %29 = add nsw i32 %ik.1, 1, !dbg !63
  %30 = add nsw i32 %29, -1, !dbg !66
  br label %28, !dbg !67

; <label>:31                                      ; preds = %22, %16
  %ik.2 = phi i32 [ %ik.0, %22 ], [ %17, %16 ]
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %ik.2), !dbg !68
  ret i32 0, !dbg !69
}

declare i32 @printf(i8*, ...)

declare void @exit(i32) noreturn

declare i32 @atoi(i8*)

declare i32 @sleep(...)

define i32 @recaman(i32 %sequenceNo) nounwind uwtable ssp {
  %sequenceNo1 = call i32 @kint_arg.i32(), !id !70
  %1 = add nsw i32 %sequenceNo1, 1, !dbg !71
  %2 = sext i32 %1 to i64, !dbg !71
  %3 = call i8* @calloc(i64 %2, i64 4), !dbg !71
  %4 = bitcast i8* %3 to i32*, !dbg !71
  %5 = icmp eq i32* %4, null, !dbg !73
  br i1 %5, label %6, label %8, !dbg !73

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str2, i32 0, i32 0)), !dbg !74
  br label %14, !dbg !76

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds i32* %4, i64 0, !dbg !77
  store i32 0, i32* %9, align 4, !dbg !77
  %10 = sext i32 %sequenceNo1 to i64, !dbg !78
  %11 = getelementptr inbounds i32* %4, i64 %10, !dbg !78
  %12 = load i32* %11, align 4, !dbg !78
  %13 = bitcast i32* %4 to i8*, !dbg !79
  call void @free(i8* %13), !dbg !79
  br label %14, !dbg !80

; <label>:14                                      ; preds = %8, %6
  %.0 = phi i32 [ -1, %6 ], [ %12, %8 ]
  ret i32 %.0, !dbg !81
}

declare i8* @calloc(i64, i64)

declare void @free(i8*)

define i32 @inSequence(i32 %value, i32* %seq, i32 %size) nounwind uwtable ssp {
  %size2 = call i32 @kint_arg.i32(), !id !82
  %value1 = call i32 @kint_arg.i32(), !id !83
  br label %1, !dbg !84

; <label>:1                                       ; preds = %9, %0
  %j.0 = phi i32 [ 0, %0 ], [ %10, %9 ]
  %2 = icmp slt i32 %j.0, %size2, !dbg !84
  br i1 %2, label %3, label %11, !dbg !84

; <label>:3                                       ; preds = %1
  %4 = sext i32 %j.0 to i64, !dbg !87
  %5 = getelementptr inbounds i32* %seq, i64 %4, !dbg !87
  %6 = load i32* %5, align 4, !dbg !87
  %7 = icmp eq i32 %6, %value1, !dbg !87
  br i1 %7, label %8, label %9, !dbg !87

; <label>:8                                       ; preds = %3
  br label %12, !dbg !89

; <label>:9                                       ; preds = %3
  %10 = add nsw i32 %j.0, 1, !dbg !91
  br label %1, !dbg !91

; <label>:11                                      ; preds = %1
  br label %12, !dbg !92

; <label>:12                                      ; preds = %11, %8
  %.0 = phi i32 [ 1, %8 ], [ 0, %11 ]
  ret i32 %.0, !dbg !93
}

declare i32 @kint_arg.i32()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"recaman.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !14, metadata !15, metadata !21, metadata !24}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"v445foo", metadata !"v445foo", metadata !"", metadata !6, i32 41, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @v445foo, null, null, metadata !1, i32 42} ; [ DW_TAG_subprogram ] [line 41] [def] [scope 42] [v445foo]
!6 = metadata !{i32 786473, metadata !"recaman.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786454, null, metadata !"v445number", metadata !6, i32 32, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [v445number] [line 32, size 0, align 0, offset 0] [from v445num]
!11 = metadata !{i32 786451, null, metadata !"v445num", metadata !6, i32 29, i64 32, i64 32, i32 0, i32 0, null, metadata !12, i32 0, i32 0} ; [ DW_TAG_structure_type ] [v445num] [line 29, size 32, align 32, offset 0] [from ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786445, metadata !11, metadata !"value", metadata !6, i32 31, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [value] [line 31, size 32, align 32, offset 0] [from int]
!14 = metadata !{i32 786478, i32 0, metadata !6, metadata !"v445bar", metadata !"v445bar", metadata !"", metadata !6, i32 48, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @v445bar, null, null, metadata !1, i32 49} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [v445bar]
!15 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 59, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 60} ; [ DW_TAG_subprogram ] [line 59] [def] [scope 60] [main]
!16 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !9, metadata !9, metadata !18}
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!20 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!21 = metadata !{i32 786478, i32 0, metadata !6, metadata !"recaman", metadata !"recaman", metadata !"", metadata !6, i32 117, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @recaman, null, null, metadata !1, i32 118} ; [ DW_TAG_subprogram ] [line 117] [def] [scope 118] [recaman]
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !9, metadata !9}
!24 = metadata !{i32 786478, i32 0, metadata !6, metadata !"inSequence", metadata !"inSequence", metadata !"", metadata !6, i32 147, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32*, i32)* @inSequence, null, null, metadata !1, i32 148} ; [ DW_TAG_subprogram ] [line 147] [def] [scope 148] [inSequence]
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !9, metadata !9, metadata !27, metadata !9}
!27 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!28 = metadata !{metadata !"arg.v445foo.1"}
!29 = metadata !{metadata !"arg.v445foo.0"}
!30 = metadata !{i32 45, i32 10, metadata !31, null}
!31 = metadata !{i32 786443, metadata !5, i32 42, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!32 = metadata !{metadata !"arg.v445bar.1"}
!33 = metadata !{metadata !"arg.v445bar.0"}
!34 = metadata !{i32 51, i32 3, metadata !35, null}
!35 = metadata !{i32 786443, metadata !14, i32 49, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!36 = metadata !{i32 53, i32 7, metadata !37, null}
!37 = metadata !{i32 786443, metadata !35, i32 52, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!38 = metadata !{i32 54, i32 11, metadata !37, null}
!39 = metadata !{i32 55, i32 5, metadata !37, null}
!40 = metadata !{i32 56, i32 3, metadata !35, null}
!41 = metadata !{metadata !"arg.main.0"}
!42 = metadata !{i32 70, i32 3, metadata !43, null}
!43 = metadata !{i32 786443, metadata !15, i32 60, i32 1, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!44 = metadata !{i32 72, i32 7, metadata !45, null}
!45 = metadata !{i32 786443, metadata !43, i32 71, i32 5, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!46 = metadata !{i32 73, i32 7, metadata !45, null}
!47 = metadata !{i32 76, i32 17, metadata !43, null}
!48 = metadata !{i32 80, i32 15, metadata !43, null}
!49 = metadata !{i32 83, i32 9, metadata !50, null}
!50 = metadata !{i32 786443, metadata !43, i32 83, i32 3, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!51 = metadata !{i32 85, i32 7, metadata !52, null}
!52 = metadata !{i32 786443, metadata !50, i32 84, i32 5, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!53 = metadata !{i32 83, i32 41, metadata !50, null}
!54 = metadata !{i32 88, i32 3, metadata !43, null}
!55 = metadata !{i32 91, i32 3, metadata !43, null}
!56 = metadata !{i32 93, i32 7, metadata !57, null}
!57 = metadata !{i32 786443, metadata !43, i32 92, i32 5, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!58 = metadata !{i32 95, i32 7, metadata !57, null}
!59 = metadata !{i32 97, i32 4, metadata !60, null}
!60 = metadata !{i32 786443, metadata !57, i32 96, i32 2, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!61 = metadata !{i32 98, i32 4, metadata !60, null}
!62 = metadata !{i32 101, i32 4, metadata !60, null}
!63 = metadata !{i32 105, i32 5, metadata !64, null}
!64 = metadata !{i32 786443, metadata !65, i32 104, i32 3, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!65 = metadata !{i32 786443, metadata !60, i32 102, i32 6, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!66 = metadata !{i32 106, i32 5, metadata !64, null}
!67 = metadata !{i32 107, i32 3, metadata !64, null}
!68 = metadata !{i32 112, i32 3, metadata !43, null}
!69 = metadata !{i32 114, i32 3, metadata !43, null}
!70 = metadata !{metadata !"arg.recaman.0"}
!71 = metadata !{i32 123, i32 20, metadata !72, null}
!72 = metadata !{i32 786443, metadata !21, i32 118, i32 1, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!73 = metadata !{i32 126, i32 2, metadata !72, null}
!74 = metadata !{i32 127, i32 3, metadata !75, null}
!75 = metadata !{i32 786443, metadata !72, i32 126, i32 24, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!76 = metadata !{i32 128, i32 3, metadata !75, null}
!77 = metadata !{i32 133, i32 2, metadata !72, null}
!78 = metadata !{i32 137, i32 2, metadata !72, null}
!79 = metadata !{i32 140, i32 2, metadata !72, null}
!80 = metadata !{i32 143, i32 2, metadata !72, null}
!81 = metadata !{i32 144, i32 1, metadata !72, null}
!82 = metadata !{metadata !"arg.inSequence.2"}
!83 = metadata !{metadata !"arg.inSequence.0"}
!84 = metadata !{i32 151, i32 7, metadata !85, null}
!85 = metadata !{i32 786443, metadata !86, i32 151, i32 2, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!86 = metadata !{i32 786443, metadata !24, i32 148, i32 1, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!87 = metadata !{i32 152, i32 3, metadata !88, null}
!88 = metadata !{i32 786443, metadata !85, i32 151, i32 27, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!89 = metadata !{i32 153, i32 4, metadata !90, null}
!90 = metadata !{i32 786443, metadata !88, i32 152, i32 24, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_v445/src/kint/recaman.c]
!91 = metadata !{i32 151, i32 22, metadata !85, null}
!92 = metadata !{i32 157, i32 2, metadata !86, null}
!93 = metadata !{i32 158, i32 1, metadata !86, null}
