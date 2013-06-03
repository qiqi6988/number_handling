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

@__stderrp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [18 x i8] c"Usage: %s output\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@__stdoutp = external global %struct.__sFILE*
@.str2 = private unnamed_addr constant [11 x i8] c"LOWER_TEXT\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"UPPER_TEXT\00", align 1
@.str4 = private unnamed_addr constant [39 x i8] c"cannot find LOWER_TEXT in environment\0A\00", align 1
@.str5 = private unnamed_addr constant [39 x i8] c"cannot find UPPER_TEXT in environment\0A\00", align 1
@.str6 = private unnamed_addr constant [37 x i8] c"bad input: lower = %hu, upper = %hu\0A\00", align 1
@count = internal global [256 x i8] zeroinitializer, align 16
@tbl = internal global [256 x i8] zeroinitializer, align 16
@keep = internal global [23 x i8] zeroinitializer, align 16
@secret = internal constant [23 x i8] c"this is a secret value\00", align 16
@_DefaultRuneLocale = external global %struct._RuneLocale
@.str7 = private unnamed_addr constant [4 x i8] c"%2x\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !48
  %1 = icmp ne i32 %argc1, 2, !dbg !49
  br i1 %1, label %2, label %7, !dbg !49

; <label>:2                                       ; preds = %0
  %3 = load %struct.__sFILE** @__stderrp, align 8, !dbg !51
  %4 = getelementptr inbounds i8** %argv, i64 0, !dbg !51
  %5 = load i8** %4, align 8, !dbg !51
  %6 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %3, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i8* %5), !dbg !51
  br label %38, !dbg !53

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds i8** %argv, i64 1, !dbg !54
  %9 = load i8** %8, align 8, !dbg !54
  %10 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !54
  %11 = call %struct.__sFILE* @"\01_freopen"(i8* %9, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), %struct.__sFILE* %10), !dbg !54
  %12 = call i8* @getenv(i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0)), !dbg !55
  %13 = call i8* @getenv(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0)), !dbg !56
  %14 = icmp ne i8* %12, null, !dbg !57
  br i1 %14, label %18, label %15, !dbg !57

; <label>:15                                      ; preds = %7
  %16 = load %struct.__sFILE** @__stderrp, align 8, !dbg !58
  %17 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %16, i8* getelementptr inbounds ([39 x i8]* @.str4, i32 0, i32 0)), !dbg !58
  br label %38, !dbg !60

; <label>:18                                      ; preds = %7
  %19 = icmp ne i8* %13, null, !dbg !61
  br i1 %19, label %23, label %20, !dbg !61

; <label>:20                                      ; preds = %18
  %21 = load %struct.__sFILE** @__stderrp, align 8, !dbg !62
  %22 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0)), !dbg !62
  br label %38, !dbg !64

; <label>:23                                      ; preds = %18
  %24 = call zeroext i8 @decode(i8* %12), !dbg !65, !intrange !66
  %25 = zext i8 %24 to i32, !dbg !65
  %26 = call zeroext i8 @decode(i8* %13), !dbg !67, !intrange !66
  %27 = zext i8 %26 to i32, !dbg !67
  %28 = icmp eq i32 %27, 0, !dbg !68
  br i1 %28, label %31, label %29, !dbg !68

; <label>:29                                      ; preds = %23
  %30 = icmp eq i32 %25, 0, !dbg !68
  br i1 %30, label %31, label %34, !dbg !68

; <label>:31                                      ; preds = %29, %23
  %32 = load %struct.__sFILE** @__stderrp, align 8, !dbg !69
  %33 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %32, i8* getelementptr inbounds ([37 x i8]* @.str6, i32 0, i32 0), i32 %25, i32 %27), !dbg !69
  br label %38, !dbg !71

; <label>:34                                      ; preds = %29
  %35 = trunc i32 %25 to i8, !dbg !72
  %36 = trunc i32 %27 to i8, !dbg !72
  %37 = call i32 @filter(i8 zeroext %35, i8 zeroext %36), !dbg !72, !intrange !73
  br label %38, !dbg !72

; <label>:38                                      ; preds = %34, %31, %20, %15, %2
  %.0 = phi i32 [ 1, %2 ], [ 1, %31 ], [ %37, %34 ], [ 1, %20 ], [ 1, %15 ]
  ret i32 %.0, !dbg !74
}

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

