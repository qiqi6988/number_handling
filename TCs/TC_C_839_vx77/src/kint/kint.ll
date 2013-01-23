; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque
%struct.stat = type { i32, i16, i16, i64, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64, i32, i32, i32, i32, [2 x i64] }
%struct.timespec = type { i64, i64 }
%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str1 = private unnamed_addr constant [27 x i8] c"Maximum sample rate is %d\0A\00", align 1
@.str2 = private unnamed_addr constant [27 x i8] c"Minimum sample rate is %d\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"Maximum bits per sample is %d\0A\00", align 1
@.str4 = private unnamed_addr constant [17 x i8] c"Output size %jd\0A\00", align 1
@.str5 = private unnamed_addr constant [87 x i8] c"Usage %s -o <output_file> [options]\0AOptions:\0A  -h               -- print this message\0A\00", align 1
@.str6 = private unnamed_addr constant [21 x i8] c"Can't open file: %s\0A\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"hs:o:\00", align 1
@optarg = external global i8*
@.str8 = private unnamed_addr constant [41 x i8] c"No output file specified with -o option\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"socket failed with error\0A\00", align 1
@.str10 = private unnamed_addr constant [30 x i8] c"setsockopt failed with error\0A\00", align 1
@.str11 = private unnamed_addr constant [27 x i8] c"bind failed with an error\0A\00", align 1
@.str12 = private unnamed_addr constant [26 x i8] c"listen failed with error\0A\00", align 1
@.str13 = private unnamed_addr constant [35 x i8] c"Socket created.  Ready to accept.\0A\00", align 1
@.str14 = private unnamed_addr constant [35 x i8] c"WAVESRV: waiting for a connection\0A\00", align 1
@.str15 = private unnamed_addr constant [34 x i8] c"ECHOSERV: Error calling accept()\0A\00", align 1
@.str16 = private unnamed_addr constant [21 x i8] c"WAVESRV: Connected!\0A\00", align 1
@.str17 = private unnamed_addr constant [32 x i8] c"WAVESRV: Error calling close()\0A\00", align 1

define i16* @get16Value(i8* %array, i16 signext %num_bytes) nounwind uwtable ssp {
  %1 = call i8* @malloc(i64 2), !dbg !100
  %2 = bitcast i8* %1 to i16*, !dbg !100
  %3 = getelementptr inbounds i8* %array, i64 0, !dbg !102
  %4 = load i8* %3, align 1, !dbg !102
  %5 = sext i8 %4 to i32, !dbg !102
  %6 = getelementptr inbounds i8* %array, i64 1, !dbg !102
  %7 = load i8* %6, align 1, !dbg !102
  %8 = sext i8 %7 to i32, !dbg !102
  %9 = shl i32 %8, 8, !dbg !102
  %10 = or i32 %5, %9, !dbg !102
  %11 = trunc i32 %10 to i16, !dbg !102
  store i16 %11, i16* %2, align 2, !dbg !102
  ret i16* %2, !dbg !103
}

declare i8* @malloc(i64)

define i32 @doConversion(i8* %input, i8* %output) nounwind uwtable ssp {
  %buffer = alloca [1024 x i8], align 16
  %bps_array = alloca [2 x i8], align 1
  %report = alloca [1 x %struct.stat], align 16
  %1 = call %struct.__sFILE* @openFile(i8* %output, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0)), !dbg !104
  %2 = bitcast i8* %input to i352*, !dbg !106
  %srcval = load i352* %2, align 1, !dbg !106
  %3 = lshr i352 %srcval, 192, !dbg !107
  %4 = trunc i352 %3 to i8, !dbg !107
  %5 = sext i8 %4 to i32, !dbg !107
  %6 = lshr i352 %srcval, 200, !dbg !107
  %7 = trunc i352 %6 to i8, !dbg !107
  %8 = sext i8 %7 to i32, !dbg !107
  %9 = shl i32 %8, 8, !dbg !107
  %10 = or i32 %5, %9, !dbg !107
  %11 = lshr i352 %srcval, 208, !dbg !107
  %12 = trunc i352 %11 to i8, !dbg !107
  %13 = sext i8 %12 to i32, !dbg !107
  %14 = shl i32 %13, 16, !dbg !107
  %15 = or i32 %10, %14, !dbg !107
  %16 = lshr i352 %srcval, 216, !dbg !107
  %17 = trunc i352 %16 to i8, !dbg !107
  %18 = sext i8 %17 to i32, !dbg !107
  %19 = shl i32 %18, 24, !dbg !107
  %20 = or i32 %15, %19, !dbg !107
  %21 = sext i32 %20 to i64, !dbg !107
  %22 = icmp ugt i64 %21, 44100, !dbg !108
  br i1 %22, label %23, label %26, !dbg !108

; <label>:23                                      ; preds = %0
  %24 = load %struct.__sFILE** @__stderrp, align 8, !dbg !109
  %25 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %24, i8* getelementptr inbounds ([27 x i8]* @.str1, i32 0, i32 0), i32 44100), !dbg !109
  call void @exit(i32 1) noreturn, !dbg !111
  unreachable, !dbg !111

; <label>:26                                      ; preds = %0
  %27 = icmp ult i64 %21, 500, !dbg !112
  br i1 %27, label %28, label %31, !dbg !112

