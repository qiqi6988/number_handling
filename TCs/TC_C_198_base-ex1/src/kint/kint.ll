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
@.str5 = private unnamed_addr constant [43 x i8] c"Odd number of bytes when expecting UTF-16\0A\00", align 1
@.str6 = private unnamed_addr constant [30 x i8] c"Root is a reserved user name\0A\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"UTF-8\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"UTF-16BE\00", align 1
@.str9 = private unnamed_addr constant [9 x i8] c"UTF-16LE\00", align 1
@.str10 = private unnamed_addr constant [7 x i8] c"UTF-16\00", align 1
@.str11 = private unnamed_addr constant [11 x i8] c"iconv_open\00", align 1
@.str12 = private unnamed_addr constant [6 x i8] c"iconv\00", align 1
@.str13 = private unnamed_addr constant [22 x i8] c"User name not UTF-16\0A\00", align 1
@.str14 = private unnamed_addr constant [5 x i8] c"root\00", align 1
@.str15 = private unnamed_addr constant [33 x i8] c"Restricted operations permitted\0A\00", align 1
@.str16 = private unnamed_addr constant [33 x i8] c"Privileged operations permitted\0A\00", align 1
@.str17 = private unnamed_addr constant [184 x i8] c"Usage: %s [options] [input]\0AOptions:\0A  -o file -- output to file (default is standard output)\0A  -t      -- run in trusted mode accepting root as input\0A  -h      -- print this message\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  br label %1, !dbg !27

; <label>:1                                       ; preds = %5, %7, %0
  %output.0 = phi i8* [ null, %0 ], [ %output.0, %7 ], [ %6, %5 ]
  %trusted.0 = phi i32 [ 0, %0 ], [ 1, %7 ], [ %trusted.0, %5 ]
  %2 = call i32 @"\01_getopt"(i32 %argc, i8** %argv, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0)), !dbg !30
  %3 = icmp eq i32 %2, -1, !dbg !32
  br i1 %3, label %14, label %4, !dbg !32

; <label>:4                                       ; preds = %1
  switch i32 %2, label %11 [
    i32 111, label %5
    i32 116, label %7
    i32 104, label %8
  ], !dbg !33

; <label>:5                                       ; preds = %4
  %6 = load i8** @optarg, align 8, !dbg !34
  br label %1, !dbg !36

; <label>:7                                       ; preds = %4
  br label %1, !dbg !37

; <label>:8                                       ; preds = %4
  %9 = getelementptr inbounds i8** %argv, i64 0, !dbg !38
  %10 = load i8** %9, align 8, !dbg !38
  call void @usage(i8* %10), !dbg !38
  br label %44, !dbg !39

; <label>:11                                      ; preds = %4
  %12 = getelementptr inbounds i8** %argv, i64 0, !dbg !40
  %13 = load i8** %12, align 8, !dbg !40
  call void @usage(i8* %13), !dbg !40
  br label %44, !dbg !41

; <label>:14                                      ; preds = %1
  %15 = load i32* @optind, align 4, !dbg !42
  %16 = sub nsw i32 %argc, %15, !dbg !42
  switch i32 %16, label %30 [
    i32 0, label %35
    i32 1, label %17
  ], !dbg !42

; <label>:17                                      ; preds = %14
  %18 = load i32* @optind, align 4, !dbg !43
  %19 = sext i32 %18 to i64, !dbg !43
  %20 = getelementptr inbounds i8** %argv, i64 %19, !dbg !43
  %21 = load i8** %20, align 8, !dbg !43
  %22 = load %struct.__sFILE** @__stdinp, align 8, !dbg !43
  %23 = call %struct.__sFILE* @"\01_freopen"(i8* %21, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), %struct.__sFILE* %22), !dbg !43
  %24 = icmp ne %struct.__sFILE* %23, null, !dbg !43
  br i1 %24, label %35, label %25, !dbg !43

; <label>:25                                      ; preds = %17
  %26 = load i32* @optind, align 4, !dbg !45
  %27 = sext i32 %26 to i64, !dbg !45
  %28 = getelementptr inbounds i8** %argv, i64 %27, !dbg !45
  %29 = load i8** %28, align 8, !dbg !45
  call void @perror(i8* %29), !dbg !45
  br label %44, !dbg !47