declare %struct.__sFILE* @"\01_freopen"(i8*, i8*, %struct.__sFILE*)

declare i8* @getenv(i8*)

define internal zeroext i8 @decode(i8* %val) nounwind uwtable ssp {
  %c = alloca i32, align 4
  %1 = load i8* %val, align 1, !dbg !75
  %2 = icmp ne i8 %1, 0, !dbg !75
  br i1 %2, label %4, label %3, !dbg !75

; <label>:3                                       ; preds = %0
  br label %18, !dbg !77

; <label>:4                                       ; preds = %0
  %5 = load i8* %val, align 1, !dbg !78
  %6 = sext i8 %5 to i32, !dbg !78
  %7 = icmp ne i32 %6, 37, !dbg !78
  br i1 %7, label %8, label %10, !dbg !78

; <label>:8                                       ; preds = %4
  %9 = load i8* %val, align 1, !dbg !79
  br label %18, !dbg !79

; <label>:10                                      ; preds = %4
  %11 = getelementptr inbounds i8* %val, i64 1, !dbg !80
  %12 = call i32 (i8*, i8*, ...)* @sscanf(i8* %11, i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i32* %c), !dbg !80
  %13 = icmp ne i32 %12, 1, !dbg !81
  br i1 %13, label %14, label %15, !dbg !81

; <label>:14                                      ; preds = %10
  br label %18, !dbg !82

; <label>:15                                      ; preds = %10
  %16 = load i32* %c, align 4, !dbg !83
  %17 = trunc i32 %16 to i8, !dbg !83
  br label %18, !dbg !83

; <label>:18                                      ; preds = %15, %14, %8, %3
  %.0 = phi i8 [ %9, %8 ], [ 0, %14 ], [ %17, %15 ], [ 0, %3 ]
  ret i8 %.0, !dbg !84
}

define internal i32 @filter(i8 zeroext %lower, i8 zeroext %upper) nounwind uwtable ssp {
  %upper2 = call i8 @kint_arg.i8(), !id !85, !intrange !66
  %lower1 = call i8 @kint_arg.i8(), !id !86, !intrange !66
  br label %1, !dbg !87

; <label>:1                                       ; preds = %17, %0
  %i.0 = phi i32 [ 0, %0 ], [ %18, %17 ]
  %2 = icmp slt i32 %i.0, 256, !dbg !87
  br i1 %2, label %3, label %19, !dbg !87

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !90
  %5 = getelementptr inbounds [256 x i8]* @count, i32 0, i64 %4, !dbg !90
  store i8 0, i8* %5, align 1, !dbg !90
  %6 = call i32 @isupper(i32 %i.0), !dbg !92, !intrange !93
  %7 = icmp ne i32 %6, 0, !dbg !92
  br i1 %7, label %8, label %13, !dbg !92

; <label>:8                                       ; preds = %3
  %9 = call i32 @tolower(i32 %i.0), !dbg !94
  %10 = trunc i32 %9 to i8, !dbg !94
  %11 = sext i32 %i.0 to i64, !dbg !94
  %12 = getelementptr inbounds [256 x i8]* @tbl, i32 0, i64 %11, !dbg !94
  store i8 %10, i8* %12, align 1, !dbg !94
  br label %17, !dbg !94

; <label>:13                                      ; preds = %3
  %14 = trunc i32 %i.0 to i8, !dbg !95
  %15 = sext i32 %i.0 to i64, !dbg !95
  %16 = getelementptr inbounds [256 x i8]* @tbl, i32 0, i64 %15, !dbg !95
  store i8 %14, i8* %16, align 1, !dbg !95
  br label %17

; <label>:17                                      ; preds = %13, %8
  %18 = add nsw i32 %i.0, 1, !dbg !96
  br label %1, !dbg !96

; <label>:19                                      ; preds = %1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([23 x i8]* @keep, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @secret, i32 0, i32 0), i64 23, i32 1, i1 false), !dbg !97
  br label %20, !dbg !98

; <label>:20                                      ; preds = %36, %19
  %.0 = phi i8 [ %lower1, %19 ], [ %39, %36 ]
  %21 = zext i8 %.0 to i32, !dbg !98
  %22 = zext i8 %upper2 to i32, !dbg !98
  %23 = icmp slt i32 %21, %22, !dbg !98
  br i1 %23, label %24, label %40, !dbg !98

