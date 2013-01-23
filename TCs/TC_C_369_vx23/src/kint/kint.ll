; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct._RuneLocale = type { [8 x i8], [32 x i8], i32 (i8*, i64, i8**)*, i32 (i32, i8*, i64, i8**)*, i32, [256 x i32], [256 x i32], [256 x i32], %struct._RuneRange, %struct._RuneRange, %struct._RuneRange, i8*, i32, i32, %struct._RuneCharClass* }
%struct._RuneRange = type { i32, %struct._RuneEntry* }
%struct._RuneEntry = type { i32, i32, i32, i32* }
%struct._RuneCharClass = type { [14 x i8], i32 }
%struct.assoc = type { i8*, i8* }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%2x\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale

define %struct.assoc* @parse_query_string(i8* %qs) nounwind uwtable ssp {
  %1 = icmp ne i8* %qs, null, !dbg !49
  br i1 %1, label %2, label %5, !dbg !49

; <label>:2                                       ; preds = %0
  %3 = load i8* %qs, align 1, !dbg !49
  %4 = icmp ne i8 %3, 0, !dbg !49
  br i1 %4, label %10, label %5, !dbg !49

; <label>:5                                       ; preds = %2, %0
  %6 = call i8* @malloc(i64 16), !dbg !51
  %7 = bitcast i8* %6 to %struct.assoc*, !dbg !51
  %8 = getelementptr inbounds %struct.assoc* %7, i32 0, i32 1, !dbg !53
  store i8* null, i8** %8, align 8, !dbg !53
  %9 = getelementptr inbounds %struct.assoc* %7, i32 0, i32 0, !dbg !53
  store i8* null, i8** %9, align 8, !dbg !53
  br label %143, !dbg !54

; <label>:10                                      ; preds = %2
  %11 = call i64 @strlen(i8* %qs), !dbg !55
  br label %12, !dbg !56

; <label>:12                                      ; preds = %25, %10
  %cp.0 = phi i8* [ %qs, %10 ], [ %26, %25 ]
  %seps.0 = phi i32 [ 0, %10 ], [ %seps.1, %25 ]
  %13 = load i8* %cp.0, align 1, !dbg !56
  %14 = icmp ne i8 %13, 0, !dbg !56
  br i1 %14, label %15, label %27, !dbg !56

; <label>:15                                      ; preds = %12
  %16 = load i8* %cp.0, align 1, !dbg !58
  %17 = sext i8 %16 to i32, !dbg !58
  %18 = icmp eq i32 %17, 38, !dbg !58
  br i1 %18, label %23, label %19, !dbg !58

; <label>:19                                      ; preds = %15
  %20 = load i8* %cp.0, align 1, !dbg !58
  %21 = sext i8 %20 to i32, !dbg !58
  %22 = icmp eq i32 %21, 59, !dbg !58
  br i1 %22, label %23, label %25, !dbg !58

; <label>:23                                      ; preds = %19, %15
  %24 = add nsw i32 %seps.0, 1, !dbg !59
  br label %25, !dbg !59

; <label>:25                                      ; preds = %23, %19
  %seps.1 = phi i32 [ %24, %23 ], [ %seps.0, %19 ]
  %26 = getelementptr inbounds i8* %cp.0, i32 1, !dbg !60
  br label %12, !dbg !60

; <label>:27                                      ; preds = %12
  %28 = add nsw i32 %seps.0, 2, !dbg !61
  %29 = sext i32 %28 to i64, !dbg !61
  %30 = mul i64 %29, 16, !dbg !61
  %31 = add i64 %30, %11, !dbg !61
  %32 = add i64 %31, 1, !dbg !61
  %33 = call i8* @malloc(i64 %32), !dbg !61
  %34 = bitcast i8* %33 to %struct.assoc*, !dbg !61
  %35 = add nsw i32 %seps.0, 1, !dbg !62
  %36 = sext i32 %35 to i64, !dbg !62
  %37 = getelementptr inbounds %struct.assoc* %34, i64 %36, !dbg !62
  %38 = getelementptr inbounds %struct.assoc* %37, i32 0, i32 1, !dbg !62
  store i8* null, i8** %38, align 8, !dbg !62
  %39 = add nsw i32 %seps.0, 1, !dbg !62
  %40 = sext i32 %39 to i64, !dbg !62
  %41 = getelementptr inbounds %struct.assoc* %34, i64 %40, !dbg !62
  %42 = getelementptr inbounds %struct.assoc* %41, i32 0, i32 0, !dbg !62
  store i8* null, i8** %42, align 8, !dbg !62
  %43 = sext i32 %seps.0 to i64, !dbg !63
  %44 = getelementptr inbounds %struct.assoc* %34, i64 %43, !dbg !63
  %45 = getelementptr inbounds %struct.assoc* %44, i64 2, !dbg !63
  %46 = bitcast %struct.assoc* %45 to i8*, !dbg !63
  %47 = call i64 @llvm.objectsize.i64(i8* %46, i1 false), !dbg !63
  %48 = icmp ne i64 %47, -1, !dbg !63
  %49 = sext i32 %seps.0 to i64, !dbg !63
  %50 = getelementptr inbounds %struct.assoc* %34, i64 %49, !dbg !63
  %51 = getelementptr inbounds %struct.assoc* %50, i64 2, !dbg !63
  %52 = bitcast %struct.assoc* %51 to i8*, !dbg !63
  %53 = add i64 %11, 1, !dbg !63
  br i1 %48, label %54, label %61, !dbg !63

; <label>:54                                      ; preds = %27
  %55 = sext i32 %seps.0 to i64, !dbg !63
  %56 = getelementptr inbounds %struct.assoc* %34, i64 %55, !dbg !63
  %57 = getelementptr inbounds %struct.assoc* %56, i64 2, !dbg !63
  %58 = bitcast %struct.assoc* %57 to i8*, !dbg !63
  %59 = call i64 @llvm.objectsize.i64(i8* %58, i1 false), !dbg !63
  %60 = call i8* @__memcpy_chk(i8* %52, i8* %qs, i64 %53, i64 %59) nounwind, !dbg !63
  br label %63, !dbg !63

; <label>:61                                      ; preds = %27
  %62 = call i8* @__inline_memcpy_chk(i8* %52, i8* %qs, i64 %53), !dbg !63
  br label %63, !dbg !63

; <label>:63                                      ; preds = %61, %54
  %64 = phi i8* [ %60, %54 ], [ %62, %61 ], !dbg !63
  br label %65, !dbg !64

; <label>:65                                      ; preds = %84, %63
  %f.0 = phi i8* [ %64, %63 ], [ %f.1, %84 ]
  %key.0 = phi i32 [ 1, %63 ], [ %key.1, %84 ]
  %a.0 = phi %struct.assoc* [ %34, %63 ], [ %a.1, %84 ]
  %qp.0 = phi i8* [ %64, %63 ], [ %85, %84 ]
  %66 = load i8* %qp.0, align 1, !dbg !64
  %67 = icmp ne i8 %66, 0, !dbg !64
  br i1 %67, label %68, label %86, !dbg !64

; <label>:68                                      ; preds = %65
  %69 = load i8* %qp.0, align 1, !dbg !66
  %70 = sext i8 %69 to i32, !dbg !66
  switch i32 %70, label %84 [
    i32 38, label %71
    i32 59, label %71
    i32 61, label %81
  ], !dbg !66

; <label>:71                                      ; preds = %68, %68
  %72 = icmp ne i32 %key.0, 0, !dbg !67
  br i1 %72, label %73, label %76, !dbg !67

; <label>:73                                      ; preds = %71
  %74 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 0, !dbg !69
  store i8* %f.0, i8** %74, align 8, !dbg !69
  %75 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 1, !dbg !71
  store i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8** %75, align 8, !dbg !71
  br label %78, !dbg !72

; <label>:76                                      ; preds = %71
  %77 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 1, !dbg !73
  store i8* %f.0, i8** %77, align 8, !dbg !73
  br label %78

; <label>:78                                      ; preds = %76, %73
  store i8 0, i8* %qp.0, align 1, !dbg !74
  %79 = getelementptr inbounds i8* %qp.0, i64 1, !dbg !75
  %80 = getelementptr inbounds %struct.assoc* %a.0, i32 1, !dbg !76
  br label %84, !dbg !77

; <label>:81                                      ; preds = %68
  store i8 0, i8* %qp.0, align 1, !dbg !78
  %82 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 0, !dbg !79
  store i8* %f.0, i8** %82, align 8, !dbg !79
  %83 = getelementptr inbounds i8* %qp.0, i64 1, !dbg !80
  br label %84, !dbg !81

; <label>:84                                      ; preds = %81, %78, %68
  %f.1 = phi i8* [ %f.0, %68 ], [ %83, %81 ], [ %79, %78 ]
  %key.1 = phi i32 [ %key.0, %68 ], [ 0, %81 ], [ 1, %78 ]
  %a.1 = phi %struct.assoc* [ %a.0, %68 ], [ %a.0, %81 ], [ %80, %78 ]
  %85 = getelementptr inbounds i8* %qp.0, i32 1, !dbg !82
  br label %65, !dbg !82

; <label>:86                                      ; preds = %65
  %87 = icmp ne i32 %key.0, 0, !dbg !83
  br i1 %87, label %88, label %91, !dbg !83

; <label>:88                                      ; preds = %86
  %89 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 0, !dbg !84
  store i8* %f.0, i8** %89, align 8, !dbg !84
  %90 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 1, !dbg !86
  store i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8** %90, align 8, !dbg !86
  br label %93, !dbg !87

; <label>:91                                      ; preds = %86
  %92 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 1, !dbg !88
  store i8* %f.0, i8** %92, align 8, !dbg !88
  br label %93

; <label>:93                                      ; preds = %91, %88
  br label %94, !dbg !89

; <label>:94                                      ; preds = %137, %93
  %a.2 = phi %struct.assoc* [ %34, %93 ], [ %139, %137 ]
  %95 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !89
  %96 = load i8** %95, align 8, !dbg !89
  %97 = icmp ne i8* %96, null, !dbg !89
  br i1 %97, label %98, label %140, !dbg !89

; <label>:98                                      ; preds = %94
  %99 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !91
  %100 = load i8** %99, align 8, !dbg !91
  %101 = call i8* @decode(i8* %100), !dbg !91
  %102 = icmp ne i8* %101, null, !dbg !93
  br i1 %102, label %103, label %141, !dbg !93

; <label>:103                                     ; preds = %98
  %104 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !94
  %105 = load i8** %104, align 8, !dbg !94
  %106 = call i64 @llvm.objectsize.i64(i8* %105, i1 false), !dbg !94
  %107 = icmp ne i64 %106, -1, !dbg !94
  %108 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !94
  %109 = load i8** %108, align 8, !dbg !94
  br i1 %107, label %110, label %115, !dbg !94

; <label>:110                                     ; preds = %103
  %111 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !94
  %112 = load i8** %111, align 8, !dbg !94
  %113 = call i64 @llvm.objectsize.i64(i8* %112, i1 false), !dbg !94
  %114 = call i8* @__strcpy_chk(i8* %109, i8* %101, i64 %113) nounwind, !dbg !94
  br label %117, !dbg !94

; <label>:115                                     ; preds = %103
  %116 = call i8* @__inline_strcpy_chk(i8* %109, i8* %101), !dbg !94
  br label %117, !dbg !94

; <label>:117                                     ; preds = %115, %110
  %118 = phi i8* [ %114, %110 ], [ %116, %115 ], !dbg !94
  call void @free(i8* %101), !dbg !96
  %119 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !97
  %120 = load i8** %119, align 8, !dbg !97
  %121 = call i8* @decode(i8* %120), !dbg !97
  %122 = icmp ne i8* %121, null, !dbg !98
  br i1 %122, label %123, label %141, !dbg !98

; <label>:123                                     ; preds = %117
  %124 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !99
  %125 = load i8** %124, align 8, !dbg !99
  %126 = call i64 @llvm.objectsize.i64(i8* %125, i1 false), !dbg !99
  %127 = icmp ne i64 %126, -1, !dbg !99
  %128 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !99
  %129 = load i8** %128, align 8, !dbg !99
  br i1 %127, label %130, label %135, !dbg !99

; <label>:130                                     ; preds = %123
  %131 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !99
  %132 = load i8** %131, align 8, !dbg !99
  %133 = call i64 @llvm.objectsize.i64(i8* %132, i1 false), !dbg !99
  %134 = call i8* @__strcpy_chk(i8* %129, i8* %121, i64 %133) nounwind, !dbg !99
  br label %137, !dbg !99

; <label>:135                                     ; preds = %123
  %136 = call i8* @__inline_strcpy_chk(i8* %129, i8* %121), !dbg !99
  br label %137, !dbg !99

; <label>:137                                     ; preds = %135, %130
  %138 = phi i8* [ %134, %130 ], [ %136, %135 ], !dbg !99
  call void @free(i8* %121), !dbg !101
  %139 = getelementptr inbounds %struct.assoc* %a.2, i32 1, !dbg !102
  br label %94, !dbg !102

; <label>:140                                     ; preds = %94
  br label %143, !dbg !103

; <label>:141                                     ; preds = %117, %98
  %142 = bitcast %struct.assoc* %34 to i8*, !dbg !104
  call void @free(i8* %142), !dbg !104
  br label %143, !dbg !105

; <label>:143                                     ; preds = %141, %140, %5
  %.0 = phi %struct.assoc* [ null, %141 ], [ %34, %140 ], [ %7, %5 ]
  ret %struct.assoc* %.0, !dbg !106
}

