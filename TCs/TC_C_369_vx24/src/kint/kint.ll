; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.point = type { i64, i64 }
%struct.sockaddr = type { i8, i8, [14 x i8] }
%struct.DIR = type { i32, i64, i64, i8*, i32, i64, i64, i32, %struct._opaque_pthread_mutex_t, %struct._telldir* }
%struct._opaque_pthread_mutex_t = type { i64, [56 x i8] }
%struct._telldir = type opaque
%struct.dirent = type { i64, i64, i16, i16, i8, [1024 x i8] }

@.str = private unnamed_addr constant [16 x i8] c"1 SERVER ERROR\0A\00", align 1
@.str1 = private unnamed_addr constant [16 x i8] c"2 SERVER ERROR\0A\00", align 1
@main.ipaddr = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str2 = private unnamed_addr constant [16 x i8] c"3 SERVER ERROR\0A\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"4 SERVER ERROR\0A\00", align 1
@.str4 = private unnamed_addr constant [16 x i8] c"5 SERVER ERROR\0A\00", align 1
@.str5 = private unnamed_addr constant [16 x i8] c"6 SERVER ERROR\0A\00", align 1
@.str6 = private unnamed_addr constant [16 x i8] c"7 SERVER ERROR\0A\00", align 1
@.str7 = private unnamed_addr constant [16 x i8] c"8 SERVER ERROR\0A\00", align 1
@.str8 = private unnamed_addr constant [16 x i8] c"9 SERVER ERROR\0A\00", align 1
@.str9 = private unnamed_addr constant [17 x i8] c"10 SERVER ERROR\0A\00", align 1
@.str10 = private unnamed_addr constant [15 x i8] c"y = (%f)x + %f\00", align 1
@.str11 = private unnamed_addr constant [17 x i8] c"11 SERVER ERROR\0A\00", align 1
@.str12 = private unnamed_addr constant [8 x i8] c"x = %lu\00", align 1
@.str13 = private unnamed_addr constant [17 x i8] c"12 SERVER ERROR\0A\00", align 1
@.str14 = private unnamed_addr constant [17 x i8] c"13 SERVER ERROR\0A\00", align 1
@.str15 = private unnamed_addr constant [17 x i8] c"14 SERVER ERROR\0A\00", align 1
@.str16 = private unnamed_addr constant [5 x i8] c"quit\00", align 1
@.str17 = private unnamed_addr constant [16 x i8] c"%lu %lu %lu %lu\00", align 1
@.str18 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str19 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str20 = private unnamed_addr constant [7 x i8] c"slope-\00", align 1
@.str21 = private unnamed_addr constant [12 x i8] c"%s %s %s %s\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %opt = alloca i32, align 4
  %addr = alloca %struct.sockaddr_in, align 4
  %ipaddr = alloca [10 x i8], align 1
  %cliaddr = alloca %struct.sockaddr_in, align 4
  %clilength = alloca i32, align 4
  %addrbuf = alloca [16 x i8], align 16
  %buffer = alloca [1024 x i8], align 16
  %p1 = alloca %struct.point, align 8
  %p2 = alloca %struct.point, align 8
  %out = alloca [1024 x i8], align 16
  %m = alloca float, align 4
  %1 = call i32 @socket(i32 2, i32 1, i32 0), !dbg !65
  %2 = icmp eq i32 %1, -1, !dbg !65
  br i1 %2, label %3, label %5, !dbg !65

; <label>:3                                       ; preds = %0
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0)), !dbg !67
  call void @exit(i32 1) noreturn, !dbg !69
  unreachable, !dbg !69

; <label>:5                                       ; preds = %0
  store i32 1, i32* %opt, align 4, !dbg !70
  %6 = bitcast i32* %opt to i8*, !dbg !71
  %7 = call i32 @setsockopt(i32 %1, i32 65535, i32 4, i8* %6, i32 4), !dbg !71
  %8 = icmp slt i32 %7, 0, !dbg !71
  br i1 %8, label %9, label %11, !dbg !71

; <label>:9                                       ; preds = %5
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)), !dbg !72
  call void @exit(i32 1) noreturn, !dbg !74
  unreachable, !dbg !74

; <label>:11                                      ; preds = %5
  %12 = bitcast [10 x i8]* %ipaddr to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* getelementptr inbounds ([10 x i8]* @main.ipaddr, i32 0, i32 0), i64 10, i32 1, i1 false), !dbg !75
  %13 = getelementptr inbounds %struct.sockaddr_in* %addr, i32 0, i32 1, !dbg !76
  store i8 2, i8* %13, align 1, !dbg !76, !id !77
  %14 = getelementptr inbounds %struct.sockaddr_in* %addr, i32 0, i32 2, !dbg !78
  store i16 -11746, i16* %14, align 2, !dbg !78, !id !79
  %15 = getelementptr inbounds [10 x i8]* %ipaddr, i32 0, i32 0, !dbg !80
  %16 = getelementptr inbounds %struct.sockaddr_in* %addr, i32 0, i32 3, !dbg !80
  %17 = getelementptr inbounds %struct.in_addr* %16, i32 0, i32 0, !dbg !80
  %18 = bitcast i32* %17 to i8*, !dbg !80
  %19 = call i32 @inet_pton(i32 2, i8* %15, i8* %18), !dbg !80
  %20 = icmp slt i32 %19, 1, !dbg !80
  br i1 %20, label %21, label %25, !dbg !80

; <label>:21                                      ; preds = %11
  %22 = call i32 @"\01_close"(i32 %1), !dbg !81
  %23 = icmp eq i32 %22, -1, !dbg !81
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str2, i32 0, i32 0)), !dbg !83
  call void @exit(i32 1) noreturn, !dbg !84
  unreachable, !dbg !84

; <label>:25                                      ; preds = %11
  %26 = bitcast %struct.sockaddr_in* %addr to %struct.sockaddr*, !dbg !85
  %27 = call i32 @"\01_bind"(i32 %1, %struct.sockaddr* %26, i32 16), !dbg !85
  %28 = icmp eq i32 %27, -1, !dbg !85
  br i1 %28, label %29, label %33, !dbg !85

; <label>:29                                      ; preds = %25
  %30 = call i32 @"\01_close"(i32 %1), !dbg !86
  %31 = icmp eq i32 %30, -1, !dbg !86
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0)), !dbg !88
  call void @exit(i32 1) noreturn, !dbg !89
  unreachable, !dbg !89

; <label>:33                                      ; preds = %25
  %34 = call i32 @"\01_listen"(i32 %1, i32 128), !dbg !90
  %35 = icmp eq i32 %34, -1, !dbg !90
  br i1 %35, label %36, label %40, !dbg !90

; <label>:36                                      ; preds = %33
  %37 = call i32 @"\01_close"(i32 %1), !dbg !91
  %38 = icmp eq i32 %37, -1, !dbg !91
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str4, i32 0, i32 0)), !dbg !93
  call void @exit(i32 1) noreturn, !dbg !94
  unreachable, !dbg !94

