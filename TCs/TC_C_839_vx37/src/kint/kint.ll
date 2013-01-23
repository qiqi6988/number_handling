; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque
%struct.inputData = type { i8*, i64 }
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
@.str7 = private unnamed_addr constant [5 x i8] c"9084\00", align 1
@.str8 = private unnamed_addr constant [6 x i8] c"hp:o:\00", align 1
@optarg = external global i8*
@.str9 = private unnamed_addr constant [41 x i8] c"No output file specified with -o option\0A\00", align 1
@.str10 = private unnamed_addr constant [41 x i8] c"Error reading port value with -p option\0A\00", align 1
@.str11 = private unnamed_addr constant [26 x i8] c"socket failed with error\0A\00", align 1
@.str12 = private unnamed_addr constant [30 x i8] c"setsockopt failed with error\0A\00", align 1
@.str13 = private unnamed_addr constant [27 x i8] c"bind failed with an error\0A\00", align 1
@.str14 = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1
@.str15 = private unnamed_addr constant [26 x i8] c"listen failed with error\0A\00", align 1
@.str16 = private unnamed_addr constant [46 x i8] c"Socket created.  Ready to accept on port %d.\0A\00", align 1
@.str17 = private unnamed_addr constant [35 x i8] c"WAVESRV: waiting for a connection\0A\00", align 1
@.str18 = private unnamed_addr constant [34 x i8] c"ECHOSERV: Error calling accept()\0A\00", align 1
@.str19 = private unnamed_addr constant [21 x i8] c"WAVESRV: Connected!\0A\00", align 1
@.str20 = private unnamed_addr constant [32 x i8] c"WAVESRV: Error calling close()\0A\00", align 1

define i32 @doConversion(%struct.inputData* %inp, i8* %output) nounwind uwtable ssp {
  %buffer = alloca [1024 x i8], align 16
  %report = alloca [1 x %struct.stat], align 16
  %1 = call %struct.__sFILE* @openFile(i8* %output, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0)), !dbg !108
  %2 = getelementptr inbounds %struct.inputData* %inp, i32 0, i32 0, !dbg !110
  %3 = load i8** %2, align 8, !dbg !110
  %4 = bitcast i8* %3 to i352*, !dbg !111
  %srcval = load i352* %4, align 1, !dbg !111
  %5 = lshr i352 %srcval, 192, !dbg !112
  %6 = trunc i352 %5 to i8, !dbg !112
  %7 = sext i8 %6 to i32, !dbg !112
  %8 = lshr i352 %srcval, 200, !dbg !112
  %9 = trunc i352 %8 to i8, !dbg !112
  %10 = sext i8 %9 to i32, !dbg !112
  %11 = shl i32 %10, 8, !dbg !112
  %12 = or i32 %7, %11, !dbg !112
  %13 = lshr i352 %srcval, 208, !dbg !112
  %14 = trunc i352 %13 to i8, !dbg !112
  %15 = sext i8 %14 to i32, !dbg !112
  %16 = shl i32 %15, 16, !dbg !112
  %17 = or i32 %12, %16, !dbg !112
  %18 = lshr i352 %srcval, 216, !dbg !112
  %19 = trunc i352 %18 to i8, !dbg !112
  %20 = sext i8 %19 to i32, !dbg !112
  %21 = shl i32 %20, 24, !dbg !112
  %22 = or i32 %17, %21, !dbg !112
  %23 = sext i32 %22 to i64, !dbg !112
  %24 = icmp ugt i64 %23, 44100, !dbg !113
  br i1 %24, label %25, label %28, !dbg !113

; <label>:25                                      ; preds = %0
  %26 = load %struct.__sFILE** @__stderrp, align 8, !dbg !114
  %27 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %26, i8* getelementptr inbounds ([27 x i8]* @.str1, i32 0, i32 0), i32 44100), !dbg !114
  call void @exit(i32 1) noreturn, !dbg !116
  unreachable, !dbg !116

; <label>:28                                      ; preds = %0
  %29 = icmp ult i64 %23, 500, !dbg !117
  br i1 %29, label %30, label %33, !dbg !117

; <label>:30                                      ; preds = %28
  %31 = load %struct.__sFILE** @__stderrp, align 8, !dbg !118
  %32 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %31, i8* getelementptr inbounds ([27 x i8]* @.str2, i32 0, i32 0), i32 500), !dbg !118
  call void @exit(i32 1) noreturn, !dbg !120
  unreachable, !dbg !120

; <label>:33                                      ; preds = %28
  %34 = lshr i352 %srcval, 272, !dbg !121
  %35 = trunc i352 %34 to i8, !dbg !121
  %36 = sext i8 %35 to i32, !dbg !121
  %37 = lshr i352 %srcval, 280, !dbg !121
  %38 = trunc i352 %37 to i8, !dbg !121
  %39 = sext i8 %38 to i32, !dbg !121
  %40 = shl i32 %39, 8, !dbg !121
  %41 = or i32 %36, %40, !dbg !121
  %42 = trunc i32 %41 to i16, !dbg !121
  %43 = sext i16 %42 to i32, !dbg !122
  %44 = icmp sgt i32 %43, 32, !dbg !122
  br i1 %44, label %45, label %48, !dbg !122

; <label>:45                                      ; preds = %33
  %46 = load %struct.__sFILE** @__stderrp, align 8, !dbg !123
  %47 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %46, i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 32), !dbg !123
  call void @exit(i32 1) noreturn, !dbg !125
  unreachable, !dbg !125

; <label>:48                                      ; preds = %33
  %49 = sext i16 %42 to i64, !dbg !126
  %50 = mul i64 %49, %23, !dbg !126
  %51 = udiv i64 %50, 8, !dbg !126
  %52 = getelementptr inbounds i8* %3, i64 44, !dbg !127
  br label %53, !dbg !128