declare i8* @malloc(i64)

declare i64 @strlen(i8*)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memcpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_memcpy_chk(i8* %__dest, i8* %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !107
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !108
  %2 = call i8* @__memcpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !108
  ret i8* %2, !dbg !108
}

define internal i8* @decode(i8* %field) nounwind uwtable ssp {
  %c = alloca i32, align 4
  %1 = icmp ne i8* %field, null, !dbg !110
  br i1 %1, label %3, label %2, !dbg !110

; <label>:2                                       ; preds = %0
  br label %41, !dbg !112

; <label>:3                                       ; preds = %0
  %4 = call i64 @strlen(i8* %field), !dbg !113
  %5 = add i64 %4, 1, !dbg !113
  %6 = call i8* @malloc(i64 %5), !dbg !113
  br label %7, !dbg !114

; <label>:7                                       ; preds = %38, %3
  %cp.0 = phi i8* [ %6, %3 ], [ %cp.1, %38 ]
  %.01 = phi i8* [ %field, %3 ], [ %39, %38 ]
  %8 = load i8* %.01, align 1, !dbg !114
  %9 = icmp ne i8 %8, 0, !dbg !114
  br i1 %9, label %10, label %40, !dbg !114

; <label>:10                                      ; preds = %7
  %11 = load i8* %.01, align 1, !dbg !116
  %12 = sext i8 %11 to i32, !dbg !116
  %13 = call i32 @leave(i32 %12), !dbg !116, !intrange !118
  %14 = icmp ne i32 %13, 0, !dbg !116
  %15 = load i8* %.01, align 1, !dbg !119
  br i1 %14, label %16, label %18, !dbg !116

; <label>:16                                      ; preds = %10
  %17 = getelementptr inbounds i8* %cp.0, i32 1, !dbg !119
  store i8 %15, i8* %cp.0, align 1, !dbg !119
  br label %38, !dbg !119

; <label>:18                                      ; preds = %10
  %19 = sext i8 %15 to i32, !dbg !120
  %20 = icmp eq i32 %19, 43, !dbg !120
  br i1 %20, label %21, label %23, !dbg !120

; <label>:21                                      ; preds = %18
  %22 = getelementptr inbounds i8* %cp.0, i32 1, !dbg !121
  store i8 32, i8* %cp.0, align 1, !dbg !121
  br label %38, !dbg !121

; <label>:23                                      ; preds = %18
  %24 = getelementptr inbounds i8* %.01, i32 1, !dbg !122
  %25 = load i8* %.01, align 1, !dbg !122
  %26 = sext i8 %25 to i32, !dbg !122
  %27 = icmp ne i32 %26, 37, !dbg !122
  br i1 %27, label %28, label %29, !dbg !122

; <label>:28                                      ; preds = %23
  call void @free(i8* %6), !dbg !123
  br label %41, !dbg !125

; <label>:29                                      ; preds = %23
  %30 = call i32 (i8*, i8*, ...)* @sscanf(i8* %24, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32* %c), !dbg !126
  %31 = icmp ne i32 %30, 1, !dbg !128
  br i1 %31, label %32, label %33, !dbg !128

; <label>:32                                      ; preds = %29
  call void @free(i8* %6), !dbg !129
  br label %41, !dbg !131

; <label>:33                                      ; preds = %29
  %34 = getelementptr inbounds i8* %24, i64 1, !dbg !132
  %35 = load i32* %c, align 4, !dbg !133
  %36 = trunc i32 %35 to i8, !dbg !133
  %37 = getelementptr inbounds i8* %cp.0, i32 1, !dbg !133
  store i8 %36, i8* %cp.0, align 1, !dbg !133
  br label %38

; <label>:38                                      ; preds = %33, %21, %16
  %cp.1 = phi i8* [ %17, %16 ], [ %22, %21 ], [ %37, %33 ]
  %.1 = phi i8* [ %.01, %16 ], [ %.01, %21 ], [ %34, %33 ]
  %39 = getelementptr inbounds i8* %.1, i32 1, !dbg !134
  br label %7, !dbg !134

; <label>:40                                      ; preds = %7
  store i8 0, i8* %cp.0, align 1, !dbg !135
  br label %41, !dbg !136

; <label>:41                                      ; preds = %40, %32, %28, %2
  %.0 = phi i8* [ null, %28 ], [ null, %32 ], [ %6, %40 ], [ null, %2 ]
  ret i8* %.0, !dbg !137
}