; <label>:40                                      ; preds = %33
  store i32 16, i32* %clilength, align 4, !dbg !95
  br label %41, !dbg !96

; <label>:41                                      ; preds = %149, %40
  %42 = bitcast %struct.sockaddr_in* %cliaddr to %struct.sockaddr*, !dbg !97
  %43 = call i32 @"\01_accept"(i32 %1, %struct.sockaddr* %42, i32* %clilength), !dbg !97
  %44 = icmp eq i32 %43, -1, !dbg !97
  br i1 %44, label %45, label %49, !dbg !97

; <label>:45                                      ; preds = %41
  %46 = call i32 @"\01_close"(i32 %1), !dbg !99
  %47 = icmp eq i32 %46, -1, !dbg !99
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str5, i32 0, i32 0)), !dbg !101
  call void @exit(i32 1) noreturn, !dbg !102
  unreachable, !dbg !102

; <label>:49                                      ; preds = %41
  %50 = getelementptr inbounds %struct.sockaddr_in* %cliaddr, i32 0, i32 3, !dbg !103
  %51 = bitcast %struct.in_addr* %50 to i8*, !dbg !103
  %52 = getelementptr inbounds [16 x i8]* %addrbuf, i32 0, i32 0, !dbg !103
  %53 = call i8* @inet_ntop(i32 2, i8* %51, i8* %52, i32 16), !dbg !103
  %54 = icmp eq i8* %53, null, !dbg !103
  br i1 %54, label %55, label %61, !dbg !103

; <label>:55                                      ; preds = %49
  %56 = call i32 @"\01_close"(i32 %43), !dbg !104
  %57 = icmp eq i32 %56, -1, !dbg !104
  %58 = call i32 @"\01_close"(i32 %1), !dbg !106
  %59 = icmp eq i32 %58, -1, !dbg !106
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str6, i32 0, i32 0)), !dbg !107
  call void @exit(i32 1) noreturn, !dbg !108
  unreachable, !dbg !108

; <label>:61                                      ; preds = %49
  %62 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* %62, i8 0, i64 1024, i32 1, i1 false), !dbg !109
  %63 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !110
  %64 = call i64 @"\01_read"(i32 %43, i8* %63, i64 1024), !dbg !110
  %65 = icmp eq i64 %64, -1, !dbg !110
  br i1 %65, label %66, label %72, !dbg !110

; <label>:66                                      ; preds = %61
  %67 = call i32 @"\01_close"(i32 %43), !dbg !111
  %68 = icmp eq i32 %67, -1, !dbg !111
  %69 = call i32 @"\01_close"(i32 %1), !dbg !113
  %70 = icmp eq i32 %69, -1, !dbg !113
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str7, i32 0, i32 0)), !dbg !114
  call void @exit(i32 1) noreturn, !dbg !115
  unreachable, !dbg !115

; <label>:72                                      ; preds = %61
  %73 = getelementptr inbounds [1024 x i8]* %out, i32 0, i32 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* %73, i8 0, i64 1024, i32 1, i1 false), !dbg !116
  %74 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !117
  %75 = getelementptr inbounds [1024 x i8]* %out, i32 0, i32 0, !dbg !117
  %76 = call i32 @get_input(i8* %74, i8* %75), !dbg !117, !intrange !118
  %77 = icmp eq i32 %76, 0, !dbg !117
  br i1 %77, label %78, label %80, !dbg !117

; <label>:78                                      ; preds = %72
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str8, i32 0, i32 0)), !dbg !119
  call void @exit(i32 1) noreturn, !dbg !121
  unreachable, !dbg !121

; <label>:80                                      ; preds = %72
  %81 = getelementptr inbounds [1024 x i8]* %out, i32 0, i32 0, !dbg !122
  %82 = call i32 @parse_input(i8* %81, %struct.point* %p1, %struct.point* %p2), !dbg !122, !intrange !123
  %83 = icmp ne i32 %82, 0, !dbg !122
  br i1 %83, label %84, label %93, !dbg !122

; <label>:84                                      ; preds = %80
  %85 = call i32 @"\01_close"(i32 %43), !dbg !124
  %86 = icmp eq i32 %85, -1, !dbg !124
  %87 = call i32 @"\01_close"(i32 %1), !dbg !126
  %88 = icmp eq i32 %87, -1, !dbg !126
  %89 = icmp eq i32 %82, 2, !dbg !127
  br i1 %89, label %90, label %92, !dbg !127

; <label>:90                                      ; preds = %84
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str9, i32 0, i32 0)), !dbg !128
  call void @exit(i32 1) noreturn, !dbg !130
  unreachable, !dbg !130

; <label>:92                                      ; preds = %84
  call void @exit(i32 0) noreturn, !dbg !131
  unreachable, !dbg !131

; <label>:93                                      ; preds = %80
  %94 = bitcast %struct.point* %p1 to { i64, i64 }*, !dbg !133
  %95 = getelementptr { i64, i64 }* %94, i32 0, i32 0, !dbg !133
  %96 = load i64* %95, align 1, !dbg !133
  %97 = getelementptr { i64, i64 }* %94, i32 0, i32 1, !dbg !133
  %98 = load i64* %97, align 1, !dbg !133
  %99 = bitcast %struct.point* %p2 to { i64, i64 }*, !dbg !133
  %100 = getelementptr { i64, i64 }* %99, i32 0, i32 0, !dbg !133
  %101 = load i64* %100, align 1, !dbg !133
  %102 = getelementptr { i64, i64 }* %99, i32 0, i32 1, !dbg !133
  %103 = load i64* %102, align 1, !dbg !133
  %104 = call i32 @compute_slope(i64 %96, i64 %98, i64 %101, i64 %103, float* %m), !dbg !133, !intrange !118
  %105 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* %105, i8 0, i64 1024, i32 1, i1 false), !dbg !134
  %106 = icmp eq i32 %104, 0, !dbg !135
  br i1 %106, label %107, label %127, !dbg !135

; <label>:107                                     ; preds = %93
  %108 = load float* %m, align 4, !dbg !136
  %109 = bitcast %struct.point* %p1 to { i64, i64 }*, !dbg !136
  %110 = getelementptr { i64, i64 }* %109, i32 0, i32 0, !dbg !136
  %111 = load i64* %110, align 1, !dbg !136
  %112 = getelementptr { i64, i64 }* %109, i32 0, i32 1, !dbg !136
  %113 = load i64* %112, align 1, !dbg !136
  %114 = call float @compute_y_intercept(float %108, i64 %111, i64 %113), !dbg !136
  %115 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !138
  %116 = load float* %m, align 4, !dbg !138
  %117 = fpext float %116 to double, !dbg !138
  %118 = fpext float %114 to double, !dbg !138
  %119 = call i32 (i8*, i64, i32, i64, i8*, ...)* @__snprintf_chk(i8* %115, i64 1024, i32 0, i64 1024, i8* getelementptr inbounds ([15 x i8]* @.str10, i32 0, i32 0), double %117, double %118), !dbg !138
  %120 = icmp slt i32 %119, 0, !dbg !138
  br i1 %120, label %121, label %139, !dbg !138

