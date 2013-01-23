; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct._RuneLocale = type { [8 x i8], [32 x i8], i32 (i8*, i64, i8**)*, i32 (i32, i8*, i64, i8**)*, i32, [256 x i32], [256 x i32], [256 x i32], %struct._RuneRange, %struct._RuneRange, %struct._RuneRange, i8*, i32, i32, %struct._RuneCharClass* }
%struct._RuneRange = type { i32, %struct._RuneEntry* }
%struct._RuneEntry = type { i32, i32, i32, i32* }
%struct._RuneCharClass = type { [14 x i8], i32 }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque

@.str = private unnamed_addr constant [18 x i8] c"allocation error\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str2 = private unnamed_addr constant [27 x i8] c"\0AERROR: Cannot open file.\0A\00", align 1
@.str3 = private unnamed_addr constant [27 x i8] c"\0AERROR: File close error.\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale

define i32 @nsquaredplusone(i32 %n) nounwind uwtable ssp {
  %1 = mul nsw i32 %n, %n, !dbg !25
  %2 = add nsw i32 %1, 1, !dbg !25
  ret i32 %2, !dbg !25
}

define i32 @checkargs(i32 %number_of_args, i8** %arg_array) nounwind uwtable ssp {
  %1 = icmp ne i32 %number_of_args, 3, !dbg !27
  br i1 %1, label %12, label %2, !dbg !27

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %arg_array, i64 2, !dbg !29
  %4 = load i8** %3, align 8, !dbg !29
  %5 = call i32 @atoi(i8* %4), !dbg !29
  %6 = icmp slt i32 %5, 0, !dbg !29
  br i1 %6, label %12, label %7, !dbg !29

; <label>:7                                       ; preds = %2
  %8 = getelementptr inbounds i8** %arg_array, i64 2, !dbg !30
  %9 = load i8** %8, align 8, !dbg !30
  %10 = call i32 @atoi(i8* %9), !dbg !30
  %11 = icmp sgt i32 %10, 2, !dbg !30
  br i1 %11, label %12, label %13, !dbg !30

; <label>:12                                      ; preds = %7, %2, %0
  br label %14, !dbg !31

; <label>:13                                      ; preds = %7
  br label %14, !dbg !33

; <label>:14                                      ; preds = %13, %12
  %.0 = phi i32 [ -1, %12 ], [ 0, %13 ]
  ret i32 %.0, !dbg !34
}

declare i32 @atoi(i8*)

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %line = alloca [256 x i8], align 16
  %1 = call i32 @checkargs(i32 %argc, i8** %argv), !dbg !35
  %2 = trunc i32 %1 to i8, !dbg !35
  %3 = zext i8 %2 to i32, !dbg !35
  %4 = call i32 @nsquaredplusone(i32 %3), !dbg !37
  %5 = sext i32 %4 to i64, !dbg !37
  %6 = call i8* @calloc(i64 %5, i64 4), !dbg !37
  %7 = bitcast i8* %6 to i32*, !dbg !37
  %8 = icmp eq i32* %7, null, !dbg !38
  br i1 %8, label %9, label %11, !dbg !38

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)), !dbg !39
  call void @exit(i32 1) noreturn, !dbg !41
  unreachable, !dbg !41

; <label>:11                                      ; preds = %0
  %12 = call i32 @nsquaredplusone(i32 %3), !dbg !42
  br label %13, !dbg !43

; <label>:13                                      ; preds = %15, %11
  %j.0 = phi i32 [ 0, %11 ], [ %18, %15 ]
  %14 = icmp slt i32 %j.0, %12, !dbg !43
  br i1 %14, label %15, label %19, !dbg !43

; <label>:15                                      ; preds = %13
  %16 = sext i32 %j.0 to i64, !dbg !45
  %17 = getelementptr inbounds i32* %7, i64 %16, !dbg !45
  store i32 %j.0, i32* %17, align 4, !dbg !45
  %18 = add nsw i32 %j.0, 1, !dbg !47
  br label %13, !dbg !47

