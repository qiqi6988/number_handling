; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.sockaddr_storage = type { i8, i8, [6 x i8], i64, [112 x i8] }
%struct.timeval = type { i64, i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }
%struct.addrinfo = type { i32, i32, i32, i32, i32, i8*, %struct.sockaddr*, %struct.addrinfo* }

@__stderrp = external global %struct.__sFILE*
@.str = private unnamed_addr constant [3 x i8] c"o:\00", align 1
@optarg = external global i8*
@optind = external global i32
@.str1 = private unnamed_addr constant [12 x i8] c"bad port %d\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str3 = private unnamed_addr constant [24 x i8] c"cannot open log file %s\00", align 1
@.str4 = private unnamed_addr constant [36 x i8] c"cannot set timeout on accept socket\00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"accept\00", align 1
@.str6 = private unnamed_addr constant [33 x i8] c"cannot set timeout on connection\00", align 1
@.str7 = private unnamed_addr constant [5 x i8] c"read\00", align 1
@.str8 = private unnamed_addr constant [17 x i8] c"response handler\00", align 1
@.str9 = private unnamed_addr constant [6 x i8] c"write\00", align 1
@.str10 = private unnamed_addr constant [41 x i8] c"Error getting bind info for port %s: %s\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"cannot create master socket\00", align 1
@.str12 = private unnamed_addr constant [21 x i8] c"cannot reuse address\00", align 1
@.str13 = private unnamed_addr constant [26 x i8] c"cannot bind master socket\00", align 1
@.str14 = private unnamed_addr constant [31 x i8] c"cannot listen on master socket\00", align 1
@.str15 = private unnamed_addr constant [26 x i8] c"Usage: %s [-o log] port \0A\00", align 1
@.str16 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str17 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @info(i8* %fmt, ...) nounwind uwtable ssp {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !39
  %2 = bitcast %struct.__va_list_tag* %1 to i8*, !dbg !39
  call void @llvm.va_start(i8* %2), !dbg !39
  %3 = load %struct.__sFILE** @__stderrp, align 8, !dbg !41
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !41
  %5 = call i32 @vfprintf(%struct.__sFILE* %3, i8* %fmt, %struct.__va_list_tag* %4), !dbg !41
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !42
  %7 = bitcast %struct.__va_list_tag* %6 to i8*, !dbg !42
  call void @llvm.va_end(i8* %7), !dbg !42
  %8 = load %struct.__sFILE** @__stderrp, align 8, !dbg !43
  %9 = call i32 @fputc(i32 10, %struct.__sFILE* %8), !dbg !43
  ret void, !dbg !44
}

declare void @llvm.va_start(i8*) nounwind

declare i32 @vfprintf(%struct.__sFILE*, i8*, %struct.__va_list_tag*)

declare void @llvm.va_end(i8*) nounwind

declare i32 @fputc(i32, %struct.__sFILE*)

define void @warn(i8* %fmt, ...) nounwind uwtable ssp {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !45
  %2 = bitcast %struct.__va_list_tag* %1 to i8*, !dbg !45
  call void @llvm.va_start(i8* %2), !dbg !45
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !47
  call void @report(i8* %fmt, %struct.__va_list_tag* %3), !dbg !47
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !48
  %5 = bitcast %struct.__va_list_tag* %4 to i8*, !dbg !48
  call void @llvm.va_end(i8* %5), !dbg !48
  ret void, !dbg !49
}

define internal void @report(i8* %fmt, %struct.__va_list_tag* %ap) nounwind uwtable ssp {
  %1 = call i32* @__error(), !dbg !50
  %2 = load i32* %1, align 4, !dbg !50
  %3 = load %struct.__sFILE** @__stderrp, align 8, !dbg !52
  %4 = call i32 @vfprintf(%struct.__sFILE* %3, i8* %fmt, %struct.__va_list_tag* %ap), !dbg !52
  %5 = icmp ne i32 %2, 0, !dbg !53
  %6 = load %struct.__sFILE** @__stderrp, align 8, !dbg !54
  br i1 %5, label %7, label %9, !dbg !53

; <label>:7                                       ; preds = %0
  %8 = call i32 @"\01_fputs"(i8* getelementptr inbounds ([3 x i8]* @.str16, i32 0, i32 0), %struct.__sFILE* %6), !dbg !54
  call void @perror(i8* getelementptr inbounds ([1 x i8]* @.str17, i32 0, i32 0)), !dbg !56
  br label %11, !dbg !57

; <label>:9                                       ; preds = %0
  %10 = call i32 @fputc(i32 10, %struct.__sFILE* %6), !dbg !58
  br label %11

; <label>:11                                      ; preds = %9, %7
  ret void, !dbg !59
}