; <label>:121                                     ; preds = %107
  %122 = call i32 @"\01_close"(i32 %43), !dbg !139
  %123 = icmp eq i32 %122, -1, !dbg !139
  %124 = call i32 @"\01_close"(i32 %1), !dbg !141
  %125 = icmp eq i32 %124, -1, !dbg !141
  %126 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str11, i32 0, i32 0)), !dbg !142
  call void @exit(i32 1) noreturn, !dbg !143
  unreachable, !dbg !143

; <label>:127                                     ; preds = %93
  %128 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !144
  %129 = getelementptr inbounds %struct.point* %p1, i32 0, i32 0, !dbg !144
  %130 = load i64* %129, align 8, !dbg !144, !id !146
  %131 = call i32 (i8*, i64, i32, i64, i8*, ...)* @__snprintf_chk(i8* %128, i64 1024, i32 0, i64 1024, i8* getelementptr inbounds ([8 x i8]* @.str12, i32 0, i32 0), i64 %130), !dbg !144
  %132 = icmp slt i32 %131, 0, !dbg !144
  br i1 %132, label %133, label %139, !dbg !144

; <label>:133                                     ; preds = %127
  %134 = call i32 @"\01_close"(i32 %43), !dbg !147
  %135 = icmp eq i32 %134, -1, !dbg !147
  %136 = call i32 @"\01_close"(i32 %1), !dbg !149
  %137 = icmp eq i32 %136, -1, !dbg !149
  %138 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str13, i32 0, i32 0)), !dbg !150
  call void @exit(i32 1) noreturn, !dbg !151
  unreachable, !dbg !151

; <label>:139                                     ; preds = %127, %107
  %140 = getelementptr inbounds [1024 x i8]* %buffer, i32 0, i32 0, !dbg !152
  %141 = call i64 @"\01_write"(i32 %43, i8* %140, i64 1024), !dbg !152
  %142 = icmp eq i64 %141, -1, !dbg !152
  %143 = call i32 @"\01_close"(i32 %43), !dbg !153
  %144 = icmp eq i32 %143, -1, !dbg !153
  br i1 %142, label %145, label %149, !dbg !152

; <label>:145                                     ; preds = %139
  %146 = call i32 @"\01_close"(i32 %1), !dbg !155
  %147 = icmp eq i32 %146, -1, !dbg !155
  %148 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str14, i32 0, i32 0)), !dbg !156
  call void @exit(i32 1) noreturn, !dbg !157
  unreachable, !dbg !157

; <label>:149                                     ; preds = %139
  br i1 %144, label %150, label %41, !dbg !158

; <label>:150                                     ; preds = %149
  %151 = call i32 @"\01_close"(i32 %1), !dbg !159
  %152 = icmp ne i32 %151, 0, !dbg !159
  %153 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str15, i32 0, i32 0)), !dbg !161
  call void @exit(i32 1) noreturn, !dbg !162
  unreachable, !dbg !162
}

declare i32 @socket(i32, i32, i32)

declare i32 @printf(i8*, ...)

declare void @exit(i32) noreturn

declare i32 @setsockopt(i32, i32, i32, i8*, i32)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @inet_pton(i32, i8*, i8*)

declare i32 @"\01_close"(i32)

declare i32 @"\01_bind"(i32, %struct.sockaddr*, i32)

declare i32 @"\01_listen"(i32, i32)

declare i32 @"\01_accept"(i32, %struct.sockaddr*, i32*)

declare i8* @inet_ntop(i32, i8*, i8*, i32)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i64 @"\01_read"(i32, i8*, i64)

define i32 @get_input(i8* %in, i8* %out) nounwind uwtable ssp {
  %filename = alloca [256 x i8], align 16
  %1 = call i32 @is_match(i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i8* %in), !dbg !163, !intrange !118
  %2 = icmp ne i32 %1, 0, !dbg !163
  br i1 %2, label %3, label %16, !dbg !163

; <label>:3                                       ; preds = %0
  %4 = call i64 @llvm.objectsize.i64(i8* %out, i1 false), !dbg !165
  %5 = icmp ne i64 %4, -1, !dbg !165
  %6 = call i64 @strlen(i8* %in), !dbg !165
  br i1 %5, label %7, label %10, !dbg !165

; <label>:7                                       ; preds = %3
  %8 = call i64 @llvm.objectsize.i64(i8* %out, i1 false), !dbg !165
  %9 = call i8* @__strncpy_chk(i8* %out, i8* %in, i64 %6, i64 %8) nounwind, !dbg !165
  br label %12, !dbg !165

; <label>:10                                      ; preds = %3
  %11 = call i8* @__inline_strncpy_chk(i8* %out, i8* %in, i64 %6), !dbg !165
  br label %12, !dbg !165

; <label>:12                                      ; preds = %10, %7
  %13 = phi i8* [ %9, %7 ], [ %11, %10 ], !dbg !165
  %14 = call i64 @strlen(i8* %in), !dbg !167
  %15 = getelementptr inbounds i8* %out, i64 %14, !dbg !167
  store i8 0, i8* %15, align 1, !dbg !167
  br label %64, !dbg !168

; <label>:16                                      ; preds = %0
  %17 = call %struct.DIR* @"\01_opendir$INODE64"(i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0)), !dbg !169
  %18 = call i8* @strtok(i8* %in, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0)), !dbg !170
  %19 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0)), !dbg !171
  %20 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0)), !dbg !172
  %21 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str19, i32 0, i32 0)), !dbg !173
  %22 = icmp eq i8* %21, null, !dbg !174
  br i1 %22, label %23, label %24, !dbg !174

; <label>:23                                      ; preds = %16
  br label %64, !dbg !175

; <label>:24                                      ; preds = %16
  %25 = icmp ne %struct.DIR* %17, null, !dbg !177
  br i1 %25, label %26, label %61, !dbg !177

; <label>:26                                      ; preds = %29, %24
  %27 = call %struct.dirent* @"\01_readdir$INODE64"(%struct.DIR* %17), !dbg !178
  %28 = icmp ne %struct.dirent* %27, null, !dbg !178
  br i1 %28, label %29, label %61, !dbg !178

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* %30, i8 0, i64 256, i32 1, i1 false), !dbg !180
  %31 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0, !dbg !182
  %32 = call i8* @__strncat_chk(i8* %31, i8* getelementptr inbounds ([7 x i8]* @.str20, i32 0, i32 0), i64 6, i64 256) nounwind, !dbg !182
  %33 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0, !dbg !183
  %34 = call i64 @strlen(i8* %21), !dbg !183
  %35 = call i8* @__strncat_chk(i8* %33, i8* %21, i64 %34, i64 256) nounwind, !dbg !183
  %36 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0, !dbg !184
  %37 = call i8* @__strncat_chk(i8* %36, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0), i64 1, i64 256) nounwind, !dbg !184
  %38 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0, !dbg !185
  %39 = getelementptr inbounds %struct.dirent* %27, i32 0, i32 5, !dbg !185
  %40 = getelementptr inbounds [1024 x i8]* %39, i32 0, i32 0, !dbg !185
  %41 = getelementptr inbounds [256 x i8]* %filename, i32 0, i32 0, !dbg !186
  %42 = call i64 @strlen(i8* %41), !dbg !186
  %43 = call i32 @strncmp(i8* %38, i8* %40, i64 %42), !dbg !186
  %44 = icmp eq i32 %43, 0, !dbg !186
  br i1 %44, label %45, label %26, !dbg !186