declare i8* @__strcpy_chk(i8*, i8*, i64) nounwind

define internal i8* @__inline_strcpy_chk(i8* noalias %__dest, i8* noalias %__src) nounwind uwtable inlinehint ssp {
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !138
  %2 = call i8* @__strcpy_chk(i8* %__dest, i8* %__src, i64 %1) nounwind, !dbg !138
  ret i8* %2, !dbg !138
}

declare void @free(i8*)

define internal i32 @leave(i32 %c) nounwind uwtable ssp {
  %c1 = call i32 @kint_arg.i32(), !id !140
  %1 = call i32 @isalnum(i32 %c1), !dbg !141, !intrange !118
  %2 = icmp ne i32 %1, 0, !dbg !141
  br i1 %2, label %3, label %4, !dbg !141

; <label>:3                                       ; preds = %0
  br label %7, !dbg !143

; <label>:4                                       ; preds = %0
  switch i32 %c1, label %6 [
    i32 46, label %5
    i32 44, label %5
    i32 45, label %5
    i32 95, label %5
    i32 126, label %5
  ], !dbg !144

; <label>:5                                       ; preds = %4, %4, %4, %4, %4
  br label %7, !dbg !145

; <label>:6                                       ; preds = %4
  br label %7, !dbg !147

; <label>:7                                       ; preds = %6, %5, %3
  %.0 = phi i32 [ 1, %3 ], [ 0, %6 ], [ 1, %5 ]
  ret i32 %.0, !dbg !148
}

