; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque
%struct._RuneLocale = type { [8 x i8], [32 x i8], i32 (i8*, i64, i8**)*, i32 (i32, i8*, i64, i8**)*, i32, [256 x i32], [256 x i32], [256 x i32], %struct._RuneRange, %struct._RuneRange, %struct._RuneRange, i8*, i32, i32, %struct._RuneCharClass* }
%struct._RuneRange = type { i32, %struct._RuneEntry* }
%struct._RuneEntry = type { i32, i32, i32, i32* }
%struct._RuneCharClass = type { [14 x i8], i32 }

@.str = private unnamed_addr constant [4 x i8] c"o:h\00", align 1
@optarg = external global i8*
@optind = external global i32
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@__stdinp = external global %struct.__sFILE*
@__stderrp = external global %struct.__sFILE*
@.str2 = private unnamed_addr constant [15 x i8] c"Bad arg count\0A\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@__stdoutp = external global %struct.__sFILE*
@count = internal global [256 x i8] zeroinitializer, align 16
@tbl = internal global [256 x i8] zeroinitializer, align 16
@keep = internal global [23 x i8] zeroinitializer, align 16
@secret = internal constant [23 x i8] c"this is a secret value\00", align 16
@.str4 = private unnamed_addr constant [8 x i8] c"%d: %d\09\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale
@.str5 = private unnamed_addr constant [127 x i8] c"Usage: %s [options] [input]\0AOptions:\0A  -o file -- output to file (default is standard output)\0A  -h      -- print this message\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !49
  br label %1, !dbg !50

; <label>:1                                       ; preds = %5, %0
  %output.0 = phi i8* [ null, %0 ], [ %6, %5 ]
  %2 = call i32 @"\01_getopt"(i32 %argc1, i8** %argv, i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0)), !dbg !53
  %3 = icmp eq i32 %2, -1, !dbg !55
  br i1 %3, label %13, label %4, !dbg !55

; <label>:4                                       ; preds = %1
  switch i32 %2, label %10 [
    i32 111, label %5
    i32 104, label %7
  ], !dbg !56

; <label>:5                                       ; preds = %4
  %6 = load i8** @optarg, align 8, !dbg !57
  br label %1, !dbg !59

; <label>:7                                       ; preds = %4
  %8 = getelementptr inbounds i8** %argv, i64 0, !dbg !60
  %9 = load i8** %8, align 8, !dbg !60
  call void @usage(i8* %9), !dbg !60
  br label %43, !dbg !61

; <label>:10                                      ; preds = %4
  %11 = getelementptr inbounds i8** %argv, i64 0, !dbg !62
  %12 = load i8** %11, align 8, !dbg !62
  call void @usage(i8* %12), !dbg !62
  br label %43, !dbg !63

; <label>:13                                      ; preds = %1
  %14 = load i32* @optind, align 4, !dbg !64, !id !65
  %15 = sub nsw i32 %argc1, %14, !dbg !64
  switch i32 %15, label %29 [
    i32 0, label %34
    i32 1, label %16
  ], !dbg !64

; <label>:16                                      ; preds = %13
  %17 = load i32* @optind, align 4, !dbg !66, !id !65
  %18 = sext i32 %17 to i64, !dbg !66
  %19 = getelementptr inbounds i8** %argv, i64 %18, !dbg !66
  %20 = load i8** %19, align 8, !dbg !66
  %21 = load %struct.__sFILE** @__stdinp, align 8, !dbg !66
  %22 = call %struct.__sFILE* @"\01_freopen"(i8* %20, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), %struct.__sFILE* %21), !dbg !66
  %23 = icmp ne %struct.__sFILE* %22, null, !dbg !66
  br i1 %23, label %34, label %24, !dbg !66

; <label>:24                                      ; preds = %16
  %25 = load i32* @optind, align 4, !dbg !68, !id !65
  %26 = sext i32 %25 to i64, !dbg !68
  %27 = getelementptr inbounds i8** %argv, i64 %26, !dbg !68
  %28 = load i8** %27, align 8, !dbg !68
  call void @perror(i8* %28), !dbg !68
  br label %43, !dbg !70