; <label>:24                                      ; preds = %20
  %25 = sext i8 %.0 to i32, !dbg !99
  %26 = call i32 @tr(i32 %25), !dbg !99
  %27 = trunc i32 %26 to i8, !dbg !99
  %28 = sext i8 %27 to i32, !dbg !101
  %29 = zext i8 %.0 to i32, !dbg !101
  %30 = icmp ne i32 %28, %29, !dbg !101
  br i1 %30, label %31, label %36, !dbg !101

; <label>:31                                      ; preds = %24
  %32 = zext i8 %.0 to i64, !dbg !102
  %33 = getelementptr inbounds [256 x i8]* @count, i32 0, i64 %32, !dbg !102
  %34 = load i8* %33, align 1, !dbg !102
  %35 = add i8 %34, 1, !dbg !102
  store i8 %35, i8* %33, align 1, !dbg !102
  br label %36, !dbg !102

; <label>:36                                      ; preds = %31, %24
  %37 = sext i8 %27 to i32, !dbg !103
  %38 = call i32 @putchar(i32 %37), !dbg !103
  %39 = add i8 %.0, 1, !dbg !104
  br label %20, !dbg !105

; <label>:40                                      ; preds = %20
  ret i32 0, !dbg !106
}

define internal i32 @isupper(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !107, !intrange !73
  %1 = call i32 @__istype(i32 %_c1, i64 32768), !dbg !108, !intrange !93
  ret i32 %1, !dbg !108
}

define internal i32 @tolower(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !110, !intrange !73
  %1 = call i32 @__tolower(i32 %_c1), !dbg !111
  ret i32 %1, !dbg !111
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal i32 @tr(i32 %c) nounwind uwtable ssp {
  %c1 = call i32 @kint_arg.i32(), !id !113
  %1 = sext i32 %c1 to i64, !dbg !114
  %2 = getelementptr inbounds [256 x i8]* @tbl, i32 0, i64 %1, !dbg !114
  %3 = load i8* %2, align 1, !dbg !114
  %4 = sext i8 %3 to i32, !dbg !114
  ret i32 %4, !dbg !114
}

declare i32 @putchar(i32)

declare i32 @__tolower(i32)

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !116, !intrange !117
  %_c1 = call i32 @kint_arg.i32(), !id !118
  %1 = call i32 @isascii(i32 %_c1), !dbg !119, !intrange !93
  %2 = icmp ne i32 %1, 0, !dbg !119
  br i1 %2, label %3, label %10, !dbg !119

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !119
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !119
  %6 = load i32* %5, align 4, !dbg !119
  %7 = zext i32 %6 to i64, !dbg !119
  %8 = and i64 %7, %_f2, !dbg !119
  %9 = icmp ne i64 %8, 0, !dbg !119
  br label %13, !dbg !119

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c1, i64 %_f2), !dbg !121
  %12 = icmp ne i32 %11, 0, !dbg !121
  br label %13, !dbg !121

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !119
  %15 = xor i1 %14, true, !dbg !119
  %16 = zext i1 %15 to i32, !dbg !119
  ret i32 %16, !dbg !121
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !122
  %1 = and i32 %_c1, -128, !dbg !123
  %2 = icmp eq i32 %1, 0, !dbg !123
  %3 = zext i1 %2 to i32, !dbg !123
  ret i32 %3, !dbg !123
}

declare i32 @__maskrune(i32, i64)

declare i32 @sscanf(i8*, i8*, ...)

declare i32 @kint_arg.i32()