declare i32 @sscanf(i8*, i8*, ...)

define internal i32 @isalnum(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !149
  %1 = call i32 @__istype(i32 %_c1, i64 1280), !dbg !150, !intrange !118
  ret i32 %1, !dbg !150
}

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !152, !intrange !153
  %_c1 = call i32 @kint_arg.i32(), !id !154
  %1 = call i32 @isascii(i32 %_c1), !dbg !155, !intrange !118
  %2 = icmp ne i32 %1, 0, !dbg !155
  br i1 %2, label %3, label %10, !dbg !155

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !155
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !155
  %6 = load i32* %5, align 4, !dbg !155
  %7 = zext i32 %6 to i64, !dbg !155
  %8 = and i64 %7, %_f2, !dbg !155
  %9 = icmp ne i64 %8, 0, !dbg !155
  br label %13, !dbg !155

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c1, i64 %_f2), !dbg !157
  %12 = icmp ne i32 %11, 0, !dbg !157
  br label %13, !dbg !157

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !155
  %15 = xor i1 %14, true, !dbg !155
  %16 = zext i1 %15 to i32, !dbg !155
  ret i32 %16, !dbg !157
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !158
  %1 = and i32 %_c1, -128, !dbg !159
  %2 = icmp eq i32 %1, 0, !dbg !159
  %3 = zext i1 %2 to i32, !dbg !159
  ret i32 %3, !dbg !159
}