; <label>:30                                      ; preds = %14
  %31 = load %struct.__sFILE** @__stderrp, align 8, !dbg !48
  %32 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %31, i8* getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0)), !dbg !48
  %33 = getelementptr inbounds i8** %argv, i64 0, !dbg !49
  %34 = load i8** %33, align 8, !dbg !49
  call void @usage(i8* %34), !dbg !49
  br label %44, !dbg !50

; <label>:35                                      ; preds = %17, %14
  %36 = icmp ne i8* %output.0, null, !dbg !51
  br i1 %36, label %37, label %42, !dbg !51

; <label>:37                                      ; preds = %35
  %38 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !52
  %39 = call %struct.__sFILE* @"\01_freopen"(i8* %output.0, i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0), %struct.__sFILE* %38), !dbg !52
  %40 = icmp ne %struct.__sFILE* %39, null, !dbg !52
  br i1 %40, label %42, label %41, !dbg !52

; <label>:41                                      ; preds = %37
  call void @perror(i8* %output.0), !dbg !53
  br label %44, !dbg !55

; <label>:42                                      ; preds = %37, %35
  %43 = call i32 @filter(i32 %trusted.0), !dbg !56
  br label %44, !dbg !56

; <label>:44                                      ; preds = %42, %41, %30, %25, %11, %8
  %.0 = phi i32 [ 1, %30 ], [ %43, %42 ], [ 1, %41 ], [ 1, %25 ], [ 1, %11 ], [ 0, %8 ]
  ret i32 %.0, !dbg !57
}

declare i32 @"\01_getopt"(i32, i8**, i8*)

define internal void @usage(i8* %prog) nounwind uwtable ssp {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !58
  %2 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([184 x i8]* @.str17, i32 0, i32 0), i8* %prog), !dbg !58
  ret void, !dbg !60
}

declare %struct.__sFILE* @"\01_freopen"(i8*, i8*, %struct.__sFILE*)

declare void @perror(i8*)

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

define internal i32 @filter(i32 %trusted) nounwind uwtable ssp {
  %buf = alloca [512 x i16], align 16
  %inbuf = alloca i8*, align 8
  %inbytes = alloca i64, align 8
  %username = alloca [1024 x i8], align 16
  %outbuf = alloca i8*, align 8
  %outbytes = alloca i64, align 8
  %1 = getelementptr inbounds [512 x i16]* %buf, i32 0, i32 0, !dbg !61
  %2 = bitcast i16* %1 to i8*, !dbg !61
  %3 = load %struct.__sFILE** @__stdinp, align 8, !dbg !61
  %4 = call i64 @fread(i8* %2, i64 1, i64 1022, %struct.__sFILE* %3), !dbg !61
  %5 = icmp ne i64 %4, 1022, !dbg !63
  br i1 %5, label %6, label %13, !dbg !63

; <label>:6                                       ; preds = %0
  %7 = load %struct.__sFILE** @__stdinp, align 8, !dbg !64
  %8 = call i32 @ferror(%struct.__sFILE* %7), !dbg !64
  %9 = icmp ne i32 %8, 0, !dbg !64
  br i1 %9, label %10, label %13, !dbg !64

; <label>:10                                      ; preds = %6
  %11 = load %struct.__sFILE** @__stderrp, align 8, !dbg !65
  %12 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0)), !dbg !65
  br label %85, !dbg !67

; <label>:13                                      ; preds = %6, %0
  %14 = and i64 %4, 1, !dbg !68
  %15 = icmp ne i64 %14, 0, !dbg !68
  br i1 %15, label %16, label %19, !dbg !68

; <label>:16                                      ; preds = %13
  %17 = load %struct.__sFILE** @__stderrp, align 8, !dbg !69
  %18 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([43 x i8]* @.str5, i32 0, i32 0)), !dbg !69
  br label %85, !dbg !71

; <label>:19                                      ; preds = %13
  %20 = lshr i64 %4, 1, !dbg !72
  %21 = getelementptr inbounds [512 x i16]* %buf, i32 0, i64 %20, !dbg !73
  store i16 0, i16* %21, align 2, !dbg !73
  %22 = getelementptr inbounds [512 x i16]* %buf, i32 0, i32 0, !dbg !74
  %23 = call i32 @is_byte_order_mark(i16* %22), !dbg !74
  %24 = icmp ne i32 %trusted, 0, !dbg !75
  br i1 %24, label %46, label %25, !dbg !75

; <label>:25                                      ; preds = %19
  %26 = icmp eq i64 %20, 4, !dbg !76
  br i1 %26, label %27, label %34, !dbg !76