; <label>:19                                      ; preds = %21, %13
  %j.1 = phi i32 [ %j.0, %13 ], [ %22, %21 ]
  %20 = icmp sgt i32 %j.1, 0, !dbg !48
  br i1 %20, label %21, label %29, !dbg !48

; <label>:21                                      ; preds = %19
  %22 = add nsw i32 %j.1, -1, !dbg !49
  %23 = mul nsw i32 %22, 20, !dbg !51
  %24 = call i32 (...)* @sleep(i32 %23), !dbg !51
  %25 = icmp sgt i32 %22, 100, !dbg !52
  br i1 %25, label %26, label %19, !dbg !52

; <label>:26                                      ; preds = %21, %26
  %j.2 = phi i32 [ %22, %21 ], [ %28, %26 ]
  %27 = add nsw i32 %j.2, 1, !dbg !53
  %28 = add nsw i32 %27, -1, !dbg !56
  br label %26, !dbg !57

; <label>:29                                      ; preds = %19
  %30 = getelementptr inbounds i8** %argv, i64 1, !dbg !58
  %31 = load i8** %30, align 8, !dbg !58
  %32 = call %struct.__sFILE* @"\01_fopen"(i8* %31, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !59
  %33 = icmp eq %struct.__sFILE* %32, null, !dbg !60
  br i1 %33, label %34, label %36, !dbg !60

; <label>:34                                      ; preds = %29
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str2, i32 0, i32 0)), !dbg !61
  br label %118, !dbg !63

; <label>:36                                      ; preds = %29
  %37 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 256, i32 1, i1 false), !dbg !64
  br label %38, !dbg !65

; <label>:38                                      ; preds = %58, %68, %89, %94, %36
  %multi_line_comment.0 = phi i32 [ 0, %36 ], [ %multi_line_comment.1, %68 ], [ %multi_line_comment.1, %89 ], [ %multi_line_comment.1, %94 ], [ %multi_line_comment.1, %58 ]
  %total_lines.0 = phi i32 [ 0, %36 ], [ %43, %68 ], [ %43, %89 ], [ %43, %94 ], [ %43, %58 ]
  %lines_of_code.0 = phi i32 [ 0, %36 ], [ %lines_of_code.1, %68 ], [ %lines_of_code.1, %89 ], [ %lines_of_code.1, %94 ], [ %lines_of_code.1, %58 ]
  %39 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !66
  %40 = call i8* @fgets(i8* %39, i32 256, %struct.__sFILE* %32), !dbg !66
  %41 = icmp ne i8* %40, null, !dbg !66
  br i1 %41, label %42, label %110, !dbg !66

; <label>:42                                      ; preds = %38
  %43 = add nsw i32 %total_lines.0, 1, !dbg !67
  %44 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !69
  %45 = call i64 @strlen(i8* %44), !dbg !69
  %46 = sub i64 %45, 1, !dbg !69
  %47 = getelementptr inbounds [256 x i8]* %line, i32 0, i64 %46, !dbg !69
  %48 = load i8* %47, align 1, !dbg !69
  %49 = sext i8 %48 to i32, !dbg !69
  %50 = icmp eq i32 %49, 10, !dbg !69
  br i1 %50, label %51, label %56, !dbg !69

; <label>:51                                      ; preds = %42
  %52 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !70
  %53 = call i64 @strlen(i8* %52), !dbg !70
  %54 = sub i64 %53, 1, !dbg !70
  %55 = getelementptr inbounds [256 x i8]* %line, i32 0, i64 %54, !dbg !70
  store i8 0, i8* %55, align 1, !dbg !70
  br label %56, !dbg !70

; <label>:56                                      ; preds = %51, %42
  %57 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !71
  br label %58, !dbg !72

