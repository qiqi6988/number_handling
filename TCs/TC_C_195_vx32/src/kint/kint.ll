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
  %1 = icmp ne i8* %qs, null, !dbg !48
  br i1 %1, label %2, label %5, !dbg !48

; <label>:2                                       ; preds = %0
  %3 = load i8* %qs, align 1, !dbg !48
  %4 = icmp ne i8 %3, 0, !dbg !48
  br i1 %4, label %10, label %5, !dbg !48

; <label>:5                                       ; preds = %2, %0
  %6 = call i8* @malloc(i64 16), !dbg !50
  %7 = bitcast i8* %6 to %struct.assoc*, !dbg !50
  %8 = getelementptr inbounds %struct.assoc* %7, i32 0, i32 1, !dbg !52
  store i8* null, i8** %8, align 8, !dbg !52
  %9 = getelementptr inbounds %struct.assoc* %7, i32 0, i32 0, !dbg !52
  store i8* null, i8** %9, align 8, !dbg !52
  br label %155, !dbg !53

; <label>:10                                      ; preds = %2
  %11 = call i64 @strlen(i8* %qs), !dbg !54
  br label %12, !dbg !55

; <label>:12                                      ; preds = %25, %10
  %cp.0 = phi i8* [ %qs, %10 ], [ %26, %25 ]
  %seps.0 = phi i32 [ 0, %10 ], [ %seps.1, %25 ]
  %13 = load i8* %cp.0, align 1, !dbg !55
  %14 = icmp ne i8 %13, 0, !dbg !55
  br i1 %14, label %15, label %27, !dbg !55

; <label>:15                                      ; preds = %12
  %16 = load i8* %cp.0, align 1, !dbg !57
  %17 = sext i8 %16 to i32, !dbg !57
  %18 = icmp eq i32 %17, 38, !dbg !57
  br i1 %18, label %23, label %19, !dbg !57

; <label>:19                                      ; preds = %15
  %20 = load i8* %cp.0, align 1, !dbg !57
  %21 = sext i8 %20 to i32, !dbg !57
  %22 = icmp eq i32 %21, 59, !dbg !57
  br i1 %22, label %23, label %25, !dbg !57

; <label>:23                                      ; preds = %19, %15
  %24 = add nsw i32 %seps.0, 1, !dbg !58
  br label %25, !dbg !58

; <label>:25                                      ; preds = %23, %19
  %seps.1 = phi i32 [ %24, %23 ], [ %seps.0, %19 ]
  %26 = getelementptr inbounds i8* %cp.0, i32 1, !dbg !59
  br label %12, !dbg !59

; <label>:27                                      ; preds = %12
  %28 = add nsw i32 %seps.0, 2, !dbg !60
  %29 = sext i32 %28 to i64, !dbg !60
  %30 = mul i64 %29, 16, !dbg !60
  %31 = add i64 %30, %11, !dbg !60
  %32 = add i64 %31, 1, !dbg !60
  %33 = call i8* @malloc(i64 %32), !dbg !60
  %34 = bitcast i8* %33 to %struct.assoc*, !dbg !60
  %35 = add nsw i32 %seps.0, 1, !dbg !61
  %36 = sext i32 %35 to i64, !dbg !61
  %37 = getelementptr inbounds %struct.assoc* %34, i64 %36, !dbg !61
  %38 = getelementptr inbounds %struct.assoc* %37, i32 0, i32 1, !dbg !61
  store i8* null, i8** %38, align 8, !dbg !61
  %39 = add nsw i32 %seps.0, 1, !dbg !61
  %40 = sext i32 %39 to i64, !dbg !61
  %41 = getelementptr inbounds %struct.assoc* %34, i64 %40, !dbg !61
  %42 = getelementptr inbounds %struct.assoc* %41, i32 0, i32 0, !dbg !61
  store i8* null, i8** %42, align 8, !dbg !61
  %43 = sext i32 %seps.0 to i64, !dbg !62
  %44 = getelementptr inbounds %struct.assoc* %34, i64 %43, !dbg !62
  %45 = getelementptr inbounds %struct.assoc* %44, i64 2, !dbg !62
  %46 = bitcast %struct.assoc* %45 to i8*, !dbg !62
  %47 = call i64 @llvm.objectsize.i64(i8* %46, i1 false), !dbg !62
  %48 = icmp ne i64 %47, -1, !dbg !62
  %49 = sext i32 %seps.0 to i64, !dbg !62
  %50 = getelementptr inbounds %struct.assoc* %34, i64 %49, !dbg !62
  %51 = getelementptr inbounds %struct.assoc* %50, i64 2, !dbg !62
  %52 = bitcast %struct.assoc* %51 to i8*, !dbg !62
  %53 = add i64 %11, 1, !dbg !62
  br i1 %48, label %54, label %61, !dbg !62