; <label>:29                                      ; preds = %13
  %30 = load %struct.__sFILE** @__stderrp, align 8, !dbg !71
  %31 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %30, i8* getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0)), !dbg !71
  %32 = getelementptr inbounds i8** %argv, i64 0, !dbg !72
  %33 = load i8** %32, align 8, !dbg !72
  call void @usage(i8* %33), !dbg !72
  br label %43, !dbg !73

; <label>:34                                      ; preds = %16, %13
  %35 = icmp ne i8* %output.0, null, !dbg !74
  br i1 %35, label %36, label %41, !dbg !74

; <label>:36                                      ; preds = %34
  %37 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !75
  %38 = call %struct.__sFILE* @"\01_freopen"(i8* %output.0, i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0), %struct.__sFILE* %37), !dbg !75
  %39 = icmp ne %struct.__sFILE* %38, null, !dbg !75
  br i1 %39, label %41, label %40, !dbg !75

; <label>:40                                      ; preds = %36
  call void @perror(i8* %output.0), !dbg !76
  br label %43, !dbg !78

; <label>:41                                      ; preds = %36, %34
  %42 = call i32 @filter(), !dbg !79, !intrange !80
  br label %43, !dbg !79

; <label>:43                                      ; preds = %41, %40, %29, %24, %10, %7
  %.0 = phi i32 [ 1, %29 ], [ %42, %41 ], [ 1, %40 ], [ 1, %24 ], [ 1, %10 ], [ 0, %7 ]
  ret i32 %.0, !dbg !81
}

declare i32 @"\01_getopt"(i32, i8**, i8*)

define internal void @usage(i8* %prog) nounwind uwtable ssp {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !82
  %2 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([127 x i8]* @.str5, i32 0, i32 0), i8* %prog), !dbg !82
  ret void, !dbg !84
}

declare %struct.__sFILE* @"\01_freopen"(i8*, i8*, %struct.__sFILE*)

declare void @perror(i8*)

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

define internal i32 @filter() nounwind uwtable ssp {
  br label %1, !dbg !85

; <label>:1                                       ; preds = %17, %0
  %i.0 = phi i32 [ 0, %0 ], [ %18, %17 ]
  %2 = icmp slt i32 %i.0, 256, !dbg !85
  br i1 %2, label %3, label %19, !dbg !85

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !88
  %5 = getelementptr inbounds [256 x i8]* @count, i32 0, i64 %4, !dbg !88
  store i8 0, i8* %5, align 1, !dbg !88
  %6 = call i32 @isupper(i32 %i.0), !dbg !90, !intrange !91
  %7 = icmp ne i32 %6, 0, !dbg !90
  br i1 %7, label %8, label %13, !dbg !90

; <label>:8                                       ; preds = %3
  %9 = call i32 @tolower(i32 %i.0), !dbg !92
  %10 = trunc i32 %9 to i8, !dbg !92
  %11 = sext i32 %i.0 to i64, !dbg !92
  %12 = getelementptr inbounds [256 x i8]* @tbl, i32 0, i64 %11, !dbg !92
  store i8 %10, i8* %12, align 1, !dbg !92
  br label %17, !dbg !92

; <label>:13                                      ; preds = %3
  %14 = trunc i32 %i.0 to i8, !dbg !93
  %15 = sext i32 %i.0 to i64, !dbg !93
  %16 = getelementptr inbounds [256 x i8]* @tbl, i32 0, i64 %15, !dbg !93
  store i8 %14, i8* %16, align 1, !dbg !93
  br label %17

; <label>:17                                      ; preds = %13, %8
  %18 = add nsw i32 %i.0, 1, !dbg !94
  br label %1, !dbg !94

; <label>:19                                      ; preds = %1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([23 x i8]* @keep, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @secret, i32 0, i32 0), i64 23, i32 1, i1 false), !dbg !95
  br label %20, !dbg !96

; <label>:20                                      ; preds = %37, %19
  %21 = call i32 @getchar(), !dbg !98
  %22 = icmp eq i32 %21, -1, !dbg !100
  br i1 %22, label %23, label %25, !dbg !100

; <label>:23                                      ; preds = %20
  %24 = call i32 @print_summary(), !dbg !101, !intrange !80
  ret i32 %24, !dbg !101

