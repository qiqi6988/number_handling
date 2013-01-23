; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@__stdinp = external global %struct.__sFILE*
@.str1 = private unnamed_addr constant [42 x i8] c"-n argument specified without line count\0A\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"Could not open file\00", align 1
@.str4 = private unnamed_addr constant [39 x i8] c"argument is too large; maximum is 2000\00", align 1

define void @head(i64 %count, %struct.__sFILE* %file) nounwind uwtable ssp {
  %count1 = call i64 @kint_arg.i64(), !id !76
  %line = alloca [1024 x i8], align 16
  br label %1, !dbg !77

; <label>:1                                       ; preds = %12, %0
  %i.0 = phi i32 [ 0, %0 ], [ %13, %12 ]
  %.0 = phi i64 [ %count1, %0 ], [ %2, %12 ]
  %2 = add nsw i64 %.0, -1, !dbg !77
  %3 = icmp ne i64 %.0, 0, !dbg !77
  br i1 %3, label %4, label %14, !dbg !77

; <label>:4                                       ; preds = %1
  %5 = getelementptr inbounds [1024 x i8]* %line, i32 0, i32 0, !dbg !79
  %6 = call i8* @fgets(i8* %5, i32 1024, %struct.__sFILE* %file), !dbg !79
  %7 = getelementptr inbounds [1024 x i8]* %line, i32 0, i32 0, !dbg !81
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8* %7), !dbg !81
  %9 = icmp eq i32 %i.0, 100, !dbg !82
  br i1 %9, label %10, label %12, !dbg !82

; <label>:10                                      ; preds = %4
  %11 = call i32 (...)* @sleep(i32 1), !dbg !83
  br label %12, !dbg !85

; <label>:12                                      ; preds = %10, %4
  %i.1 = phi i32 [ 0, %10 ], [ %i.0, %4 ]
  %13 = add nsw i32 %i.1, 1, !dbg !86
  br label %1, !dbg !87

; <label>:14                                      ; preds = %1
  ret void, !dbg !88
}

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i32 @printf(i8*, ...)

declare i32 @sleep(...)

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !89
  %count = alloca [5 x i64], align 16
  %1 = load %struct.__sFILE** @__stdinp, align 8, !dbg !90
  %2 = getelementptr inbounds [5 x i64]* %count, i32 0, i64 0, !dbg !92
  store i64 10, i64* %2, align 8, !dbg !92
  br label %3, !dbg !93

; <label>:3                                       ; preds = %37, %0
  %i.0 = phi i32 [ 1, %0 ], [ %38, %37 ]
  %file.0 = phi %struct.__sFILE* [ %1, %0 ], [ %file.1, %37 ]
  %4 = icmp slt i32 %i.0, %argc1, !dbg !93
  br i1 %4, label %5, label %39, !dbg !93

; <label>:5                                       ; preds = %3
  %6 = sext i32 %i.0 to i64, !dbg !95
  %7 = getelementptr inbounds i8** %argv, i64 %6, !dbg !95
  %8 = load i8** %7, align 8, !dbg !95
  %9 = getelementptr inbounds i8* %8, i64 0, !dbg !95
  %10 = load i8* %9, align 1, !dbg !95
  %11 = sext i8 %10 to i32, !dbg !95
  %12 = icmp eq i32 %11, 45, !dbg !95
  %13 = sext i32 %i.0 to i64, !dbg !97
  %14 = getelementptr inbounds i8** %argv, i64 %13, !dbg !97
  %15 = load i8** %14, align 8, !dbg !97
  br i1 %12, label %16, label %33, !dbg !95

; <label>:16                                      ; preds = %5
  %17 = getelementptr inbounds i8* %15, i64 1, !dbg !97
  %18 = load i8* %17, align 1, !dbg !97
  %19 = sext i8 %18 to i32, !dbg !97
  %20 = icmp eq i32 %19, 110, !dbg !97
  br i1 %20, label %21, label %37, !dbg !97