; <label>:45                                      ; preds = %29
  %46 = getelementptr inbounds %struct.dirent* %27, i32 0, i32 5, !dbg !187
  %47 = getelementptr inbounds [1024 x i8]* %46, i32 0, i32 0, !dbg !187
  %48 = call i8* @strtok(i8* %47, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0)), !dbg !187
  %49 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0)), !dbg !189
  %50 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0)), !dbg !190
  %51 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0)), !dbg !191
  %52 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0)), !dbg !192
  %53 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([2 x i8]* @.str18, i32 0, i32 0)), !dbg !193
  %54 = call i64 @llvm.objectsize.i64(i8* %out, i1 false), !dbg !194
  %55 = call i32 (i8*, i64, i32, i64, i8*, ...)* @__snprintf_chk(i8* %out, i64 1024, i32 0, i64 %54, i8* getelementptr inbounds ([12 x i8]* @.str21, i32 0, i32 0), i8* %49, i8* %50, i8* %51, i8* %52), !dbg !194
  %56 = icmp slt i32 %55, 0, !dbg !194
  br i1 %56, label %57, label %60, !dbg !194

; <label>:57                                      ; preds = %45
  %58 = call i32 @"\01_closedir"(%struct.DIR* %17), !dbg !195
  %59 = icmp eq i32 %58, -1, !dbg !195
  br label %64, !dbg !197

; <label>:60                                      ; preds = %45
  br label %64, !dbg !198

; <label>:61                                      ; preds = %26, %24
  %62 = call i32 @"\01_closedir"(%struct.DIR* %17), !dbg !199
  %63 = icmp eq i32 %62, -1, !dbg !199
  br label %64, !dbg !200

; <label>:64                                      ; preds = %61, %60, %57, %23, %12
  %.0 = phi i32 [ 1, %12 ], [ 0, %23 ], [ 0, %57 ], [ 1, %60 ], [ 0, %61 ]
  ret i32 %.0, !dbg !201
}

define i32 @parse_input(i8* %buffer, %struct.point* %p1, %struct.point* %p2) nounwind uwtable ssp {
  %1 = call i32 @is_match(i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i8* %buffer), !dbg !202, !intrange !118
  %2 = icmp ne i32 %1, 0, !dbg !202
  br i1 %2, label %3, label %4, !dbg !202

; <label>:3                                       ; preds = %0
  br label %13, !dbg !204

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.point* %p1, i32 0, i32 0, !dbg !206
  %6 = getelementptr inbounds %struct.point* %p1, i32 0, i32 1, !dbg !206
  %7 = getelementptr inbounds %struct.point* %p2, i32 0, i32 0, !dbg !206
  %8 = getelementptr inbounds %struct.point* %p2, i32 0, i32 1, !dbg !206
  %9 = call i32 (i8*, i8*, ...)* @sscanf(i8* %buffer, i8* getelementptr inbounds ([16 x i8]* @.str17, i32 0, i32 0), i64* %5, i64* %6, i64* %7, i64* %8), !dbg !206
  %10 = icmp eq i32 %9, -1, !dbg !206
  br i1 %10, label %11, label %12, !dbg !206

; <label>:11                                      ; preds = %4
  br label %13, !dbg !208

; <label>:12                                      ; preds = %4
  br label %13, !dbg !210

; <label>:13                                      ; preds = %12, %11, %3
  %.0 = phi i32 [ 1, %3 ], [ 2, %11 ], [ 0, %12 ]
  ret i32 %.0, !dbg !211
}

define i32 @compute_slope(i64 %p1.coerce0, i64 %p1.coerce1, i64 %p2.coerce0, i64 %p2.coerce1, float* %m) nounwind uwtable ssp {
  %p2.coerce14 = call i64 @kint_arg.i64(), !id !212
  %p2.coerce03 = call i64 @kint_arg.i64(), !id !213
  %p1.coerce12 = call i64 @kint_arg.i64(), !id !214
  %p1.coerce01 = call i64 @kint_arg.i64(), !id !215
  %p1 = alloca %struct.point, align 8
  %p2 = alloca %struct.point, align 8
  %dx = alloca i64, align 8
  %dy = alloca i64, align 8
  %1 = bitcast %struct.point* %p1 to { i64, i64 }*
  %2 = getelementptr { i64, i64 }* %1, i32 0, i32 0
  store i64 %p1.coerce01, i64* %2
  %3 = getelementptr { i64, i64 }* %1, i32 0, i32 1
  store i64 %p1.coerce12, i64* %3
  %4 = bitcast %struct.point* %p2 to { i64, i64 }*
  %5 = getelementptr { i64, i64 }* %4, i32 0, i32 0
  store i64 %p2.coerce03, i64* %5
  %6 = getelementptr { i64, i64 }* %4, i32 0, i32 1
  store i64 %p2.coerce14, i64* %6
  %7 = getelementptr inbounds %struct.point* %p2, i32 0, i32 0, !dbg !216
  %8 = getelementptr inbounds %struct.point* %p1, i32 0, i32 0, !dbg !216
  %9 = call i64 @compute_integer_math(i64 (i64*, i64*)* @compute_difference, i64* %7, i64* %8), !dbg !216, !intrange !218
  store i64 %9, i64* %dx, align 8, !dbg !216
  %10 = getelementptr inbounds %struct.point* %p2, i32 0, i32 1, !dbg !219
  %11 = getelementptr inbounds %struct.point* %p1, i32 0, i32 1, !dbg !219
  %12 = call i64 @compute_integer_math(i64 (i64*, i64*)* @compute_difference, i64* %10, i64* %11), !dbg !219, !intrange !218
  store i64 %12, i64* %dy, align 8, !dbg !219
  %13 = call i64 @compute_integer_math(i64 (i64*, i64*)* @precision_needed, i64* %dx, i64* %dy), !dbg !220, !intrange !218
  %14 = load i64* %dx, align 8, !dbg !221
  %15 = icmp ne i64 %14, 0, !dbg !221
  br i1 %15, label %16, label %33, !dbg !221

; <label>:16                                      ; preds = %0
  %17 = icmp ne i64 %13, 0, !dbg !222
  %18 = load i64* %dy, align 8, !dbg !224
  br i1 %17, label %23, label %19, !dbg !222

; <label>:19                                      ; preds = %16
  %20 = load i64* %dx, align 8, !dbg !226
  %21 = udiv i64 %18, %20, !dbg !226
  %22 = uitofp i64 %21 to float, !dbg !226
  store float %22, float* %m, align 4, !dbg !226
  br label %32, !dbg !228

; <label>:23                                      ; preds = %16
  %24 = uitofp i64 %18 to float, !dbg !224
  %25 = load i64* %dx, align 8, !dbg !229
  %26 = uitofp i64 %25 to float, !dbg !229
  %27 = load i64* %dy, align 8, !dbg !230
  %28 = uitofp i64 %27 to float, !dbg !230
  %29 = load i64* %dx, align 8, !dbg !230
  %30 = uitofp i64 %29 to float, !dbg !230
  %31 = fdiv float %28, %30, !dbg !230
  store float %31, float* %m, align 4, !dbg !230
  br label %32

; <label>:32                                      ; preds = %23, %19
  br label %34, !dbg !231

; <label>:33                                      ; preds = %0
  br label %34, !dbg !232

; <label>:34                                      ; preds = %33, %32
  %.0 = phi i32 [ 0, %32 ], [ 1, %33 ]
  ret i32 %.0, !dbg !234
}