; <label>:54                                      ; preds = %27
  %55 = sext i32 %seps.0 to i64, !dbg !62
  %56 = getelementptr inbounds %struct.assoc* %34, i64 %55, !dbg !62
  %57 = getelementptr inbounds %struct.assoc* %56, i64 2, !dbg !62
  %58 = bitcast %struct.assoc* %57 to i8*, !dbg !62
  %59 = call i64 @llvm.objectsize.i64(i8* %58, i1 false), !dbg !62
  %60 = call i8* @__memcpy_chk(i8* %52, i8* %qs, i64 %53, i64 %59) nounwind, !dbg !62
  br label %63, !dbg !62

; <label>:61                                      ; preds = %27
  %62 = call i8* @__inline_memcpy_chk(i8* %52, i8* %qs, i64 %53), !dbg !62
  br label %63, !dbg !62

; <label>:63                                      ; preds = %61, %54
  %64 = phi i8* [ %60, %54 ], [ %62, %61 ], !dbg !62
  br label %65, !dbg !63

; <label>:65                                      ; preds = %84, %63
  %f.0 = phi i8* [ %64, %63 ], [ %f.1, %84 ]
  %key.0 = phi i32 [ 1, %63 ], [ %key.1, %84 ]
  %a.0 = phi %struct.assoc* [ %34, %63 ], [ %a.1, %84 ]
  %qp.0 = phi i8* [ %64, %63 ], [ %85, %84 ]
  %66 = load i8* %qp.0, align 1, !dbg !63
  %67 = icmp ne i8 %66, 0, !dbg !63
  br i1 %67, label %68, label %86, !dbg !63

; <label>:68                                      ; preds = %65
  %69 = load i8* %qp.0, align 1, !dbg !65
  %70 = sext i8 %69 to i32, !dbg !65
  switch i32 %70, label %84 [
    i32 38, label %71
    i32 59, label %71
    i32 61, label %81
  ], !dbg !65

; <label>:71                                      ; preds = %68, %68
  %72 = icmp ne i32 %key.0, 0, !dbg !66
  br i1 %72, label %73, label %76, !dbg !66

; <label>:73                                      ; preds = %71
  %74 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 0, !dbg !68
  store i8* %f.0, i8** %74, align 8, !dbg !68
  %75 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 1, !dbg !70
  store i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8** %75, align 8, !dbg !70
  br label %78, !dbg !71

; <label>:76                                      ; preds = %71
  %77 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 1, !dbg !72
  store i8* %f.0, i8** %77, align 8, !dbg !72
  br label %78

; <label>:78                                      ; preds = %76, %73
  store i8 0, i8* %qp.0, align 1, !dbg !73
  %79 = getelementptr inbounds i8* %qp.0, i64 1, !dbg !74
  %80 = getelementptr inbounds %struct.assoc* %a.0, i32 1, !dbg !75
  br label %84, !dbg !76

; <label>:81                                      ; preds = %68
  store i8 0, i8* %qp.0, align 1, !dbg !77
  %82 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 0, !dbg !78
  store i8* %f.0, i8** %82, align 8, !dbg !78
  %83 = getelementptr inbounds i8* %qp.0, i64 1, !dbg !79
  br label %84, !dbg !80

