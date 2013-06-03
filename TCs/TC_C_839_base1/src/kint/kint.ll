; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque

@__stdinp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [42 x i8] c"-n argument specified without line count\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"file: %s\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"Could not open file\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !13
  %line = alloca [1024 x i8], align 16
  %1 = load %struct.__sFILE** @__stdinp, align 8, !dbg !14
  br label %2, !dbg !16

; <label>:2                                       ; preds = %36, %0
  %count.0 = phi i64 [ 10, %0 ], [ %count.1, %36 ]
  %i.0 = phi i32 [ 1, %0 ], [ %37, %36 ]
  %file.0 = phi %struct.__sFILE* [ %1, %0 ], [ %file.1, %36 ]
  %3 = icmp slt i32 %i.0, %argc1, !dbg !16
  br i1 %3, label %4, label %38, !dbg !16

; <label>:4                                       ; preds = %2
  %5 = sext i32 %i.0 to i64, !dbg !18
  %6 = getelementptr inbounds i8** %argv, i64 %5, !dbg !18
  %7 = load i8** %6, align 8, !dbg !18
  %8 = getelementptr inbounds i8* %7, i64 0, !dbg !18
  %9 = load i8* %8, align 1, !dbg !18
  %10 = sext i8 %9 to i32, !dbg !18
  %11 = icmp eq i32 %10, 45, !dbg !18
  %12 = sext i32 %i.0 to i64, !dbg !20
  %13 = getelementptr inbounds i8** %argv, i64 %12, !dbg !20
  %14 = load i8** %13, align 8, !dbg !20
  br i1 %11, label %15, label %31, !dbg !18

; <label>:15                                      ; preds = %4
  %16 = getelementptr inbounds i8* %14, i64 1, !dbg !20
  %17 = load i8* %16, align 1, !dbg !20
  %18 = sext i8 %17 to i32, !dbg !20
  %19 = icmp eq i32 %18, 110, !dbg !20
  br i1 %19, label %20, label %36, !dbg !20

; <label>:20                                      ; preds = %15
  %21 = add nsw i32 %i.0, 1, !dbg !22
  %22 = icmp slt i32 %21, %argc1, !dbg !22
  br i1 %22, label %23, label %29, !dbg !22

; <label>:23                                      ; preds = %20
  %24 = add nsw i32 %i.0, 1, !dbg !24
  %25 = sext i32 %24 to i64, !dbg !24
  %26 = getelementptr inbounds i8** %argv, i64 %25, !dbg !24
  %27 = load i8** %26, align 8, !dbg !24
  %28 = call i64 @atoll(i8* %27), !dbg !24
  br label %36, !dbg !26

; <label>:29                                      ; preds = %20
  %30 = call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @.str, i32 0, i32 0)), !dbg !27
  br label %48, !dbg !29

; <label>:31                                      ; preds = %4
  %32 = call %struct.__sFILE* @"\01_fopen"(i8* %14, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !30
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), %struct.__sFILE* %32), !dbg !32
  %34 = icmp ne %struct.__sFILE* %32, null, !dbg !33
  br i1 %34, label %36, label %35, !dbg !33

; <label>:35                                      ; preds = %31
  call void @perror(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0)), !dbg !34
  br label %48, !dbg !36

; <label>:36                                      ; preds = %31, %23, %15
  %count.1 = phi i64 [ %28, %23 ], [ %count.0, %15 ], [ %count.0, %31 ]
  %i.1 = phi i32 [ %24, %23 ], [ %i.0, %15 ], [ %i.0, %31 ]
  %file.1 = phi %struct.__sFILE* [ %file.0, %23 ], [ %file.0, %15 ], [ %32, %31 ]
  %37 = add nsw i32 %i.1, 1, !dbg !37
  br label %2, !dbg !37

; <label>:38                                      ; preds = %41, %2
  %count.2 = phi i64 [ %count.0, %2 ], [ %39, %41 ]
  %39 = add nsw i64 %count.2, -1, !dbg !38
  %40 = icmp ne i64 %count.2, 0, !dbg !38
  br i1 %40, label %41, label %46, !dbg !38

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds [1024 x i8]* %line, i32 0, i32 0, !dbg !39
  %43 = call i8* @fgets(i8* %42, i32 1024, %struct.__sFILE* %file.0), !dbg !39
  %44 = getelementptr inbounds [1024 x i8]* %line, i32 0, i32 0, !dbg !41
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i8* %44), !dbg !41
  br label %38, !dbg !42

; <label>:46                                      ; preds = %38
  %47 = call i32 @fclose(%struct.__sFILE* %file.0), !dbg !43
  br label %48, !dbg !44

; <label>:48                                      ; preds = %46, %35, %29
  %.0 = phi i32 [ -1, %29 ], [ -1, %35 ], [ 0, %46 ]
  ret i32 %.0, !dbg !45
}

declare i64 @atoll(i8*)

declare i32 @puts(i8*)

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare i32 @printf(i8*, ...)

declare void @perror(i8*)

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i32 @fclose(%struct.__sFILE*)

declare i32 @kint_arg.i32()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"head.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 67, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 68} ; [ DW_TAG_subprogram ] [line 67] [def] [scope 68] [main]
!6 = metadata !{i32 786473, metadata !"head.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{metadata !"arg.main.0"}
!14 = metadata !{i32 72, i32 20, metadata !15, null}
!15 = metadata !{i32 786443, metadata !5, i32 68, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!16 = metadata !{i32 74, i32 7, metadata !17, null}
!17 = metadata !{i32 786443, metadata !15, i32 74, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!18 = metadata !{i32 75, i32 3, metadata !19, null}
!19 = metadata !{i32 786443, metadata !17, i32 74, i32 29, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!20 = metadata !{i32 76, i32 4, metadata !21, null}
!21 = metadata !{i32 786443, metadata !19, i32 75, i32 26, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!22 = metadata !{i32 77, i32 5, metadata !23, null}
!23 = metadata !{i32 786443, metadata !21, i32 76, i32 27, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!24 = metadata !{i32 78, i32 14, metadata !25, null}
!25 = metadata !{i32 786443, metadata !23, i32 77, i32 23, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!26 = metadata !{i32 84, i32 4, metadata !23, null}
!27 = metadata !{i32 81, i32 6, metadata !28, null}
!28 = metadata !{i32 786443, metadata !23, i32 80, i32 10, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!29 = metadata !{i32 82, i32 6, metadata !28, null}
!30 = metadata !{i32 87, i32 11, metadata !31, null}
!31 = metadata !{i32 786443, metadata !19, i32 86, i32 8, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!32 = metadata !{i32 88, i32 4, metadata !31, null}
!33 = metadata !{i32 89, i32 4, metadata !31, null}
!34 = metadata !{i32 90, i32 5, metadata !35, null}
!35 = metadata !{i32 786443, metadata !31, i32 89, i32 16, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!36 = metadata !{i32 91, i32 5, metadata !35, null}
!37 = metadata !{i32 74, i32 24, metadata !17, null}
!38 = metadata !{i32 98, i32 2, metadata !15, null}
!39 = metadata !{i32 103, i32 7, metadata !40, null}
!40 = metadata !{i32 786443, metadata !15, i32 98, i32 18, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_base1/src/kint/head.c]
!41 = metadata !{i32 109, i32 4, metadata !40, null}
!42 = metadata !{i32 110, i32 2, metadata !40, null}
!43 = metadata !{i32 112, i32 2, metadata !15, null}
!44 = metadata !{i32 114, i32 2, metadata !15, null}
!45 = metadata !{i32 115, i32 1, metadata !15, null}