define float @compute_y_intercept(float %m, i64 %p.coerce0, i64 %p.coerce1) nounwind uwtable ssp {
  %p.coerce12 = call i64 @kint_arg.i64(), !id !235
  %p.coerce01 = call i64 @kint_arg.i64(), !id !236
  %1 = uitofp i64 %p.coerce12 to float, !dbg !237
  %2 = uitofp i64 %p.coerce01 to float, !dbg !237
  %3 = fmul float %m, %2, !dbg !237
  %4 = fsub float %1, %3, !dbg !237
  ret float %4, !dbg !237
}

declare i32 @__snprintf_chk(i8*, i64, i32, i64, i8*, ...)

declare i64 @"\01_write"(i32, i8*, i64)

define i32 @is_match(i8* %str1, i8* %str2) nounwind uwtable ssp {
  %1 = call i64 @strlen(i8* %str1), !dbg !239
  %2 = trunc i64 %1 to i32, !dbg !239
  %3 = sext i32 %2 to i64, !dbg !239
  %4 = call i64 @strlen(i8* %str2), !dbg !241
  %5 = icmp eq i64 %3, %4, !dbg !241
  br i1 %5, label %6, label %11, !dbg !241

; <label>:6                                       ; preds = %0
  %7 = sext i32 %2 to i64, !dbg !242
  %8 = call i32 @strncmp(i8* %str1, i8* %str2, i64 %7), !dbg !242
  %9 = icmp eq i32 %8, 0, !dbg !242
  br i1 %9, label %10, label %11, !dbg !242

; <label>:10                                      ; preds = %6
  br label %12, !dbg !244

; <label>:11                                      ; preds = %6, %0
  br label %12, !dbg !246

; <label>:12                                      ; preds = %11, %10
  %.0 = phi i32 [ 1, %10 ], [ 0, %11 ]
  ret i32 %.0, !dbg !247
}

declare i32 @sscanf(i8*, i8*, ...)

define i64 @compute_integer_math(i64 (i64*, i64*)* %function_1, i64* %n1, i64* %n2) nounwind uwtable ssp {
  %1 = call i64 %function_1(i64* %n1, i64* %n2), !dbg !248, !intrange !218
  ret i64 %1, !dbg !248
}

define i64 @compute_difference(i64* %n1, i64* %n2) nounwind uwtable ssp {
  %1 = load i64* %n1, align 8, !dbg !250
  %2 = load i64* %n2, align 8, !dbg !250
  %3 = sub i64 %1, %2, !dbg !250
  ret i64 %3, !dbg !250
}

define i64 @precision_needed(i64* %dx, i64* %dy) nounwind uwtable ssp {
  %1 = load i64* %dy, align 8, !dbg !252
  %2 = load i64* %dx, align 8, !dbg !252
  %3 = call { i64, i64 } @lldiv(i64 %1, i64 %2), !dbg !252
  %4 = extractvalue { i64, i64 } %3, 0, !dbg !252
  %5 = extractvalue { i64, i64 } %3, 1, !dbg !252
  %6 = icmp eq i64 %5, 0, !dbg !254
  br i1 %6, label %7, label %8, !dbg !254

; <label>:7                                       ; preds = %0
  br label %9, !dbg !255

; <label>:8                                       ; preds = %0
  br label %9, !dbg !257

; <label>:9                                       ; preds = %8, %7
  %.0 = phi i64 [ 0, %7 ], [ 1, %8 ]
  ret i64 %.0, !dbg !259
}

declare i64 @strlen(i8*)

declare i32 @strncmp(i8*, i8*, i64)

declare { i64, i64 } @lldiv(i64, i64)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__strncpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_strncpy_chk(i8* noalias %__dest, i8* noalias %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !260
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !261
  %2 = call i8* @__strncpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !261
  ret i8* %2, !dbg !261
}

declare %struct.DIR* @"\01_opendir$INODE64"(i8*)

declare i8* @strtok(i8*, i8*)

declare %struct.dirent* @"\01_readdir$INODE64"(%struct.DIR*)

declare i8* @__strncat_chk(i8*, i8*, i64, i64) nounwind