; <label>:84                                      ; preds = %81, %78, %68
  %f.1 = phi i8* [ %f.0, %68 ], [ %83, %81 ], [ %79, %78 ]
  %key.1 = phi i32 [ %key.0, %68 ], [ 0, %81 ], [ 1, %78 ]
  %a.1 = phi %struct.assoc* [ %a.0, %68 ], [ %a.0, %81 ], [ %80, %78 ]
  %85 = getelementptr inbounds i8* %qp.0, i32 1, !dbg !81
  br label %65, !dbg !81

; <label>:86                                      ; preds = %65
  %87 = icmp ne i32 %key.0, 0, !dbg !82
  br i1 %87, label %88, label %91, !dbg !82

; <label>:88                                      ; preds = %86
  %89 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 0, !dbg !83
  store i8* %f.0, i8** %89, align 8, !dbg !83
  %90 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 1, !dbg !85
  store i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8** %90, align 8, !dbg !85
  br label %93, !dbg !86

; <label>:91                                      ; preds = %86
  %92 = getelementptr inbounds %struct.assoc* %a.0, i32 0, i32 1, !dbg !87
  store i8* %f.0, i8** %92, align 8, !dbg !87
  br label %93

; <label>:93                                      ; preds = %91, %88
  br label %94, !dbg !88

; <label>:94                                      ; preds = %150, %93
  %a.2 = phi %struct.assoc* [ %34, %93 ], [ %151, %150 ]
  %95 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !88
  %96 = load i8** %95, align 8, !dbg !88
  %97 = icmp ne i8* %96, null, !dbg !88
  br i1 %97, label %98, label %152, !dbg !88

; <label>:98                                      ; preds = %94
  %99 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !90
  %100 = load i8** %99, align 8, !dbg !90
  %101 = load i8* %100, align 1, !dbg !90
  %102 = icmp ne i8 %101, 0, !dbg !90
  br i1 %102, label %103, label %124, !dbg !90

; <label>:103                                     ; preds = %98
  %104 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !92
  %105 = load i8** %104, align 8, !dbg !92
  %106 = call i8* @decode(i8* %105), !dbg !92
  %107 = icmp ne i8* %106, null, !dbg !94
  br i1 %107, label %108, label %153, !dbg !94

; <label>:108                                     ; preds = %103
  %109 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !95
  %110 = load i8** %109, align 8, !dbg !95
  %111 = call i64 @llvm.objectsize.i64(i8* %110, i1 false), !dbg !95
  %112 = icmp ne i64 %111, -1, !dbg !95
  %113 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !95
  %114 = load i8** %113, align 8, !dbg !95
  br i1 %112, label %115, label %120, !dbg !95

; <label>:115                                     ; preds = %108
  %116 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 0, !dbg !95
  %117 = load i8** %116, align 8, !dbg !95
  %118 = call i64 @llvm.objectsize.i64(i8* %117, i1 false), !dbg !95
  %119 = call i8* @__strcpy_chk(i8* %114, i8* %106, i64 %118) nounwind, !dbg !95
  br label %122, !dbg !95

; <label>:120                                     ; preds = %108
  %121 = call i8* @__inline_strcpy_chk(i8* %114, i8* %106), !dbg !95
  br label %122, !dbg !95

; <label>:122                                     ; preds = %120, %115
  %123 = phi i8* [ %119, %115 ], [ %121, %120 ], !dbg !95
  call void @free(i8* %106), !dbg !97
  br label %124, !dbg !98

; <label>:124                                     ; preds = %122, %98
  %125 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !99
  %126 = load i8** %125, align 8, !dbg !99
  %127 = load i8* %126, align 1, !dbg !99
  %128 = icmp ne i8 %127, 0, !dbg !99
  br i1 %128, label %129, label %150, !dbg !99

; <label>:129                                     ; preds = %124
  %130 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !100
  %131 = load i8** %130, align 8, !dbg !100
  %132 = call i8* @decode(i8* %131), !dbg !100
  %133 = icmp ne i8* %132, null, !dbg !102
  br i1 %133, label %134, label %153, !dbg !102