; <label>:21                                      ; preds = %16
  %22 = add nsw i32 %i.0, 1, !dbg !99
  %23 = icmp slt i32 %22, %argc1, !dbg !99
  br i1 %23, label %24, label %31, !dbg !99

; <label>:24                                      ; preds = %21
  %25 = add nsw i32 %i.0, 1, !dbg !101
  %26 = sext i32 %25 to i64, !dbg !101
  %27 = getelementptr inbounds i8** %argv, i64 %26, !dbg !101
  %28 = load i8** %27, align 8, !dbg !101
  %29 = call i64 @atoll(i8* %28), !dbg !101
  %30 = getelementptr inbounds [5 x i64]* %count, i32 0, i64 0, !dbg !101
  store i64 %29, i64* %30, align 8, !dbg !101
  br label %37, !dbg !103

; <label>:31                                      ; preds = %21
  %32 = call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @.str1, i32 0, i32 0)), !dbg !104
  br label %49, !dbg !106

; <label>:33                                      ; preds = %5
  %34 = call %struct.__sFILE* @"\01_fopen"(i8* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !107
  %35 = icmp ne %struct.__sFILE* %34, null, !dbg !109
  br i1 %35, label %37, label %36, !dbg !109

; <label>:36                                      ; preds = %33
  call void @perror(i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0)), !dbg !110
  br label %49, !dbg !112

; <label>:37                                      ; preds = %33, %24, %16
  %i.1 = phi i32 [ %25, %24 ], [ %i.0, %16 ], [ %i.0, %33 ]
  %file.1 = phi %struct.__sFILE* [ %file.0, %24 ], [ %file.0, %16 ], [ %34, %33 ]
  %38 = add nsw i32 %i.1, 1, !dbg !113
  br label %3, !dbg !113

; <label>:39                                      ; preds = %3
  %40 = getelementptr inbounds [5 x i64]* %count, i32 0, i64 0, !dbg !114
  %41 = load i64* %40, align 8, !dbg !114
  %42 = icmp sgt i64 %41, 2000, !dbg !114
  br i1 %42, label %43, label %44, !dbg !114

; <label>:43                                      ; preds = %39
  call void @perror(i8* getelementptr inbounds ([39 x i8]* @.str4, i32 0, i32 0)), !dbg !115
  br label %49, !dbg !117

; <label>:44                                      ; preds = %39
  %45 = sext i32 0 to i64, !dbg !118
  %46 = getelementptr inbounds [5 x i64]* %count, i32 0, i64 %45, !dbg !118
  %47 = load i64* %46, align 8, !dbg !118
  call void @head(i64 %47, %struct.__sFILE* %file.0), !dbg !118
  %48 = call i32 @fclose(%struct.__sFILE* %file.0), !dbg !119
  br label %49, !dbg !120

; <label>:49                                      ; preds = %44, %43, %36, %31
  %.0 = phi i32 [ -1, %31 ], [ -1, %36 ], [ -1, %43 ], [ 0, %44 ]
  ret i32 %.0, !dbg !121
}

declare i64 @atoll(i8*)

declare i32 @puts(i8*)

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare void @perror(i8*)

declare i32 @fclose(%struct.__sFILE*)

declare i64 @kint_arg.i64()

