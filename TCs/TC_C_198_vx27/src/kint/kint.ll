; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque

@.str = private unnamed_addr constant [5 x i8] c"o:ht\00", align 1
@optarg = external global i8*
@optind = external global i32
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@__stdinp = external global %struct.__sFILE*
@__stderrp = external global %struct.__sFILE*
@.str2 = private unnamed_addr constant [15 x i8] c"Bad arg count\0A\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@__stdoutp = external global %struct.__sFILE*
@.str4 = private unnamed_addr constant [15 x i8] c"Error on read\0A\00", align 1
@.str5 = private unnamed_addr constant [30 x i8] c"Root is a reserved user name\0A\00", align 1
@.str6 = private unnamed_addr constant [6 x i8] c"UTF-8\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"UTF-16BE\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"UTF-16LE\00", align 1
@.str9 = private unnamed_addr constant [7 x i8] c"UTF-16\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"iconv_open\00", align 1
@.str11 = private unnamed_addr constant [6 x i8] c"iconv\00", align 1
@.str12 = private unnamed_addr constant [22 x i8] c"User name not UTF-16\0A\00", align 1
@.str13 = private unnamed_addr constant [5 x i8] c"root\00", align 1
@.str14 = private unnamed_addr constant [33 x i8] c"Restricted operations permitted\0A\00", align 1
@.str15 = private unnamed_addr constant [33 x i8] c"Privileged operations permitted\0A\00", align 1
@.str16 = private unnamed_addr constant [184 x i8] c"Usage: %s [options] [input]\0AOptions:\0A  -o file -- output to file (default is standard output)\0A  -t      -- run in trusted mode accepting root as input\0A  -h      -- print this message\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  br label %1, !dbg !30

; <label>:1                                       ; preds = %5, %7, %0
  %output.0 = phi i8* [ null, %0 ], [ %output.0, %7 ], [ %6, %5 ]
  %trusted.0 = phi i32 [ 0, %0 ], [ 1, %7 ], [ %trusted.0, %5 ]
  %2 = call i32 @"\01_getopt"(i32 %argc, i8** %argv, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0)), !dbg !33
  %3 = icmp eq i32 %2, -1, !dbg !35
  br i1 %3, label %14, label %4, !dbg !35

; <label>:4                                       ; preds = %1
  switch i32 %2, label %11 [
    i32 111, label %5
    i32 116, label %7
    i32 104, label %8
  ], !dbg !36

; <label>:5                                       ; preds = %4
  %6 = load i8** @optarg, align 8, !dbg !37
  br label %1, !dbg !39

; <label>:7                                       ; preds = %4
  br label %1, !dbg !40

; <label>:8                                       ; preds = %4
  %9 = getelementptr inbounds i8** %argv, i64 0, !dbg !41
  %10 = load i8** %9, align 8, !dbg !41
  call void @usage(i8* %10), !dbg !41
  br label %44, !dbg !42

; <label>:11                                      ; preds = %4
  %12 = getelementptr inbounds i8** %argv, i64 0, !dbg !43
  %13 = load i8** %12, align 8, !dbg !43
  call void @usage(i8* %13), !dbg !43
  br label %44, !dbg !44

; <label>:14                                      ; preds = %1
  %15 = load i32* @optind, align 4, !dbg !45
  %16 = sub nsw i32 %argc, %15, !dbg !45
  switch i32 %16, label %30 [
    i32 0, label %35
    i32 1, label %17
  ], !dbg !45

; <label>:17                                      ; preds = %14
  %18 = load i32* @optind, align 4, !dbg !46
  %19 = sext i32 %18 to i64, !dbg !46
  %20 = getelementptr inbounds i8** %argv, i64 %19, !dbg !46
  %21 = load i8** %20, align 8, !dbg !46
  %22 = load %struct.__sFILE** @__stdinp, align 8, !dbg !46
  %23 = call %struct.__sFILE* @"\01_freopen"(i8* %21, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), %struct.__sFILE* %22), !dbg !46
  %24 = icmp ne %struct.__sFILE* %23, null, !dbg !46
  br i1 %24, label %35, label %25, !dbg !46

; <label>:25                                      ; preds = %17
  %26 = load i32* @optind, align 4, !dbg !48
  %27 = sext i32 %26 to i64, !dbg !48
  %28 = getelementptr inbounds i8** %argv, i64 %27, !dbg !48
  %29 = load i8** %28, align 8, !dbg !48
  call void @perror(i8* %29), !dbg !48
  br label %44, !dbg !50