; <label>:28                                      ; preds = %26
  %29 = load %struct.__sFILE** @__stderrp, align 8, !dbg !113
  %30 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %29, i8* getelementptr inbounds ([27 x i8]* @.str2, i32 0, i32 0), i32 500), !dbg !113
  call void @exit(i32 1) noreturn, !dbg !115
  unreachable, !dbg !115

; <label>:31                                      ; preds = %26
  %32 = lshr i352 %srcval, 272, !dbg !116
  %33 = trunc i352 %32 to i8, !dbg !116
  %34 = getelementptr inbounds [2 x i8]* %bps_array, i32 0, i64 0, !dbg !116
  store i8 %33, i8* %34, align 1, !dbg !116
  %35 = lshr i352 %srcval, 280, !dbg !117
  %36 = trunc i352 %35 to i8, !dbg !117
  %37 = getelementptr inbounds [2 x i8]* %bps_array, i32 0, i64 1, !dbg !117
  store i8 %36, i8* %37, align 1, !dbg !117
  %38 = getelementptr inbounds [2 x i8]* %bps_array, i32 0, i32 0, !dbg !118
  %39 = call i16* @get16Value(i8* %38, i16 signext 2), !dbg !118
  %40 = load i16* %39, align 2, !dbg !119
  %41 = sext i16 %40 to i32, !dbg !119
  %42 = icmp sgt i32 %41, 32, !dbg !119
  br i1 %42, label %43, label %46, !dbg !119

; <label>:43                                      ; preds = %31
  %44 = load %struct.__sFILE** @__stderrp, align 8, !dbg !120
  %45 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %44, i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 32), !dbg !120
  call void @exit(i32 1) noreturn, !dbg !122
  unreachable, !dbg !122

; <label>:46                                      ; preds = %31
  %47 = load i16* %39, align 2, !dbg !123
  %48 = sext i16 %47 to i64, !dbg !123
  %49 = mul i64 %48, %21, !dbg !123
  %50 = udiv i64 %49, 8, !dbg !123
  %51 = getelementptr inbounds i8* %input, i64 44, !dbg !124
  br label %52, !dbg !125

; <label>:52                                      ; preds = %66, %46
  %total_bytes_per_second.0 = phi i64 [ %50, %46 ], [ %total_bytes_per_second.1, %66 ]
  %loop_count.0 = phi i32 [ 0, %46 ], [ %67, %66 ]
  %.0 = phi i8* [ %51, %46 ], [ %64, %66 ]
  %53 = icmp ugt i64 %total_bytes_per_second.0, 0, !dbg !125
  br i1 %53, label %54, label %68, !dbg !125

; <label>:54                                      ; preds = %52
  %55 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %55, i8* %.0, i64 1024, i32 1, i1 false), !dbg !127
  %56 = icmp ule i64 %total_bytes_per_second.0, 1024, !dbg !129
  %57 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !130
  br i1 %56, label %58, label %60, !dbg !129

; <label>:58                                      ; preds = %54
  %59 = call i64 @"\01_fwrite"(i8* %57, i64 %total_bytes_per_second.0, i64 1, %struct.__sFILE* %1), !dbg !130
  br label %63, !dbg !132

; <label>:60                                      ; preds = %54
  %61 = call i64 @"\01_fwrite"(i8* %57, i64 1024, i64 1, %struct.__sFILE* %1), !dbg !133
  %62 = sub i64 %total_bytes_per_second.0, 1024, !dbg !135
  br label %63

; <label>:63                                      ; preds = %60, %58
  %total_bytes_per_second.1 = phi i64 [ 0, %58 ], [ %62, %60 ]
  %wt.0 = phi i64 [ %59, %58 ], [ %61, %60 ]
  %64 = getelementptr inbounds i8* %.0, i64 %wt.0, !dbg !136
  %65 = icmp sgt i32 %loop_count.0, 2000, !dbg !137
  br i1 %65, label %68, label %66, !dbg !137

; <label>:66                                      ; preds = %63
  %67 = add nsw i32 %loop_count.0, 1, !dbg !138
  br label %52, !dbg !138

; <label>:68                                      ; preds = %63, %52
  %69 = call i32 @fflush(%struct.__sFILE* %1), !dbg !139
  %70 = call i32 @fileno(%struct.__sFILE* %1), !dbg !140
  %71 = getelementptr inbounds [1 x %struct.stat]* %report, i32 0, i32 0, !dbg !140
  %72 = call i32 @"\01_fstat$INODE64"(i32 %70, %struct.stat* %71), !dbg !140
  %73 = getelementptr inbounds [1 x %struct.stat]* %report, i32 0, i32 0, !dbg !141
  %74 = getelementptr inbounds %struct.stat* %73, i32 0, i32 11, !dbg !141
  %75 = load i64* %74, align 8, !dbg !141, !id !142
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str4, i32 0, i32 0), i64 %75), !dbg !141
  %77 = call i32 @fclose(%struct.__sFILE* %1), !dbg !143
  ret i32 0, !dbg !144
}

define %struct.__sFILE* @openFile(i8* %name, i8* %mode) nounwind uwtable ssp {
  %1 = call %struct.__sFILE* @"\01_fopen"(i8* %name, i8* %mode), !dbg !145
  %2 = icmp ne %struct.__sFILE* %1, null, !dbg !145
  br i1 %2, label %3, label %4, !dbg !145

; <label>:3                                       ; preds = %0
  ret %struct.__sFILE* %1, !dbg !147

; <label>:4                                       ; preds = %0
  %5 = load %struct.__sFILE** @__stderrp, align 8, !dbg !149
  %6 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %5, i8* getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0), i8* %name), !dbg !149
  call void @exit(i32 1) noreturn, !dbg !150
  unreachable, !dbg !150
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