; <label>:25                                      ; preds = %20
  %26 = trunc i32 %21 to i8, !dbg !102
  %27 = sext i8 %26 to i32, !dbg !103
  %28 = call i32 @tr(i32 %27), !dbg !103
  %29 = trunc i32 %28 to i8, !dbg !103
  %30 = sext i8 %29 to i32, !dbg !104
  %31 = icmp ne i32 %30, %21, !dbg !104
  br i1 %31, label %32, label %37, !dbg !104

; <label>:32                                      ; preds = %25
  %33 = sext i32 %21 to i64, !dbg !105
  %34 = getelementptr inbounds [256 x i8]* @count, i32 0, i64 %33, !dbg !105
  %35 = load i8* %34, align 1, !dbg !105
  %36 = add i8 %35, 1, !dbg !105
  store i8 %36, i8* %34, align 1, !dbg !105
  br label %37, !dbg !105

; <label>:37                                      ; preds = %32, %25
  %38 = sext i8 %29 to i32, !dbg !106
  %39 = call i32 @putchar(i32 %38), !dbg !106
  br label %20, !dbg !107
}

define internal i32 @isupper(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !108, !intrange !80
  %1 = call i32 @__istype(i32 %_c1, i64 32768), !dbg !109, !intrange !91
  ret i32 %1, !dbg !109
}

define internal i32 @tolower(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !111, !intrange !80
  %1 = call i32 @__tolower(i32 %_c1), !dbg !112
  ret i32 %1, !dbg !112
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @getchar()

define internal i32 @print_summary() nounwind uwtable ssp {
  br label %1, !dbg !114

; <label>:1                                       ; preds = %21, %0
  %j.0 = phi i32 [ 0, %0 ], [ %j.1, %21 ]
  %i.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %i.0, 256, !dbg !114
  br i1 %2, label %3, label %23, !dbg !114

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !117
  %5 = getelementptr inbounds [256 x i8]* @count, i32 0, i64 %4, !dbg !117
  %6 = load i8* %5, align 1, !dbg !117
  %7 = icmp ne i8 %6, 0, !dbg !117
  br i1 %7, label %8, label %21, !dbg !117

; <label>:8                                       ; preds = %3
  %9 = load %struct.__sFILE** @__stderrp, align 8, !dbg !119
  %10 = sext i32 %i.0 to i64, !dbg !119
  %11 = getelementptr inbounds [256 x i8]* @count, i32 0, i64 %10, !dbg !119
  %12 = load i8* %11, align 1, !dbg !119
  %13 = zext i8 %12 to i32, !dbg !119
  %14 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %9, i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0), i32 %i.0, i32 %13), !dbg !119
  %15 = add nsw i32 %j.0, 1, !dbg !121
  %16 = srem i32 %15, 8, !dbg !121
  %17 = icmp eq i32 %16, 0, !dbg !121
  br i1 %17, label %18, label %21, !dbg !121

; <label>:18                                      ; preds = %8
  %19 = load %struct.__sFILE** @__stderrp, align 8, !dbg !122
  %20 = call i32 @fputc(i32 10, %struct.__sFILE* %19), !dbg !122
  br label %21, !dbg !122

; <label>:21                                      ; preds = %18, %8, %3
  %j.1 = phi i32 [ %15, %18 ], [ %15, %8 ], [ %j.0, %3 ]
  %22 = add nsw i32 %i.0, 1, !dbg !123
  br label %1, !dbg !123

; <label>:23                                      ; preds = %1
  %24 = srem i32 %j.0, 8, !dbg !124
  %25 = icmp ne i32 %24, 0, !dbg !124
  br i1 %25, label %26, label %29, !dbg !124

; <label>:26                                      ; preds = %23
  %27 = load %struct.__sFILE** @__stderrp, align 8, !dbg !125
  %28 = call i32 @fputc(i32 10, %struct.__sFILE* %27), !dbg !125
  br label %29, !dbg !125

; <label>:29                                      ; preds = %26, %23
  ret i32 0, !dbg !126
}