; <label>:58                                      ; preds = %108, %102, %83, %78, %56
  %line_already_counted.0 = phi i32 [ 0, %56 ], [ %line_already_counted.0, %78 ], [ %line_already_counted.0, %83 ], [ %line_already_counted.0, %102 ], [ %line_already_counted.1, %108 ]
  %line_pointer.0 = phi i8* [ %57, %56 ], [ %79, %78 ], [ %84, %83 ], [ %103, %102 ], [ %109, %108 ]
  %multi_line_comment.1 = phi i32 [ %multi_line_comment.0, %56 ], [ %multi_line_comment.2, %78 ], [ %multi_line_comment.1, %83 ], [ 1, %102 ], [ %multi_line_comment.1, %108 ]
  %lines_of_code.1 = phi i32 [ %lines_of_code.0, %56 ], [ %lines_of_code.1, %78 ], [ %lines_of_code.1, %83 ], [ %lines_of_code.1, %102 ], [ %lines_of_code.2, %108 ]
  %59 = load i8* %line_pointer.0, align 1, !dbg !72
  %60 = sext i8 %59 to i32, !dbg !72
  %61 = icmp ne i32 %60, 0, !dbg !72
  br i1 %61, label %62, label %38, !dbg !72

; <label>:62                                      ; preds = %58
  %63 = icmp eq i32 %multi_line_comment.1, 1, !dbg !73
  %64 = load i8* %line_pointer.0, align 1, !dbg !75
  %65 = sext i8 %64 to i32, !dbg !75
  br i1 %63, label %66, label %80, !dbg !73

; <label>:66                                      ; preds = %62
  %67 = icmp eq i32 %65, 42, !dbg !75
  br i1 %67, label %68, label %78, !dbg !75

; <label>:68                                      ; preds = %66
  %69 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !77
  %70 = load i8* %69, align 1, !dbg !79
  %71 = sext i8 %70 to i32, !dbg !79
  %72 = icmp eq i32 %71, 0, !dbg !79
  br i1 %72, label %38, label %73, !dbg !79

; <label>:73                                      ; preds = %68
  %74 = load i8* %69, align 1, !dbg !80
  %75 = sext i8 %74 to i32, !dbg !80
  %76 = icmp eq i32 %75, 47, !dbg !80
  br i1 %76, label %77, label %78, !dbg !80

; <label>:77                                      ; preds = %73
  br label %78, !dbg !81

; <label>:78                                      ; preds = %73, %77, %66
  %line_pointer.1 = phi i8* [ %69, %77 ], [ %69, %73 ], [ %line_pointer.0, %66 ]
  %multi_line_comment.2 = phi i32 [ 0, %77 ], [ %multi_line_comment.1, %73 ], [ %multi_line_comment.1, %66 ]
  %79 = getelementptr inbounds i8* %line_pointer.1, i32 1, !dbg !83
  br label %58, !dbg !84

; <label>:80                                      ; preds = %62
  %81 = call i32 @isspace(i32 %65), !dbg !85
  %82 = icmp ne i32 %81, 0, !dbg !85
  br i1 %82, label %83, label %85, !dbg !85

; <label>:83                                      ; preds = %80
  %84 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !86
  br label %58, !dbg !88

; <label>:85                                      ; preds = %80
  %86 = load i8* %line_pointer.0, align 1, !dbg !89
  %87 = sext i8 %86 to i32, !dbg !89
  %88 = icmp eq i32 %87, 47, !dbg !89
  br i1 %88, label %89, label %104, !dbg !89

; <label>:89                                      ; preds = %85
  %90 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !90
  %91 = load i8* %90, align 1, !dbg !92
  %92 = sext i8 %91 to i32, !dbg !92
  %93 = icmp eq i32 %92, 0, !dbg !92
  br i1 %93, label %38, label %94, !dbg !92

; <label>:94                                      ; preds = %89
  %95 = load i8* %90, align 1, !dbg !93
  %96 = sext i8 %95 to i32, !dbg !93
  %97 = icmp eq i32 %96, 47, !dbg !93
  br i1 %97, label %38, label %98, !dbg !93

; <label>:98                                      ; preds = %94
  %99 = load i8* %90, align 1, !dbg !94
  %100 = sext i8 %99 to i32, !dbg !94
  %101 = icmp eq i32 %100, 42, !dbg !94
  br i1 %101, label %102, label %104, !dbg !94