; <label>:27                                      ; preds = %25
  %28 = getelementptr inbounds [512 x i16]* %buf, i32 0, i32 0, !dbg !78
  %29 = call i32 @is_root(i16* %28), !dbg !78
  %30 = icmp ne i32 %29, 0, !dbg !78
  br i1 %30, label %31, label %34, !dbg !78

; <label>:31                                      ; preds = %27
  %32 = load %struct.__sFILE** @__stderrp, align 8, !dbg !79
  %33 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %32, i8* getelementptr inbounds ([30 x i8]* @.str6, i32 0, i32 0)), !dbg !79
  br label %85, !dbg !81

; <label>:34                                      ; preds = %27, %25
  %35 = icmp eq i64 %20, 5, !dbg !82
  br i1 %35, label %36, label %46, !dbg !82

; <label>:36                                      ; preds = %34
  %37 = icmp ne i32 %23, 0, !dbg !82
  br i1 %37, label %38, label %46, !dbg !82

; <label>:38                                      ; preds = %36
  %39 = getelementptr inbounds [512 x i16]* %buf, i32 0, i32 0, !dbg !83
  %40 = getelementptr inbounds i16* %39, i64 1, !dbg !83
  %41 = call i32 @is_root(i16* %40), !dbg !83
  %42 = icmp ne i32 %41, 0, !dbg !83
  br i1 %42, label %43, label %46, !dbg !83

; <label>:43                                      ; preds = %38
  %44 = load %struct.__sFILE** @__stderrp, align 8, !dbg !84
  %45 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %44, i8* getelementptr inbounds ([30 x i8]* @.str6, i32 0, i32 0)), !dbg !84
  br label %85, !dbg !86

; <label>:46                                      ; preds = %34, %36, %38, %19
  %47 = getelementptr inbounds [512 x i16]* %buf, i32 0, i64 0, !dbg !87
  %48 = load i16* %47, align 2, !dbg !87
  %49 = zext i16 %48 to i32, !dbg !87
  switch i32 %49, label %54 [
    i32 65534, label %50
    i32 65279, label %52
  ], !dbg !87

; <label>:50                                      ; preds = %46
  %51 = call i8* @iconv_open(i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0)), !dbg !88
  br label %56, !dbg !90

; <label>:52                                      ; preds = %46
  %53 = call i8* @iconv_open(i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0)), !dbg !91
  br label %56, !dbg !92

; <label>:54                                      ; preds = %46
  %55 = call i8* @iconv_open(i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0)), !dbg !93
  br label %56, !dbg !94

; <label>:56                                      ; preds = %54, %52, %50
  %cd.0 = phi i8* [ %55, %54 ], [ %53, %52 ], [ %51, %50 ]
  %57 = icmp eq i8* %cd.0, inttoptr (i64 -1 to i8*), !dbg !95
  br i1 %57, label %58, label %59, !dbg !95

; <label>:58                                      ; preds = %56
  call void @perror(i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0)), !dbg !96
  br label %85, !dbg !98

; <label>:59                                      ; preds = %56
  %60 = icmp ne i32 %23, 0, !dbg !99
  %61 = getelementptr inbounds [512 x i16]* %buf, i32 0, i32 0, !dbg !99
  %62 = getelementptr inbounds i16* %61, i64 1, !dbg !99
  %63 = select i1 %60, i16* %62, i16* %61, !dbg !99
  %64 = bitcast i16* %63 to i8*, !dbg !99
  store i8* %64, i8** %inbuf, align 8, !dbg !99
  %65 = shl i64 %20, 1, !dbg !100
  store i64 %65, i64* %inbytes, align 8, !dbg !100
  %66 = getelementptr inbounds [1024 x i8]* %username, i32 0, i32 0, !dbg !101
  store i8* %66, i8** %outbuf, align 8, !dbg !101
  store i64 1024, i64* %outbytes, align 8, !dbg !102
  %67 = call i64 @iconv(i8* %cd.0, i8** %inbuf, i64* %inbytes, i8** %outbuf, i64* %outbytes), !dbg !103
  %68 = icmp eq i64 %67, -1, !dbg !104
  br i1 %68, label %69, label %70, !dbg !104

; <label>:69                                      ; preds = %59
  call void @perror(i8* getelementptr inbounds ([6 x i8]* @.str12, i32 0, i32 0)), !dbg !105
  br label %85, !dbg !107