; <label>:30                                      ; preds = %14
  %31 = load %struct.__sFILE** @__stderrp, align 8, !dbg !51
  %32 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %31, i8* getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0)), !dbg !51
  %33 = getelementptr inbounds i8** %argv, i64 0, !dbg !52
  %34 = load i8** %33, align 8, !dbg !52
  call void @usage(i8* %34), !dbg !52
  br label %44, !dbg !53

; <label>:35                                      ; preds = %17, %14
  %36 = icmp ne i8* %output.0, null, !dbg !54
  br i1 %36, label %37, label %42, !dbg !54

; <label>:37                                      ; preds = %35
  %38 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !55
  %39 = call %struct.__sFILE* @"\01_freopen"(i8* %output.0, i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0), %struct.__sFILE* %38), !dbg !55
  %40 = icmp ne %struct.__sFILE* %39, null, !dbg !55
  br i1 %40, label %42, label %41, !dbg !55

; <label>:41                                      ; preds = %37
  call void @perror(i8* %output.0), !dbg !56
  br label %44, !dbg !58

; <label>:42                                      ; preds = %37, %35
  %43 = call i32 @filter(i32 %trusted.0), !dbg !59
  br label %44, !dbg !59

; <label>:44                                      ; preds = %42, %41, %30, %25, %11, %8
  %.0 = phi i32 [ 1, %30 ], [ %43, %42 ], [ 1, %41 ], [ 1, %25 ], [ 1, %11 ], [ 0, %8 ]
  ret i32 %.0, !dbg !60
}

declare i32 @"\01_getopt"(i32, i8**, i8*)

define internal void @usage(i8* %prog) nounwind uwtable ssp {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !61
  %2 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([184 x i8]* @.str16, i32 0, i32 0), i8* %prog), !dbg !61
  ret void, !dbg !63
}

declare %struct.__sFILE* @"\01_freopen"(i8*, i8*, %struct.__sFILE*)

declare void @perror(i8*)

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

define internal i32 @filter(i32 %trusted) nounwind uwtable ssp {
  %buf = alloca [1024 x i16], align 16
  %inbuf = alloca i8*, align 8
  %inbytes = alloca i64, align 8
  %username = alloca [1024 x i8], align 16
  %outbuf = alloca i8*, align 8
  %outbytes = alloca i64, align 8
  %1 = getelementptr inbounds [1024 x i16]* %buf, i32 0, i32 0, !dbg !64
  %2 = bitcast i16* %1 to i8*, !dbg !64
  %3 = load %struct.__sFILE** @__stdinp, align 8, !dbg !64
  %4 = call i64 @fread(i8* %2, i64 2, i64 2047, %struct.__sFILE* %3), !dbg !64
  %5 = icmp ne i64 %4, 2047, !dbg !66
  br i1 %5, label %6, label %13, !dbg !66

; <label>:6                                       ; preds = %0
  %7 = load %struct.__sFILE** @__stdinp, align 8, !dbg !67
  %8 = call i32 @ferror(%struct.__sFILE* %7), !dbg !67
  %9 = icmp ne i32 %8, 0, !dbg !67
  br i1 %9, label %10, label %13, !dbg !67

; <label>:10                                      ; preds = %6
  %11 = load %struct.__sFILE** @__stderrp, align 8, !dbg !68
  %12 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0)), !dbg !68
  br label %72, !dbg !70

; <label>:13                                      ; preds = %6, %0
  %14 = getelementptr inbounds [1024 x i16]* %buf, i32 0, i64 %4, !dbg !71
  store i16 0, i16* %14, align 2, !dbg !71
  %15 = getelementptr inbounds [1024 x i16]* %buf, i32 0, i32 0, !dbg !72
  %16 = call i32 @is_byte_order_mark(i16* %15), !dbg !72
  %17 = icmp ne i32 %trusted, 0, !dbg !73
  br i1 %17, label %39, label %18, !dbg !73

; <label>:18                                      ; preds = %13
  %19 = icmp eq i64 %4, 4, !dbg !74
  br i1 %19, label %20, label %27, !dbg !74

; <label>:20                                      ; preds = %18
  %21 = getelementptr inbounds [1024 x i16]* %buf, i32 0, i32 0, !dbg !76
  %22 = call i32 @is_root(i16* %21), !dbg !76
  %23 = icmp ne i32 %22, 0, !dbg !76
  br i1 %23, label %24, label %27, !dbg !76