; <label>:102                                     ; preds = %98
  %103 = getelementptr inbounds i8* %90, i32 1, !dbg !95
  br label %58, !dbg !97

; <label>:104                                     ; preds = %98, %85
  %line_pointer.2 = phi i8* [ %90, %98 ], [ %line_pointer.0, %85 ]
  %105 = icmp eq i32 %line_already_counted.0, 0, !dbg !98
  br i1 %105, label %106, label %108, !dbg !98

; <label>:106                                     ; preds = %104
  %107 = add nsw i32 %lines_of_code.1, 1, !dbg !99
  br label %108, !dbg !101

; <label>:108                                     ; preds = %106, %104
  %line_already_counted.1 = phi i32 [ 1, %106 ], [ %line_already_counted.0, %104 ]
  %lines_of_code.2 = phi i32 [ %107, %106 ], [ %lines_of_code.1, %104 ]
  %109 = getelementptr inbounds i8* %line_pointer.2, i32 1, !dbg !102
  br label %58, !dbg !103

; <label>:110                                     ; preds = %38
  %111 = call i32 @fclose(%struct.__sFILE* %32), !dbg !104
  %112 = icmp ne i32 %111, 0, !dbg !104
  br i1 %112, label %113, label %115, !dbg !104

; <label>:113                                     ; preds = %110
  %114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str3, i32 0, i32 0)), !dbg !105
  br label %118, !dbg !107

; <label>:115                                     ; preds = %110
  %116 = bitcast i32* %7 to i8*, !dbg !108
  call void @free(i8* %116), !dbg !108
  %117 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %lines_of_code.0), !dbg !109
  br label %118, !dbg !110

; <label>:118                                     ; preds = %115, %113, %34
  %.0 = phi i32 [ 1, %34 ], [ 1, %113 ], [ 0, %115 ]
  ret i32 %.0, !dbg !111
}

declare i8* @calloc(i64, i64)

declare i32 @printf(i8*, ...)

declare void @exit(i32) noreturn

declare i32 @sleep(...)

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i64 @strlen(i8*)

define internal i32 @isspace(i32 %_c) nounwind uwtable inlinehint ssp {
  %1 = call i32 @__istype(i32 %_c, i64 16384), !dbg !112
  ret i32 %1, !dbg !112
}

declare i32 @fclose(%struct.__sFILE*)

declare void @free(i8*)

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %1 = call i32 @isascii(i32 %_c), !dbg !114
  %2 = icmp ne i32 %1, 0, !dbg !114
  br i1 %2, label %3, label %10, !dbg !114

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c to i64, !dbg !114
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !114
  %6 = load i32* %5, align 4, !dbg !114
  %7 = zext i32 %6 to i64, !dbg !114
  %8 = and i64 %7, %_f, !dbg !114
  %9 = icmp ne i64 %8, 0, !dbg !114
  br label %13, !dbg !114

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c, i64 %_f), !dbg !116
  %12 = icmp ne i32 %11, 0, !dbg !116
  br label %13, !dbg !116

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !114
  %15 = xor i1 %14, true, !dbg !114
  %16 = zext i1 %15 to i32, !dbg !114
  ret i32 %16, !dbg !116
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %1 = and i32 %_c, -128, !dbg !117
  %2 = icmp eq i32 %1, 0, !dbg !117
  %3 = zext i1 %2 to i32, !dbg !117
  ret i32 %3, !dbg !117
}