; <label>:70                                      ; preds = %59
  %71 = load i64* %inbytes, align 8, !dbg !108
  %72 = icmp ne i64 %71, 0, !dbg !108
  br i1 %72, label %73, label %76, !dbg !108

; <label>:73                                      ; preds = %70
  %74 = load %struct.__sFILE** @__stderrp, align 8, !dbg !109
  %75 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %74, i8* getelementptr inbounds ([22 x i8]* @.str13, i32 0, i32 0)), !dbg !109
  br label %85, !dbg !111

; <label>:76                                      ; preds = %70
  %77 = getelementptr inbounds [1024 x i8]* %username, i32 0, i32 0, !dbg !112
  %78 = call i32 @strcmp(i8* %77, i8* getelementptr inbounds ([5 x i8]* @.str14, i32 0, i32 0)), !dbg !112
  %79 = icmp ne i32 %78, 0, !dbg !112
  br i1 %79, label %80, label %82, !dbg !112

; <label>:80                                      ; preds = %76
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str15, i32 0, i32 0)), !dbg !113
  br label %84, !dbg !113

; <label>:82                                      ; preds = %76
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str16, i32 0, i32 0)), !dbg !114
  br label %84

; <label>:84                                      ; preds = %82, %80
  br label %85, !dbg !115

; <label>:85                                      ; preds = %84, %73, %69, %58, %43, %31, %16, %10
  %.0 = phi i32 [ 1, %10 ], [ 1, %16 ], [ 1, %58 ], [ 1, %69 ], [ 1, %73 ], [ 0, %84 ], [ 1, %31 ], [ 1, %43 ]
  ret i32 %.0, !dbg !116
}

declare i64 @fread(i8*, i64, i64, %struct.__sFILE*)

declare i32 @ferror(%struct.__sFILE*)

define internal i32 @is_byte_order_mark(i16* %buf) nounwind uwtable ssp {
  %1 = getelementptr inbounds i16* %buf, i64 0, !dbg !117
  %2 = load i16* %1, align 2, !dbg !117
  %3 = zext i16 %2 to i32, !dbg !117
  %4 = icmp eq i32 %3, 65534, !dbg !117
  br i1 %4, label %10, label %5, !dbg !117

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds i16* %buf, i64 0, !dbg !117
  %7 = load i16* %6, align 2, !dbg !117
  %8 = zext i16 %7 to i32, !dbg !117
  %9 = icmp eq i32 %8, 65279, !dbg !117
  br label %10, !dbg !117

; <label>:10                                      ; preds = %5, %0
  %11 = phi i1 [ true, %0 ], [ %9, %5 ]
  %12 = zext i1 %11 to i32, !dbg !117
  ret i32 %12, !dbg !117
}

define internal i32 @is_root(i16* %buf) nounwind uwtable ssp {
  %1 = getelementptr inbounds i16* %buf, i64 0, !dbg !119
  %2 = load i16* %1, align 2, !dbg !119
  %3 = zext i16 %2 to i32, !dbg !119
  %4 = icmp eq i32 %3, 114, !dbg !119
  br i1 %4, label %5, label %20, !dbg !119

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds i16* %buf, i64 1, !dbg !119
  %7 = load i16* %6, align 2, !dbg !119
  %8 = zext i16 %7 to i32, !dbg !119
  %9 = icmp eq i32 %8, 111, !dbg !119
  br i1 %9, label %10, label %20, !dbg !119

; <label>:10                                      ; preds = %5
  %11 = getelementptr inbounds i16* %buf, i64 2, !dbg !119
  %12 = load i16* %11, align 2, !dbg !119
  %13 = zext i16 %12 to i32, !dbg !119
  %14 = icmp eq i32 %13, 111, !dbg !119
  br i1 %14, label %15, label %20, !dbg !119

; <label>:15                                      ; preds = %10
  %16 = getelementptr inbounds i16* %buf, i64 3, !dbg !119
  %17 = load i16* %16, align 2, !dbg !119
  %18 = zext i16 %17 to i32, !dbg !119
  %19 = icmp eq i32 %18, 116, !dbg !119
  br label %20

; <label>:20                                      ; preds = %15, %10, %5, %0
  %21 = phi i1 [ false, %10 ], [ false, %5 ], [ false, %0 ], [ %19, %15 ]
  %22 = zext i1 %21 to i32
  ret i32 %22, !dbg !121
}