; <label>:53                                      ; preds = %64, %48
  %total_bytes_per_second.0 = phi i64 [ %51, %48 ], [ %total_bytes_per_second.1, %64 ]
  %input.0 = phi i8* [ %52, %48 ], [ %65, %64 ]
  %loop_count.0 = phi i32 [ 0, %48 ], [ %66, %64 ]
  %54 = icmp ugt i64 %total_bytes_per_second.0, 0, !dbg !128
  br i1 %54, label %55, label %68, !dbg !128

; <label>:55                                      ; preds = %53
  %56 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %56, i8* %input.0, i64 1024, i32 1, i1 false), !dbg !129
  %57 = icmp ule i64 %total_bytes_per_second.0, 1024, !dbg !131
  %58 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !132
  br i1 %57, label %59, label %61, !dbg !131

; <label>:59                                      ; preds = %55
  %60 = call i64 @"\01_fwrite"(i8* %58, i64 %total_bytes_per_second.0, i64 1, %struct.__sFILE* %1), !dbg !132
  br label %64, !dbg !134

; <label>:61                                      ; preds = %55
  %62 = call i64 @"\01_fwrite"(i8* %58, i64 1024, i64 1, %struct.__sFILE* %1), !dbg !135
  %63 = sub i64 %total_bytes_per_second.0, 1024, !dbg !137
  br label %64

; <label>:64                                      ; preds = %61, %59
  %total_bytes_per_second.1 = phi i64 [ 0, %59 ], [ %63, %61 ]
  %wt.0 = phi i64 [ %60, %59 ], [ %62, %61 ]
  %65 = getelementptr inbounds i8* %input.0, i64 %wt.0, !dbg !138
  %66 = add nsw i32 %loop_count.0, 1, !dbg !139
  %67 = icmp sgt i32 %loop_count.0, 2000, !dbg !139
  br i1 %67, label %68, label %53, !dbg !139

; <label>:68                                      ; preds = %64, %53
  %69 = call i32 @fflush(%struct.__sFILE* %1), !dbg !140
  %70 = call i32 @fileno(%struct.__sFILE* %1), !dbg !141
  %71 = getelementptr inbounds [1 x %struct.stat]* %report, i32 0, i32 0, !dbg !141
  %72 = call i32 @"\01_fstat$INODE64"(i32 %70, %struct.stat* %71), !dbg !141
  %73 = getelementptr inbounds [1 x %struct.stat]* %report, i32 0, i32 0, !dbg !142
  %74 = getelementptr inbounds %struct.stat* %73, i32 0, i32 11, !dbg !142
  %75 = load i64* %74, align 8, !dbg !142, !id !143
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str4, i32 0, i32 0), i64 %75), !dbg !142
  %77 = call i32 @fclose(%struct.__sFILE* %1), !dbg !144
  ret i32 0, !dbg !145
}

define %struct.__sFILE* @openFile(i8* %name, i8* %mode) nounwind uwtable ssp {
  %1 = call %struct.__sFILE* @"\01_fopen"(i8* %name, i8* %mode), !dbg !146
  %2 = icmp ne %struct.__sFILE* %1, null, !dbg !146
  br i1 %2, label %3, label %4, !dbg !146

; <label>:3                                       ; preds = %0
  ret %struct.__sFILE* %1, !dbg !148

; <label>:4                                       ; preds = %0
  %5 = load %struct.__sFILE** @__stderrp, align 8, !dbg !150
  %6 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %5, i8* getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0), i8* %name), !dbg !150
  call void @exit(i32 1) noreturn, !dbg !151
  unreachable, !dbg !151
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

define void @ReceiveAudioFile(i32 %sockd, %struct.inputData* %itype) nounwind uwtable ssp {
  %sockd1 = call i32 @kint_arg.i32(), !id !152
  %buffer = alloca [1024 x i8], align 16
  br label %1, !dbg !153

; <label>:1                                       ; preds = %21, %0
  %input.0 = phi i8* [ null, %0 ], [ %9, %21 ]
  %bsize.0 = phi i32 [ 0, %0 ], [ %23, %21 ]
  %2 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !155
  %3 = call i64 @"\01_read"(i32 %sockd1, i8* %2, i64 1024), !dbg !155
  %4 = trunc i64 %3 to i32, !dbg !155
  %5 = icmp sgt i32 %4, 0, !dbg !155
  br i1 %5, label %6, label %24, !dbg !155

; <label>:6                                       ; preds = %1
  %7 = add nsw i32 %bsize.0, %4, !dbg !156
  %8 = sext i32 %7 to i64, !dbg !156
  %9 = call i8* @realloc(i8* %input.0, i64 %8), !dbg !156
  %10 = sext i32 %bsize.0 to i64, !dbg !158
  %11 = getelementptr inbounds i8* %9, i64 %10, !dbg !158
  %12 = call i64 @llvm.objectsize.i64(i8* %11, i1 false), !dbg !159
  %13 = icmp ne i64 %12, -1, !dbg !159
  %14 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !159
  %15 = sext i32 %4 to i64, !dbg !159
  br i1 %13, label %16, label %19, !dbg !159

; <label>:16                                      ; preds = %6
  %17 = call i64 @llvm.objectsize.i64(i8* %11, i1 false), !dbg !159
  %18 = call i8* @__memcpy_chk(i8* %11, i8* %14, i64 %15, i64 %17) nounwind, !dbg !159
  br label %21, !dbg !159

; <label>:19                                      ; preds = %6
  %20 = call i8* @__inline_memcpy_chk(i8* %11, i8* %14, i64 %15), !dbg !159
  br label %21, !dbg !159

; <label>:21                                      ; preds = %19, %16
  %22 = phi i8* [ %18, %16 ], [ %20, %19 ], !dbg !159
  %23 = add nsw i32 %bsize.0, %4, !dbg !160
  br label %1, !dbg !161

; <label>:24                                      ; preds = %1
  %25 = getelementptr inbounds %struct.inputData* %itype, i32 0, i32 0, !dbg !162
  store i8* %input.0, i8** %25, align 8, !dbg !162
  %26 = sext i32 %bsize.0 to i64, !dbg !163
  %27 = getelementptr inbounds %struct.inputData* %itype, i32 0, i32 1, !dbg !163
  store i64 %26, i64* %27, align 8, !dbg !163, !id !164
  ret void, !dbg !165
}