declare void @exit(i32) noreturn

declare i64 @"\01_fwrite"(i8*, i64, i64, %struct.__sFILE*)

declare i32 @fflush(%struct.__sFILE*)

declare i32 @"\01_fstat$INODE64"(i32, %struct.stat*)

declare i32 @fileno(%struct.__sFILE*)

declare i32 @printf(i8*, ...)

declare i32 @fclose(%struct.__sFILE*)

define i8* @ReceiveAudioFile(i32 %sockd) nounwind uwtable ssp {
  %sockd1 = call i32 @kint_arg.i32(), !id !151
  %buffer = alloca [1024 x i8], align 16
  br label %1, !dbg !152

; <label>:1                                       ; preds = %21, %0
  %input.0 = phi i8* [ null, %0 ], [ %9, %21 ]
  %bsize.0 = phi i32 [ 0, %0 ], [ %23, %21 ]
  %2 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !154
  %3 = call i64 @"\01_read"(i32 %sockd1, i8* %2, i64 1024), !dbg !154
  %4 = trunc i64 %3 to i32, !dbg !154
  %5 = icmp sgt i32 %4, 0, !dbg !154
  br i1 %5, label %6, label %24, !dbg !154

; <label>:6                                       ; preds = %1
  %7 = add nsw i32 %bsize.0, %4, !dbg !155
  %8 = sext i32 %7 to i64, !dbg !155
  %9 = call i8* @realloc(i8* %input.0, i64 %8), !dbg !155
  %10 = sext i32 %bsize.0 to i64, !dbg !157
  %11 = getelementptr inbounds i8* %9, i64 %10, !dbg !157
  %12 = call i64 @llvm.objectsize.i64(i8* %11, i1 false), !dbg !158
  %13 = icmp ne i64 %12, -1, !dbg !158
  %14 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !158
  %15 = sext i32 %4 to i64, !dbg !158
  br i1 %13, label %16, label %19, !dbg !158

; <label>:16                                      ; preds = %6
  %17 = call i64 @llvm.objectsize.i64(i8* %11, i1 false), !dbg !158
  %18 = call i8* @__memcpy_chk(i8* %11, i8* %14, i64 %15, i64 %17) nounwind, !dbg !158
  br label %21, !dbg !158

; <label>:19                                      ; preds = %6
  %20 = call i8* @__inline_memcpy_chk(i8* %11, i8* %14, i64 %15), !dbg !158
  br label %21, !dbg !158

; <label>:21                                      ; preds = %19, %16
  %22 = phi i8* [ %18, %16 ], [ %20, %19 ], !dbg !158
  %23 = add nsw i32 %bsize.0, %4, !dbg !159
  br label %1, !dbg !160

; <label>:24                                      ; preds = %1
  ret i8* %input.0, !dbg !161
}

declare i64 @"\01_read"(i32, i8*, i64)

declare i8* @realloc(i8*, i64)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memcpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_memcpy_chk(i8* %__dest, i8* %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !162
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !163
  %2 = call i8* @__memcpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !163
  ret i8* %2, !dbg !163
}

define void @usage(i8* %prog_name) nounwind uwtable ssp {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !165
  %2 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([87 x i8]* @.str5, i32 0, i32 0), i8* %prog_name), !dbg !165
  ret void, !dbg !167
}

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !168
  %sin = alloca %struct.sockaddr_in, align 4
  %opts = alloca i32, align 4
  store i32 1, i32* %opts, align 4, !dbg !169
  br label %1, !dbg !171

; <label>:1                                       ; preds = %8, %4, %0
  %output_name.0 = phi i8* [ null, %0 ], [ %output_name.0, %4 ], [ %9, %8 ]
  %2 = call i32 @"\01_getopt"(i32 %argc1, i8** %argv, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0)), !dbg !173
  %3 = icmp eq i32 %2, -1, !dbg !175
  br i1 %3, label %10, label %4, !dbg !175

; <label>:4                                       ; preds = %1
  switch i32 %2, label %1 [
    i32 104, label %5
    i32 111, label %8
  ], !dbg !176

; <label>:5                                       ; preds = %4
  %6 = getelementptr inbounds i8** %argv, i64 0, !dbg !177
  %7 = load i8** %6, align 8, !dbg !177
  call void @usage(i8* %7), !dbg !177
  ret i32 0, !dbg !179

; <label>:8                                       ; preds = %4
  %9 = load i8** @optarg, align 8, !dbg !180
  br label %1, !dbg !181

; <label>:10                                      ; preds = %1
  %11 = icmp eq i8* %output_name.0, null, !dbg !182
  br i1 %11, label %12, label %15, !dbg !182

; <label>:12                                      ; preds = %10
  %13 = load %struct.__sFILE** @__stderrp, align 8, !dbg !183
  %14 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %13, i8* getelementptr inbounds ([41 x i8]* @.str8, i32 0, i32 0)), !dbg !183
  call void @exit(i32 1) noreturn, !dbg !185
  unreachable, !dbg !185