define void @fatal(i8* %fmt, ...) nounwind uwtable ssp {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !60
  %2 = bitcast %struct.__va_list_tag* %1 to i8*, !dbg !60
  call void @llvm.va_start(i8* %2), !dbg !60
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !62
  call void @report(i8* %fmt, %struct.__va_list_tag* %3), !dbg !62
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0, !dbg !63
  %5 = bitcast %struct.__va_list_tag* %4 to i8*, !dbg !63
  call void @llvm.va_end(i8* %5), !dbg !63
  call void @exit(i32 1) noreturn, !dbg !64
  unreachable, !dbg !64
}

declare void @exit(i32) noreturn

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !65
  br label %1, !dbg !66

; <label>:1                                       ; preds = %7, %5, %0
  %errflg.0 = phi i32 [ 0, %0 ], [ %errflg.0, %5 ], [ %8, %7 ]
  %log.0 = phi i8* [ null, %0 ], [ %6, %5 ], [ %log.0, %7 ]
  %2 = call i32 @"\01_getopt"(i32 %argc1, i8** %argv, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0)), !dbg !68
  %3 = icmp ne i32 %2, -1, !dbg !68
  br i1 %3, label %4, label %9, !dbg !68

; <label>:4                                       ; preds = %1
  %cond = icmp eq i32 %2, 111, !dbg !69
  br i1 %cond, label %5, label %7, !dbg !69

; <label>:5                                       ; preds = %4
  %6 = load i8** @optarg, align 8, !dbg !70
  br label %1, !dbg !72

; <label>:7                                       ; preds = %4
  %8 = add nsw i32 %errflg.0, 1, !dbg !73
  br label %1, !dbg !74

; <label>:9                                       ; preds = %1
  %10 = icmp ne i32 %errflg.0, 0, !dbg !75
  br i1 %10, label %11, label %15, !dbg !75

; <label>:11                                      ; preds = %9
  %12 = getelementptr inbounds i8** %argv, i64 0, !dbg !76
  %13 = load i8** %12, align 8, !dbg !76
  %14 = call i32 @usage(i8* %13), !dbg !76, !intrange !77
  br label %44, !dbg !76

; <label>:15                                      ; preds = %9
  %16 = load i32* @optind, align 4, !dbg !78, !id !79
  %17 = sub nsw i32 %argc1, %16, !dbg !78
  %18 = icmp ne i32 %17, 1, !dbg !78
  br i1 %18, label %19, label %23, !dbg !78

; <label>:19                                      ; preds = %15
  %20 = getelementptr inbounds i8** %argv, i64 0, !dbg !80
  %21 = load i8** %20, align 8, !dbg !80
  %22 = call i32 @usage(i8* %21), !dbg !80, !intrange !77
  br label %44, !dbg !80

; <label>:23                                      ; preds = %15
  %24 = load i32* @optind, align 4, !dbg !81, !id !79
  %25 = sext i32 %24 to i64, !dbg !81
  %26 = getelementptr inbounds i8** %argv, i64 %25, !dbg !81
  %27 = load i8** %26, align 8, !dbg !81
  %28 = call i32 @atoi(i8* %27), !dbg !81
  %29 = icmp sle i32 %28, 0, !dbg !82
  br i1 %29, label %30, label %31, !dbg !82

; <label>:30                                      ; preds = %23
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %28), !dbg !83
  br label %31, !dbg !83

; <label>:31                                      ; preds = %30, %23
  %32 = load %struct.__sFILE** @__stderrp, align 8, !dbg !84
  %33 = call %struct.__sFILE* @"\01_freopen"(i8* %log.0, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), %struct.__sFILE* %32), !dbg !84
  %34 = icmp ne %struct.__sFILE* %33, null, !dbg !84
  br i1 %34, label %36, label %35, !dbg !84