declare i64 @"\01_read"(i32, i8*, i64)

declare i8* @realloc(i8*, i64)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memcpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_memcpy_chk(i8* %__dest, i8* %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !166
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !167
  %2 = call i8* @__memcpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !167
  ret i8* %2, !dbg !167
}

define void @usage(i8* %prog_name) nounwind uwtable ssp {
  %1 = load %struct.__sFILE** @__stderrp, align 8, !dbg !169
  %2 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %1, i8* getelementptr inbounds ([87 x i8]* @.str5, i32 0, i32 0), i8* %prog_name), !dbg !169
  ret void, !dbg !171
}

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !172
  %sin = alloca %struct.sockaddr_in, align 4
  %opts = alloca i32, align 4
  store i32 1, i32* %opts, align 4, !dbg !173
  %1 = call i8* @malloc(i64 16), !dbg !175
  %2 = bitcast i8* %1 to %struct.inputData*, !dbg !175
  br label %3, !dbg !176

; <label>:3                                       ; preds = %12, %10, %6, %0
  %output_name.0 = phi i8* [ null, %0 ], [ %output_name.0, %6 ], [ %output_name.0, %12 ], [ %11, %10 ]
  %szPort.0 = phi i8* [ getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0), %0 ], [ %szPort.0, %6 ], [ %13, %12 ], [ %szPort.0, %10 ]
  %4 = call i32 @"\01_getopt"(i32 %argc1, i8** %argv, i8* getelementptr inbounds ([6 x i8]* @.str8, i32 0, i32 0)), !dbg !178
  %5 = icmp eq i32 %4, -1, !dbg !180
  br i1 %5, label %14, label %6, !dbg !180

; <label>:6                                       ; preds = %3
  switch i32 %4, label %3 [
    i32 104, label %7
    i32 111, label %10
    i32 112, label %12
  ], !dbg !181

; <label>:7                                       ; preds = %6
  %8 = getelementptr inbounds i8** %argv, i64 0, !dbg !182
  %9 = load i8** %8, align 8, !dbg !182
  call void @usage(i8* %9), !dbg !182
  ret i32 0, !dbg !184

; <label>:10                                      ; preds = %6
  %11 = load i8** @optarg, align 8, !dbg !185
  br label %3, !dbg !186

; <label>:12                                      ; preds = %6
  %13 = load i8** @optarg, align 8, !dbg !187
  br label %3, !dbg !188

; <label>:14                                      ; preds = %3
  %15 = icmp eq i8* %output_name.0, null, !dbg !189
  br i1 %15, label %16, label %19, !dbg !189

; <label>:16                                      ; preds = %14
  %17 = load %struct.__sFILE** @__stderrp, align 8, !dbg !190
  %18 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %17, i8* getelementptr inbounds ([41 x i8]* @.str9, i32 0, i32 0)), !dbg !190
  call void @exit(i32 1) noreturn, !dbg !192
  unreachable, !dbg !192

; <label>:19                                      ; preds = %14
  %20 = call i32 @atoi(i8* %szPort.0), !dbg !193
  %21 = icmp eq i32 %20, 0, !dbg !193
  br i1 %21, label %22, label %25, !dbg !193

; <label>:22                                      ; preds = %19
  %23 = load %struct.__sFILE** @__stderrp, align 8, !dbg !194
  %24 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %23, i8* getelementptr inbounds ([41 x i8]* @.str10, i32 0, i32 0)), !dbg !194
  call void @exit(i32 1) noreturn, !dbg !196
  unreachable, !dbg !196

; <label>:25                                      ; preds = %19
  %26 = bitcast %struct.sockaddr_in* %sin to i8*, !dbg !197
  call void @llvm.memset.p0i8.i64(i8* %26, i8 0, i64 16, i32 1, i1 false), !dbg !197
  %27 = getelementptr inbounds %struct.sockaddr_in* %sin, i32 0, i32 1, !dbg !198
  store i8 2, i8* %27, align 1, !dbg !198, !id !199
  %28 = getelementptr inbounds %struct.sockaddr_in* %sin, i32 0, i32 3, !dbg !200
  %29 = getelementptr inbounds %struct.in_addr* %28, i32 0, i32 0, !dbg !200
  store i32 0, i32* %29, align 4, !dbg !200, !id !201
  %30 = trunc i32 %20 to i16, !dbg !202
  %31 = call zeroext i16 @_OSSwapInt16(i16 zeroext %30), !dbg !202
  %32 = zext i16 %31 to i32, !dbg !202
  %33 = trunc i32 %32 to i16, !dbg !202
  %34 = getelementptr inbounds %struct.sockaddr_in* %sin, i32 0, i32 2, !dbg !202
  store i16 %33, i16* %34, align 2, !dbg !202, !id !203
  %35 = call i32 @socket(i32 2, i32 1, i32 6), !dbg !204
  %36 = icmp slt i32 %35, 0, !dbg !204
  br i1 %36, label %37, label %40, !dbg !204

; <label>:37                                      ; preds = %25
  %38 = load %struct.__sFILE** @__stderrp, align 8, !dbg !205
  %39 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %38, i8* getelementptr inbounds ([26 x i8]* @.str11, i32 0, i32 0)), !dbg !205
  call void @exit(i32 1) noreturn, !dbg !207
  unreachable, !dbg !207