declare i32 @kint_arg.i32()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"head.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !72}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"head", metadata !"head", metadata !"", metadata !6, i32 90, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i64, %struct.__sFILE*)* @head, null, null, metadata !1, i32 91} ; [ DW_TAG_subprogram ] [line 90] [def] [scope 91] [head]
!6 = metadata !{i32 786473, metadata !"head.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!11 = metadata !{i32 786454, null, metadata !"FILE", metadata !6, i32 161, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [FILE] [line 161, size 0, align 0, offset 0] [from __sFILE]
!12 = metadata !{i32 786451, null, metadata !"__sFILE", metadata !13, i32 130, i64 1216, i64 64, i32 0, i32 0, null, metadata !14, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__sFILE] [line 130, size 1216, align 64, offset 0] [from ]
!13 = metadata !{i32 786473, metadata !"/usr/include/stdio.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint", null} ; [ DW_TAG_file_type ]
!14 = metadata !{metadata !15, metadata !18, metadata !20, metadata !21, metadata !23, metadata !24, metadata !29, metadata !30, metadata !32, metadata !36, metadata !42, metadata !50, metadata !56, metadata !57, metadata !60, metadata !61, metadata !65, metadata !69, metadata !70, metadata !71}
!15 = metadata !{i32 786445, metadata !12, metadata !"_p", metadata !13, i32 131, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_member ] [_p] [line 131, size 64, align 64, offset 0] [from ]
!16 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned char]
!17 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!18 = metadata !{i32 786445, metadata !12, metadata !"_r", metadata !13, i32 132, i64 32, i64 32, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ] [_r] [line 132, size 32, align 32, offset 64] [from int]
!19 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = metadata !{i32 786445, metadata !12, metadata !"_w", metadata !13, i32 133, i64 32, i64 32, i64 96, i32 0, metadata !19} ; [ DW_TAG_member ] [_w] [line 133, size 32, align 32, offset 96] [from int]
!21 = metadata !{i32 786445, metadata !12, metadata !"_flags", metadata !13, i32 134, i64 16, i64 16, i64 128, i32 0, metadata !22} ; [ DW_TAG_member ] [_flags] [line 134, size 16, align 16, offset 128] [from short]
!22 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!23 = metadata !{i32 786445, metadata !12, metadata !"_file", metadata !13, i32 135, i64 16, i64 16, i64 144, i32 0, metadata !22} ; [ DW_TAG_member ] [_file] [line 135, size 16, align 16, offset 144] [from short]
!24 = metadata !{i32 786445, metadata !12, metadata !"_bf", metadata !13, i32 136, i64 128, i64 64, i64 192, i32 0, metadata !25} ; [ DW_TAG_member ] [_bf] [line 136, size 128, align 64, offset 192] [from __sbuf]
!25 = metadata !{i32 786451, null, metadata !"__sbuf", metadata !13, i32 96, i64 128, i64 64, i32 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__sbuf] [line 96, size 128, align 64, offset 0] [from ]
!26 = metadata !{metadata !27, metadata !28}
!27 = metadata !{i32 786445, metadata !25, metadata !"_base", metadata !13, i32 97, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_member ] [_base] [line 97, size 64, align 64, offset 0] [from ]
!28 = metadata !{i32 786445, metadata !25, metadata !"_size", metadata !13, i32 98, i64 32, i64 32, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ] [_size] [line 98, size 32, align 32, offset 64] [from int]
!29 = metadata !{i32 786445, metadata !12, metadata !"_lbfsize", metadata !13, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !19} ; [ DW_TAG_member ] [_lbfsize] [line 137, size 32, align 32, offset 320] [from int]
!30 = metadata !{i32 786445, metadata !12, metadata !"_cookie", metadata !13, i32 140, i64 64, i64 64, i64 384, i32 0, metadata !31} ; [ DW_TAG_member ] [_cookie] [line 140, size 64, align 64, offset 384] [from ]
!31 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!32 = metadata !{i32 786445, metadata !12, metadata !"_close", metadata !13, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !33} ; [ DW_TAG_member ] [_close] [line 141, size 64, align 64, offset 448] [from ]
!33 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!34 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{metadata !19, metadata !31}
!36 = metadata !{i32 786445, metadata !12, metadata !"_read", metadata !13, i32 142, i64 64, i64 64, i64 512, i32 0, metadata !37} ; [ DW_TAG_member ] [_read] [line 142, size 64, align 64, offset 512] [from ]
!37 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!38 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !19, metadata !31, metadata !40, metadata !19}
!40 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!41 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!42 = metadata !{i32 786445, metadata !12, metadata !"_seek", metadata !13, i32 143, i64 64, i64 64, i64 576, i32 0, metadata !43} ; [ DW_TAG_member ] [_seek] [line 143, size 64, align 64, offset 576] [from ]
!43 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !44} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!44 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = metadata !{metadata !46, metadata !31, metadata !46, metadata !19}
!46 = metadata !{i32 786454, null, metadata !"fpos_t", metadata !13, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_typedef ] [fpos_t] [line 85, size 0, align 0, offset 0] [from __darwin_off_t]
!47 = metadata !{i32 786454, null, metadata !"__darwin_off_t", metadata !13, i32 110, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ] [__darwin_off_t] [line 110, size 0, align 0, offset 0] [from __int64_t]
!48 = metadata !{i32 786454, null, metadata !"__int64_t", metadata !13, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_typedef ] [__int64_t] [line 46, size 0, align 0, offset 0] [from long long int]
!49 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!50 = metadata !{i32 786445, metadata !12, metadata !"_write", metadata !13, i32 144, i64 64, i64 64, i64 640, i32 0, metadata !51} ; [ DW_TAG_member ] [_write] [line 144, size 64, align 64, offset 640] [from ]
!51 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!52 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{metadata !19, metadata !31, metadata !54, metadata !19}
!54 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !55} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!55 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!56 = metadata !{i32 786445, metadata !12, metadata !"_ub", metadata !13, i32 147, i64 128, i64 64, i64 704, i32 0, metadata !25} ; [ DW_TAG_member ] [_ub] [line 147, size 128, align 64, offset 704] [from __sbuf]
!57 = metadata !{i32 786445, metadata !12, metadata !"_extra", metadata !13, i32 148, i64 64, i64 64, i64 832, i32 0, metadata !58} ; [ DW_TAG_member ] [_extra] [line 148, size 64, align 64, offset 832] [from ]
!58 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __sFILEX]
!59 = metadata !{i32 786451, null, metadata !"__sFILEX", metadata !13, i32 102, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [__sFILEX] [line 102, size 0, align 0, offset 0] [fwd] [from ]
!60 = metadata !{i32 786445, metadata !12, metadata !"_ur", metadata !13, i32 149, i64 32, i64 32, i64 896, i32 0, metadata !19} ; [ DW_TAG_member ] [_ur] [line 149, size 32, align 32, offset 896] [from int]
!61 = metadata !{i32 786445, metadata !12, metadata !"_ubuf", metadata !13, i32 152, i64 24, i64 8, i64 928, i32 0, metadata !62} ; [ DW_TAG_member ] [_ubuf] [line 152, size 24, align 8, offset 928] [from ]
!62 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 24, i64 8, i32 0, i32 0, metadata !17, metadata !63, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 24, align 8, offset 0] [from unsigned char]
!63 = metadata !{metadata !64}
!64 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!65 = metadata !{i32 786445, metadata !12, metadata !"_nbuf", metadata !13, i32 153, i64 8, i64 8, i64 952, i32 0, metadata !66} ; [ DW_TAG_member ] [_nbuf] [line 153, size 8, align 8, offset 952] [from ]
!66 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !17, metadata !67, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from unsigned char]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786465, i64 0, i64 0}        ; [ DW_TAG_subrange_type ] [0, -1]
!69 = metadata !{i32 786445, metadata !12, metadata !"_lb", metadata !13, i32 156, i64 128, i64 64, i64 960, i32 0, metadata !25} ; [ DW_TAG_member ] [_lb] [line 156, size 128, align 64, offset 960] [from __sbuf]
!70 = metadata !{i32 786445, metadata !12, metadata !"_blksize", metadata !13, i32 159, i64 32, i64 32, i64 1088, i32 0, metadata !19} ; [ DW_TAG_member ] [_blksize] [line 159, size 32, align 32, offset 1088] [from int]
!71 = metadata !{i32 786445, metadata !12, metadata !"_offset", metadata !13, i32 160, i64 64, i64 64, i64 1152, i32 0, metadata !46} ; [ DW_TAG_member ] [_offset] [line 160, size 64, align 64, offset 1152] [from fpos_t]
!72 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 107, metadata !73, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 108} ; [ DW_TAG_subprogram ] [line 107] [def] [scope 108] [main]
!73 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{metadata !19, metadata !19, metadata !75}
!75 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!76 = metadata !{metadata !"arg.head.0"}
!77 = metadata !{i32 95, i32 2, metadata !78, null}
!78 = metadata !{i32 786443, metadata !5, i32 91, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!79 = metadata !{i32 96, i32 3, metadata !80, null}
!80 = metadata !{i32 786443, metadata !78, i32 95, i32 18, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!81 = metadata !{i32 97, i32 3, metadata !80, null}
!82 = metadata !{i32 98, i32 3, metadata !80, null}
!83 = metadata !{i32 101, i32 4, metadata !84, null}
!84 = metadata !{i32 786443, metadata !80, i32 99, i32 3, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!85 = metadata !{i32 102, i32 3, metadata !84, null}
!86 = metadata !{i32 103, i32 3, metadata !80, null}
!87 = metadata !{i32 104, i32 2, metadata !80, null}
!88 = metadata !{i32 105, i32 1, metadata !78, null}
!89 = metadata !{metadata !"arg.main.0"}
!90 = metadata !{i32 113, i32 20, metadata !91, null}
!91 = metadata !{i32 786443, metadata !72, i32 108, i32 1, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!92 = metadata !{i32 115, i32 2, metadata !91, null}
!93 = metadata !{i32 117, i32 7, metadata !94, null}
!94 = metadata !{i32 786443, metadata !91, i32 117, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!95 = metadata !{i32 118, i32 3, metadata !96, null}
!96 = metadata !{i32 786443, metadata !94, i32 117, i32 29, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!97 = metadata !{i32 119, i32 4, metadata !98, null}
!98 = metadata !{i32 786443, metadata !96, i32 118, i32 26, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!99 = metadata !{i32 120, i32 5, metadata !100, null}
!100 = metadata !{i32 786443, metadata !98, i32 119, i32 27, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!101 = metadata !{i32 121, i32 17, metadata !102, null}
!102 = metadata !{i32 786443, metadata !100, i32 120, i32 23, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!103 = metadata !{i32 127, i32 4, metadata !100, null}
!104 = metadata !{i32 124, i32 6, metadata !105, null}
!105 = metadata !{i32 786443, metadata !100, i32 123, i32 10, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!106 = metadata !{i32 125, i32 6, metadata !105, null}
!107 = metadata !{i32 130, i32 11, metadata !108, null}
!108 = metadata !{i32 786443, metadata !96, i32 129, i32 8, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!109 = metadata !{i32 131, i32 4, metadata !108, null}
!110 = metadata !{i32 132, i32 5, metadata !111, null}
!111 = metadata !{i32 786443, metadata !108, i32 131, i32 16, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!112 = metadata !{i32 133, i32 5, metadata !111, null}
!113 = metadata !{i32 117, i32 24, metadata !94, null}
!114 = metadata !{i32 138, i32 2, metadata !91, null}
!115 = metadata !{i32 139, i32 4, metadata !116, null}
!116 = metadata !{i32 786443, metadata !91, i32 138, i32 23, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx28/src/kint/head.c]
!117 = metadata !{i32 140, i32 4, metadata !116, null}
!118 = metadata !{i32 142, i32 2, metadata !91, null}
!119 = metadata !{i32 144, i32 2, metadata !91, null}
!120 = metadata !{i32 146, i32 2, metadata !91, null}
!121 = metadata !{i32 147, i32 1, metadata !91, null}