declare i32 @__maskrune(i32, i64)

declare i64 @kint_arg.i64()

declare i32 @kint_arg.i32()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"query.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !20, metadata !23, metadata !27, metadata !29, metadata !34, metadata !35, metadata !41}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"parse_query_string", metadata !"parse_query_string", metadata !"", metadata !6, i32 15, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.assoc* (i8*)* @parse_query_string, null, null, metadata !1, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [parse_query_string]
!6 = metadata !{i32 786473, metadata !"query.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !18}
!9 = metadata !{i32 786454, null, metadata !"assoc_t", metadata !6, i32 9, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [assoc_t] [line 9, size 0, align 0, offset 0] [from ]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from assoc]
!11 = metadata !{i32 786451, null, metadata !"assoc", metadata !12, i32 4, i64 128, i64 64, i32 0, i32 0, null, metadata !13, i32 0, i32 0} ; [ DW_TAG_structure_type ] [assoc] [line 4, size 128, align 64, offset 0] [from ]
!12 = metadata !{i32 786473, metadata !"./query.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint", null} ; [ DW_TAG_file_type ]
!13 = metadata !{metadata !14, metadata !17}
!14 = metadata !{i32 786445, metadata !11, metadata !"key", metadata !12, i32 5, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [key] [line 5, size 64, align 64, offset 0] [from ]
!15 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = metadata !{i32 786445, metadata !11, metadata !"val", metadata !12, i32 6, i64 64, i64 64, i64 64, i32 0, metadata !15} ; [ DW_TAG_member ] [val] [line 6, size 64, align 64, offset 64] [from ]
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!20 = metadata !{i32 786478, i32 0, metadata !6, metadata !"decode", metadata !"decode", metadata !"", metadata !6, i32 117, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*)* @decode, null, null, metadata !1, i32 118} ; [ DW_TAG_subprogram ] [line 117] [local] [def] [scope 118] [decode]
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !15, metadata !18}
!23 = metadata !{i32 786478, i32 0, metadata !6, metadata !"leave", metadata !"leave", metadata !"", metadata !6, i32 97, metadata !24, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @leave, null, null, metadata !1, i32 98} ; [ DW_TAG_subprogram ] [line 97] [local] [def] [scope 98] [leave]
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !26, metadata !26}
!26 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = metadata !{i32 786478, i32 0, metadata !28, metadata !"isalnum", metadata !"isalnum", metadata !"", metadata !28, i32 229, metadata !24, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isalnum, null, null, metadata !1, i32 230} ; [ DW_TAG_subprogram ] [line 229] [local] [def] [scope 230] [isalnum]
!28 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint", null} ; [ DW_TAG_file_type ]
!29 = metadata !{i32 786478, i32 0, metadata !28, metadata !"__istype", metadata !"__istype", metadata !"", metadata !28, i32 170, metadata !30, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{metadata !26, metadata !32, metadata !33}
!32 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !28, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !26} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!33 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!34 = metadata !{i32 786478, i32 0, metadata !28, metadata !"isascii", metadata !"isascii", metadata !"", metadata !28, i32 152, metadata !24, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!35 = metadata !{i32 786478, i32 0, metadata !36, metadata !"__inline_strcpy_chk", metadata !"__inline_strcpy_chk", metadata !"", metadata !36, i32 92, metadata !37, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*)* @__inline_strcpy_chk, null, null, metadata !1, i32 93} ; [ DW_TAG_subprogram ] [line 92] [local] [def] [scope 93] [__inline_strcpy_chk]
!36 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint", null} ; [ DW_TAG_file_type ]
!37 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{metadata !15, metadata !39, metadata !40}
!39 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{i32 786478, i32 0, metadata !36, metadata !"__inline_memcpy_chk", metadata !"__inline_memcpy_chk", metadata !"", metadata !36, i32 59, metadata !42, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_memcpy_chk, null, null, metadata !1, i32 60} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 60] [__inline_memcpy_chk]
!42 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{metadata !44, metadata !44, metadata !45, metadata !47}
!44 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!46 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{i32 786454, null, metadata !"size_t", metadata !6, i32 78, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ] [size_t] [line 78, size 0, align 0, offset 0] [from __darwin_size_t]
!48 = metadata !{i32 786454, null, metadata !"__darwin_size_t", metadata !6, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ] [__darwin_size_t] [line 90, size 0, align 0, offset 0] [from long unsigned int]
!49 = metadata !{i32 18, i32 3, metadata !50, null}
!50 = metadata !{i32 786443, metadata !5, i32 16, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!51 = metadata !{i32 19, i32 11, metadata !52, null}
!52 = metadata !{i32 786443, metadata !50, i32 18, i32 20, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!53 = metadata !{i32 20, i32 5, metadata !52, null}
!54 = metadata !{i32 21, i32 5, metadata !52, null}
!55 = metadata !{i32 23, i32 16, metadata !50, null}
!56 = metadata !{i32 26, i32 3, metadata !57, null}
!57 = metadata !{i32 786443, metadata !50, i32 26, i32 3, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!58 = metadata !{i32 27, i32 5, metadata !57, null}
!59 = metadata !{i32 28, i32 7, metadata !57, null}
!60 = metadata !{i32 26, i32 15, metadata !57, null}
!61 = metadata !{i32 30, i32 9, metadata !50, null}
!62 = metadata !{i32 31, i32 3, metadata !50, null}
!63 = metadata !{i32 32, i32 13, metadata !50, null}
!64 = metadata !{i32 39, i32 3, metadata !65, null}
!65 = metadata !{i32 786443, metadata !50, i32 39, i32 3, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!66 = metadata !{i32 40, i32 5, metadata !65, null}
!67 = metadata !{i32 43, i32 7, metadata !68, null}
!68 = metadata !{i32 786443, metadata !65, i32 40, i32 18, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!69 = metadata !{i32 44, i32 2, metadata !70, null}
!70 = metadata !{i32 786443, metadata !68, i32 43, i32 16, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!71 = metadata !{i32 45, i32 2, metadata !70, null}
!72 = metadata !{i32 46, i32 7, metadata !70, null}
!73 = metadata !{i32 48, i32 2, metadata !68, null}
!74 = metadata !{i32 49, i32 7, metadata !68, null}
!75 = metadata !{i32 50, i32 7, metadata !68, null}
!76 = metadata !{i32 52, i32 7, metadata !68, null}
!77 = metadata !{i32 53, i32 7, metadata !68, null}
!78 = metadata !{i32 55, i32 7, metadata !68, null}
!79 = metadata !{i32 56, i32 7, metadata !68, null}
!80 = metadata !{i32 57, i32 7, metadata !68, null}
!81 = metadata !{i32 59, i32 7, metadata !68, null}
!82 = metadata !{i32 39, i32 15, metadata !65, null}
!83 = metadata !{i32 61, i32 3, metadata !50, null}
!84 = metadata !{i32 62, i32 5, metadata !85, null}
!85 = metadata !{i32 786443, metadata !50, i32 61, i32 12, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!86 = metadata !{i32 63, i32 5, metadata !85, null}
!87 = metadata !{i32 64, i32 3, metadata !85, null}
!88 = metadata !{i32 66, i32 5, metadata !50, null}
!89 = metadata !{i32 71, i32 8, metadata !90, null}
!90 = metadata !{i32 786443, metadata !50, i32 71, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!91 = metadata !{i32 72, i32 15, metadata !92, null}
!92 = metadata !{i32 786443, metadata !90, i32 71, i32 30, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!93 = metadata !{i32 73, i32 5, metadata !92, null}
!94 = metadata !{i32 74, i32 7, metadata !95, null}
!95 = metadata !{i32 786443, metadata !92, i32 73, i32 12, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!96 = metadata !{i32 75, i32 7, metadata !95, null}
!97 = metadata !{i32 79, i32 9, metadata !92, null}
!98 = metadata !{i32 80, i32 5, metadata !92, null}
!99 = metadata !{i32 81, i32 7, metadata !100, null}
!100 = metadata !{i32 786443, metadata !92, i32 80, i32 12, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!101 = metadata !{i32 82, i32 7, metadata !100, null}
!102 = metadata !{i32 71, i32 25, metadata !90, null}
!103 = metadata !{i32 88, i32 3, metadata !50, null}
!104 = metadata !{i32 91, i32 3, metadata !50, null}
!105 = metadata !{i32 92, i32 3, metadata !50, null}
!106 = metadata !{i32 93, i32 1, metadata !50, null}
!107 = metadata !{metadata !"arg._kint.__inline_memcpy_chk.2"}
!108 = metadata !{i32 61, i32 56, metadata !109, null}
!109 = metadata !{i32 786443, metadata !41, i32 60, i32 1, metadata !36, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint//usr/include/secure/_string.h]
!110 = metadata !{i32 119, i32 3, metadata !111, null}
!111 = metadata !{i32 786443, metadata !20, i32 118, i32 1, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!112 = metadata !{i32 120, i32 5, metadata !111, null}
!113 = metadata !{i32 121, i32 23, metadata !111, null}
!114 = metadata !{i32 123, i32 3, metadata !115, null}
!115 = metadata !{i32 786443, metadata !111, i32 123, i32 3, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!116 = metadata !{i32 124, i32 9, metadata !117, null}
!117 = metadata !{i32 786443, metadata !115, i32 123, i32 27, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!118 = metadata !{i32 0, i32 2}
!119 = metadata !{i32 125, i32 7, metadata !117, null}
!120 = metadata !{i32 127, i32 7, metadata !117, null}
!121 = metadata !{i32 128, i32 2, metadata !117, null}
!122 = metadata !{i32 130, i32 2, metadata !117, null}
!123 = metadata !{i32 131, i32 4, metadata !124, null}
!124 = metadata !{i32 786443, metadata !117, i32 130, i32 23, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!125 = metadata !{i32 132, i32 4, metadata !124, null}
!126 = metadata !{i32 136, i32 13, metadata !127, null}
!127 = metadata !{i32 786443, metadata !117, i32 134, i32 7, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!128 = metadata !{i32 137, i32 4, metadata !127, null}
!129 = metadata !{i32 138, i32 6, metadata !130, null}
!130 = metadata !{i32 786443, metadata !127, i32 137, i32 17, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!131 = metadata !{i32 139, i32 6, metadata !130, null}
!132 = metadata !{i32 141, i32 4, metadata !127, null}
!133 = metadata !{i32 142, i32 4, metadata !127, null}
!134 = metadata !{i32 123, i32 18, metadata !115, null}
!135 = metadata !{i32 145, i32 3, metadata !111, null}
!136 = metadata !{i32 146, i32 3, metadata !111, null}
!137 = metadata !{i32 147, i32 1, metadata !111, null}
!138 = metadata !{i32 94, i32 49, metadata !139, null}
!139 = metadata !{i32 786443, metadata !35, i32 93, i32 1, metadata !36, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint//usr/include/secure/_string.h]
!140 = metadata !{metadata !"arg._kint.leave.0"}
!141 = metadata !{i32 99, i32 7, metadata !142, null}
!142 = metadata !{i32 786443, metadata !23, i32 98, i32 1, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!143 = metadata !{i32 100, i32 5, metadata !142, null}
!144 = metadata !{i32 101, i32 3, metadata !142, null}
!145 = metadata !{i32 107, i32 5, metadata !146, null}
!146 = metadata !{i32 786443, metadata !142, i32 101, i32 14, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint/query.c]
!147 = metadata !{i32 109, i32 5, metadata !146, null}
!148 = metadata !{i32 111, i32 1, metadata !142, null}
!149 = metadata !{metadata !"arg._kint.isalnum.0"}
!150 = metadata !{i32 231, i32 10, metadata !151, null}
!151 = metadata !{i32 786443, metadata !27, i32 230, i32 1, metadata !28, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint//usr/include/ctype.h]
!152 = metadata !{metadata !"arg._kint.__istype.1"}
!153 = metadata !{i64 1280, i64 1281}
!154 = metadata !{metadata !"arg._kint.__istype.0"}
!155 = metadata !{i32 175, i32 10, metadata !156, null}
!156 = metadata !{i32 786443, metadata !29, i32 171, i32 1, metadata !28, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint//usr/include/ctype.h]
!157 = metadata !{i32 176, i32 7, metadata !156, null}
!158 = metadata !{metadata !"arg._kint.isascii.0"}
!159 = metadata !{i32 154, i32 2, metadata !160, null}
!160 = metadata !{i32 786443, metadata !34, i32 153, i32 1, metadata !28, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_vx23/src/kint//usr/include/ctype.h]