; <label>:35                                      ; preds = %31
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0), i8* %log.0), !dbg !85
  br label %36, !dbg !85

; <label>:36                                      ; preds = %35, %31
  %37 = load %struct.__sFILE** @__stderrp, align 8, !dbg !86
  %38 = call i32 @setvbuf(%struct.__sFILE* %37, i8* null, i32 1, i64 1024), !dbg !86
  %39 = load i32* @optind, align 4, !dbg !87, !id !79
  %40 = sext i32 %39 to i64, !dbg !87
  %41 = getelementptr inbounds i8** %argv, i64 %40, !dbg !87
  %42 = load i8** %41, align 8, !dbg !87
  %43 = call i32 @start(i8* %42), !dbg !87, !intrange !88
  br label %44, !dbg !87

; <label>:44                                      ; preds = %36, %19, %11
  %.0 = phi i32 [ %14, %11 ], [ %22, %19 ], [ %43, %36 ]
  ret i32 %.0, !dbg !89
}

declare i32 @"\01_getopt"(i32, i8**, i8*)

define internal i32 @usage(i8* %prog) nounwind uwtable ssp {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !90
  %2 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([26 x i8]* @.str15, i32 0, i32 0), i8* %prog), !dbg !90
  ret i32 1, !dbg !92
}

declare i32 @atoi(i8*)

declare %struct.__sFILE* @"\01_freopen"(i8*, i8*, %struct.__sFILE*)

declare i32 @setvbuf(%struct.__sFILE*, i8*, i32, i64)

define internal i32 @start(i8* %port) nounwind uwtable ssp {
  %fsin = alloca [1 x %struct.sockaddr_storage], align 16
  %alen = alloca i32, align 4
  %buf = alloca [1024 x i8], align 16
  %tv = alloca %struct.timeval, align 8
  store i32 128, i32* %alen, align 4, !dbg !93
  %1 = call i32 @initserver(i8* %port), !dbg !95, !intrange !77
  %2 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1, !dbg !96
  store i32 0, i32* %2, align 4, !dbg !96, !id !97
  %3 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0, !dbg !98
  store i64 43200, i64* %3, align 8, !dbg !98, !id !99
  %4 = bitcast %struct.timeval* %tv to i8*, !dbg !100
  %5 = call i32 @setsockopt(i32 %1, i32 65535, i32 4102, i8* %4, i32 16), !dbg !100
  %6 = icmp slt i32 %5, 0, !dbg !100
  br i1 %6, label %7, label %8, !dbg !100

; <label>:7                                       ; preds = %0
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0)), !dbg !101
  br label %8, !dbg !101

; <label>:8                                       ; preds = %7, %0
  %9 = getelementptr inbounds [1 x %struct.sockaddr_storage]* %fsin, i32 0, i32 0, !dbg !102
  %10 = bitcast %struct.sockaddr_storage* %9 to %struct.sockaddr*, !dbg !102
  %11 = call i32 @"\01_accept"(i32 %1, %struct.sockaddr* %10, i32* %alen), !dbg !102
  %12 = icmp slt i32 %11, 0, !dbg !103
  br i1 %12, label %13, label %14, !dbg !103

; <label>:13                                      ; preds = %8
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0)), !dbg !104
  br label %14, !dbg !104

; <label>:14                                      ; preds = %13, %8
  %15 = call i32 @"\01_close"(i32 %1), !dbg !105
  %16 = bitcast %struct.timeval* %tv to i8*, !dbg !106
  %17 = call i32 @setsockopt(i32 %11, i32 65535, i32 4102, i8* %16, i32 16), !dbg !106
  %18 = icmp slt i32 %17, 0, !dbg !106
  br i1 %18, label %19, label %20, !dbg !106

; <label>:19                                      ; preds = %14
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0)), !dbg !107
  br label %20, !dbg !107

; <label>:20                                      ; preds = %19, %14
  %21 = getelementptr inbounds [1024 x i8]* %buf, i32 0, i32 0, !dbg !108
  %22 = call i64 @"\01_read"(i32 %11, i8* %21, i64 1024), !dbg !108
  %23 = trunc i64 %22 to i32, !dbg !108
  %24 = icmp slt i32 %23, 0, !dbg !109
  br i1 %24, label %25, label %26, !dbg !109