declare i32 @"\01_closedir"(%struct.DIR*)

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"server.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !13, metadata !15, metadata !13} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3, metadata !3, metadata !3, metadata !9, metadata !9, metadata !3, metadata !3, metadata !3, metadata !9, metadata !9}
!3 = metadata !{i32 786436, null, metadata !"INPUT", metadata !4, i32 123, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [INPUT] [line 123, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"server.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8}
!6 = metadata !{i32 786472, metadata !"INPUT_POINTS", i64 0} ; [ DW_TAG_enumerator ] [INPUT_POINTS :: 0]
!7 = metadata !{i32 786472, metadata !"INPUT_QUIT", i64 1} ; [ DW_TAG_enumerator ] [INPUT_QUIT :: 1]
!8 = metadata !{i32 786472, metadata !"INPUT_ERROR", i64 2} ; [ DW_TAG_enumerator ] [INPUT_ERROR :: 2]
!9 = metadata !{i32 786436, null, metadata !"SLOPE", metadata !4, i32 128, i64 32, i64 32, i32 0, i32 0, null, metadata !10, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [SLOPE] [line 128, size 32, align 32, offset 0] [from ]
!10 = metadata !{metadata !11, metadata !12}
!11 = metadata !{i32 786472, metadata !"DEFINED_SLOPE", i64 0} ; [ DW_TAG_enumerator ] [DEFINED_SLOPE :: 0]
!12 = metadata !{i32 786472, metadata !"UNDEFINED_SLOPE", i64 1} ; [ DW_TAG_enumerator ] [UNDEFINED_SLOPE :: 1]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !17, metadata !24, metadata !34, metadata !39, metadata !42, metadata !46, metadata !49, metadata !50, metadata !54, metadata !55}
!17 = metadata !{i32 786478, i32 0, metadata !4, metadata !"main", metadata !"main", metadata !"", metadata !4, i32 167, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !13, i32 167} ; [ DW_TAG_subprogram ] [line 167] [def] [main]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !20, metadata !20, metadata !21}
!20 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!23 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!24 = metadata !{i32 786478, i32 0, metadata !4, metadata !"parse_input", metadata !"parse_input", metadata !"", metadata !4, i32 378, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, %struct.point*, %struct.point*)* @parse_input, null, null, metadata !13, i32 378} ; [ DW_TAG_subprogram ] [line 378] [def] [parse_input]
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !3, metadata !22, metadata !27, metadata !27}
!27 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from point]
!28 = metadata !{i32 786454, null, metadata !"point", metadata !4, i32 120, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [point] [line 120, size 0, align 0, offset 0] [from point]
!29 = metadata !{i32 786451, null, metadata !"point", metadata !4, i32 117, i64 128, i64 64, i32 0, i32 0, null, metadata !30, i32 0, i32 0} ; [ DW_TAG_structure_type ] [point] [line 117, size 128, align 64, offset 0] [from ]
!30 = metadata !{metadata !31, metadata !33}
!31 = metadata !{i32 786445, metadata !29, metadata !"x", metadata !4, i32 118, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ] [x] [line 118, size 64, align 64, offset 0] [from long unsigned int]
!32 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!33 = metadata !{i32 786445, metadata !29, metadata !"y", metadata !4, i32 119, i64 64, i64 64, i64 64, i32 0, metadata !32} ; [ DW_TAG_member ] [y] [line 119, size 64, align 64, offset 64] [from long unsigned int]
!34 = metadata !{i32 786478, i32 0, metadata !4, metadata !"compute_slope", metadata !"compute_slope", metadata !"", metadata !4, i32 401, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i64, i64, i64, i64, float*)* @compute_slope, null, null, metadata !13, i32 401} ; [ DW_TAG_subprogram ] [line 401] [def] [compute_slope]
!35 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{metadata !9, metadata !28, metadata !28, metadata !37}
!37 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!38 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!39 = metadata !{i32 786478, i32 0, metadata !4, metadata !"compute_y_intercept", metadata !"compute_y_intercept", metadata !"", metadata !4, i32 432, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, float (float, i64, i64)* @compute_y_intercept, null, null, metadata !13, i32 432} ; [ DW_TAG_subprogram ] [line 432] [def] [compute_y_intercept]
!40 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{metadata !38, metadata !38, metadata !28}
!42 = metadata !{i32 786478, i32 0, metadata !4, metadata !"compute_difference", metadata !"compute_difference", metadata !"", metadata !4, i32 439, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64*, i64*)* @compute_difference, null, null, metadata !13, i32 439} ; [ DW_TAG_subprogram ] [line 439] [def] [compute_difference]
!43 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{metadata !32, metadata !45, metadata !45}
!45 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from long unsigned int]
!46 = metadata !{i32 786478, i32 0, metadata !4, metadata !"is_match", metadata !"is_match", metadata !"", metadata !4, i32 446, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i8*)* @is_match, null, null, metadata !13, i32 446} ; [ DW_TAG_subprogram ] [line 446] [def] [is_match]
!47 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = metadata !{metadata !20, metadata !22, metadata !22}
!49 = metadata !{i32 786478, i32 0, metadata !4, metadata !"precision_needed", metadata !"precision_needed", metadata !"", metadata !4, i32 457, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64*, i64*)* @precision_needed, null, null, metadata !13, i32 457} ; [ DW_TAG_subprogram ] [line 457] [def] [precision_needed]
!50 = metadata !{i32 786478, i32 0, metadata !4, metadata !"compute_integer_math", metadata !"compute_integer_math", metadata !"", metadata !4, i32 468, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i64 (i64*, i64*)*, i64*, i64*)* @compute_integer_math, null, null, metadata !13, i32 468} ; [ DW_TAG_subprogram ] [line 468] [def] [compute_integer_math]
!51 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{metadata !32, metadata !53, metadata !45, metadata !45}
!53 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!54 = metadata !{i32 786478, i32 0, metadata !4, metadata !"get_input", metadata !"get_input", metadata !"", metadata !4, i32 475, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i8*)* @get_input, null, null, metadata !13, i32 475} ; [ DW_TAG_subprogram ] [line 475] [def] [get_input]
!55 = metadata !{i32 786478, i32 0, metadata !56, metadata !"__inline_strncpy_chk", metadata !"__inline_strncpy_chk", metadata !"", metadata !56, i32 128, metadata !57, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_strncpy_chk, null, null, metadata !13, i32 130} ; [ DW_TAG_subprogram ] [line 128] [local] [def] [scope 130] [__inline_strncpy_chk]
!56 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint", null} ; [ DW_TAG_file_type ]
!57 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !22, metadata !59, metadata !60, metadata !63}
!59 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !61} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!62 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!63 = metadata !{i32 786454, null, metadata !"size_t", metadata !56, i32 78, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 78, size 0, align 0, offset 0] [from __darwin_size_t]
!64 = metadata !{i32 786454, null, metadata !"__darwin_size_t", metadata !56, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ] [__darwin_size_t] [line 90, size 0, align 0, offset 0] [from long unsigned int]
!65 = metadata !{i32 174, i32 17, metadata !66, null}
!66 = metadata !{i32 786443, metadata !17, i32 167, i32 33, metadata !4, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!67 = metadata !{i32 176, i32 5, metadata !68, null}
!68 = metadata !{i32 786443, metadata !66, i32 174, i32 56, metadata !4, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!69 = metadata !{i32 177, i32 5, metadata !68, null}
!70 = metadata !{i32 179, i32 14, metadata !66, null}
!71 = metadata !{i32 181, i32 7, metadata !66, null}
!72 = metadata !{i32 182, i32 5, metadata !73, null}
!73 = metadata !{i32 786443, metadata !66, i32 181, i32 75, metadata !4, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!74 = metadata !{i32 183, i32 5, metadata !73, null}
!75 = metadata !{i32 188, i32 30, metadata !66, null}
!76 = metadata !{i32 189, i32 3, metadata !66, null}
!77 = metadata !{metadata !"struct.sockaddr_in.1"}
!78 = metadata !{i32 190, i32 3, metadata !66, null}
!79 = metadata !{metadata !"struct.sockaddr_in.2"}
!80 = metadata !{i32 192, i32 7, metadata !66, null}
!81 = metadata !{i32 194, i32 9, metadata !82, null}
!82 = metadata !{i32 786443, metadata !66, i32 192, i32 61, metadata !4, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!83 = metadata !{i32 197, i32 5, metadata !82, null}
!84 = metadata !{i32 198, i32 5, metadata !82, null}
!85 = metadata !{i32 203, i32 7, metadata !66, null}
!86 = metadata !{i32 205, i32 9, metadata !87, null}
!87 = metadata !{i32 786443, metadata !66, i32 203, i32 63, metadata !4, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!88 = metadata !{i32 208, i32 5, metadata !87, null}
!89 = metadata !{i32 209, i32 5, metadata !87, null}
!90 = metadata !{i32 214, i32 7, metadata !66, null}
!91 = metadata !{i32 216, i32 9, metadata !92, null}
!92 = metadata !{i32 786443, metadata !66, i32 214, i32 38, metadata !4, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!93 = metadata !{i32 219, i32 5, metadata !92, null}
!94 = metadata !{i32 220, i32 5, metadata !92, null}
!95 = metadata !{i32 225, i32 40, metadata !66, null}
!96 = metadata !{i32 228, i32 3, metadata !66, null}
!97 = metadata !{i32 230, i32 20, metadata !98, null}
!98 = metadata !{i32 786443, metadata !66, i32 228, i32 11, metadata !4, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!99 = metadata !{i32 232, i32 11, metadata !100, null}
!100 = metadata !{i32 786443, metadata !98, i32 230, i32 80, metadata !4, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!101 = metadata !{i32 235, i32 7, metadata !100, null}
!102 = metadata !{i32 236, i32 7, metadata !100, null}
!103 = metadata !{i32 242, i32 9, metadata !98, null}
!104 = metadata !{i32 244, i32 11, metadata !105, null}
!105 = metadata !{i32 786443, metadata !98, i32 242, i32 84, metadata !4, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!106 = metadata !{i32 247, i32 11, metadata !105, null}
!107 = metadata !{i32 250, i32 7, metadata !105, null}
!108 = metadata !{i32 251, i32 7, metadata !105, null}
!109 = metadata !{i32 258, i32 5, metadata !98, null}
!110 = metadata !{i32 261, i32 9, metadata !98, null}
!111 = metadata !{i32 263, i32 11, metadata !112, null}
!112 = metadata !{i32 786443, metadata !98, i32 261, i32 48, metadata !4, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!113 = metadata !{i32 266, i32 11, metadata !112, null}
!114 = metadata !{i32 269, i32 7, metadata !112, null}
!115 = metadata !{i32 270, i32 7, metadata !112, null}
!116 = metadata !{i32 281, i32 5, metadata !98, null}
!117 = metadata !{i32 283, i32 9, metadata !98, null}
!118 = metadata !{i32 0, i32 2}
!119 = metadata !{i32 284, i32 7, metadata !120, null}
!120 = metadata !{i32 786443, metadata !98, i32 283, i32 36, metadata !4, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!121 = metadata !{i32 285, i32 7, metadata !120, null}
!122 = metadata !{i32 288, i32 18, metadata !98, null}
!123 = metadata !{i32 0, i32 3}
!124 = metadata !{i32 289, i32 11, metadata !125, null}
!125 = metadata !{i32 786443, metadata !98, i32 288, i32 60, metadata !4, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!126 = metadata !{i32 292, i32 11, metadata !125, null}
!127 = metadata !{i32 296, i32 7, metadata !125, null}
!128 = metadata !{i32 297, i32 2, metadata !129, null}
!129 = metadata !{i32 786443, metadata !125, i32 296, i32 32, metadata !4, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!130 = metadata !{i32 298, i32 9, metadata !129, null}
!131 = metadata !{i32 301, i32 2, metadata !132, null}
!132 = metadata !{i32 786443, metadata !125, i32 299, i32 12, metadata !4, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!133 = metadata !{i32 311, i32 24, metadata !98, null}
!134 = metadata !{i32 312, i32 5, metadata !98, null}
!135 = metadata !{i32 314, i32 5, metadata !98, null}
!136 = metadata !{i32 317, i32 17, metadata !137, null}
!137 = metadata !{i32 786443, metadata !98, i32 314, i32 34, metadata !4, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!138 = metadata !{i32 321, i32 11, metadata !137, null}
!139 = metadata !{i32 323, i32 6, metadata !140, null}
!140 = metadata !{i32 786443, metadata !137, i32 321, i32 65, metadata !4, i32 25} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!141 = metadata !{i32 326, i32 6, metadata !140, null}
!142 = metadata !{i32 329, i32 2, metadata !140, null}
!143 = metadata !{i32 330, i32 2, metadata !140, null}
!144 = metadata !{i32 334, i32 11, metadata !145, null}
!145 = metadata !{i32 786443, metadata !98, i32 332, i32 10, metadata !4, i32 28} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!146 = metadata !{metadata !"struct.point.0"}
!147 = metadata !{i32 336, i32 6, metadata !148, null}
!148 = metadata !{i32 786443, metadata !145, i32 334, i32 59, metadata !4, i32 29} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!149 = metadata !{i32 339, i32 6, metadata !148, null}
!150 = metadata !{i32 342, i32 2, metadata !148, null}
!151 = metadata !{i32 343, i32 2, metadata !148, null}
!152 = metadata !{i32 349, i32 9, metadata !98, null}
!153 = metadata !{i32 351, i32 11, metadata !154, null}
!154 = metadata !{i32 786443, metadata !98, i32 349, i32 49, metadata !4, i32 32} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!155 = metadata !{i32 354, i32 11, metadata !154, null}
!156 = metadata !{i32 357, i32 7, metadata !154, null}
!157 = metadata !{i32 358, i32 7, metadata !154, null}
!158 = metadata !{i32 363, i32 9, metadata !98, null}
!159 = metadata !{i32 365, i32 11, metadata !160, null}
!160 = metadata !{i32 786443, metadata !98, i32 363, i32 30, metadata !4, i32 35} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!161 = metadata !{i32 368, i32 7, metadata !160, null}
!162 = metadata !{i32 369, i32 7, metadata !160, null}
!163 = metadata !{i32 477, i32 7, metadata !164, null}
!164 = metadata !{i32 786443, metadata !54, i32 475, i32 34, metadata !4, i32 55} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!165 = metadata !{i32 478, i32 5, metadata !166, null}
!166 = metadata !{i32 786443, metadata !164, i32 477, i32 27, metadata !4, i32 56} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!167 = metadata !{i32 479, i32 9, metadata !166, null}
!168 = metadata !{i32 480, i32 5, metadata !166, null}
!169 = metadata !{i32 485, i32 14, metadata !164, null}
!170 = metadata !{i32 491, i32 18, metadata !164, null}
!171 = metadata !{i32 492, i32 15, metadata !164, null}
!172 = metadata !{i32 493, i32 17, metadata !164, null}
!173 = metadata !{i32 494, i32 16, metadata !164, null}
!174 = metadata !{i32 498, i32 3, metadata !164, null}
!175 = metadata !{i32 499, i32 5, metadata !176, null}
!176 = metadata !{i32 786443, metadata !164, i32 498, i32 20, metadata !4, i32 57} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!177 = metadata !{i32 502, i32 3, metadata !164, null}
!178 = metadata !{i32 503, i32 17, metadata !179, null}
!179 = metadata !{i32 786443, metadata !164, i32 502, i32 19, metadata !4, i32 58} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!180 = metadata !{i32 505, i32 7, metadata !181, null}
!181 = metadata !{i32 786443, metadata !179, i32 503, i32 39, metadata !4, i32 59} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!182 = metadata !{i32 507, i32 11, metadata !181, null}
!183 = metadata !{i32 508, i32 11, metadata !181, null}
!184 = metadata !{i32 509, i32 11, metadata !181, null}
!185 = metadata !{i32 511, i32 10, metadata !181, null}
!186 = metadata !{i32 511, i32 37, metadata !181, null}
!187 = metadata !{i32 513, i32 16, metadata !188, null}
!188 = metadata !{i32 786443, metadata !181, i32 511, i32 60, metadata !4, i32 60} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!189 = metadata !{i32 514, i32 13, metadata !188, null}
!190 = metadata !{i32 515, i32 13, metadata !188, null}
!191 = metadata !{i32 516, i32 13, metadata !188, null}
!192 = metadata !{i32 517, i32 13, metadata !188, null}
!193 = metadata !{i32 518, i32 14, metadata !188, null}
!194 = metadata !{i32 520, i32 6, metadata !188, null}
!195 = metadata !{i32 521, i32 8, metadata !196, null}
!196 = metadata !{i32 786443, metadata !188, i32 520, i32 62, metadata !4, i32 61} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!197 = metadata !{i32 524, i32 4, metadata !196, null}
!198 = metadata !{i32 526, i32 2, metadata !188, null}
!199 = metadata !{i32 530, i32 7, metadata !164, null}
!200 = metadata !{i32 533, i32 3, metadata !164, null}
!201 = metadata !{i32 534, i32 1, metadata !164, null}
!202 = metadata !{i32 381, i32 7, metadata !203, null}
!203 = metadata !{i32 786443, metadata !24, i32 378, i32 57, metadata !4, i32 37} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!204 = metadata !{i32 383, i32 5, metadata !205, null}
!205 = metadata !{i32 786443, metadata !203, i32 381, i32 31, metadata !4, i32 38} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!206 = metadata !{i32 385, i32 9, metadata !207, null}
!207 = metadata !{i32 786443, metadata !203, i32 384, i32 8, metadata !4, i32 39} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!208 = metadata !{i32 387, i32 7, metadata !209, null}
!209 = metadata !{i32 786443, metadata !207, i32 385, i32 85, metadata !4, i32 40} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!210 = metadata !{i32 390, i32 5, metadata !207, null}
!211 = metadata !{i32 392, i32 1, metadata !203, null}
!212 = metadata !{metadata !"arg.compute_slope.3"}
!213 = metadata !{metadata !"arg.compute_slope.2"}
!214 = metadata !{metadata !"arg.compute_slope.1"}
!215 = metadata !{metadata !"arg.compute_slope.0"}
!216 = metadata !{i32 402, i32 22, metadata !217, null}
!217 = metadata !{i32 786443, metadata !34, i32 401, i32 54, metadata !4, i32 41} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!218 = metadata !{i64 0, i64 2}
!219 = metadata !{i32 403, i32 22, metadata !217, null}
!220 = metadata !{i32 404, i32 29, metadata !217, null}
!221 = metadata !{i32 412, i32 3, metadata !217, null}
!222 = metadata !{i32 413, i32 5, metadata !223, null}
!223 = metadata !{i32 786443, metadata !217, i32 412, i32 17, metadata !4, i32 42} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!224 = metadata !{i32 416, i32 19, metadata !225, null}
!225 = metadata !{i32 786443, metadata !223, i32 415, i32 10, metadata !4, i32 44} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!226 = metadata !{i32 414, i32 7, metadata !227, null}
!227 = metadata !{i32 786443, metadata !223, i32 413, i32 22, metadata !4, i32 43} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!228 = metadata !{i32 415, i32 5, metadata !227, null}
!229 = metadata !{i32 417, i32 19, metadata !225, null}
!230 = metadata !{i32 418, i32 7, metadata !225, null}
!231 = metadata !{i32 420, i32 5, metadata !223, null}
!232 = metadata !{i32 423, i32 5, metadata !233, null}
!233 = metadata !{i32 786443, metadata !217, i32 421, i32 8, metadata !4, i32 45} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!234 = metadata !{i32 425, i32 1, metadata !217, null}
!235 = metadata !{metadata !"arg.compute_y_intercept.2"}
!236 = metadata !{metadata !"arg.compute_y_intercept.1"}
!237 = metadata !{i32 433, i32 3, metadata !238, null}
!238 = metadata !{i32 786443, metadata !39, i32 432, i32 44, metadata !4, i32 46} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!239 = metadata !{i32 448, i32 17, metadata !240, null}
!240 = metadata !{i32 786443, metadata !46, i32 446, i32 37, metadata !4, i32 48} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!241 = metadata !{i32 448, i32 34, metadata !240, null}
!242 = metadata !{i32 449, i32 9, metadata !243, null}
!243 = metadata !{i32 786443, metadata !240, i32 448, i32 47, metadata !4, i32 49} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!244 = metadata !{i32 450, i32 7, metadata !245, null}
!245 = metadata !{i32 786443, metadata !243, i32 449, i32 40, metadata !4, i32 50} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!246 = metadata !{i32 453, i32 3, metadata !240, null}
!247 = metadata !{i32 454, i32 1, metadata !240, null}
!248 = metadata !{i32 469, i32 11, metadata !249, null}
!249 = metadata !{i32 786443, metadata !50, i32 468, i32 130, metadata !4, i32 54} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!250 = metadata !{i32 440, i32 3, metadata !251, null}
!251 = metadata !{i32 786443, metadata !42, i32 439, i32 71, metadata !4, i32 47} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!252 = metadata !{i32 458, i32 15, metadata !253, null}
!253 = metadata !{i32 786443, metadata !49, i32 457, i32 69, metadata !4, i32 51} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!254 = metadata !{i32 460, i32 3, metadata !253, null}
!255 = metadata !{i32 461, i32 5, metadata !256, null}
!256 = metadata !{i32 786443, metadata !253, i32 460, i32 20, metadata !4, i32 52} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!257 = metadata !{i32 463, i32 5, metadata !258, null}
!258 = metadata !{i32 786443, metadata !253, i32 462, i32 8, metadata !4, i32 53} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint/server.c]
!259 = metadata !{i32 465, i32 1, metadata !253, null}
!260 = metadata !{metadata !"arg._kint.__inline_strncpy_chk.2"}
!261 = metadata !{i32 131, i32 57, metadata !262, null}
!262 = metadata !{i32 786443, metadata !55, i32 130, i32 1, metadata !56, i32 64} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx24/src/kint//usr/include/secure/_string.h]