define internal i32 @tr(i32 %c) nounwind uwtable ssp {
  %c1 = call i32 @kint_arg.i32(), !id !127
  %1 = sext i32 %c1 to i64, !dbg !128
  %2 = getelementptr inbounds [256 x i8]* @tbl, i32 0, i64 %1, !dbg !128
  %3 = load i8* %2, align 1, !dbg !128
  %4 = sext i8 %3 to i32, !dbg !128
  ret i32 %4, !dbg !128
}

declare i32 @putchar(i32)

declare i32 @fputc(i32, %struct.__sFILE*)

declare i32 @__tolower(i32)

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !130, !intrange !131
  %_c1 = call i32 @kint_arg.i32(), !id !132
  %1 = call i32 @isascii(i32 %_c1), !dbg !133, !intrange !91
  %2 = icmp ne i32 %1, 0, !dbg !133
  br i1 %2, label %3, label %10, !dbg !133

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !133
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !133
  %6 = load i32* %5, align 4, !dbg !133
  %7 = zext i32 %6 to i64, !dbg !133
  %8 = and i64 %7, %_f2, !dbg !133
  %9 = icmp ne i64 %8, 0, !dbg !133
  br label %13, !dbg !133

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c1, i64 %_f2), !dbg !135
  %12 = icmp ne i32 %11, 0, !dbg !135
  br label %13, !dbg !135

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !133
  %15 = xor i1 %14, true, !dbg !133
  %16 = zext i1 %15 to i32, !dbg !133
  ret i32 %16, !dbg !135
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !136
  %1 = and i32 %_c1, -128, !dbg !137
  %2 = icmp eq i32 %1, 0, !dbg !137
  %3 = zext i1 %2 to i32, !dbg !137
  ret i32 %3, !dbg !137
}

declare i32 @__maskrune(i32, i64)