; <label>:24                                      ; preds = %20
  %25 = load %struct.__sFILE** @__stderrp, align 8, !dbg !77
  %26 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %25, i8* getelementptr inbounds ([30 x i8]* @.str5, i32 0, i32 0)), !dbg !77
  br label %72, !dbg !79

; <label>:27                                      ; preds = %20, %18
  %28 = icmp eq i64 %4, 5, !dbg !80
  br i1 %28, label %29, label %39, !dbg !80

; <label>:29                                      ; preds = %27
  %30 = icmp ne i32 %16, 0, !dbg !80
  br i1 %30, label %31, label %39, !dbg !80

; <label>:31                                      ; preds = %29
  %32 = getelementptr inbounds [1024 x i16]* %buf, i32 0, i32 0, !dbg !81
  %33 = getelementptr inbounds i16* %32, i64 1, !dbg !81
  %34 = call i32 @is_root(i16* %33), !dbg !81
  %35 = icmp ne i32 %34, 0, !dbg !81
  br i1 %35, label %36, label %39, !dbg !81

; <label>:36                                      ; preds = %31
  %37 = load %struct.__sFILE** @__stderrp, align 8, !dbg !82
  %38 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %37, i8* getelementptr inbounds ([30 x i8]* @.str5, i32 0, i32 0)), !dbg !82
  br label %72, !dbg !84

; <label>:39                                      ; preds = %27, %29, %31, %13
  %40 = getelementptr inbounds [1024 x i16]* %buf, i32 0, i64 0, !dbg !85
  %41 = load i16* %40, align 2, !dbg !85
  %42 = zext i16 %41 to i32, !dbg !85
  switch i32 %42, label %47 [
    i32 65534, label %43
    i32 65279, label %45
  ], !dbg !85

; <label>:43                                      ; preds = %39
  %44 = call i8* @iconv_open(i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0)), !dbg !86
  br label %49, !dbg !88

; <label>:45                                      ; preds = %39
  %46 = call i8* @iconv_open(i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0)), !dbg !89
  br label %49, !dbg !90

; <label>:47                                      ; preds = %39
  %48 = call i8* @iconv_open(i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0)), !dbg !91
  br label %49, !dbg !92

; <label>:49                                      ; preds = %47, %45, %43
  %cd.0 = phi i8* [ %48, %47 ], [ %46, %45 ], [ %44, %43 ]
  %50 = icmp eq i8* %cd.0, inttoptr (i64 -1 to i8*), !dbg !93
  br i1 %50, label %51, label %52, !dbg !93

; <label>:51                                      ; preds = %49
  call void @perror(i8* getelementptr inbounds ([11 x i8]* @.str10, i32 0, i32 0)), !dbg !94
  br label %72, !dbg !96

; <label>:52                                      ; preds = %49
  %53 = icmp ne i32 %16, 0, !dbg !97
  %54 = getelementptr inbounds [1024 x i16]* %buf, i32 0, i32 0, !dbg !97
  %55 = getelementptr inbounds i16* %54, i64 1, !dbg !97
  %56 = select i1 %53, i16* %55, i16* %54, !dbg !97
  %57 = bitcast i16* %56 to i8*, !dbg !97
  store i8* %57, i8** %inbuf, align 8, !dbg !97
  %58 = mul i64 %4, 2, !dbg !98
  store i64 %58, i64* %inbytes, align 8, !dbg !98
  %59 = getelementptr inbounds [1024 x i8]* %username, i32 0, i32 0, !dbg !99
  store i8* %59, i8** %outbuf, align 8, !dbg !99
  store i64 1024, i64* %outbytes, align 8, !dbg !100
  %60 = call i64 @iconv(i8* %cd.0, i8** %inbuf, i64* %inbytes, i8** %outbuf, i64* %outbytes), !dbg !101
  %61 = icmp eq i64 %60, -1, !dbg !102
  br i1 %61, label %62, label %63, !dbg !102

; <label>:62                                      ; preds = %52
  call void @perror(i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0)), !dbg !103
  br label %72, !dbg !105

; <label>:63                                      ; preds = %52
  %64 = load i64* %inbytes, align 8, !dbg !106
  %65 = icmp ne i64 %64, 0, !dbg !106
  br i1 %65, label %66, label %69, !dbg !106