; <label>:134                                     ; preds = %129
  %135 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !103
  %136 = load i8** %135, align 8, !dbg !103
  %137 = call i64 @llvm.objectsize.i64(i8* %136, i1 false), !dbg !103
  %138 = icmp ne i64 %137, -1, !dbg !103
  %139 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !103
  %140 = load i8** %139, align 8, !dbg !103
  br i1 %138, label %141, label %146, !dbg !103

; <label>:141                                     ; preds = %134
  %142 = getelementptr inbounds %struct.assoc* %a.2, i32 0, i32 1, !dbg !103
  %143 = load i8** %142, align 8, !dbg !103
  %144 = call i64 @llvm.objectsize.i64(i8* %143, i1 false), !dbg !103
  %145 = call i8* @__strcpy_chk(i8* %140, i8* %132, i64 %144) nounwind, !dbg !103
  br label %148, !dbg !103

; <label>:146                                     ; preds = %134
  %147 = call i8* @__inline_strcpy_chk(i8* %140, i8* %132), !dbg !103
  br label %148, !dbg !103

; <label>:148                                     ; preds = %146, %141
  %149 = phi i8* [ %145, %141 ], [ %147, %146 ], !dbg !103
  call void @free(i8* %132), !dbg !105
  br label %150, !dbg !106

; <label>:150                                     ; preds = %148, %124
  %151 = getelementptr inbounds %struct.assoc* %a.2, i32 1, !dbg !107
  br label %94, !dbg !107

; <label>:152                                     ; preds = %94
  br label %155, !dbg !108

; <label>:153                                     ; preds = %129, %103
  %154 = bitcast %struct.assoc* %34 to i8*, !dbg !109
  call void @free(i8* %154), !dbg !109
  br label %155, !dbg !110

; <label>:155                                     ; preds = %153, %152, %5
  %.0 = phi %struct.assoc* [ null, %153 ], [ %34, %152 ], [ %7, %5 ]
  ret %struct.assoc* %.0, !dbg !111
}

declare i8* @malloc(i64)

declare i64 @strlen(i8*)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memcpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_memcpy_chk(i8* %__dest, i8* %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !112
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !113
  %2 = call i8* @__memcpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !113
  ret i8* %2, !dbg !113
}