; <label>:25                                      ; preds = %20
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0)), !dbg !110
  br label %26, !dbg !110

; <label>:26                                      ; preds = %25, %20
  %27 = icmp sge i32 %23, 1024, !dbg !111
  br i1 %27, label %28, label %29, !dbg !111

; <label>:28                                      ; preds = %26
  br label %29, !dbg !112

; <label>:29                                      ; preds = %28, %26
  %n.0 = phi i32 [ 1023, %28 ], [ %23, %26 ]
  %30 = sext i32 %n.0 to i64, !dbg !113
  %31 = getelementptr inbounds [1024 x i8]* %buf, i32 0, i64 %30, !dbg !113
  store i8 0, i8* %31, align 1, !dbg !113
  %32 = getelementptr inbounds [1024 x i8]* %buf, i32 0, i32 0, !dbg !114
  %33 = call i32 @response_handler(i8* %32, i32 %n.0, i64 1024), !dbg !114
  %34 = icmp sgt i32 %33, 1024, !dbg !115
  br i1 %34, label %35, label %36, !dbg !115

; <label>:35                                      ; preds = %29
  br label %36, !dbg !116

; <label>:36                                      ; preds = %35, %29
  %n.1 = phi i32 [ 1024, %35 ], [ %33, %29 ]
  %37 = icmp slt i32 %n.1, 0, !dbg !117
  br i1 %37, label %38, label %39, !dbg !117

; <label>:38                                      ; preds = %36
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([17 x i8]* @.str8, i32 0, i32 0)), !dbg !118
  br label %39, !dbg !118

; <label>:39                                      ; preds = %38, %36
  %40 = icmp sgt i32 %n.1, 0, !dbg !119
  br i1 %40, label %41, label %47, !dbg !119

; <label>:41                                      ; preds = %39
  %42 = getelementptr inbounds [1024 x i8]* %buf, i32 0, i32 0, !dbg !120
  %43 = sext i32 %n.1 to i64, !dbg !120
  %44 = call i64 @"\01_write"(i32 %11, i8* %42, i64 %43), !dbg !120
  %45 = icmp slt i64 %44, 0, !dbg !120
  br i1 %45, label %46, label %47, !dbg !120

; <label>:46                                      ; preds = %41
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([6 x i8]* @.str9, i32 0, i32 0)), !dbg !121
  br label %47, !dbg !121

; <label>:47                                      ; preds = %46, %41, %39
  ret i32 0, !dbg !122
}

define internal i32 @initserver(i8* %port) nounwind uwtable ssp {
  %ai = alloca %struct.addrinfo*, align 8
  %hints = alloca [1 x %struct.addrinfo], align 16
  %reuse = alloca i32, align 4
  %1 = getelementptr inbounds [1 x %struct.addrinfo]* %hints, i32 0, i32 0, !dbg !123
  %2 = bitcast %struct.addrinfo* %1 to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 48, i32 1, i1 false), !dbg !123
  %3 = getelementptr inbounds [1 x %struct.addrinfo]* %hints, i32 0, i32 0, !dbg !125
  %4 = getelementptr inbounds %struct.addrinfo* %3, i32 0, i32 0, !dbg !125
  store i32 1, i32* %4, align 4, !dbg !125, !id !126
  %5 = getelementptr inbounds [1 x %struct.addrinfo]* %hints, i32 0, i32 0, !dbg !127
  %6 = getelementptr inbounds %struct.addrinfo* %5, i32 0, i32 1, !dbg !127
  store i32 2, i32* %6, align 4, !dbg !127, !id !128
  %7 = getelementptr inbounds [1 x %struct.addrinfo]* %hints, i32 0, i32 0, !dbg !129
  %8 = call i32 @getaddrinfo(i8* null, i8* %port, %struct.addrinfo* %7, %struct.addrinfo** %ai), !dbg !129
  %9 = icmp ne i32 %8, 0, !dbg !130
  br i1 %9, label %10, label %14, !dbg !130

; <label>:10                                      ; preds = %0
  %11 = load %struct.__sFILE** @__stderrp, align 8, !dbg !131
  %12 = call i8* @gai_strerror(i32 %8), !dbg !133
  %13 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %11, i8* getelementptr inbounds ([41 x i8]* @.str10, i32 0, i32 0), i8* %port, i8* %12), !dbg !133
  br label %48, !dbg !134