; <label>:40                                      ; preds = %25
  %41 = bitcast i32* %opts to i8*, !dbg !208
  %42 = call i32 @setsockopt(i32 %35, i32 65535, i32 4, i8* %41, i32 4), !dbg !208
  %43 = icmp slt i32 %42, 0, !dbg !208
  br i1 %43, label %44, label %47, !dbg !208

; <label>:44                                      ; preds = %40
  %45 = load %struct.__sFILE** @__stderrp, align 8, !dbg !209
  %46 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %45, i8* getelementptr inbounds ([30 x i8]* @.str12, i32 0, i32 0)), !dbg !209
  call void @exit(i32 1) noreturn, !dbg !211
  unreachable, !dbg !211

; <label>:47                                      ; preds = %40
  %48 = bitcast %struct.sockaddr_in* %sin to %struct.sockaddr*, !dbg !212
  %49 = call i32 @"\01_bind"(i32 %35, %struct.sockaddr* %48, i32 16), !dbg !212
  %50 = icmp slt i32 %49, 0, !dbg !212
  br i1 %50, label %51, label %54, !dbg !212

; <label>:51                                      ; preds = %47
  %52 = load %struct.__sFILE** @__stderrp, align 8, !dbg !213
  %53 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %52, i8* getelementptr inbounds ([27 x i8]* @.str13, i32 0, i32 0)), !dbg !213
  call void @perror(i8* getelementptr inbounds ([6 x i8]* @.str14, i32 0, i32 0)), !dbg !215
  call void @exit(i32 1) noreturn, !dbg !216
  unreachable, !dbg !216

; <label>:54                                      ; preds = %47
  %55 = call i32 @"\01_listen"(i32 %35, i32 1024), !dbg !217
  %56 = icmp slt i32 %55, 0, !dbg !217
  %57 = load %struct.__sFILE** @__stderrp, align 8, !dbg !218
  br i1 %56, label %58, label %60, !dbg !217

; <label>:58                                      ; preds = %54
  %59 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %57, i8* getelementptr inbounds ([26 x i8]* @.str15, i32 0, i32 0)), !dbg !218
  call void @exit(i32 1) noreturn, !dbg !220
  unreachable, !dbg !220

; <label>:60                                      ; preds = %54
  %61 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %57, i8* getelementptr inbounds ([46 x i8]* @.str16, i32 0, i32 0), i32 %20), !dbg !221
  %62 = load %struct.__sFILE** @__stderrp, align 8, !dbg !222
  %63 = call i32 @fflush(%struct.__sFILE* %62), !dbg !222
  %64 = load %struct.__sFILE** @__stderrp, align 8, !dbg !223
  %65 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %64, i8* getelementptr inbounds ([35 x i8]* @.str17, i32 0, i32 0)), !dbg !223
  %66 = load %struct.__sFILE** @__stderrp, align 8, !dbg !224
  %67 = call i32 @fflush(%struct.__sFILE* %66), !dbg !224
  %68 = call i32 @"\01_accept"(i32 %35, %struct.sockaddr* null, i32* null), !dbg !225
  %69 = icmp slt i32 %68, 0, !dbg !225
  %70 = load %struct.__sFILE** @__stderrp, align 8, !dbg !226
  br i1 %69, label %71, label %73, !dbg !225

; <label>:71                                      ; preds = %60
  %72 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %70, i8* getelementptr inbounds ([34 x i8]* @.str18, i32 0, i32 0)), !dbg !226
  call void @exit(i32 1) noreturn, !dbg !228
  unreachable, !dbg !228

; <label>:73                                      ; preds = %60
  %74 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %70, i8* getelementptr inbounds ([21 x i8]* @.str19, i32 0, i32 0)), !dbg !229
  %75 = load %struct.__sFILE** @__stderrp, align 8, !dbg !230
  %76 = call i32 @fflush(%struct.__sFILE* %75), !dbg !230
  call void @ReceiveAudioFile(i32 %68, %struct.inputData* %2), !dbg !231
  %77 = call i32 @"\01_close"(i32 %68), !dbg !232
  %78 = icmp slt i32 %77, 0, !dbg !232
  br i1 %78, label %79, label %82, !dbg !232

; <label>:79                                      ; preds = %73
  %80 = load %struct.__sFILE** @__stderrp, align 8, !dbg !233
  %81 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %80, i8* getelementptr inbounds ([32 x i8]* @.str20, i32 0, i32 0)), !dbg !233
  call void @exit(i32 1) noreturn, !dbg !235
  unreachable, !dbg !235

; <label>:82                                      ; preds = %73
  %83 = call i32 @doConversion(%struct.inputData* %2, i8* %output_name.0), !dbg !236, !intrange !237
  call void @exit(i32 %83) noreturn, !dbg !238
  unreachable, !dbg !238
}

declare i8* @malloc(i64)

declare i32 @"\01_getopt"(i32, i8**, i8*)

declare i32 @atoi(i8*)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define internal zeroext i16 @_OSSwapInt16(i16 zeroext %_data) nounwind uwtable inlinehint ssp {
  %_data1 = call i16 @kint_arg.i16(), !id !239
  %1 = zext i16 %_data1 to i32, !dbg !240
  %2 = shl i32 %1, 8, !dbg !240
  %3 = zext i16 %_data1 to i32, !dbg !240
  %4 = ashr i32 %3, 8, !dbg !240
  %5 = or i32 %2, %4, !dbg !240
  %6 = trunc i32 %5 to i16, !dbg !240
  ret i16 %6, !dbg !240
}

declare i32 @socket(i32, i32, i32)

declare i32 @setsockopt(i32, i32, i32, i8*, i32)

declare i32 @"\01_bind"(i32, %struct.sockaddr*, i32)