define internal i8* @decode(i8* %field) nounwind uwtable ssp {
  %c = alloca i32, align 4
  %1 = icmp ne i8* %field, null, !dbg !115
  br i1 %1, label %3, label %2, !dbg !115

; <label>:2                                       ; preds = %0
  br label %38, !dbg !117

; <label>:3                                       ; preds = %0
  %4 = call i64 @strlen(i8* %field), !dbg !118
  %5 = add i64 %4, 1, !dbg !118
  %6 = call i8* @malloc(i64 %5), !dbg !118
  br label %7, !dbg !119

; <label>:7                                       ; preds = %35, %3
  %cp.0 = phi i8* [ %6, %3 ], [ %cp.1, %35 ]
  %.01 = phi i8* [ %field, %3 ], [ %36, %35 ]
  %8 = load i8* %.01, align 1, !dbg !119
  %9 = icmp ne i8 %8, 0, !dbg !119
  br i1 %9, label %10, label %37, !dbg !119

; <label>:10                                      ; preds = %7
  %11 = load i8* %.01, align 1, !dbg !121
  %12 = sext i8 %11 to i32, !dbg !121
  switch i32 %12, label %26 [
    i32 43, label %13
    i32 37, label %15
    i32 35, label %25
    i32 32, label %25
  ], !dbg !121

; <label>:13                                      ; preds = %10
  %14 = getelementptr inbounds i8* %cp.0, i32 1, !dbg !122
  store i8 32, i8* %cp.0, align 1, !dbg !122
  br label %35, !dbg !124

; <label>:15                                      ; preds = %10
  %16 = getelementptr inbounds i8* %.01, i64 1, !dbg !125
  %17 = call i32 (i8*, i8*, ...)* @sscanf(i8* %16, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32* %c), !dbg !125
  %18 = icmp ne i32 %17, 1, !dbg !125
  br i1 %18, label %19, label %20, !dbg !125

; <label>:19                                      ; preds = %15
  call void @free(i8* %6), !dbg !126
  br label %38, !dbg !128

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds i8* %.01, i64 2, !dbg !129
  %22 = load i32* %c, align 4, !dbg !130
  %23 = trunc i32 %22 to i8, !dbg !130
  %24 = getelementptr inbounds i8* %cp.0, i32 1, !dbg !130
  store i8 %23, i8* %cp.0, align 1, !dbg !130
  br label %35, !dbg !131

; <label>:25                                      ; preds = %10, %10
  call void @free(i8* %6), !dbg !132
  br label %38, !dbg !133

; <label>:26                                      ; preds = %10
  %27 = load i8* %.01, align 1, !dbg !134
  %28 = sext i8 %27 to i32, !dbg !134
  %29 = call i32 @isgraph(i32 %28), !dbg !134, !intrange !135
  %30 = icmp ne i32 %29, 0, !dbg !134
  br i1 %30, label %32, label %31, !dbg !134

; <label>:31                                      ; preds = %26
  call void @free(i8* %6), !dbg !136
  br label %38, !dbg !138

; <label>:32                                      ; preds = %26
  %33 = load i8* %.01, align 1, !dbg !139
  %34 = getelementptr inbounds i8* %cp.0, i32 1, !dbg !139
  store i8 %33, i8* %cp.0, align 1, !dbg !139
  br label %35, !dbg !140

; <label>:35                                      ; preds = %32, %20, %13
  %cp.1 = phi i8* [ %34, %32 ], [ %24, %20 ], [ %14, %13 ]
  %.1 = phi i8* [ %.01, %32 ], [ %21, %20 ], [ %.01, %13 ]
  %36 = getelementptr inbounds i8* %.1, i32 1, !dbg !141
  br label %7, !dbg !141

; <label>:37                                      ; preds = %7
  store i8 0, i8* %cp.0, align 1, !dbg !142
  br label %38, !dbg !143

; <label>:38                                      ; preds = %37, %31, %25, %19, %2
  %.0 = phi i8* [ null, %31 ], [ null, %25 ], [ null, %19 ], [ %6, %37 ], [ null, %2 ]
  ret i8* %.0, !dbg !144
}

declare i8* @__strcpy_chk(i8*, i8*, i64) nounwind

define internal i8* @__inline_strcpy_chk(i8* noalias %__dest, i8* noalias %__src) nounwind uwtable inlinehint ssp {
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !145
  %2 = call i8* @__strcpy_chk(i8* %__dest, i8* %__src, i64 %1) nounwind, !dbg !145
  ret i8* %2, !dbg !145
}

declare void @free(i8*)

declare i32 @sscanf(i8*, i8*, ...)

define internal i32 @isgraph(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !147
  %1 = call i32 @__istype(i32 %_c1, i64 2048), !dbg !148, !intrange !135
  ret i32 %1, !dbg !148
}

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !150, !intrange !151
  %_c1 = call i32 @kint_arg.i32(), !id !152
  %1 = call i32 @isascii(i32 %_c1), !dbg !153, !intrange !135
  %2 = icmp ne i32 %1, 0, !dbg !153
  br i1 %2, label %3, label %10, !dbg !153

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !153
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !153
  %6 = load i32* %5, align 4, !dbg !153
  %7 = zext i32 %6 to i64, !dbg !153
  %8 = and i64 %7, %_f2, !dbg !153
  %9 = icmp ne i64 %8, 0, !dbg !153
  br label %13, !dbg !153

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c1, i64 %_f2), !dbg !155
  %12 = icmp ne i32 %11, 0, !dbg !155
  br label %13, !dbg !155

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !153
  %15 = xor i1 %14, true, !dbg !153
  %16 = zext i1 %15 to i32, !dbg !153
  ret i32 %16, !dbg !155
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !156
  %1 = and i32 %_c1, -128, !dbg !157
  %2 = icmp eq i32 %1, 0, !dbg !157
  %3 = zext i1 %2 to i32, !dbg !157
  ret i32 %3, !dbg !157
}

declare i32 @__maskrune(i32, i64)

declare i64 @kint_arg.i64()