declare i32 @__maskrune(i32, i64)

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !10, metadata !16, metadata !17, metadata !19, metadata !24}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"nsquaredplusone", metadata !"nsquaredplusone", metadata !"", metadata !6, i32 37, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @nsquaredplusone, null, null, metadata !1, i32 38} ; [ DW_TAG_subprogram ] [line 37] [def] [scope 38] [nsquaredplusone]
!6 = metadata !{i32 786473, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, i32 0, metadata !6, metadata !"checkargs", metadata !"checkargs", metadata !"", metadata !6, i32 43, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @checkargs, null, null, metadata !1, i32 44} ; [ DW_TAG_subprogram ] [line 43] [def] [scope 44] [checkargs]
!11 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !9, metadata !9, metadata !13}
!13 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!15 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!16 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 53, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 54} ; [ DW_TAG_subprogram ] [line 53] [def] [scope 54] [main]
!17 = metadata !{i32 786478, i32 0, metadata !18, metadata !"isspace", metadata !"isspace", metadata !"", metadata !18, i32 284, metadata !7, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isspace, null, null, metadata !1, i32 285} ; [ DW_TAG_subprogram ] [line 284] [local] [def] [scope 285] [isspace]
!18 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint", null} ; [ DW_TAG_file_type ]
!19 = metadata !{i32 786478, i32 0, metadata !18, metadata !"__istype", metadata !"__istype", metadata !"", metadata !18, i32 170, metadata !20, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!20 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{metadata !9, metadata !22, metadata !23}
!22 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !18, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!23 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!24 = metadata !{i32 786478, i32 0, metadata !18, metadata !"isascii", metadata !"isascii", metadata !"", metadata !18, i32 152, metadata !7, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!25 = metadata !{i32 39, i32 3, metadata !26, null}
!26 = metadata !{i32 786443, metadata !5, i32 38, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!27 = metadata !{i32 45, i32 3, metadata !28, null}
!28 = metadata !{i32 786443, metadata !10, i32 44, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!29 = metadata !{i32 45, i32 35, metadata !28, null}
!30 = metadata !{i32 45, i32 65, metadata !28, null}
!31 = metadata !{i32 47, i32 7, metadata !32, null}
!32 = metadata !{i32 786443, metadata !28, i32 46, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!33 = metadata !{i32 50, i32 3, metadata !28, null}
!34 = metadata !{i32 51, i32 1, metadata !28, null}
!35 = metadata !{i32 73, i32 40, metadata !36, null}
!36 = metadata !{i32 786443, metadata !16, i32 54, i32 1, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!37 = metadata !{i32 76, i32 25, metadata !36, null}
!38 = metadata !{i32 77, i32 2, metadata !36, null}
!39 = metadata !{i32 79, i32 6, metadata !40, null}
!40 = metadata !{i32 786443, metadata !36, i32 78, i32 4, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!41 = metadata !{i32 80, i32 6, metadata !40, null}
!42 = metadata !{i32 84, i32 23, metadata !36, null}
!43 = metadata !{i32 85, i32 8, metadata !44, null}
!44 = metadata !{i32 786443, metadata !36, i32 85, i32 2, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!45 = metadata !{i32 87, i32 6, metadata !46, null}
!46 = metadata !{i32 786443, metadata !44, i32 86, i32 4, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!47 = metadata !{i32 85, i32 39, metadata !44, null}
!48 = metadata !{i32 91, i32 2, metadata !36, null}
!49 = metadata !{i32 93, i32 6, metadata !50, null}
!50 = metadata !{i32 786443, metadata !36, i32 92, i32 4, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!51 = metadata !{i32 94, i32 6, metadata !50, null}
!52 = metadata !{i32 97, i32 6, metadata !50, null}
!53 = metadata !{i32 101, i32 7, metadata !54, null}
!54 = metadata !{i32 786443, metadata !55, i32 100, i32 5, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!55 = metadata !{i32 786443, metadata !50, i32 98, i32 8, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!56 = metadata !{i32 102, i32 7, metadata !54, null}
!57 = metadata !{i32 103, i32 5, metadata !54, null}
!58 = metadata !{i32 113, i32 2, metadata !36, null}
!59 = metadata !{i32 118, i32 7, metadata !36, null}
!60 = metadata !{i32 119, i32 2, metadata !36, null}
!61 = metadata !{i32 121, i32 3, metadata !62, null}
!62 = metadata !{i32 786443, metadata !36, i32 120, i32 2, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!63 = metadata !{i32 122, i32 3, metadata !62, null}
!64 = metadata !{i32 129, i32 2, metadata !36, null}
!65 = metadata !{i32 131, i32 2, metadata !36, null}
!66 = metadata !{i32 131, i32 9, metadata !36, null}
!67 = metadata !{i32 133, i32 3, metadata !68, null}
!68 = metadata !{i32 786443, metadata !36, i32 132, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!69 = metadata !{i32 137, i32 12, metadata !68, null}
!70 = metadata !{i32 137, i32 42, metadata !68, null}
!71 = metadata !{i32 139, i32 3, metadata !68, null}
!72 = metadata !{i32 143, i32 3, metadata !68, null}
!73 = metadata !{i32 145, i32 4, metadata !74, null}
!74 = metadata !{i32 786443, metadata !68, i32 144, i32 3, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!75 = metadata !{i32 147, i32 5, metadata !76, null}
!76 = metadata !{i32 786443, metadata !74, i32 146, i32 4, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!77 = metadata !{i32 149, i32 6, metadata !78, null}
!78 = metadata !{i32 786443, metadata !76, i32 148, i32 5, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!79 = metadata !{i32 150, i32 6, metadata !78, null}
!80 = metadata !{i32 152, i32 6, metadata !78, null}
!81 = metadata !{i32 155, i32 6, metadata !82, null}
!82 = metadata !{i32 786443, metadata !78, i32 153, i32 6, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!83 = metadata !{i32 158, i32 5, metadata !76, null}
!84 = metadata !{i32 159, i32 5, metadata !76, null}
!85 = metadata !{i32 162, i32 8, metadata !74, null}
!86 = metadata !{i32 164, i32 5, metadata !87, null}
!87 = metadata !{i32 786443, metadata !74, i32 163, i32 4, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!88 = metadata !{i32 165, i32 5, metadata !87, null}
!89 = metadata !{i32 168, i32 4, metadata !74, null}
!90 = metadata !{i32 170, i32 5, metadata !91, null}
!91 = metadata !{i32 786443, metadata !74, i32 169, i32 4, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!92 = metadata !{i32 171, i32 5, metadata !91, null}
!93 = metadata !{i32 173, i32 5, metadata !91, null}
!94 = metadata !{i32 175, i32 5, metadata !91, null}
!95 = metadata !{i32 178, i32 6, metadata !96, null}
!96 = metadata !{i32 786443, metadata !91, i32 176, i32 5, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!97 = metadata !{i32 179, i32 6, metadata !96, null}
!98 = metadata !{i32 184, i32 4, metadata !74, null}
!99 = metadata !{i32 187, i32 5, metadata !100, null}
!100 = metadata !{i32 786443, metadata !74, i32 185, i32 4, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!101 = metadata !{i32 189, i32 4, metadata !100, null}
!102 = metadata !{i32 191, i32 4, metadata !74, null}
!103 = metadata !{i32 192, i32 3, metadata !74, null}
!104 = metadata !{i32 197, i32 6, metadata !36, null}
!105 = metadata !{i32 199, i32 6, metadata !106, null}
!106 = metadata !{i32 786443, metadata !36, i32 198, i32 4, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint/countlines.c]
!107 = metadata !{i32 200, i32 6, metadata !106, null}
!108 = metadata !{i32 204, i32 2, metadata !36, null}
!109 = metadata !{i32 206, i32 2, metadata !36, null}
!110 = metadata !{i32 208, i32 2, metadata !36, null}
!111 = metadata !{i32 209, i32 1, metadata !36, null}
!112 = metadata !{i32 286, i32 10, metadata !113, null}
!113 = metadata !{i32 786443, metadata !17, i32 285, i32 1, metadata !18, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint//usr/include/ctype.h]
!114 = metadata !{i32 175, i32 10, metadata !115, null}
!115 = metadata !{i32 786443, metadata !19, i32 171, i32 1, metadata !18, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint//usr/include/ctype.h]
!116 = metadata !{i32 176, i32 7, metadata !115, null}
!117 = metadata !{i32 154, i32 2, metadata !118, null}
!118 = metadata !{i32 786443, metadata !24, i32 153, i32 1, metadata !18, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_196_v522/src/kint//usr/include/ctype.h]