; <label>:66                                      ; preds = %63
  %67 = load %struct.__sFILE** @__stderrp, align 8, !dbg !107
  %68 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %67, i8* getelementptr inbounds ([22 x i8]* @.str12, i32 0, i32 0)), !dbg !107
  br label %72, !dbg !109

; <label>:69                                      ; preds = %63
  %70 = getelementptr inbounds [1024 x i8]* %username, i32 0, i32 0, !dbg !110
  %71 = call i32 @decide(i8* %70), !dbg !110
  br label %72, !dbg !110

; <label>:72                                      ; preds = %69, %66, %62, %51, %36, %24, %10
  %.0 = phi i32 [ 1, %10 ], [ 1, %51 ], [ 1, %62 ], [ 1, %66 ], [ %71, %69 ], [ 1, %24 ], [ 1, %36 ]
  ret i32 %.0, !dbg !111
}

declare i64 @fread(i8*, i64, i64, %struct.__sFILE*)

declare i32 @ferror(%struct.__sFILE*)

define internal i32 @is_byte_order_mark(i16* %buf) nounwind uwtable ssp {
  %1 = getelementptr inbounds i16* %buf, i64 0, !dbg !112
  %2 = load i16* %1, align 2, !dbg !112
  %3 = zext i16 %2 to i32, !dbg !112
  %4 = icmp eq i32 %3, 65534, !dbg !112
  br i1 %4, label %10, label %5, !dbg !112

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds i16* %buf, i64 0, !dbg !112
  %7 = load i16* %6, align 2, !dbg !112
  %8 = zext i16 %7 to i32, !dbg !112
  %9 = icmp eq i32 %8, 65279, !dbg !112
  br label %10, !dbg !112

; <label>:10                                      ; preds = %5, %0
  %11 = phi i1 [ true, %0 ], [ %9, %5 ]
  %12 = zext i1 %11 to i32, !dbg !112
  ret i32 %12, !dbg !112
}

define internal i32 @is_root(i16* %buf) nounwind uwtable ssp {
  %1 = getelementptr inbounds i16* %buf, i64 0, !dbg !114
  %2 = load i16* %1, align 2, !dbg !114
  %3 = zext i16 %2 to i32, !dbg !114
  %4 = icmp eq i32 %3, 114, !dbg !114
  br i1 %4, label %5, label %20, !dbg !114

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds i16* %buf, i64 1, !dbg !114
  %7 = load i16* %6, align 2, !dbg !114
  %8 = zext i16 %7 to i32, !dbg !114
  %9 = icmp eq i32 %8, 111, !dbg !114
  br i1 %9, label %10, label %20, !dbg !114

; <label>:10                                      ; preds = %5
  %11 = getelementptr inbounds i16* %buf, i64 2, !dbg !114
  %12 = load i16* %11, align 2, !dbg !114
  %13 = zext i16 %12 to i32, !dbg !114
  %14 = icmp eq i32 %13, 111, !dbg !114
  br i1 %14, label %15, label %20, !dbg !114

; <label>:15                                      ; preds = %10
  %16 = getelementptr inbounds i16* %buf, i64 3, !dbg !114
  %17 = load i16* %16, align 2, !dbg !114
  %18 = zext i16 %17 to i32, !dbg !114
  %19 = icmp eq i32 %18, 116, !dbg !114
  br label %20

; <label>:20                                      ; preds = %15, %10, %5, %0
  %21 = phi i1 [ false, %10 ], [ false, %5 ], [ false, %0 ], [ %19, %15 ]
  %22 = zext i1 %21 to i32
  ret i32 %22, !dbg !116
}

declare i8* @iconv_open(i8*, i8*)

declare i64 @iconv(i8*, i8**, i64*, i8**, i64*)

define internal i32 @decide(i8* %username) nounwind uwtable ssp {
  %1 = call i32 @strcmp(i8* %username, i8* getelementptr inbounds ([5 x i8]* @.str13, i32 0, i32 0)), !dbg !117
  %2 = icmp ne i32 %1, 0, !dbg !117
  br i1 %2, label %3, label %5, !dbg !117

; <label>:3                                       ; preds = %0
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str14, i32 0, i32 0)), !dbg !119
  br label %7, !dbg !119

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str15, i32 0, i32 0)), !dbg !120
  br label %7

; <label>:7                                       ; preds = %5, %3
  ret i32 0, !dbg !121
}