; <label>:14                                      ; preds = %0
  %15 = load %struct.addrinfo** %ai, align 8, !dbg !135
  %16 = getelementptr inbounds %struct.addrinfo* %15, i32 0, i32 1, !dbg !135
  %17 = load i32* %16, align 4, !dbg !135, !id !128, !intrange !136
  %18 = load %struct.addrinfo** %ai, align 8, !dbg !135
  %19 = getelementptr inbounds %struct.addrinfo* %18, i32 0, i32 2, !dbg !135
  %20 = load i32* %19, align 4, !dbg !135, !id !137
  %21 = load %struct.addrinfo** %ai, align 8, !dbg !135
  %22 = getelementptr inbounds %struct.addrinfo* %21, i32 0, i32 3, !dbg !135
  %23 = load i32* %22, align 4, !dbg !135, !id !138
  %24 = call i32 @socket(i32 %17, i32 %20, i32 %23), !dbg !135
  %25 = icmp slt i32 %24, 0, !dbg !139
  br i1 %25, label %26, label %27, !dbg !139

; <label>:26                                      ; preds = %14
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0)), !dbg !140
  br label %27, !dbg !140

; <label>:27                                      ; preds = %26, %14
  store i32 1, i32* %reuse, align 4, !dbg !141
  %28 = bitcast i32* %reuse to i8*, !dbg !142
  %29 = call i32 @setsockopt(i32 %24, i32 65535, i32 4, i8* %28, i32 4), !dbg !142
  %30 = icmp slt i32 %29, 0, !dbg !142
  br i1 %30, label %31, label %32, !dbg !142

; <label>:31                                      ; preds = %27
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([21 x i8]* @.str12, i32 0, i32 0)), !dbg !143
  br label %32, !dbg !143

; <label>:32                                      ; preds = %31, %27
  %33 = load %struct.addrinfo** %ai, align 8, !dbg !144
  %34 = getelementptr inbounds %struct.addrinfo* %33, i32 0, i32 6, !dbg !144
  %35 = load %struct.sockaddr** %34, align 8, !dbg !144
  %36 = load %struct.addrinfo** %ai, align 8, !dbg !144
  %37 = getelementptr inbounds %struct.addrinfo* %36, i32 0, i32 4, !dbg !144
  %38 = load i32* %37, align 4, !dbg !144, !id !145
  %39 = call i32 @"\01_bind"(i32 %24, %struct.sockaddr* %35, i32 %38), !dbg !144
  %40 = icmp slt i32 %39, 0, !dbg !144
  br i1 %40, label %41, label %42, !dbg !144

; <label>:41                                      ; preds = %32
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([26 x i8]* @.str13, i32 0, i32 0)), !dbg !146
  br label %42, !dbg !146

; <label>:42                                      ; preds = %41, %32
  %43 = call i32 @"\01_listen"(i32 %24, i32 10), !dbg !147
  %44 = icmp slt i32 %43, 0, !dbg !147
  br i1 %44, label %45, label %46, !dbg !147

; <label>:45                                      ; preds = %42
  call void (i8*, ...)* @fatal(i8* getelementptr inbounds ([31 x i8]* @.str14, i32 0, i32 0)), !dbg !148
  br label %46, !dbg !148

; <label>:46                                      ; preds = %45, %42
  %47 = load %struct.addrinfo** %ai, align 8, !dbg !149
  call void @freeaddrinfo(%struct.addrinfo* %47), !dbg !149
  br label %48, !dbg !150

; <label>:48                                      ; preds = %46, %10
  %.0 = phi i32 [ 1, %10 ], [ %24, %46 ]
  ret i32 %.0, !dbg !151
}

declare i32 @setsockopt(i32, i32, i32, i8*, i32)

declare i32 @"\01_accept"(i32, %struct.sockaddr*, i32*)

declare i32 @"\01_close"(i32)

declare i64 @"\01_read"(i32, i8*, i64)

declare i32 @response_handler(i8*, i32, i64)

declare i64 @"\01_write"(i32, i8*, i64)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @getaddrinfo(i8*, i8*, %struct.addrinfo*, %struct.addrinfo**)

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