; <label>:15                                      ; preds = %10
  %16 = bitcast %struct.sockaddr_in* %sin to i8*, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 16, i32 1, i1 false), !dbg !186
  %17 = getelementptr inbounds %struct.sockaddr_in* %sin, i32 0, i32 1, !dbg !187
  store i8 2, i8* %17, align 1, !dbg !187, !id !188
  %18 = getelementptr inbounds %struct.sockaddr_in* %sin, i32 0, i32 3, !dbg !189
  %19 = getelementptr inbounds %struct.in_addr* %18, i32 0, i32 0, !dbg !189
  store i32 0, i32* %19, align 4, !dbg !189, !id !190
  %20 = getelementptr inbounds %struct.sockaddr_in* %sin, i32 0, i32 2, !dbg !191
  store i16 31523, i16* %20, align 2, !dbg !191, !id !192
  %21 = call i32 @socket(i32 2, i32 1, i32 6), !dbg !193
  %22 = icmp slt i32 %21, 0, !dbg !193
  br i1 %22, label %23, label %26, !dbg !193

; <label>:23                                      ; preds = %15
  %24 = load %struct.__sFILE** @__stderrp, align 8, !dbg !194
  %25 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %24, i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0)), !dbg !194
  call void @exit(i32 1) noreturn, !dbg !196
  unreachable, !dbg !196

; <label>:26                                      ; preds = %15
  %27 = bitcast i32* %opts to i8*, !dbg !197
  %28 = call i32 @setsockopt(i32 %21, i32 65535, i32 4, i8* %27, i32 4), !dbg !197
  %29 = icmp slt i32 %28, 0, !dbg !197
  br i1 %29, label %30, label %33, !dbg !197

; <label>:30                                      ; preds = %26
  %31 = load %struct.__sFILE** @__stderrp, align 8, !dbg !198
  %32 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %31, i8* getelementptr inbounds ([30 x i8]* @.str10, i32 0, i32 0)), !dbg !198
  call void @exit(i32 1) noreturn, !dbg !200
  unreachable, !dbg !200

; <label>:33                                      ; preds = %26
  %34 = bitcast %struct.sockaddr_in* %sin to %struct.sockaddr*, !dbg !201
  %35 = call i32 @"\01_bind"(i32 %21, %struct.sockaddr* %34, i32 16), !dbg !201
  %36 = icmp slt i32 %35, 0, !dbg !201
  br i1 %36, label %37, label %40, !dbg !201

; <label>:37                                      ; preds = %33
  %38 = load %struct.__sFILE** @__stderrp, align 8, !dbg !202
  %39 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %38, i8* getelementptr inbounds ([27 x i8]* @.str11, i32 0, i32 0)), !dbg !202
  call void @exit(i32 1) noreturn, !dbg !204
  unreachable, !dbg !204

; <label>:40                                      ; preds = %33
  %41 = call i32 @"\01_listen"(i32 %21, i32 1024), !dbg !205
  %42 = icmp slt i32 %41, 0, !dbg !205
  %43 = load %struct.__sFILE** @__stderrp, align 8, !dbg !206
  br i1 %42, label %44, label %46, !dbg !205

; <label>:44                                      ; preds = %40
  %45 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %43, i8* getelementptr inbounds ([26 x i8]* @.str12, i32 0, i32 0)), !dbg !206
  call void @exit(i32 1) noreturn, !dbg !208
  unreachable, !dbg !208

; <label>:46                                      ; preds = %40
  %47 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %43, i8* getelementptr inbounds ([35 x i8]* @.str13, i32 0, i32 0)), !dbg !209
  %48 = load %struct.__sFILE** @__stderrp, align 8, !dbg !210
  %49 = call i32 @fflush(%struct.__sFILE* %48), !dbg !210
  %50 = load %struct.__sFILE** @__stderrp, align 8, !dbg !211
  %51 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %50, i8* getelementptr inbounds ([35 x i8]* @.str14, i32 0, i32 0)), !dbg !211
  %52 = load %struct.__sFILE** @__stderrp, align 8, !dbg !212
  %53 = call i32 @fflush(%struct.__sFILE* %52), !dbg !212
  %54 = call i32 @"\01_accept"(i32 %21, %struct.sockaddr* null, i32* null), !dbg !213
  %55 = icmp slt i32 %54, 0, !dbg !213
  %56 = load %struct.__sFILE** @__stderrp, align 8, !dbg !214
  br i1 %55, label %57, label %59, !dbg !213

; <label>:57                                      ; preds = %46
  %58 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %56, i8* getelementptr inbounds ([34 x i8]* @.str15, i32 0, i32 0)), !dbg !214
  call void @exit(i32 1) noreturn, !dbg !216
  unreachable, !dbg !216

; <label>:59                                      ; preds = %46
  %60 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %56, i8* getelementptr inbounds ([21 x i8]* @.str16, i32 0, i32 0)), !dbg !217
  %61 = load %struct.__sFILE** @__stderrp, align 8, !dbg !218
  %62 = call i32 @fflush(%struct.__sFILE* %61), !dbg !218
  %63 = call i8* @ReceiveAudioFile(i32 %54), !dbg !219
  %64 = call i32 @"\01_close"(i32 %54), !dbg !220
  %65 = icmp slt i32 %64, 0, !dbg !220
  br i1 %65, label %66, label %69, !dbg !220

; <label>:66                                      ; preds = %59
  %67 = load %struct.__sFILE** @__stderrp, align 8, !dbg !221
  %68 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %67, i8* getelementptr inbounds ([32 x i8]* @.str17, i32 0, i32 0)), !dbg !221
  call void @exit(i32 1) noreturn, !dbg !223
  unreachable, !dbg !223