declare i32 @strcmp(i8*, i8*)

declare i32 @printf(i8*, ...)

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"unihan.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !16, metadata !19, metadata !24, metadata !25}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 184, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 185} ; [ DW_TAG_subprogram ] [line 184] [def] [scope 185] [main]
!6 = metadata !{i32 786473, metadata !"unihan.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !6, metadata !"filter", metadata !"filter", metadata !"", metadata !6, i32 104, metadata !14, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @filter, null, null, metadata !1, i32 105} ; [ DW_TAG_subprogram ] [line 104] [local] [def] [scope 105] [filter]
!14 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !9, metadata !9}
!16 = metadata !{i32 786478, i32 0, metadata !6, metadata !"decide", metadata !"decide", metadata !"", metadata !6, i32 93, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @decide, null, null, metadata !1, i32 94} ; [ DW_TAG_subprogram ] [line 93] [local] [def] [scope 94] [decide]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !9, metadata !11}
!19 = metadata !{i32 786478, i32 0, metadata !6, metadata !"is_root", metadata !"is_root", metadata !"", metadata !6, i32 78, metadata !20, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i16*)* @is_root, null, null, metadata !1, i32 79} ; [ DW_TAG_subprogram ] [line 78] [local] [def] [scope 79] [is_root]
!20 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{metadata !9, metadata !22}
!22 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned short]
!23 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!24 = metadata !{i32 786478, i32 0, metadata !6, metadata !"is_byte_order_mark", metadata !"is_byte_order_mark", metadata !"", metadata !6, i32 87, metadata !20, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i16*)* @is_byte_order_mark, null, null, metadata !1, i32 88} ; [ DW_TAG_subprogram ] [line 87] [local] [def] [scope 88] [is_byte_order_mark]
!25 = metadata !{i32 786478, i32 0, metadata !6, metadata !"usage", metadata !"usage", metadata !"", metadata !6, i32 173, metadata !26, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @usage, null, null, metadata !1, i32 174} ; [ DW_TAG_subprogram ] [line 173] [local] [def] [scope 174] [usage]
!26 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{null, metadata !28}
!28 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!30 = metadata !{i32 192, i32 3, metadata !31, null}
!31 = metadata !{i32 786443, metadata !32, i32 192, i32 3, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!32 = metadata !{i32 786443, metadata !5, i32 185, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!33 = metadata !{i32 193, i32 13, metadata !34, null}
!34 = metadata !{i32 786443, metadata !31, i32 192, i32 12, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!35 = metadata !{i32 194, i32 5, metadata !34, null}
!36 = metadata !{i32 196, i32 5, metadata !34, null}
!37 = metadata !{i32 198, i32 7, metadata !38, null}
!38 = metadata !{i32 786443, metadata !34, i32 196, i32 16, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!39 = metadata !{i32 199, i32 7, metadata !38, null}
!40 = metadata !{i32 202, i32 7, metadata !38, null}
!41 = metadata !{i32 204, i32 7, metadata !38, null}
!42 = metadata !{i32 205, i32 7, metadata !38, null}
!43 = metadata !{i32 207, i32 7, metadata !38, null}
!44 = metadata !{i32 208, i32 7, metadata !38, null}
!45 = metadata !{i32 212, i32 3, metadata !32, null}
!46 = metadata !{i32 216, i32 10, metadata !47, null}
!47 = metadata !{i32 786443, metadata !32, i32 212, i32 26, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!48 = metadata !{i32 217, i32 7, metadata !49, null}
!49 = metadata !{i32 786443, metadata !47, i32 216, i32 46, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!50 = metadata !{i32 218, i32 7, metadata !49, null}
!51 = metadata !{i32 222, i32 5, metadata !47, null}
!52 = metadata !{i32 223, i32 5, metadata !47, null}
!53 = metadata !{i32 224, i32 5, metadata !47, null}
!54 = metadata !{i32 227, i32 3, metadata !32, null}
!55 = metadata !{i32 227, i32 18, metadata !32, null}
!56 = metadata !{i32 228, i32 5, metadata !57, null}
!57 = metadata !{i32 786443, metadata !32, i32 227, i32 49, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!58 = metadata !{i32 229, i32 5, metadata !57, null}
!59 = metadata !{i32 232, i32 10, metadata !32, null}
!60 = metadata !{i32 233, i32 1, metadata !32, null}
!61 = metadata !{i32 175, i32 3, metadata !62, null}
!62 = metadata !{i32 786443, metadata !25, i32 174, i32 1, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!63 = metadata !{i32 181, i32 1, metadata !62, null}
!64 = metadata !{i32 111, i32 14, metadata !65, null}
!65 = metadata !{i32 786443, metadata !13, i32 105, i32 1, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!66 = metadata !{i32 112, i32 3, metadata !65, null}
!67 = metadata !{i32 112, i32 19, metadata !65, null}
!68 = metadata !{i32 113, i32 5, metadata !69, null}
!69 = metadata !{i32 786443, metadata !65, i32 112, i32 35, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!70 = metadata !{i32 114, i32 5, metadata !69, null}
!71 = metadata !{i32 116, i32 3, metadata !65, null}
!72 = metadata !{i32 118, i32 13, metadata !65, null}
!73 = metadata !{i32 120, i32 3, metadata !65, null}
!74 = metadata !{i32 122, i32 5, metadata !75, null}
!75 = metadata !{i32 786443, metadata !65, i32 120, i32 17, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!76 = metadata !{i32 122, i32 19, metadata !75, null}
!77 = metadata !{i32 123, i32 7, metadata !78, null}
!78 = metadata !{i32 786443, metadata !75, i32 122, i32 34, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!79 = metadata !{i32 124, i32 7, metadata !78, null}
!80 = metadata !{i32 126, i32 5, metadata !75, null}
!81 = metadata !{i32 126, i32 26, metadata !75, null}
!82 = metadata !{i32 127, i32 7, metadata !83, null}
!83 = metadata !{i32 786443, metadata !75, i32 126, i32 45, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!84 = metadata !{i32 128, i32 7, metadata !83, null}
!85 = metadata !{i32 135, i32 3, metadata !65, null}
!86 = metadata !{i32 137, i32 10, metadata !87, null}
!87 = metadata !{i32 786443, metadata !65, i32 135, i32 19, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!88 = metadata !{i32 138, i32 5, metadata !87, null}
!89 = metadata !{i32 140, i32 10, metadata !87, null}
!90 = metadata !{i32 141, i32 5, metadata !87, null}
!91 = metadata !{i32 143, i32 10, metadata !87, null}
!92 = metadata !{i32 144, i32 3, metadata !87, null}
!93 = metadata !{i32 145, i32 3, metadata !65, null}
!94 = metadata !{i32 146, i32 5, metadata !95, null}
!95 = metadata !{i32 786443, metadata !65, i32 145, i32 28, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!96 = metadata !{i32 147, i32 5, metadata !95, null}
!97 = metadata !{i32 151, i32 47, metadata !65, null}
!98 = metadata !{i32 152, i32 46, metadata !65, null}
!99 = metadata !{i32 154, i32 26, metadata !65, null}
!100 = metadata !{i32 155, i32 38, metadata !65, null}
!101 = metadata !{i32 156, i32 18, metadata !65, null}
!102 = metadata !{i32 157, i32 3, metadata !65, null}
!103 = metadata !{i32 158, i32 5, metadata !104, null}
!104 = metadata !{i32 786443, metadata !65, i32 157, i32 30, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!105 = metadata !{i32 159, i32 5, metadata !104, null}
!106 = metadata !{i32 161, i32 3, metadata !65, null}
!107 = metadata !{i32 162, i32 5, metadata !108, null}
!108 = metadata !{i32 786443, metadata !65, i32 161, i32 21, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!109 = metadata !{i32 163, i32 5, metadata !108, null}
!110 = metadata !{i32 167, i32 10, metadata !65, null}
!111 = metadata !{i32 168, i32 1, metadata !65, null}
!112 = metadata !{i32 89, i32 3, metadata !113, null}
!113 = metadata !{i32 786443, metadata !24, i32 88, i32 1, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!114 = metadata !{i32 80, i32 3, metadata !115, null}
!115 = metadata !{i32 786443, metadata !19, i32 79, i32 1, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!116 = metadata !{i32 84, i32 1, metadata !19, null}
!117 = metadata !{i32 96, i32 7, metadata !118, null}
!118 = metadata !{i32 786443, metadata !16, i32 94, i32 1, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_vx27/src/kint/unihan.c]
!119 = metadata !{i32 97, i32 5, metadata !118, null}
!120 = metadata !{i32 99, i32 5, metadata !118, null}
!121 = metadata !{i32 100, i32 3, metadata !118, null}