declare i8 @kint_arg.i8()

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"lower.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !34} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !17, metadata !20, metadata !22, metadata !23, metadata !28, metadata !29}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 144, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 145} ; [ DW_TAG_subprogram ] [line 144] [def] [scope 145] [main]
!6 = metadata !{i32 786473, metadata !"lower.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !6, metadata !"filter", metadata !"filter", metadata !"", metadata !6, i32 104, metadata !14, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8, i8)* @filter, null, null, metadata !1, i32 105} ; [ DW_TAG_subprogram ] [line 104] [local] [def] [scope 105] [filter]
!14 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !9, metadata !16, metadata !16}
!16 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!17 = metadata !{i32 786478, i32 0, metadata !6, metadata !"tr", metadata !"tr", metadata !"", metadata !6, i32 98, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @tr, null, null, metadata !1, i32 99} ; [ DW_TAG_subprogram ] [line 98] [local] [def] [scope 99] [tr]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !9}
!20 = metadata !{i32 786478, i32 0, metadata !21, metadata !"tolower", metadata !"tolower", metadata !"", metadata !21, i32 309, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @tolower, null, null, metadata !1, i32 310} ; [ DW_TAG_subprogram ] [line 309] [local] [def] [scope 310] [tolower]
!21 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint", null} ; [ DW_TAG_file_type ]
!22 = metadata !{i32 786478, i32 0, metadata !21, metadata !"isupper", metadata !"isupper", metadata !"", metadata !21, i32 290, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isupper, null, null, metadata !1, i32 291} ; [ DW_TAG_subprogram ] [line 290] [local] [def] [scope 291] [isupper]
!23 = metadata !{i32 786478, i32 0, metadata !21, metadata !"__istype", metadata !"__istype", metadata !"", metadata !21, i32 170, metadata !24, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !9, metadata !26, metadata !27}
!26 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !21, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!27 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!28 = metadata !{i32 786478, i32 0, metadata !21, metadata !"isascii", metadata !"isascii", metadata !"", metadata !21, i32 152, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!29 = metadata !{i32 786478, i32 0, metadata !6, metadata !"decode", metadata !"decode", metadata !"", metadata !6, i32 128, metadata !30, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8 (i8*)* @decode, null, null, metadata !1, i32 129} ; [ DW_TAG_subprogram ] [line 128] [local] [def] [scope 129] [decode]
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{metadata !16, metadata !32}
!32 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!33 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !36, metadata !40, metadata !42, metadata !46}
!36 = metadata !{i32 786484, i32 0, null, metadata !"secret", metadata !"secret", metadata !"", metadata !6, i32 73, metadata !37, i32 1, i32 1, [23 x i8]* @secret} ; [ DW_TAG_variable ] [secret] [line 73] [local] [def]
!37 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 184, i64 8, i32 0, i32 0, metadata !33, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 184, align 8, offset 0] [from ]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786465, i64 0, i64 22}       ; [ DW_TAG_subrange_type ] [0, 21]
!40 = metadata !{i32 786484, i32 0, null, metadata !"keep", metadata !"keep", metadata !"", metadata !6, i32 76, metadata !41, i32 1, i32 1, [23 x i8]* @keep} ; [ DW_TAG_variable ] [keep] [line 76] [local] [def]
!41 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 184, i64 8, i32 0, i32 0, metadata !12, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 184, align 8, offset 0] [from char]
!42 = metadata !{i32 786484, i32 0, null, metadata !"tbl", metadata !"tbl", metadata !"", metadata !6, i32 77, metadata !43, i32 1, i32 1, [256 x i8]* @tbl} ; [ DW_TAG_variable ] [tbl] [line 77] [local] [def]
!43 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !12, metadata !44, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ] [0, 254]
!46 = metadata !{i32 786484, i32 0, null, metadata !"count", metadata !"count", metadata !"", metadata !6, i32 75, metadata !47, i32 1, i32 1, [256 x i8]* @count} ; [ DW_TAG_variable ] [count] [line 75] [local] [def]
!47 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !16, metadata !44, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from unsigned char]
!48 = metadata !{metadata !"arg.main.0"}
!49 = metadata !{i32 146, i32 3, metadata !50, null}
!50 = metadata !{i32 786443, metadata !5, i32 145, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!51 = metadata !{i32 147, i32 5, metadata !52, null}
!52 = metadata !{i32 786443, metadata !50, i32 146, i32 18, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!53 = metadata !{i32 148, i32 5, metadata !52, null}
!54 = metadata !{i32 152, i32 3, metadata !50, null}
!55 = metadata !{i32 155, i32 22, metadata !50, null}
!56 = metadata !{i32 156, i32 22, metadata !50, null}
!57 = metadata !{i32 158, i32 3, metadata !50, null}
!58 = metadata !{i32 159, i32 5, metadata !59, null}
!59 = metadata !{i32 786443, metadata !50, i32 158, i32 20, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!60 = metadata !{i32 160, i32 5, metadata !59, null}
!61 = metadata !{i32 162, i32 3, metadata !50, null}
!62 = metadata !{i32 163, i32 5, metadata !63, null}
!63 = metadata !{i32 786443, metadata !50, i32 162, i32 20, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!64 = metadata !{i32 164, i32 5, metadata !63, null}
!65 = metadata !{i32 170, i32 10, metadata !50, null}
!66 = metadata !{i8 0, i8 1}
!67 = metadata !{i32 171, i32 11, metadata !50, null}
!68 = metadata !{i32 172, i32 3, metadata !50, null}
!69 = metadata !{i32 173, i32 5, metadata !70, null}
!70 = metadata !{i32 786443, metadata !50, i32 172, i32 33, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!71 = metadata !{i32 174, i32 5, metadata !70, null}
!72 = metadata !{i32 176, i32 10, metadata !50, null}
!73 = metadata !{i32 0, i32 1}
!74 = metadata !{i32 177, i32 1, metadata !50, null}
!75 = metadata !{i32 130, i32 3, metadata !76, null}
!76 = metadata !{i32 786443, metadata !29, i32 129, i32 1, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!77 = metadata !{i32 131, i32 5, metadata !76, null}
!78 = metadata !{i32 132, i32 3, metadata !76, null}
!79 = metadata !{i32 133, i32 5, metadata !76, null}
!80 = metadata !{i32 135, i32 12, metadata !76, null}
!81 = metadata !{i32 136, i32 3, metadata !76, null}
!82 = metadata !{i32 137, i32 5, metadata !76, null}
!83 = metadata !{i32 138, i32 3, metadata !76, null}
!84 = metadata !{i32 139, i32 1, metadata !76, null}
!85 = metadata !{metadata !"arg._kint.filter.1"}
!86 = metadata !{metadata !"arg._kint.filter.0"}
!87 = metadata !{i32 107, i32 8, metadata !88, null}
!88 = metadata !{i32 786443, metadata !89, i32 107, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!89 = metadata !{i32 786443, metadata !13, i32 105, i32 1, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!90 = metadata !{i32 108, i32 5, metadata !91, null}
!91 = metadata !{i32 786443, metadata !88, i32 107, i32 32, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!92 = metadata !{i32 109, i32 9, metadata !91, null}
!93 = metadata !{i32 0, i32 2}
!94 = metadata !{i32 110, i32 16, metadata !91, null}
!95 = metadata !{i32 112, i32 7, metadata !91, null}
!96 = metadata !{i32 107, i32 27, metadata !88, null}
!97 = metadata !{i32 114, i32 3, metadata !89, null}
!98 = metadata !{i32 115, i32 3, metadata !89, null}
!99 = metadata !{i32 118, i32 10, metadata !100, null}
!100 = metadata !{i32 786443, metadata !89, i32 115, i32 25, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!101 = metadata !{i32 119, i32 5, metadata !100, null}
!102 = metadata !{i32 120, i32 7, metadata !100, null}
!103 = metadata !{i32 121, i32 5, metadata !100, null}
!104 = metadata !{i32 122, i32 5, metadata !100, null}
!105 = metadata !{i32 123, i32 3, metadata !100, null}
!106 = metadata !{i32 124, i32 3, metadata !89, null}
!107 = metadata !{metadata !"arg._kint.isupper.0"}
!108 = metadata !{i32 292, i32 10, metadata !109, null}
!109 = metadata !{i32 786443, metadata !22, i32 291, i32 1, metadata !21, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint//usr/include/ctype.h]
!110 = metadata !{metadata !"arg._kint.tolower.0"}
!111 = metadata !{i32 311, i32 17, metadata !112, null}
!112 = metadata !{i32 786443, metadata !20, i32 310, i32 1, metadata !21, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint//usr/include/ctype.h]
!113 = metadata !{metadata !"arg._kint.tr.0"}
!114 = metadata !{i32 100, i32 3, metadata !115, null}
!115 = metadata !{i32 786443, metadata !17, i32 99, i32 1, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint/lower.c]
!116 = metadata !{metadata !"arg._kint.__istype.1"}
!117 = metadata !{i64 32768, i64 32769}
!118 = metadata !{metadata !"arg._kint.__istype.0"}
!119 = metadata !{i32 175, i32 10, metadata !120, null}
!120 = metadata !{i32 786443, metadata !23, i32 171, i32 1, metadata !21, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint//usr/include/ctype.h]
!121 = metadata !{i32 176, i32 7, metadata !120, null}
!122 = metadata !{metadata !"arg._kint.isascii.0"}
!123 = metadata !{i32 154, i32 2, metadata !124, null}
!124 = metadata !{i32 786443, metadata !28, i32 153, i32 1, metadata !21, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_197_vx74/src/kint//usr/include/ctype.h]