declare i32 @kint_arg.i32()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"query.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !20, metadata !23, metadata !28, metadata !33, metadata !34, metadata !40}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"parse_query_string", metadata !"parse_query_string", metadata !"", metadata !6, i32 15, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.assoc* (i8*)* @parse_query_string, null, null, metadata !1, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [parse_query_string]
!6 = metadata !{i32 786473, metadata !"query.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !18}
!9 = metadata !{i32 786454, null, metadata !"assoc_t", metadata !6, i32 9, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [assoc_t] [line 9, size 0, align 0, offset 0] [from ]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from assoc]
!11 = metadata !{i32 786451, null, metadata !"assoc", metadata !12, i32 4, i64 128, i64 64, i32 0, i32 0, null, metadata !13, i32 0, i32 0} ; [ DW_TAG_structure_type ] [assoc] [line 4, size 128, align 64, offset 0] [from ]
!12 = metadata !{i32 786473, metadata !"./query.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint", null} ; [ DW_TAG_file_type ]
!13 = metadata !{metadata !14, metadata !17}
!14 = metadata !{i32 786445, metadata !11, metadata !"key", metadata !12, i32 5, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [key] [line 5, size 64, align 64, offset 0] [from ]
!15 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = metadata !{i32 786445, metadata !11, metadata !"val", metadata !12, i32 6, i64 64, i64 64, i64 64, i32 0, metadata !15} ; [ DW_TAG_member ] [val] [line 6, size 64, align 64, offset 64] [from ]
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!20 = metadata !{i32 786478, i32 0, metadata !6, metadata !"decode", metadata !"decode", metadata !"", metadata !6, i32 104, metadata !21, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*)* @decode, null, null, metadata !1, i32 105} ; [ DW_TAG_subprogram ] [line 104] [local] [def] [scope 105] [decode]
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !15, metadata !18}
!23 = metadata !{i32 786478, i32 0, metadata !24, metadata !"isgraph", metadata !"isgraph", metadata !"", metadata !24, i32 260, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isgraph, null, null, metadata !1, i32 261} ; [ DW_TAG_subprogram ] [line 260] [local] [def] [scope 261] [isgraph]
!24 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint", null} ; [ DW_TAG_file_type ]
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !27, metadata !27}
!27 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!28 = metadata !{i32 786478, i32 0, metadata !24, metadata !"__istype", metadata !"__istype", metadata !"", metadata !24, i32 170, metadata !29, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!29 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !27, metadata !31, metadata !32}
!31 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !24, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!32 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!33 = metadata !{i32 786478, i32 0, metadata !24, metadata !"isascii", metadata !"isascii", metadata !"", metadata !24, i32 152, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!34 = metadata !{i32 786478, i32 0, metadata !35, metadata !"__inline_strcpy_chk", metadata !"__inline_strcpy_chk", metadata !"", metadata !35, i32 92, metadata !36, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*)* @__inline_strcpy_chk, null, null, metadata !1, i32 93} ; [ DW_TAG_subprogram ] [line 92] [local] [def] [scope 93] [__inline_strcpy_chk]
!35 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint", null} ; [ DW_TAG_file_type ]
!36 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{metadata !15, metadata !38, metadata !39}
!38 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{i32 786478, i32 0, metadata !35, metadata !"__inline_memcpy_chk", metadata !"__inline_memcpy_chk", metadata !"", metadata !35, i32 59, metadata !41, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_memcpy_chk, null, null, metadata !1, i32 60} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 60] [__inline_memcpy_chk]
!41 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{metadata !43, metadata !43, metadata !44, metadata !46}
!43 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!44 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{i32 786454, null, metadata !"size_t", metadata !6, i32 78, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_typedef ] [size_t] [line 78, size 0, align 0, offset 0] [from __darwin_size_t]
!47 = metadata !{i32 786454, null, metadata !"__darwin_size_t", metadata !6, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ] [__darwin_size_t] [line 90, size 0, align 0, offset 0] [from long unsigned int]
!48 = metadata !{i32 18, i32 3, metadata !49, null}
!49 = metadata !{i32 786443, metadata !5, i32 16, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!50 = metadata !{i32 19, i32 11, metadata !51, null}
!51 = metadata !{i32 786443, metadata !49, i32 18, i32 20, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!52 = metadata !{i32 20, i32 5, metadata !51, null}
!53 = metadata !{i32 21, i32 5, metadata !51, null}
!54 = metadata !{i32 23, i32 16, metadata !49, null}
!55 = metadata !{i32 26, i32 3, metadata !56, null}
!56 = metadata !{i32 786443, metadata !49, i32 26, i32 3, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!57 = metadata !{i32 27, i32 5, metadata !56, null}
!58 = metadata !{i32 28, i32 7, metadata !56, null}
!59 = metadata !{i32 26, i32 15, metadata !56, null}
!60 = metadata !{i32 30, i32 9, metadata !49, null}
!61 = metadata !{i32 31, i32 3, metadata !49, null}
!62 = metadata !{i32 32, i32 13, metadata !49, null}
!63 = metadata !{i32 39, i32 3, metadata !64, null}
!64 = metadata !{i32 786443, metadata !49, i32 39, i32 3, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!65 = metadata !{i32 40, i32 5, metadata !64, null}
!66 = metadata !{i32 43, i32 7, metadata !67, null}
!67 = metadata !{i32 786443, metadata !64, i32 40, i32 18, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!68 = metadata !{i32 44, i32 2, metadata !69, null}
!69 = metadata !{i32 786443, metadata !67, i32 43, i32 16, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!70 = metadata !{i32 45, i32 2, metadata !69, null}
!71 = metadata !{i32 46, i32 7, metadata !69, null}
!72 = metadata !{i32 48, i32 2, metadata !67, null}
!73 = metadata !{i32 49, i32 7, metadata !67, null}
!74 = metadata !{i32 50, i32 7, metadata !67, null}
!75 = metadata !{i32 52, i32 7, metadata !67, null}
!76 = metadata !{i32 53, i32 7, metadata !67, null}
!77 = metadata !{i32 55, i32 7, metadata !67, null}
!78 = metadata !{i32 56, i32 7, metadata !67, null}
!79 = metadata !{i32 57, i32 7, metadata !67, null}
!80 = metadata !{i32 59, i32 7, metadata !67, null}
!81 = metadata !{i32 39, i32 15, metadata !64, null}
!82 = metadata !{i32 61, i32 3, metadata !49, null}
!83 = metadata !{i32 62, i32 5, metadata !84, null}
!84 = metadata !{i32 786443, metadata !49, i32 61, i32 12, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!85 = metadata !{i32 63, i32 5, metadata !84, null}
!86 = metadata !{i32 64, i32 3, metadata !84, null}
!87 = metadata !{i32 66, i32 5, metadata !49, null}
!88 = metadata !{i32 71, i32 8, metadata !89, null}
!89 = metadata !{i32 786443, metadata !49, i32 71, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!90 = metadata !{i32 73, i32 5, metadata !91, null}
!91 = metadata !{i32 786443, metadata !89, i32 71, i32 30, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!92 = metadata !{i32 74, i32 11, metadata !93, null}
!93 = metadata !{i32 786443, metadata !91, i32 73, i32 18, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!94 = metadata !{i32 75, i32 7, metadata !93, null}
!95 = metadata !{i32 76, i32 2, metadata !96, null}
!96 = metadata !{i32 786443, metadata !93, i32 75, i32 14, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!97 = metadata !{i32 77, i32 2, metadata !96, null}
!98 = metadata !{i32 81, i32 5, metadata !93, null}
!99 = metadata !{i32 82, i32 5, metadata !91, null}
!100 = metadata !{i32 83, i32 11, metadata !101, null}
!101 = metadata !{i32 786443, metadata !91, i32 82, i32 18, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!102 = metadata !{i32 84, i32 7, metadata !101, null}
!103 = metadata !{i32 85, i32 2, metadata !104, null}
!104 = metadata !{i32 786443, metadata !101, i32 84, i32 14, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!105 = metadata !{i32 86, i32 2, metadata !104, null}
!106 = metadata !{i32 90, i32 5, metadata !101, null}
!107 = metadata !{i32 71, i32 25, metadata !89, null}
!108 = metadata !{i32 93, i32 3, metadata !49, null}
!109 = metadata !{i32 96, i32 3, metadata !49, null}
!110 = metadata !{i32 97, i32 3, metadata !49, null}
!111 = metadata !{i32 98, i32 1, metadata !49, null}
!112 = metadata !{metadata !"arg._kint.__inline_memcpy_chk.2"}
!113 = metadata !{i32 61, i32 56, metadata !114, null}
!114 = metadata !{i32 786443, metadata !40, i32 60, i32 1, metadata !35, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint//usr/include/secure/_string.h]
!115 = metadata !{i32 107, i32 3, metadata !116, null}
!116 = metadata !{i32 786443, metadata !20, i32 105, i32 1, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!117 = metadata !{i32 108, i32 5, metadata !116, null}
!118 = metadata !{i32 109, i32 23, metadata !116, null}
!119 = metadata !{i32 111, i32 3, metadata !120, null}
!120 = metadata !{i32 786443, metadata !116, i32 111, i32 3, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!121 = metadata !{i32 112, i32 5, metadata !120, null}
!122 = metadata !{i32 114, i32 7, metadata !123, null}
!123 = metadata !{i32 786443, metadata !120, i32 112, i32 21, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!124 = metadata !{i32 115, i32 7, metadata !123, null}
!125 = metadata !{i32 117, i32 11, metadata !123, null}
!126 = metadata !{i32 118, i32 2, metadata !127, null}
!127 = metadata !{i32 786443, metadata !123, i32 117, i32 46, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!128 = metadata !{i32 119, i32 2, metadata !127, null}
!129 = metadata !{i32 121, i32 7, metadata !123, null}
!130 = metadata !{i32 122, i32 7, metadata !123, null}
!131 = metadata !{i32 123, i32 7, metadata !123, null}
!132 = metadata !{i32 126, i32 7, metadata !123, null}
!133 = metadata !{i32 127, i32 7, metadata !123, null}
!134 = metadata !{i32 129, i32 12, metadata !123, null}
!135 = metadata !{i32 0, i32 2}
!136 = metadata !{i32 130, i32 2, metadata !137, null}
!137 = metadata !{i32 786443, metadata !123, i32 129, i32 29, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint/query.c]
!138 = metadata !{i32 131, i32 2, metadata !137, null}
!139 = metadata !{i32 133, i32 7, metadata !123, null}
!140 = metadata !{i32 134, i32 5, metadata !123, null}
!141 = metadata !{i32 111, i32 18, metadata !120, null}
!142 = metadata !{i32 135, i32 3, metadata !116, null}
!143 = metadata !{i32 136, i32 3, metadata !116, null}
!144 = metadata !{i32 137, i32 1, metadata !116, null}
!145 = metadata !{i32 94, i32 49, metadata !146, null}
!146 = metadata !{i32 786443, metadata !34, i32 93, i32 1, metadata !35, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint//usr/include/secure/_string.h]
!147 = metadata !{metadata !"arg._kint.isgraph.0"}
!148 = metadata !{i32 262, i32 10, metadata !149, null}
!149 = metadata !{i32 786443, metadata !23, i32 261, i32 1, metadata !24, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint//usr/include/ctype.h]
!150 = metadata !{metadata !"arg._kint.__istype.1"}
!151 = metadata !{i64 2048, i64 2049}
!152 = metadata !{metadata !"arg._kint.__istype.0"}
!153 = metadata !{i32 175, i32 10, metadata !154, null}
!154 = metadata !{i32 786443, metadata !28, i32 171, i32 1, metadata !24, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint//usr/include/ctype.h]
!155 = metadata !{i32 176, i32 7, metadata !154, null}
!156 = metadata !{metadata !"arg._kint.isascii.0"}
!157 = metadata !{i32 154, i32 2, metadata !158, null}
!158 = metadata !{i32 786443, metadata !33, i32 153, i32 1, metadata !24, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx32/src/kint//usr/include/ctype.h]