declare i8* @gai_strerror(i32)

declare i32 @socket(i32, i32, i32)

declare i32 @"\01_bind"(i32, %struct.sockaddr*, i32)

declare i32 @"\01_listen"(i32, i32)

declare void @freeaddrinfo(%struct.addrinfo*)

declare i32* @__error()

declare i32 @"\01_fputs"(i8*, %struct.__sFILE*)

declare void @perror(i8*)

declare i32 @kint_arg.i32()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"oneshotsrv.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !12, metadata !13, metadata !14, metadata !20, metadata !23, metadata !24, metadata !25}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"info", metadata !"info", metadata !"", metadata !6, i32 28, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, ...)* @info, null, null, metadata !1, i32 29} ; [ DW_TAG_subprogram ] [line 28] [def] [scope 29] [info]
!6 = metadata !{i32 786473, metadata !"oneshotsrv.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!11 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, i32 0, metadata !6, metadata !"warn", metadata !"warn", metadata !"", metadata !6, i32 53, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, ...)* @warn, null, null, metadata !1, i32 54} ; [ DW_TAG_subprogram ] [line 53] [def] [scope 54] [warn]
!13 = metadata !{i32 786478, i32 0, metadata !6, metadata !"fatal", metadata !"fatal", metadata !"", metadata !6, i32 64, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, ...)* @fatal, null, null, metadata !1, i32 65} ; [ DW_TAG_subprogram ] [line 64] [def] [scope 65] [fatal]
!14 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 155, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 156} ; [ DW_TAG_subprogram ] [line 155] [def] [scope 156] [main]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !17, metadata !17, metadata !18}
!17 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!20 = metadata !{i32 786478, i32 0, metadata !6, metadata !"start", metadata !"start", metadata !"", metadata !6, i32 103, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @start, null, null, metadata !1, i32 104} ; [ DW_TAG_subprogram ] [line 103] [local] [def] [scope 104] [start]
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !17, metadata !9}
!23 = metadata !{i32 786478, i32 0, metadata !6, metadata !"initserver", metadata !"initserver", metadata !"", metadata !6, i32 75, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @initserver, null, null, metadata !1, i32 76} ; [ DW_TAG_subprogram ] [line 75] [local] [def] [scope 76] [initserver]
!24 = metadata !{i32 786478, i32 0, metadata !6, metadata !"usage", metadata !"usage", metadata !"", metadata !6, i32 146, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @usage, null, null, metadata !1, i32 147} ; [ DW_TAG_subprogram ] [line 146] [local] [def] [scope 147] [usage]
!25 = metadata !{i32 786478, i32 0, metadata !6, metadata !"report", metadata !"report", metadata !"", metadata !6, i32 39, metadata !26, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*, %struct.__va_list_tag*)* @report, null, null, metadata !1, i32 40} ; [ DW_TAG_subprogram ] [line 39] [local] [def] [scope 40] [report]
!26 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{null, metadata !9, metadata !28}
!28 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __va_list_tag]
!29 = metadata !{i32 786454, null, metadata !"__va_list_tag", metadata !6, i32 104, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [__va_list_tag] [line 104, size 0, align 0, offset 0] [from __va_list_tag]
!30 = metadata !{i32 786451, null, metadata !"__va_list_tag", metadata !31, i32 104, i64 192, i64 64, i32 0, i32 0, null, metadata !32, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 104, size 192, align 64, offset 0] [from ]
!31 = metadata !{i32 786473, metadata !"<built-in>", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint", null} ; [ DW_TAG_file_type ]
!32 = metadata !{metadata !33, metadata !35, metadata !36, metadata !38}
!33 = metadata !{i32 786445, metadata !30, metadata !"gp_offset", metadata !31, i32 104, i64 32, i64 32, i64 0, i32 0, metadata !34} ; [ DW_TAG_member ] [gp_offset] [line 104, size 32, align 32, offset 0] [from unsigned int]
!34 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!35 = metadata !{i32 786445, metadata !30, metadata !"fp_offset", metadata !31, i32 104, i64 32, i64 32, i64 32, i32 0, metadata !34} ; [ DW_TAG_member ] [fp_offset] [line 104, size 32, align 32, offset 32] [from unsigned int]
!36 = metadata !{i32 786445, metadata !30, metadata !"overflow_arg_area", metadata !31, i32 104, i64 64, i64 64, i64 64, i32 0, metadata !37} ; [ DW_TAG_member ] [overflow_arg_area] [line 104, size 64, align 64, offset 64] [from ]
!37 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!38 = metadata !{i32 786445, metadata !30, metadata !"reg_save_area", metadata !31, i32 104, i64 64, i64 64, i64 128, i32 0, metadata !37} ; [ DW_TAG_member ] [reg_save_area] [line 104, size 64, align 64, offset 128] [from ]
!39 = metadata !{i32 32, i32 3, metadata !40, null}
!40 = metadata !{i32 786443, metadata !5, i32 29, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!41 = metadata !{i32 33, i32 3, metadata !40, null}
!42 = metadata !{i32 34, i32 3, metadata !40, null}
!43 = metadata !{i32 35, i32 3, metadata !40, null}
!44 = metadata !{i32 36, i32 1, metadata !40, null}
!45 = metadata !{i32 57, i32 3, metadata !46, null}
!46 = metadata !{i32 786443, metadata !12, i32 54, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!47 = metadata !{i32 58, i32 3, metadata !46, null}
!48 = metadata !{i32 59, i32 3, metadata !46, null}
!49 = metadata !{i32 60, i32 1, metadata !46, null}
!50 = metadata !{i32 41, i32 13, metadata !51, null}
!51 = metadata !{i32 786443, metadata !25, i32 40, i32 1, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!52 = metadata !{i32 42, i32 3, metadata !51, null}
!53 = metadata !{i32 43, i32 3, metadata !51, null}
!54 = metadata !{i32 44, i32 5, metadata !55, null}
!55 = metadata !{i32 786443, metadata !51, i32 43, i32 17, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!56 = metadata !{i32 45, i32 5, metadata !55, null}
!57 = metadata !{i32 46, i32 3, metadata !55, null}
!58 = metadata !{i32 48, i32 5, metadata !51, null}
!59 = metadata !{i32 49, i32 1, metadata !51, null}
!60 = metadata !{i32 68, i32 3, metadata !61, null}
!61 = metadata !{i32 786443, metadata !13, i32 65, i32 1, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!62 = metadata !{i32 69, i32 3, metadata !61, null}
!63 = metadata !{i32 70, i32 3, metadata !61, null}
!64 = metadata !{i32 71, i32 3, metadata !61, null}
!65 = metadata !{metadata !"arg.main.0"}
!66 = metadata !{i32 163, i32 3, metadata !67, null}
!67 = metadata !{i32 786443, metadata !14, i32 156, i32 1, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!68 = metadata !{i32 163, i32 15, metadata !67, null}
!69 = metadata !{i32 164, i32 5, metadata !67, null}
!70 = metadata !{i32 166, i32 7, metadata !71, null}
!71 = metadata !{i32 786443, metadata !67, i32 164, i32 16, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!72 = metadata !{i32 167, i32 7, metadata !71, null}
!73 = metadata !{i32 169, i32 7, metadata !71, null}
!74 = metadata !{i32 170, i32 5, metadata !71, null}
!75 = metadata !{i32 171, i32 3, metadata !67, null}
!76 = metadata !{i32 172, i32 12, metadata !67, null}
!77 = metadata !{i32 1, i32 2}
!78 = metadata !{i32 174, i32 3, metadata !67, null}
!79 = metadata !{metadata !"var.optind"}
!80 = metadata !{i32 175, i32 12, metadata !67, null}
!81 = metadata !{i32 177, i32 7, metadata !67, null}
!82 = metadata !{i32 178, i32 3, metadata !67, null}
!83 = metadata !{i32 179, i32 5, metadata !67, null}
!84 = metadata !{i32 181, i32 8, metadata !67, null}
!85 = metadata !{i32 182, i32 5, metadata !67, null}
!86 = metadata !{i32 184, i32 3, metadata !67, null}
!87 = metadata !{i32 186, i32 10, metadata !67, null}
!88 = metadata !{i32 0, i32 1}
!89 = metadata !{i32 187, i32 1, metadata !67, null}
!90 = metadata !{i32 148, i32 3, metadata !91, null}
!91 = metadata !{i32 786443, metadata !24, i32 147, i32 1, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!92 = metadata !{i32 151, i32 3, metadata !91, null}
!93 = metadata !{i32 106, i32 32, metadata !94, null}
!94 = metadata !{i32 786443, metadata !20, i32 104, i32 1, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!95 = metadata !{i32 107, i32 15, metadata !94, null}
!96 = metadata !{i32 110, i32 3, metadata !94, null}
!97 = metadata !{metadata !"struct.timeval.1"}
!98 = metadata !{i32 111, i32 3, metadata !94, null}
!99 = metadata !{metadata !"struct.timeval.0"}
!100 = metadata !{i32 112, i32 7, metadata !94, null}
!101 = metadata !{i32 113, i32 5, metadata !94, null}
!102 = metadata !{i32 114, i32 12, metadata !94, null}
!103 = metadata !{i32 115, i32 3, metadata !94, null}
!104 = metadata !{i32 116, i32 5, metadata !94, null}
!105 = metadata !{i32 117, i32 3, metadata !94, null}
!106 = metadata !{i32 127, i32 7, metadata !94, null}
!107 = metadata !{i32 128, i32 5, metadata !94, null}
!108 = metadata !{i32 129, i32 11, metadata !94, null}
!109 = metadata !{i32 130, i32 3, metadata !94, null}
!110 = metadata !{i32 131, i32 5, metadata !94, null}
!111 = metadata !{i32 132, i32 3, metadata !94, null}
!112 = metadata !{i32 133, i32 5, metadata !94, null}
!113 = metadata !{i32 134, i32 3, metadata !94, null}
!114 = metadata !{i32 135, i32 7, metadata !94, null}
!115 = metadata !{i32 136, i32 3, metadata !94, null}
!116 = metadata !{i32 137, i32 5, metadata !94, null}
!117 = metadata !{i32 138, i32 3, metadata !94, null}
!118 = metadata !{i32 139, i32 5, metadata !94, null}
!119 = metadata !{i32 140, i32 3, metadata !94, null}
!120 = metadata !{i32 140, i32 16, metadata !94, null}
!121 = metadata !{i32 141, i32 5, metadata !94, null}
!122 = metadata !{i32 142, i32 3, metadata !94, null}
!123 = metadata !{i32 79, i32 3, metadata !124, null}
!124 = metadata !{i32 786443, metadata !23, i32 76, i32 1, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!125 = metadata !{i32 80, i32 3, metadata !124, null}
!126 = metadata !{metadata !"struct.addrinfo.0"}
!127 = metadata !{i32 81, i32 3, metadata !124, null}
!128 = metadata !{metadata !"struct.addrinfo.1"}
!129 = metadata !{i32 82, i32 12, metadata !124, null}
!130 = metadata !{i32 83, i32 3, metadata !124, null}
!131 = metadata !{i32 84, i32 5, metadata !132, null}
!132 = metadata !{i32 786443, metadata !124, i32 83, i32 11, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx72/src/kint/oneshotsrv.c]
!133 = metadata !{i32 85, i32 12, metadata !132, null}
!134 = metadata !{i32 86, i32 5, metadata !132, null}
!135 = metadata !{i32 88, i32 12, metadata !124, null}
!136 = metadata !{i32 2, i32 3}
!137 = metadata !{metadata !"struct.addrinfo.2"}
!138 = metadata !{metadata !"struct.addrinfo.3"}
!139 = metadata !{i32 89, i32 3, metadata !124, null}
!140 = metadata !{i32 90, i32 5, metadata !124, null}
!141 = metadata !{i32 91, i32 16, metadata !124, null}
!142 = metadata !{i32 92, i32 7, metadata !124, null}
!143 = metadata !{i32 93, i32 5, metadata !124, null}
!144 = metadata !{i32 94, i32 7, metadata !124, null}
!145 = metadata !{metadata !"struct.addrinfo.4"}
!146 = metadata !{i32 95, i32 5, metadata !124, null}
!147 = metadata !{i32 96, i32 7, metadata !124, null}
!148 = metadata !{i32 97, i32 5, metadata !124, null}
!149 = metadata !{i32 98, i32 3, metadata !124, null}
!150 = metadata !{i32 99, i32 3, metadata !124, null}
!151 = metadata !{i32 100, i32 1, metadata !124, null}