declare i8* @iconv_open(i8*, i8*)

declare i64 @iconv(i8*, i8**, i64*, i8**, i64*)

declare i32 @strcmp(i8*, i8*)

declare i32 @printf(i8*, ...)

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"unihan.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !16, metadata !21, metadata !22}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 174, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 175} ; [ DW_TAG_subprogram ] [line 174] [def] [scope 175] [main]
!6 = metadata !{i32 786473, metadata !"unihan.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !6, metadata !"filter", metadata !"filter", metadata !"", metadata !6, i32 89, metadata !14, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @filter, null, null, metadata !1, i32 90} ; [ DW_TAG_subprogram ] [line 89] [local] [def] [scope 90] [filter]
!14 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !9, metadata !9}
!16 = metadata !{i32 786478, i32 0, metadata !6, metadata !"is_root", metadata !"is_root", metadata !"", metadata !6, i32 74, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i16*)* @is_root, null, null, metadata !1, i32 75} ; [ DW_TAG_subprogram ] [line 74] [local] [def] [scope 75] [is_root]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !9, metadata !19}
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned short]
!20 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!21 = metadata !{i32 786478, i32 0, metadata !6, metadata !"is_byte_order_mark", metadata !"is_byte_order_mark", metadata !"", metadata !6, i32 83, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i16*)* @is_byte_order_mark, null, null, metadata !1, i32 84} ; [ DW_TAG_subprogram ] [line 83] [local] [def] [scope 84] [is_byte_order_mark]
!22 = metadata !{i32 786478, i32 0, metadata !6, metadata !"usage", metadata !"usage", metadata !"", metadata !6, i32 163, metadata !23, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @usage, null, null, metadata !1, i32 164} ; [ DW_TAG_subprogram ] [line 163] [local] [def] [scope 164] [usage]
!23 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{null, metadata !25}
!25 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!27 = metadata !{i32 182, i32 3, metadata !28, null}
!28 = metadata !{i32 786443, metadata !29, i32 182, i32 3, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!29 = metadata !{i32 786443, metadata !5, i32 175, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!30 = metadata !{i32 183, i32 13, metadata !31, null}
!31 = metadata !{i32 786443, metadata !28, i32 182, i32 12, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!32 = metadata !{i32 184, i32 5, metadata !31, null}
!33 = metadata !{i32 186, i32 5, metadata !31, null}
!34 = metadata !{i32 188, i32 7, metadata !35, null}
!35 = metadata !{i32 786443, metadata !31, i32 186, i32 16, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!36 = metadata !{i32 189, i32 7, metadata !35, null}
!37 = metadata !{i32 192, i32 7, metadata !35, null}
!38 = metadata !{i32 194, i32 7, metadata !35, null}
!39 = metadata !{i32 195, i32 7, metadata !35, null}
!40 = metadata !{i32 197, i32 7, metadata !35, null}
!41 = metadata !{i32 198, i32 7, metadata !35, null}
!42 = metadata !{i32 202, i32 3, metadata !29, null}
!43 = metadata !{i32 206, i32 10, metadata !44, null}
!44 = metadata !{i32 786443, metadata !29, i32 202, i32 26, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!45 = metadata !{i32 207, i32 7, metadata !46, null}
!46 = metadata !{i32 786443, metadata !44, i32 206, i32 46, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!47 = metadata !{i32 208, i32 7, metadata !46, null}
!48 = metadata !{i32 212, i32 5, metadata !44, null}
!49 = metadata !{i32 213, i32 5, metadata !44, null}
!50 = metadata !{i32 214, i32 5, metadata !44, null}
!51 = metadata !{i32 217, i32 3, metadata !29, null}
!52 = metadata !{i32 217, i32 18, metadata !29, null}
!53 = metadata !{i32 218, i32 5, metadata !54, null}
!54 = metadata !{i32 786443, metadata !29, i32 217, i32 49, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!55 = metadata !{i32 219, i32 5, metadata !54, null}
!56 = metadata !{i32 222, i32 10, metadata !29, null}
!57 = metadata !{i32 223, i32 1, metadata !29, null}
!58 = metadata !{i32 165, i32 3, metadata !59, null}
!59 = metadata !{i32 786443, metadata !22, i32 164, i32 1, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!60 = metadata !{i32 171, i32 1, metadata !59, null}
!61 = metadata !{i32 94, i32 14, metadata !62, null}
!62 = metadata !{i32 786443, metadata !13, i32 90, i32 1, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!63 = metadata !{i32 95, i32 3, metadata !62, null}
!64 = metadata !{i32 95, i32 19, metadata !62, null}
!65 = metadata !{i32 96, i32 5, metadata !66, null}
!66 = metadata !{i32 786443, metadata !62, i32 95, i32 35, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!67 = metadata !{i32 97, i32 5, metadata !66, null}
!68 = metadata !{i32 99, i32 3, metadata !62, null}
!69 = metadata !{i32 100, i32 5, metadata !70, null}
!70 = metadata !{i32 786443, metadata !62, i32 99, i32 14, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!71 = metadata !{i32 101, i32 5, metadata !70, null}
!72 = metadata !{i32 103, i32 3, metadata !62, null}
!73 = metadata !{i32 104, i32 3, metadata !62, null}
!74 = metadata !{i32 106, i32 13, metadata !62, null}
!75 = metadata !{i32 108, i32 3, metadata !62, null}
!76 = metadata !{i32 110, i32 5, metadata !77, null}
!77 = metadata !{i32 786443, metadata !62, i32 108, i32 17, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!78 = metadata !{i32 110, i32 19, metadata !77, null}
!79 = metadata !{i32 111, i32 7, metadata !80, null}
!80 = metadata !{i32 786443, metadata !77, i32 110, i32 34, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!81 = metadata !{i32 112, i32 7, metadata !80, null}
!82 = metadata !{i32 114, i32 5, metadata !77, null}
!83 = metadata !{i32 114, i32 26, metadata !77, null}
!84 = metadata !{i32 115, i32 7, metadata !85, null}
!85 = metadata !{i32 786443, metadata !77, i32 114, i32 45, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!86 = metadata !{i32 116, i32 7, metadata !85, null}
!87 = metadata !{i32 123, i32 3, metadata !62, null}
!88 = metadata !{i32 125, i32 10, metadata !89, null}
!89 = metadata !{i32 786443, metadata !62, i32 123, i32 19, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!90 = metadata !{i32 126, i32 5, metadata !89, null}
!91 = metadata !{i32 128, i32 10, metadata !89, null}
!92 = metadata !{i32 129, i32 5, metadata !89, null}
!93 = metadata !{i32 131, i32 10, metadata !89, null}
!94 = metadata !{i32 132, i32 3, metadata !89, null}
!95 = metadata !{i32 133, i32 3, metadata !62, null}
!96 = metadata !{i32 134, i32 5, metadata !97, null}
!97 = metadata !{i32 786443, metadata !62, i32 133, i32 28, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!98 = metadata !{i32 135, i32 5, metadata !97, null}
!99 = metadata !{i32 137, i32 47, metadata !62, null}
!100 = metadata !{i32 138, i32 26, metadata !62, null}
!101 = metadata !{i32 140, i32 26, metadata !62, null}
!102 = metadata !{i32 141, i32 38, metadata !62, null}
!103 = metadata !{i32 142, i32 18, metadata !62, null}
!104 = metadata !{i32 143, i32 3, metadata !62, null}
!105 = metadata !{i32 144, i32 5, metadata !106, null}
!106 = metadata !{i32 786443, metadata !62, i32 143, i32 30, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!107 = metadata !{i32 145, i32 5, metadata !106, null}
!108 = metadata !{i32 147, i32 3, metadata !62, null}
!109 = metadata !{i32 148, i32 5, metadata !110, null}
!110 = metadata !{i32 786443, metadata !62, i32 147, i32 21, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!111 = metadata !{i32 149, i32 5, metadata !110, null}
!112 = metadata !{i32 153, i32 7, metadata !62, null}
!113 = metadata !{i32 154, i32 5, metadata !62, null}
!114 = metadata !{i32 156, i32 5, metadata !62, null}
!115 = metadata !{i32 157, i32 3, metadata !62, null}
!116 = metadata !{i32 158, i32 1, metadata !62, null}
!117 = metadata !{i32 85, i32 3, metadata !118, null}
!118 = metadata !{i32 786443, metadata !21, i32 84, i32 1, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!119 = metadata !{i32 76, i32 3, metadata !120, null}
!120 = metadata !{i32 786443, metadata !16, i32 75, i32 1, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_198_base-ex1/src/kint/unihan.c]
!121 = metadata !{i32 80, i32 1, metadata !16, null}