declare void @perror(i8*)

declare i32 @"\01_listen"(i32, i32)

declare i32 @"\01_accept"(i32, %struct.sockaddr*, i32*)

declare i32 @"\01_close"(i32)

declare i32 @kint_arg.i32()

declare i64 @kint_arg.i64()

declare i16 @kint_arg.i16()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"main.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !23, metadata !26, metadata !31, metadata !91, metadata !95, metadata !102}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"doConversion", metadata !"doConversion", metadata !"", metadata !6, i32 98, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.inputData*, i8*)* @doConversion, null, null, metadata !1, i32 98} ; [ DW_TAG_subprogram ] [line 98] [def] [doConversion]
!6 = metadata !{i32 786473, metadata !"main.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !22}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from input_t]
!11 = metadata !{i32 786454, null, metadata !"input_t", metadata !6, i32 95, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [input_t] [line 95, size 0, align 0, offset 0] [from inputData]
!12 = metadata !{i32 786451, null, metadata !"inputData", metadata !6, i32 92, i64 128, i64 64, i32 0, i32 0, null, metadata !13, i32 0, i32 0} ; [ DW_TAG_structure_type ] [inputData] [line 92, size 128, align 64, offset 0] [from ]
!13 = metadata !{metadata !14, metadata !18}
!14 = metadata !{i32 786445, metadata !12, metadata !"data", metadata !6, i32 93, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [data] [line 93, size 64, align 64, offset 0] [from ]
!15 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from byte_t]
!16 = metadata !{i32 786454, null, metadata !"byte_t", metadata !6, i32 88, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [byte_t] [line 88, size 0, align 0, offset 0] [from char]
!17 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!18 = metadata !{i32 786445, metadata !12, metadata !"length", metadata !6, i32 94, i64 64, i64 64, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ] [length] [line 94, size 64, align 64, offset 64] [from size_t]
!19 = metadata !{i32 786454, null, metadata !"size_t", metadata !6, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 48, size 0, align 0, offset 0] [from __darwin_size_t]
!20 = metadata !{i32 786454, null, metadata !"__darwin_size_t", metadata !6, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ] [__darwin_size_t] [line 90, size 0, align 0, offset 0] [from long unsigned int]
!21 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!22 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!23 = metadata !{i32 786478, i32 0, metadata !6, metadata !"ReceiveAudioFile", metadata !"ReceiveAudioFile", metadata !"", metadata !6, i32 167, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, %struct.inputData*)* @ReceiveAudioFile, null, null, metadata !1, i32 167} ; [ DW_TAG_subprogram ] [line 167] [def] [ReceiveAudioFile]
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !9, metadata !10}
!26 = metadata !{i32 786478, i32 0, metadata !6, metadata !"usage", metadata !"usage", metadata !"", metadata !6, i32 187, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @usage, null, null, metadata !1, i32 187} ; [ DW_TAG_subprogram ] [line 187] [def] [usage]
!27 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{null, metadata !29}
!29 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!31 = metadata !{i32 786478, i32 0, metadata !6, metadata !"openFile", metadata !"openFile", metadata !"", metadata !6, i32 193, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.__sFILE* (i8*, i8*)* @openFile, null, null, metadata !1, i32 193} ; [ DW_TAG_subprogram ] [line 193] [def] [openFile]
!32 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{metadata !34, metadata !22, metadata !22}
!34 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!35 = metadata !{i32 786454, null, metadata !"FILE", metadata !6, i32 161, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ] [FILE] [line 161, size 0, align 0, offset 0] [from __sFILE]
!36 = metadata !{i32 786451, null, metadata !"__sFILE", metadata !37, i32 130, i64 1216, i64 64, i32 0, i32 0, null, metadata !38, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__sFILE] [line 130, size 1216, align 64, offset 0] [from ]
!37 = metadata !{i32 786473, metadata !"/usr/include/stdio.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint", null} ; [ DW_TAG_file_type ]
!38 = metadata !{metadata !39, metadata !42, metadata !43, metadata !44, metadata !46, metadata !47, metadata !52, metadata !53, metadata !55, metadata !59, metadata !63, metadata !71, metadata !75, metadata !76, metadata !79, metadata !80, metadata !84, metadata !88, metadata !89, metadata !90}
!39 = metadata !{i32 786445, metadata !36, metadata !"_p", metadata !37, i32 131, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_member ] [_p] [line 131, size 64, align 64, offset 0] [from ]
!40 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned char]
!41 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!42 = metadata !{i32 786445, metadata !36, metadata !"_r", metadata !37, i32 132, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ] [_r] [line 132, size 32, align 32, offset 64] [from int]
!43 = metadata !{i32 786445, metadata !36, metadata !"_w", metadata !37, i32 133, i64 32, i64 32, i64 96, i32 0, metadata !9} ; [ DW_TAG_member ] [_w] [line 133, size 32, align 32, offset 96] [from int]
!44 = metadata !{i32 786445, metadata !36, metadata !"_flags", metadata !37, i32 134, i64 16, i64 16, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_flags] [line 134, size 16, align 16, offset 128] [from short]
!45 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!46 = metadata !{i32 786445, metadata !36, metadata !"_file", metadata !37, i32 135, i64 16, i64 16, i64 144, i32 0, metadata !45} ; [ DW_TAG_member ] [_file] [line 135, size 16, align 16, offset 144] [from short]
!47 = metadata !{i32 786445, metadata !36, metadata !"_bf", metadata !37, i32 136, i64 128, i64 64, i64 192, i32 0, metadata !48} ; [ DW_TAG_member ] [_bf] [line 136, size 128, align 64, offset 192] [from __sbuf]
!48 = metadata !{i32 786451, null, metadata !"__sbuf", metadata !37, i32 96, i64 128, i64 64, i32 0, i32 0, null, metadata !49, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__sbuf] [line 96, size 128, align 64, offset 0] [from ]
!49 = metadata !{metadata !50, metadata !51}
!50 = metadata !{i32 786445, metadata !48, metadata !"_base", metadata !37, i32 97, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_member ] [_base] [line 97, size 64, align 64, offset 0] [from ]
!51 = metadata !{i32 786445, metadata !48, metadata !"_size", metadata !37, i32 98, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ] [_size] [line 98, size 32, align 32, offset 64] [from int]
!52 = metadata !{i32 786445, metadata !36, metadata !"_lbfsize", metadata !37, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !9} ; [ DW_TAG_member ] [_lbfsize] [line 137, size 32, align 32, offset 320] [from int]
!53 = metadata !{i32 786445, metadata !36, metadata !"_cookie", metadata !37, i32 140, i64 64, i64 64, i64 384, i32 0, metadata !54} ; [ DW_TAG_member ] [_cookie] [line 140, size 64, align 64, offset 384] [from ]
!54 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!55 = metadata !{i32 786445, metadata !36, metadata !"_close", metadata !37, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !56} ; [ DW_TAG_member ] [_close] [line 141, size 64, align 64, offset 448] [from ]
!56 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!57 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !9, metadata !54}
!59 = metadata !{i32 786445, metadata !36, metadata !"_read", metadata !37, i32 142, i64 64, i64 64, i64 512, i32 0, metadata !60} ; [ DW_TAG_member ] [_read] [line 142, size 64, align 64, offset 512] [from ]
!60 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!61 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{metadata !9, metadata !54, metadata !22, metadata !9}
!63 = metadata !{i32 786445, metadata !36, metadata !"_seek", metadata !37, i32 143, i64 64, i64 64, i64 576, i32 0, metadata !64} ; [ DW_TAG_member ] [_seek] [line 143, size 64, align 64, offset 576] [from ]
!64 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !65} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !67, metadata !54, metadata !67, metadata !9}
!67 = metadata !{i32 786454, null, metadata !"fpos_t", metadata !37, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [fpos_t] [line 85, size 0, align 0, offset 0] [from __darwin_off_t]
!68 = metadata !{i32 786454, null, metadata !"__darwin_off_t", metadata !37, i32 110, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_typedef ] [__darwin_off_t] [line 110, size 0, align 0, offset 0] [from __int64_t]
!69 = metadata !{i32 786454, null, metadata !"__int64_t", metadata !37, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !70} ; [ DW_TAG_typedef ] [__int64_t] [line 46, size 0, align 0, offset 0] [from long long int]
!70 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!71 = metadata !{i32 786445, metadata !36, metadata !"_write", metadata !37, i32 144, i64 64, i64 64, i64 640, i32 0, metadata !72} ; [ DW_TAG_member ] [_write] [line 144, size 64, align 64, offset 640] [from ]
!72 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !73} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!73 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{metadata !9, metadata !54, metadata !29, metadata !9}
!75 = metadata !{i32 786445, metadata !36, metadata !"_ub", metadata !37, i32 147, i64 128, i64 64, i64 704, i32 0, metadata !48} ; [ DW_TAG_member ] [_ub] [line 147, size 128, align 64, offset 704] [from __sbuf]
!76 = metadata !{i32 786445, metadata !36, metadata !"_extra", metadata !37, i32 148, i64 64, i64 64, i64 832, i32 0, metadata !77} ; [ DW_TAG_member ] [_extra] [line 148, size 64, align 64, offset 832] [from ]
!77 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __sFILEX]
!78 = metadata !{i32 786451, null, metadata !"__sFILEX", metadata !37, i32 102, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [__sFILEX] [line 102, size 0, align 0, offset 0] [fwd] [from ]
!79 = metadata !{i32 786445, metadata !36, metadata !"_ur", metadata !37, i32 149, i64 32, i64 32, i64 896, i32 0, metadata !9} ; [ DW_TAG_member ] [_ur] [line 149, size 32, align 32, offset 896] [from int]
!80 = metadata !{i32 786445, metadata !36, metadata !"_ubuf", metadata !37, i32 152, i64 24, i64 8, i64 928, i32 0, metadata !81} ; [ DW_TAG_member ] [_ubuf] [line 152, size 24, align 8, offset 928] [from ]
!81 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 24, i64 8, i32 0, i32 0, metadata !41, metadata !82, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 24, align 8, offset 0] [from unsigned char]
!82 = metadata !{metadata !83}
!83 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!84 = metadata !{i32 786445, metadata !36, metadata !"_nbuf", metadata !37, i32 153, i64 8, i64 8, i64 952, i32 0, metadata !85} ; [ DW_TAG_member ] [_nbuf] [line 153, size 8, align 8, offset 952] [from ]
!85 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !41, metadata !86, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from unsigned char]
!86 = metadata !{metadata !87}
!87 = metadata !{i32 786465, i64 0, i64 0}        ; [ DW_TAG_subrange_type ] [0, -1]
!88 = metadata !{i32 786445, metadata !36, metadata !"_lb", metadata !37, i32 156, i64 128, i64 64, i64 960, i32 0, metadata !48} ; [ DW_TAG_member ] [_lb] [line 156, size 128, align 64, offset 960] [from __sbuf]
!89 = metadata !{i32 786445, metadata !36, metadata !"_blksize", metadata !37, i32 159, i64 32, i64 32, i64 1088, i32 0, metadata !9} ; [ DW_TAG_member ] [_blksize] [line 159, size 32, align 32, offset 1088] [from int]
!90 = metadata !{i32 786445, metadata !36, metadata !"_offset", metadata !37, i32 160, i64 64, i64 64, i64 1152, i32 0, metadata !67} ; [ DW_TAG_member ] [_offset] [line 160, size 64, align 64, offset 1152] [from fpos_t]
!91 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 204, metadata !92, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 204} ; [ DW_TAG_subprogram ] [line 204] [def] [main]
!92 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !93, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!93 = metadata !{metadata !9, metadata !9, metadata !94}
!94 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!95 = metadata !{i32 786478, i32 0, metadata !96, metadata !"_OSSwapInt16", metadata !"_OSSwapInt16", metadata !"", metadata !96, i32 46, metadata !97, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i16 (i16)* @_OSSwapInt16, null, null, metadata !1, i32 49} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [scope 49] [_OSSwapInt16]
!96 = metadata !{i32 786473, metadata !"/usr/include/libkern/i386/_OSByteOrder.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint", null} ; [ DW_TAG_file_type ]
!97 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = metadata !{metadata !99, metadata !99}
!99 = metadata !{i32 786454, null, metadata !"__uint16_t", metadata !100, i32 43, i64 0, i64 0, i64 0, i32 0, metadata !101} ; [ DW_TAG_typedef ] [__uint16_t] [line 43, size 0, align 0, offset 0] [from unsigned short]
!100 = metadata !{i32 786473, metadata !"/usr/include/sys/stat.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint", null} ; [ DW_TAG_file_type ]
!101 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!102 = metadata !{i32 786478, i32 0, metadata !103, metadata !"__inline_memcpy_chk", metadata !"__inline_memcpy_chk", metadata !"", metadata !103, i32 59, metadata !104, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_memcpy_chk, null, null, metadata !1, i32 60} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 60] [__inline_memcpy_chk]
!103 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint", null} ; [ DW_TAG_file_type ]
!104 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!105 = metadata !{metadata !54, metadata !54, metadata !106, metadata !19}
!106 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !107} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!107 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{i32 109, i32 8, metadata !109, null}
!109 = metadata !{i32 786443, metadata !5, i32 98, i32 46, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!110 = metadata !{i32 111, i32 2, metadata !109, null}
!111 = metadata !{i32 114, i32 2, metadata !109, null}
!112 = metadata !{i32 116, i32 2, metadata !109, null}
!113 = metadata !{i32 118, i32 2, metadata !109, null}
!114 = metadata !{i32 119, i32 3, metadata !115, null}
!115 = metadata !{i32 786443, metadata !109, i32 118, i32 29, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!116 = metadata !{i32 120, i32 3, metadata !115, null}
!117 = metadata !{i32 122, i32 2, metadata !109, null}
!118 = metadata !{i32 123, i32 3, metadata !119, null}
!119 = metadata !{i32 786443, metadata !109, i32 122, i32 25, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!120 = metadata !{i32 124, i32 3, metadata !119, null}
!121 = metadata !{i32 127, i32 2, metadata !109, null}
!122 = metadata !{i32 132, i32 2, metadata !109, null}
!123 = metadata !{i32 133, i32 3, metadata !124, null}
!124 = metadata !{i32 786443, metadata !109, i32 132, i32 44, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!125 = metadata !{i32 134, i32 3, metadata !124, null}
!126 = metadata !{i32 137, i32 2, metadata !109, null}
!127 = metadata !{i32 140, i32 2, metadata !109, null}
!128 = metadata !{i32 143, i32 2, metadata !109, null}
!129 = metadata !{i32 144, i32 3, metadata !130, null}
!130 = metadata !{i32 786443, metadata !109, i32 143, i32 37, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!131 = metadata !{i32 145, i32 3, metadata !130, null}
!132 = metadata !{i32 146, i32 9, metadata !133, null}
!133 = metadata !{i32 786443, metadata !130, i32 145, i32 41, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!134 = metadata !{i32 148, i32 3, metadata !133, null}
!135 = metadata !{i32 149, i32 9, metadata !136, null}
!136 = metadata !{i32 786443, metadata !130, i32 148, i32 10, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!137 = metadata !{i32 150, i32 4, metadata !136, null}
!138 = metadata !{i32 152, i32 3, metadata !130, null}
!139 = metadata !{i32 153, i32 3, metadata !130, null}
!140 = metadata !{i32 157, i32 2, metadata !109, null}
!141 = metadata !{i32 159, i32 8, metadata !109, null}
!142 = metadata !{i32 160, i32 2, metadata !109, null}
!143 = metadata !{metadata !"struct.stat.11"}
!144 = metadata !{i32 163, i32 2, metadata !109, null}
!145 = metadata !{i32 164, i32 2, metadata !109, null}
!146 = metadata !{i32 196, i32 12, metadata !147, null}
!147 = metadata !{i32 786443, metadata !31, i32 193, i32 41, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!148 = metadata !{i32 197, i32 3, metadata !149, null}
!149 = metadata !{i32 786443, metadata !147, i32 196, i32 40, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!150 = metadata !{i32 200, i32 2, metadata !147, null}
!151 = metadata !{i32 201, i32 2, metadata !147, null}
!152 = metadata !{metadata !"arg.ReceiveAudioFile.0"}
!153 = metadata !{i32 176, i32 2, metadata !154, null}
!154 = metadata !{i32 786443, metadata !23, i32 167, i32 51, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!155 = metadata !{i32 176, i32 18, metadata !154, null}
!156 = metadata !{i32 177, i32 22, metadata !157, null}
!157 = metadata !{i32 786443, metadata !154, i32 176, i32 57, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!158 = metadata !{i32 178, i32 3, metadata !157, null}
!159 = metadata !{i32 179, i32 3, metadata !157, null}
!160 = metadata !{i32 180, i32 3, metadata !157, null}
!161 = metadata !{i32 181, i32 2, metadata !157, null}
!162 = metadata !{i32 183, i32 2, metadata !154, null}
!163 = metadata !{i32 184, i32 2, metadata !154, null}
!164 = metadata !{metadata !"struct.inputData.1"}
!165 = metadata !{i32 185, i32 1, metadata !154, null}
!166 = metadata !{metadata !"arg._kint.__inline_memcpy_chk.2"}
!167 = metadata !{i32 61, i32 56, metadata !168, null}
!168 = metadata !{i32 786443, metadata !102, i32 60, i32 1, metadata !103, i32 25} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint//usr/include/secure/_string.h]
!169 = metadata !{i32 188, i32 2, metadata !170, null}
!170 = metadata !{i32 786443, metadata !26, i32 187, i32 36, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!171 = metadata !{i32 191, i32 1, metadata !170, null}
!172 = metadata !{metadata !"arg.main.0"}
!173 = metadata !{i32 216, i32 14, metadata !174, null}
!174 = metadata !{i32 786443, metadata !91, i32 204, i32 35, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!175 = metadata !{i32 221, i32 35, metadata !174, null}
!176 = metadata !{i32 223, i32 2, metadata !177, null}
!177 = metadata !{i32 786443, metadata !174, i32 223, i32 2, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!178 = metadata !{i32 224, i32 11, metadata !179, null}
!179 = metadata !{i32 786443, metadata !177, i32 223, i32 11, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!180 = metadata !{i32 225, i32 3, metadata !179, null}
!181 = metadata !{i32 227, i32 3, metadata !179, null}
!182 = metadata !{i32 229, i32 4, metadata !183, null}
!183 = metadata !{i32 786443, metadata !179, i32 227, i32 14, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!184 = metadata !{i32 230, i32 4, metadata !183, null}
!185 = metadata !{i32 232, i32 4, metadata !183, null}
!186 = metadata !{i32 233, i32 4, metadata !183, null}
!187 = metadata !{i32 235, i32 4, metadata !183, null}
!188 = metadata !{i32 236, i32 4, metadata !183, null}
!189 = metadata !{i32 241, i32 2, metadata !174, null}
!190 = metadata !{i32 242, i32 4, metadata !191, null}
!191 = metadata !{i32 786443, metadata !174, i32 241, i32 27, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!192 = metadata !{i32 243, i32 4, metadata !191, null}
!193 = metadata !{i32 246, i32 14, metadata !174, null}
!194 = metadata !{i32 247, i32 3, metadata !195, null}
!195 = metadata !{i32 786443, metadata !174, i32 246, i32 34, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!196 = metadata !{i32 248, i32 3, metadata !195, null}
!197 = metadata !{i32 252, i32 2, metadata !174, null}
!198 = metadata !{i32 253, i32 2, metadata !174, null}
!199 = metadata !{metadata !"struct.sockaddr_in.1"}
!200 = metadata !{i32 254, i32 2, metadata !174, null}
!201 = metadata !{metadata !"struct.in_addr.0"}
!202 = metadata !{i32 255, i32 17, metadata !174, null}
!203 = metadata !{metadata !"struct.sockaddr_in.2"}
!204 = metadata !{i32 258, i32 16, metadata !174, null}
!205 = metadata !{i32 259, i32 3, metadata !206, null}
!206 = metadata !{i32 786443, metadata !174, i32 258, i32 64, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!207 = metadata !{i32 260, i32 3, metadata !206, null}
!208 = metadata !{i32 264, i32 6, metadata !174, null}
!209 = metadata !{i32 266, i32 3, metadata !210, null}
!210 = metadata !{i32 786443, metadata !174, i32 265, i32 23, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!211 = metadata !{i32 267, i32 3, metadata !210, null}
!212 = metadata !{i32 271, i32 7, metadata !174, null}
!213 = metadata !{i32 272, i32 3, metadata !214, null}
!214 = metadata !{i32 786443, metadata !174, i32 271, i32 64, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!215 = metadata !{i32 273, i32 3, metadata !214, null}
!216 = metadata !{i32 274, i32 3, metadata !214, null}
!217 = metadata !{i32 278, i32 6, metadata !174, null}
!218 = metadata !{i32 279, i32 3, metadata !219, null}
!219 = metadata !{i32 786443, metadata !174, i32 278, i32 35, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!220 = metadata !{i32 280, i32 3, metadata !219, null}
!221 = metadata !{i32 283, i32 2, metadata !174, null}
!222 = metadata !{i32 284, i32 2, metadata !174, null}
!223 = metadata !{i32 286, i32 2, metadata !174, null}
!224 = metadata !{i32 287, i32 2, metadata !174, null}
!225 = metadata !{i32 291, i32 16, metadata !174, null}
!226 = metadata !{i32 292, i32 3, metadata !227, null}
!227 = metadata !{i32 786443, metadata !174, i32 291, i32 49, metadata !6, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!228 = metadata !{i32 293, i32 3, metadata !227, null}
!229 = metadata !{i32 296, i32 2, metadata !174, null}
!230 = metadata !{i32 297, i32 2, metadata !174, null}
!231 = metadata !{i32 302, i32 2, metadata !174, null}
!232 = metadata !{i32 306, i32 6, metadata !174, null}
!233 = metadata !{i32 307, i32 3, metadata !234, null}
!234 = metadata !{i32 786443, metadata !174, i32 306, i32 25, metadata !6, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint/main.c]
!235 = metadata !{i32 308, i32 3, metadata !234, null}
!236 = metadata !{i32 313, i32 9, metadata !174, null}
!237 = metadata !{i32 0, i32 1}
!238 = metadata !{i32 315, i32 2, metadata !174, null}
!239 = metadata !{metadata !"arg._kint._OSSwapInt16.0"}
!240 = metadata !{i32 50, i32 5, metadata !241, null}
!241 = metadata !{i32 786443, metadata !95, i32 49, i32 1, metadata !96, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_839_vx37/src/kint//usr/include/libkern/i386/_OSByteOrder.h]