declare i32 @kint_arg.i32()

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"lower.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !34} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !16, metadata !19, metadata !20, metadata !22, metadata !23, metadata !28, metadata !29}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 151, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 152} ; [ DW_TAG_subprogram ] [line 151] [def] [scope 152] [main]
!6 = metadata !{i32 786473, metadata !"lower.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !6, metadata !"filter", metadata !"filter", metadata !"", metadata !6, i32 114, metadata !14, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @filter, null, null, metadata !1, i32 115} ; [ DW_TAG_subprogram ] [line 114] [local] [def] [scope 115] [filter]
!14 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !9}
!16 = metadata !{i32 786478, i32 0, metadata !6, metadata !"tr", metadata !"tr", metadata !"", metadata !6, i32 108, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @tr, null, null, metadata !1, i32 109} ; [ DW_TAG_subprogram ] [line 108] [local] [def] [scope 109] [tr]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !9, metadata !9}
!19 = metadata !{i32 786478, i32 0, metadata !6, metadata !"print_summary", metadata !"print_summary", metadata !"", metadata !6, i32 91, metadata !14, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @print_summary, null, null, metadata !1, i32 92} ; [ DW_TAG_subprogram ] [line 91] [local] [def] [scope 92] [print_summary]
!20 = metadata !{i32 786478, i32 0, metadata !21, metadata !"tolower", metadata !"tolower", metadata !"", metadata !21, i32 309, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @tolower, null, null, metadata !1, i32 310} ; [ DW_TAG_subprogram ] [line 309] [local] [def] [scope 310] [tolower]
!21 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint", null} ; [ DW_TAG_file_type ]
!22 = metadata !{i32 786478, i32 0, metadata !21, metadata !"isupper", metadata !"isupper", metadata !"", metadata !21, i32 290, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isupper, null, null, metadata !1, i32 291} ; [ DW_TAG_subprogram ] [line 290] [local] [def] [scope 291] [isupper]
!23 = metadata !{i32 786478, i32 0, metadata !21, metadata !"__istype", metadata !"__istype", metadata !"", metadata !21, i32 170, metadata !24, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !9, metadata !26, metadata !27}
!26 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !21, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!27 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!28 = metadata !{i32 786478, i32 0, metadata !21, metadata !"isascii", metadata !"isascii", metadata !"", metadata !21, i32 152, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!29 = metadata !{i32 786478, i32 0, metadata !6, metadata !"usage", metadata !"usage", metadata !"", metadata !6, i32 141, metadata !30, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @usage, null, null, metadata !1, i32 142} ; [ DW_TAG_subprogram ] [line 141] [local] [def] [scope 142] [usage]
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !32}
!32 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!33 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !36, metadata !40, metadata !42, metadata !46}
!36 = metadata !{i32 786484, i32 0, null, metadata !"secret", metadata !"secret", metadata !"", metadata !6, i32 83, metadata !37, i32 1, i32 1, [23 x i8]* @secret} ; [ DW_TAG_variable ] [secret] [line 83] [local] [def]
!37 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 184, i64 8, i32 0, i32 0, metadata !33, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 184, align 8, offset 0] [from ]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786465, i64 0, i64 22}       ; [ DW_TAG_subrange_type ] [0, 21]
!40 = metadata !{i32 786484, i32 0, null, metadata !"keep", metadata !"keep", metadata !"", metadata !6, i32 86, metadata !41, i32 1, i32 1, [23 x i8]* @keep} ; [ DW_TAG_variable ] [keep] [line 86] [local] [def]
!41 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 184, i64 8, i32 0, i32 0, metadata !12, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 184, align 8, offset 0] [from char]
!42 = metadata !{i32 786484, i32 0, null, metadata !"tbl", metadata !"tbl", metadata !"", metadata !6, i32 87, metadata !43, i32 1, i32 1, [256 x i8]* @tbl} ; [ DW_TAG_variable ] [tbl] [line 87] [local] [def]
!43 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !12, metadata !44, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ] [0, 254]
!46 = metadata !{i32 786484, i32 0, null, metadata !"count", metadata !"count", metadata !"", metadata !6, i32 85, metadata !47, i32 1, i32 1, [256 x i8]* @count} ; [ DW_TAG_variable ] [count] [line 85] [local] [def]
!47 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !48, metadata !44, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from unsigned char]
!48 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!49 = metadata !{metadata !"arg.main.0"}
!50 = metadata !{i32 158, i32 3, metadata !51, null}
!51 = metadata !{i32 786443, metadata !52, i32 158, i32 3, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!52 = metadata !{i32 786443, metadata !5, i32 152, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!53 = metadata !{i32 159, i32 13, metadata !54, null}
!54 = metadata !{i32 786443, metadata !51, i32 158, i32 12, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!55 = metadata !{i32 160, i32 5, metadata !54, null}
!56 = metadata !{i32 162, i32 5, metadata !54, null}
!57 = metadata !{i32 164, i32 7, metadata !58, null}
!58 = metadata !{i32 786443, metadata !54, i32 162, i32 16, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!59 = metadata !{i32 173, i32 3, metadata !54, null}
!60 = metadata !{i32 167, i32 7, metadata !58, null}
!61 = metadata !{i32 168, i32 7, metadata !58, null}
!62 = metadata !{i32 170, i32 7, metadata !58, null}
!63 = metadata !{i32 171, i32 7, metadata !58, null}
!64 = metadata !{i32 175, i32 3, metadata !52, null}
!65 = metadata !{metadata !"var.optind"}
!66 = metadata !{i32 179, i32 10, metadata !67, null}
!67 = metadata !{i32 786443, metadata !52, i32 175, i32 26, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!68 = metadata !{i32 180, i32 7, metadata !69, null}
!69 = metadata !{i32 786443, metadata !67, i32 179, i32 46, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!70 = metadata !{i32 181, i32 7, metadata !69, null}
!71 = metadata !{i32 185, i32 5, metadata !67, null}
!72 = metadata !{i32 186, i32 5, metadata !67, null}
!73 = metadata !{i32 187, i32 5, metadata !67, null}
!74 = metadata !{i32 190, i32 3, metadata !52, null}
!75 = metadata !{i32 190, i32 18, metadata !52, null}
!76 = metadata !{i32 191, i32 5, metadata !77, null}
!77 = metadata !{i32 786443, metadata !52, i32 190, i32 49, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!78 = metadata !{i32 192, i32 5, metadata !77, null}
!79 = metadata !{i32 195, i32 10, metadata !52, null}
!80 = metadata !{i32 0, i32 1}
!81 = metadata !{i32 196, i32 1, metadata !52, null}
!82 = metadata !{i32 143, i32 3, metadata !83, null}
!83 = metadata !{i32 786443, metadata !29, i32 142, i32 1, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!84 = metadata !{i32 148, i32 1, metadata !83, null}
!85 = metadata !{i32 117, i32 8, metadata !86, null}
!86 = metadata !{i32 786443, metadata !87, i32 117, i32 3, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!87 = metadata !{i32 786443, metadata !13, i32 115, i32 1, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!88 = metadata !{i32 118, i32 5, metadata !89, null}
!89 = metadata !{i32 786443, metadata !86, i32 117, i32 32, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!90 = metadata !{i32 119, i32 9, metadata !89, null}
!91 = metadata !{i32 0, i32 2}
!92 = metadata !{i32 120, i32 16, metadata !89, null}
!93 = metadata !{i32 122, i32 7, metadata !89, null}
!94 = metadata !{i32 117, i32 27, metadata !86, null}
!95 = metadata !{i32 124, i32 3, metadata !87, null}
!96 = metadata !{i32 125, i32 3, metadata !97, null}
!97 = metadata !{i32 786443, metadata !87, i32 125, i32 3, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!98 = metadata !{i32 126, i32 13, metadata !99, null}
!99 = metadata !{i32 786443, metadata !97, i32 125, i32 12, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!100 = metadata !{i32 127, i32 5, metadata !99, null}
!101 = metadata !{i32 128, i32 14, metadata !99, null}
!102 = metadata !{i32 129, i32 16, metadata !99, null}
!103 = metadata !{i32 131, i32 10, metadata !99, null}
!104 = metadata !{i32 132, i32 5, metadata !99, null}
!105 = metadata !{i32 133, i32 7, metadata !99, null}
!106 = metadata !{i32 134, i32 5, metadata !99, null}
!107 = metadata !{i32 135, i32 3, metadata !99, null}
!108 = metadata !{metadata !"arg._kint.isupper.0"}
!109 = metadata !{i32 292, i32 10, metadata !110, null}
!110 = metadata !{i32 786443, metadata !22, i32 291, i32 1, metadata !21, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint//usr/include/ctype.h]
!111 = metadata !{metadata !"arg._kint.tolower.0"}
!112 = metadata !{i32 311, i32 17, metadata !113, null}
!113 = metadata !{i32 786443, metadata !20, i32 310, i32 1, metadata !21, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint//usr/include/ctype.h]
!114 = metadata !{i32 94, i32 8, metadata !115, null}
!115 = metadata !{i32 786443, metadata !116, i32 94, i32 3, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!116 = metadata !{i32 786443, metadata !19, i32 92, i32 1, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!117 = metadata !{i32 95, i32 5, metadata !118, null}
!118 = metadata !{i32 786443, metadata !115, i32 94, i32 32, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!119 = metadata !{i32 96, i32 7, metadata !120, null}
!120 = metadata !{i32 786443, metadata !118, i32 95, i32 19, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!121 = metadata !{i32 97, i32 7, metadata !120, null}
!122 = metadata !{i32 98, i32 2, metadata !120, null}
!123 = metadata !{i32 94, i32 27, metadata !115, null}
!124 = metadata !{i32 101, i32 3, metadata !116, null}
!125 = metadata !{i32 102, i32 5, metadata !116, null}
!126 = metadata !{i32 103, i32 3, metadata !116, null}
!127 = metadata !{metadata !"arg._kint.tr.0"}
!128 = metadata !{i32 110, i32 3, metadata !129, null}
!129 = metadata !{i32 786443, metadata !16, i32 109, i32 1, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint/lower.c]
!130 = metadata !{metadata !"arg._kint.__istype.1"}
!131 = metadata !{i64 32768, i64 32769}
!132 = metadata !{metadata !"arg._kint.__istype.0"}
!133 = metadata !{i32 175, i32 10, metadata !134, null}
!134 = metadata !{i32 786443, metadata !23, i32 171, i32 1, metadata !21, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint//usr/include/ctype.h]
!135 = metadata !{i32 176, i32 7, metadata !134, null}
!136 = metadata !{metadata !"arg._kint.isascii.0"}
!137 = metadata !{i32 154, i32 2, metadata !138, null}
!138 = metadata !{i32 786443, metadata !28, i32 153, i32 1, metadata !21, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_base2/src/kint//usr/include/ctype.h]