; <label>:69                                      ; preds = %59
  %70 = call i32 @doConversion(i8* %63, i8* %output_name.0), !dbg !224, !intrange !225
  call void @exit(i32 %70) noreturn, !dbg !226
  unreachable, !dbg !226
}

declare i32 @"\01_getopt"(i32, i8**, i8*)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @socket(i32, i32, i32)

declare i32 @setsockopt(i32, i32, i32, i8*, i32)

declare i32 @"\01_bind"(i32, %struct.sockaddr*, i32)

declare i32 @"\01_listen"(i32, i32)

declare i32 @"\01_accept"(i32, %struct.sockaddr*, i32*)

declare i32 @"\01_close"(i32)

declare i32 @kint_arg.i32()

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"main.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !15, metadata !20, metadata !23, metadata !28, metadata !87, metadata !91}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"get16Value", metadata !"get16Value", metadata !"", metadata !6, i32 90, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16* (i8*, i16)* @get16Value, null, null, metadata !1, i32 90} ; [ DW_TAG_subprogram ] [line 90] [def] [get16Value]
!6 = metadata !{i32 786473, metadata !"main.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !12, metadata !10}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int16_t]
!10 = metadata !{i32 786454, null, metadata !"int16_t", metadata !6, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [int16_t] [line 85, size 0, align 0, offset 0] [from short]
!11 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from byte_t]
!13 = metadata !{i32 786454, null, metadata !"byte_t", metadata !6, i32 86, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ] [byte_t] [line 86, size 0, align 0, offset 0] [from char]
!14 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{i32 786478, i32 0, metadata !6, metadata !"doConversion", metadata !"doConversion", metadata !"", metadata !6, i32 96, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i8*)* @doConversion, null, null, metadata !1, i32 96} ; [ DW_TAG_subprogram ] [line 96] [def] [doConversion]
!16 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !18, metadata !12, metadata !19}
!18 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!20 = metadata !{i32 786478, i32 0, metadata !6, metadata !"ReceiveAudioFile", metadata !"ReceiveAudioFile", metadata !"", metadata !6, i32 165, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i32)* @ReceiveAudioFile, null, null, metadata !1, i32 165} ; [ DW_TAG_subprogram ] [line 165] [def] [ReceiveAudioFile]
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !12, metadata !18}
!23 = metadata !{i32 786478, i32 0, metadata !6, metadata !"usage", metadata !"usage", metadata !"", metadata !6, i32 184, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @usage, null, null, metadata !1, i32 184} ; [ DW_TAG_subprogram ] [line 184] [def] [usage]
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !26}
!26 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!28 = metadata !{i32 786478, i32 0, metadata !6, metadata !"openFile", metadata !"openFile", metadata !"", metadata !6, i32 190, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.__sFILE* (i8*, i8*)* @openFile, null, null, metadata !1, i32 190} ; [ DW_TAG_subprogram ] [line 190] [def] [openFile]
!29 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !31, metadata !19, metadata !19}
!31 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!32 = metadata !{i32 786454, null, metadata !"FILE", metadata !6, i32 161, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ] [FILE] [line 161, size 0, align 0, offset 0] [from __sFILE]
!33 = metadata !{i32 786451, null, metadata !"__sFILE", metadata !34, i32 130, i64 1216, i64 64, i32 0, i32 0, null, metadata !35, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__sFILE] [line 130, size 1216, align 64, offset 0] [from ]
!34 = metadata !{i32 786473, metadata !"/usr/include/stdio.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint", null} ; [ DW_TAG_file_type ]
!35 = metadata !{metadata !36, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !48, metadata !49, metadata !51, metadata !55, metadata !59, metadata !67, metadata !71, metadata !72, metadata !75, metadata !76, metadata !80, metadata !84, metadata !85, metadata !86}
!36 = metadata !{i32 786445, metadata !33, metadata !"_p", metadata !34, i32 131, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_member ] [_p] [line 131, size 64, align 64, offset 0] [from ]
!37 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned char]
!38 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!39 = metadata !{i32 786445, metadata !33, metadata !"_r", metadata !34, i32 132, i64 32, i64 32, i64 64, i32 0, metadata !18} ; [ DW_TAG_member ] [_r] [line 132, size 32, align 32, offset 64] [from int]
!40 = metadata !{i32 786445, metadata !33, metadata !"_w", metadata !34, i32 133, i64 32, i64 32, i64 96, i32 0, metadata !18} ; [ DW_TAG_member ] [_w] [line 133, size 32, align 32, offset 96] [from int]
!41 = metadata !{i32 786445, metadata !33, metadata !"_flags", metadata !34, i32 134, i64 16, i64 16, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [_flags] [line 134, size 16, align 16, offset 128] [from short]
!42 = metadata !{i32 786445, metadata !33, metadata !"_file", metadata !34, i32 135, i64 16, i64 16, i64 144, i32 0, metadata !11} ; [ DW_TAG_member ] [_file] [line 135, size 16, align 16, offset 144] [from short]
!43 = metadata !{i32 786445, metadata !33, metadata !"_bf", metadata !34, i32 136, i64 128, i64 64, i64 192, i32 0, metadata !44} ; [ DW_TAG_member ] [_bf] [line 136, size 128, align 64, offset 192] [from __sbuf]
!44 = metadata !{i32 786451, null, metadata !"__sbuf", metadata !34, i32 96, i64 128, i64 64, i32 0, i32 0, null, metadata !45, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__sbuf] [line 96, size 128, align 64, offset 0] [from ]
!45 = metadata !{metadata !46, metadata !47}
!46 = metadata !{i32 786445, metadata !44, metadata !"_base", metadata !34, i32 97, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_member ] [_base] [line 97, size 64, align 64, offset 0] [from ]
!47 = metadata !{i32 786445, metadata !44, metadata !"_size", metadata !34, i32 98, i64 32, i64 32, i64 64, i32 0, metadata !18} ; [ DW_TAG_member ] [_size] [line 98, size 32, align 32, offset 64] [from int]
!48 = metadata !{i32 786445, metadata !33, metadata !"_lbfsize", metadata !34, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !18} ; [ DW_TAG_member ] [_lbfsize] [line 137, size 32, align 32, offset 320] [from int]
!49 = metadata !{i32 786445, metadata !33, metadata !"_cookie", metadata !34, i32 140, i64 64, i64 64, i64 384, i32 0, metadata !50} ; [ DW_TAG_member ] [_cookie] [line 140, size 64, align 64, offset 384] [from ]
!50 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!51 = metadata !{i32 786445, metadata !33, metadata !"_close", metadata !34, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !52} ; [ DW_TAG_member ] [_close] [line 141, size 64, align 64, offset 448] [from ]
!52 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!53 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{metadata !18, metadata !50}
!55 = metadata !{i32 786445, metadata !33, metadata !"_read", metadata !34, i32 142, i64 64, i64 64, i64 512, i32 0, metadata !56} ; [ DW_TAG_member ] [_read] [line 142, size 64, align 64, offset 512] [from ]
!56 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!57 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !18, metadata !50, metadata !19, metadata !18}
!59 = metadata !{i32 786445, metadata !33, metadata !"_seek", metadata !34, i32 143, i64 64, i64 64, i64 576, i32 0, metadata !60} ; [ DW_TAG_member ] [_seek] [line 143, size 64, align 64, offset 576] [from ]
!60 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!61 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{metadata !63, metadata !50, metadata !63, metadata !18}
!63 = metadata !{i32 786454, null, metadata !"fpos_t", metadata !34, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [fpos_t] [line 85, size 0, align 0, offset 0] [from __darwin_off_t]
!64 = metadata !{i32 786454, null, metadata !"__darwin_off_t", metadata !34, i32 110, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [__darwin_off_t] [line 110, size 0, align 0, offset 0] [from __int64_t]
!65 = metadata !{i32 786454, null, metadata !"__int64_t", metadata !34, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__int64_t] [line 46, size 0, align 0, offset 0] [from long long int]
!66 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!67 = metadata !{i32 786445, metadata !33, metadata !"_write", metadata !34, i32 144, i64 64, i64 64, i64 640, i32 0, metadata !68} ; [ DW_TAG_member ] [_write] [line 144, size 64, align 64, offset 640] [from ]
!68 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!69 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{metadata !18, metadata !50, metadata !26, metadata !18}
!71 = metadata !{i32 786445, metadata !33, metadata !"_ub", metadata !34, i32 147, i64 128, i64 64, i64 704, i32 0, metadata !44} ; [ DW_TAG_member ] [_ub] [line 147, size 128, align 64, offset 704] [from __sbuf]
!72 = metadata !{i32 786445, metadata !33, metadata !"_extra", metadata !34, i32 148, i64 64, i64 64, i64 832, i32 0, metadata !73} ; [ DW_TAG_member ] [_extra] [line 148, size 64, align 64, offset 832] [from ]
!73 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __sFILEX]
!74 = metadata !{i32 786451, null, metadata !"__sFILEX", metadata !34, i32 102, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [__sFILEX] [line 102, size 0, align 0, offset 0] [fwd] [from ]
!75 = metadata !{i32 786445, metadata !33, metadata !"_ur", metadata !34, i32 149, i64 32, i64 32, i64 896, i32 0, metadata !18} ; [ DW_TAG_member ] [_ur] [line 149, size 32, align 32, offset 896] [from int]
!76 = metadata !{i32 786445, metadata !33, metadata !"_ubuf", metadata !34, i32 152, i64 24, i64 8, i64 928, i32 0, metadata !77} ; [ DW_TAG_member ] [_ubuf] [line 152, size 24, align 8, offset 928] [from ]
!77 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 24, i64 8, i32 0, i32 0, metadata !38, metadata !78, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 24, align 8, offset 0] [from unsigned char]
!78 = metadata !{metadata !79}
!79 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!80 = metadata !{i32 786445, metadata !33, metadata !"_nbuf", metadata !34, i32 153, i64 8, i64 8, i64 952, i32 0, metadata !81} ; [ DW_TAG_member ] [_nbuf] [line 153, size 8, align 8, offset 952] [from ]
!81 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !38, metadata !82, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from unsigned char]
!82 = metadata !{metadata !83}
!83 = metadata !{i32 786465, i64 0, i64 0}        ; [ DW_TAG_subrange_type ] [0, -1]
!84 = metadata !{i32 786445, metadata !33, metadata !"_lb", metadata !34, i32 156, i64 128, i64 64, i64 960, i32 0, metadata !44} ; [ DW_TAG_member ] [_lb] [line 156, size 128, align 64, offset 960] [from __sbuf]
!85 = metadata !{i32 786445, metadata !33, metadata !"_blksize", metadata !34, i32 159, i64 32, i64 32, i64 1088, i32 0, metadata !18} ; [ DW_TAG_member ] [_blksize] [line 159, size 32, align 32, offset 1088] [from int]
!86 = metadata !{i32 786445, metadata !33, metadata !"_offset", metadata !34, i32 160, i64 64, i64 64, i64 1152, i32 0, metadata !63} ; [ DW_TAG_member ] [_offset] [line 160, size 64, align 64, offset 1152] [from fpos_t]
!87 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 201, metadata !88, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 201} ; [ DW_TAG_subprogram ] [line 201] [def] [main]
!88 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!89 = metadata !{metadata !18, metadata !18, metadata !90}
!90 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!91 = metadata !{i32 786478, i32 0, metadata !92, metadata !"__inline_memcpy_chk", metadata !"__inline_memcpy_chk", metadata !"", metadata !92, i32 59, metadata !93, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_memcpy_chk, null, null, metadata !1, i32 60} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 60] [__inline_memcpy_chk]
!92 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint", null} ; [ DW_TAG_file_type ]
!93 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = metadata !{metadata !50, metadata !50, metadata !95, metadata !97}
!95 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !96} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!96 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = metadata !{i32 786454, null, metadata !"size_t", metadata !6, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !98} ; [ DW_TAG_typedef ] [size_t] [line 48, size 0, align 0, offset 0] [from __darwin_size_t]
!98 = metadata !{i32 786454, null, metadata !"__darwin_size_t", metadata !6, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !99} ; [ DW_TAG_typedef ] [__darwin_size_t] [line 90, size 0, align 0, offset 0] [from long unsigned int]
!99 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!100 = metadata !{i32 91, i32 31, metadata !101, null}
!101 = metadata !{i32 786443, metadata !5, i32 90, i32 59, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!102 = metadata !{i32 92, i32 2, metadata !101, null}
!103 = metadata !{i32 93, i32 2, metadata !101, null}
!104 = metadata !{i32 106, i32 8, metadata !105, null}
!105 = metadata !{i32 786443, metadata !15, i32 96, i32 47, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!106 = metadata !{i32 109, i32 2, metadata !105, null}
!107 = metadata !{i32 111, i32 2, metadata !105, null}
!108 = metadata !{i32 113, i32 2, metadata !105, null}
!109 = metadata !{i32 114, i32 3, metadata !110, null}
!110 = metadata !{i32 786443, metadata !105, i32 113, i32 29, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!111 = metadata !{i32 115, i32 3, metadata !110, null}
!112 = metadata !{i32 117, i32 2, metadata !105, null}
!113 = metadata !{i32 118, i32 3, metadata !114, null}
!114 = metadata !{i32 786443, metadata !105, i32 117, i32 25, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!115 = metadata !{i32 119, i32 3, metadata !114, null}
!116 = metadata !{i32 122, i32 2, metadata !105, null}
!117 = metadata !{i32 123, i32 2, metadata !105, null}
!118 = metadata !{i32 125, i32 20, metadata !105, null}
!119 = metadata !{i32 130, i32 2, metadata !105, null}
!120 = metadata !{i32 131, i32 3, metadata !121, null}
!121 = metadata !{i32 786443, metadata !105, i32 130, i32 45, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!122 = metadata !{i32 132, i32 3, metadata !121, null}
!123 = metadata !{i32 135, i32 2, metadata !105, null}
!124 = metadata !{i32 138, i32 2, metadata !105, null}
!125 = metadata !{i32 141, i32 7, metadata !126, null}
!126 = metadata !{i32 786443, metadata !105, i32 141, i32 2, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!127 = metadata !{i32 142, i32 3, metadata !128, null}
!128 = metadata !{i32 786443, metadata !126, i32 141, i32 65, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!129 = metadata !{i32 143, i32 3, metadata !128, null}
!130 = metadata !{i32 144, i32 9, metadata !131, null}
!131 = metadata !{i32 786443, metadata !128, i32 143, i32 41, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!132 = metadata !{i32 146, i32 3, metadata !131, null}
!133 = metadata !{i32 147, i32 9, metadata !134, null}
!134 = metadata !{i32 786443, metadata !128, i32 146, i32 10, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!135 = metadata !{i32 148, i32 4, metadata !134, null}
!136 = metadata !{i32 150, i32 3, metadata !128, null}
!137 = metadata !{i32 151, i32 3, metadata !128, null}
!138 = metadata !{i32 141, i32 51, metadata !126, null}
!139 = metadata !{i32 155, i32 2, metadata !105, null}
!140 = metadata !{i32 157, i32 8, metadata !105, null}
!141 = metadata !{i32 158, i32 2, metadata !105, null}
!142 = metadata !{metadata !"struct.stat.11"}
!143 = metadata !{i32 161, i32 2, metadata !105, null}
!144 = metadata !{i32 162, i32 2, metadata !105, null}
!145 = metadata !{i32 193, i32 12, metadata !146, null}
!146 = metadata !{i32 786443, metadata !28, i32 190, i32 41, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!147 = metadata !{i32 194, i32 3, metadata !148, null}
!148 = metadata !{i32 786443, metadata !146, i32 193, i32 40, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!149 = metadata !{i32 197, i32 2, metadata !146, null}
!150 = metadata !{i32 198, i32 2, metadata !146, null}
!151 = metadata !{metadata !"arg.ReceiveAudioFile.0"}
!152 = metadata !{i32 174, i32 2, metadata !153, null}
!153 = metadata !{i32 786443, metadata !20, i32 165, i32 38, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!154 = metadata !{i32 174, i32 18, metadata !153, null}
!155 = metadata !{i32 175, i32 22, metadata !156, null}
!156 = metadata !{i32 786443, metadata !153, i32 174, i32 57, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!157 = metadata !{i32 176, i32 3, metadata !156, null}
!158 = metadata !{i32 177, i32 3, metadata !156, null}
!159 = metadata !{i32 178, i32 3, metadata !156, null}
!160 = metadata !{i32 179, i32 2, metadata !156, null}
!161 = metadata !{i32 181, i32 2, metadata !153, null}
!162 = metadata !{metadata !"arg._kint.__inline_memcpy_chk.2"}
!163 = metadata !{i32 61, i32 56, metadata !164, null}
!164 = metadata !{i32 786443, metadata !91, i32 60, i32 1, metadata !92, i32 25} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint//usr/include/secure/_string.h]
!165 = metadata !{i32 185, i32 2, metadata !166, null}
!166 = metadata !{i32 786443, metadata !23, i32 184, i32 36, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!167 = metadata !{i32 188, i32 1, metadata !166, null}
!168 = metadata !{metadata !"arg.main.0"}
!169 = metadata !{i32 210, i32 14, metadata !170, null}
!170 = metadata !{i32 786443, metadata !87, i32 201, i32 35, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!171 = metadata !{i32 217, i32 2, metadata !172, null}
!172 = metadata !{i32 786443, metadata !170, i32 217, i32 2, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!173 = metadata !{i32 218, i32 11, metadata !174, null}
!174 = metadata !{i32 786443, metadata !172, i32 217, i32 11, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!175 = metadata !{i32 219, i32 3, metadata !174, null}
!176 = metadata !{i32 221, i32 3, metadata !174, null}
!177 = metadata !{i32 223, i32 4, metadata !178, null}
!178 = metadata !{i32 786443, metadata !174, i32 221, i32 14, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!179 = metadata !{i32 224, i32 4, metadata !178, null}
!180 = metadata !{i32 226, i32 4, metadata !178, null}
!181 = metadata !{i32 227, i32 4, metadata !178, null}
!182 = metadata !{i32 232, i32 2, metadata !170, null}
!183 = metadata !{i32 233, i32 4, metadata !184, null}
!184 = metadata !{i32 786443, metadata !170, i32 232, i32 27, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!185 = metadata !{i32 234, i32 4, metadata !184, null}
!186 = metadata !{i32 237, i32 2, metadata !170, null}
!187 = metadata !{i32 238, i32 2, metadata !170, null}
!188 = metadata !{metadata !"struct.sockaddr_in.1"}
!189 = metadata !{i32 239, i32 2, metadata !170, null}
!190 = metadata !{metadata !"struct.in_addr.0"}
!191 = metadata !{i32 240, i32 2, metadata !170, null}
!192 = metadata !{metadata !"struct.sockaddr_in.2"}
!193 = metadata !{i32 243, i32 16, metadata !170, null}
!194 = metadata !{i32 244, i32 3, metadata !195, null}
!195 = metadata !{i32 786443, metadata !170, i32 243, i32 64, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!196 = metadata !{i32 245, i32 3, metadata !195, null}
!197 = metadata !{i32 250, i32 6, metadata !170, null}
!198 = metadata !{i32 252, i32 3, metadata !199, null}
!199 = metadata !{i32 786443, metadata !170, i32 251, i32 23, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!200 = metadata !{i32 253, i32 3, metadata !199, null}
!201 = metadata !{i32 257, i32 7, metadata !170, null}
!202 = metadata !{i32 258, i32 3, metadata !203, null}
!203 = metadata !{i32 786443, metadata !170, i32 257, i32 64, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!204 = metadata !{i32 259, i32 3, metadata !203, null}
!205 = metadata !{i32 262, i32 6, metadata !170, null}
!206 = metadata !{i32 263, i32 3, metadata !207, null}
!207 = metadata !{i32 786443, metadata !170, i32 262, i32 35, metadata !6, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!208 = metadata !{i32 264, i32 3, metadata !207, null}
!209 = metadata !{i32 267, i32 2, metadata !170, null}
!210 = metadata !{i32 268, i32 2, metadata !170, null}
!211 = metadata !{i32 270, i32 2, metadata !170, null}
!212 = metadata !{i32 271, i32 2, metadata !170, null}
!213 = metadata !{i32 275, i32 16, metadata !170, null}
!214 = metadata !{i32 276, i32 3, metadata !215, null}
!215 = metadata !{i32 786443, metadata !170, i32 275, i32 49, metadata !6, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!216 = metadata !{i32 277, i32 3, metadata !215, null}
!217 = metadata !{i32 280, i32 2, metadata !170, null}
!218 = metadata !{i32 281, i32 2, metadata !170, null}
!219 = metadata !{i32 286, i32 14, metadata !170, null}
!220 = metadata !{i32 290, i32 6, metadata !170, null}
!221 = metadata !{i32 291, i32 3, metadata !222, null}
!222 = metadata !{i32 786443, metadata !170, i32 290, i32 25, metadata !6, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx77/src/kint/main.c]
!223 = metadata !{i32 292, i32 3, metadata !222, null}
!224 = metadata !{i32 297, i32 9, metadata !170, null}
!225 = metadata !{i32 0, i32 1}
!226 = metadata !{i32 299, i32 2, metadata !170, null}
