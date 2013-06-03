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
@.str = private unnamed_addr constant [38 x i8] c"\0AERROR: Usage: countlines <filename>\0A\00", align 1
@.str1 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a slash character.\0A\00", align 1
@.str2 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a colon character.\0A\00", align 1
@.str3 = private unnamed_addr constant [70 x i8] c"\0AERROR: Filename must not contain a double dot (e.g. '..') sequence.\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str5 = private unnamed_addr constant [27 x i8] c"\0AERROR: Cannot open file.\0A\00", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str7 = private unnamed_addr constant [27 x i8] c"\0AERROR: File close error.\0A\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale

define void @foo(i32 %x) nounwind uwtable ssp {
  %x1 = call i32 @kint_arg.i32(), !id !44, !intrange !45
  %1 = icmp eq i32 %x1, 0, !dbg !46
  br i1 %1, label %4, label %2, !dbg !46

; <label>:2                                       ; preds = %0
  %3 = sub nsw i32 %x1, 1, !dbg !48
  call void @bar(i32 %3), !dbg !48
  br label %4, !dbg !49

; <label>:4                                       ; preds = %2, %0
  ret void, !dbg !49
}

define void @bar(i32 %x) nounwind uwtable ssp {
  %x1 = call i32 @kint_arg.i32(), !id !50
  call void @foo(i32 %x1), !dbg !51
  ret void, !dbg !53
}

define i32 @func() nounwind uwtable ssp {
  ret i32 256, !dbg !54
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !56
  %1 = call i32 @func(), !dbg !57, !intrange !59
  %2 = zext i32 %1 to i64, !dbg !57
  %3 = call i8* @llvm.stacksave(), !dbg !57
  %4 = alloca i8, i64 %2, align 16, !dbg !57
  %5 = call i32 @func(), !dbg !60, !intrange !59
  %6 = zext i32 %5 to i64, !dbg !60
  %7 = alloca i8, i64 %6, align 16, !dbg !60
  %8 = icmp ne i32 %argc1, 2, !dbg !61
  br i1 %8, label %9, label %12, !dbg !61

; <label>:9                                       ; preds = %0
  %10 = load %struct.__sFILE** @__stderrp, align 8, !dbg !62
  %11 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([38 x i8]* @.str, i32 0, i32 0)), !dbg !62
  br label %181, !dbg !64

; <label>:12                                      ; preds = %0
  %13 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !65
  %14 = icmp ne i64 %13, -1, !dbg !65
  br i1 %14, label %15, label %18, !dbg !65

; <label>:15                                      ; preds = %12
  %16 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !65
  %17 = call i8* @__memset_chk(i8* %4, i32 0, i64 256, i64 %16) nounwind, !dbg !65
  br label %20, !dbg !65

; <label>:18                                      ; preds = %12
  %19 = call i8* @__inline_memset_chk(i8* %4, i32 0, i64 256), !dbg !65
  br label %20, !dbg !65

; <label>:20                                      ; preds = %18, %15
  %21 = phi i8* [ %17, %15 ], [ %19, %18 ], !dbg !65
  %22 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !66
  %23 = icmp ne i64 %22, -1, !dbg !66
  %24 = getelementptr inbounds i8** %argv, i64 1, !dbg !66
  %25 = load i8** %24, align 8, !dbg !66
  br i1 %23, label %26, label %29, !dbg !66

; <label>:26                                      ; preds = %20
  %27 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !66
  %28 = call i8* @__strncpy_chk(i8* %4, i8* %25, i64 255, i64 %27) nounwind, !dbg !66
  br label %31, !dbg !66

; <label>:29                                      ; preds = %20
  %30 = call i8* @__inline_strncpy_chk(i8* %4, i8* %25, i64 255), !dbg !66
  br label %31, !dbg !66

; <label>:31                                      ; preds = %29, %26
  %32 = phi i8* [ %28, %26 ], [ %30, %29 ], !dbg !66
  %33 = add nsw i32 200, 55, !dbg !67
  %34 = sext i32 %33 to i64, !dbg !67
  %35 = getelementptr inbounds i8* %4, i64 %34, !dbg !67
  store i8 0, i8* %35, align 1, !dbg !67
  call void @foo(i32 8), !dbg !68
  br label %36, !dbg !69

; <label>:36                                      ; preds = %84, %31
  %i.0 = phi i32 [ 0, %31 ], [ %85, %84 ]
  %37 = icmp slt i32 %i.0, 255, !dbg !69
  br i1 %37, label %38, label %86, !dbg !69

; <label>:38                                      ; preds = %36
  %39 = sext i32 %i.0 to i64, !dbg !71
  %40 = getelementptr inbounds i8* %4, i64 %39, !dbg !71
  %41 = load i8* %40, align 1, !dbg !71
  %42 = sext i8 %41 to i32, !dbg !71
  %43 = icmp eq i32 %42, 0, !dbg !71
  br i1 %43, label %86, label %44, !dbg !71

; <label>:44                                      ; preds = %38
  %45 = sext i32 %i.0 to i64, !dbg !73
  %46 = getelementptr inbounds i8* %4, i64 %45, !dbg !73
  %47 = load i8* %46, align 1, !dbg !73
  %48 = sext i8 %47 to i32, !dbg !73
  %49 = icmp eq i32 %48, 92, !dbg !73
  br i1 %49, label %56, label %50, !dbg !73

; <label>:50                                      ; preds = %44
  %51 = sext i32 %i.0 to i64, !dbg !73
  %52 = getelementptr inbounds i8* %4, i64 %51, !dbg !73
  %53 = load i8* %52, align 1, !dbg !73
  %54 = sext i8 %53 to i32, !dbg !73
  %55 = icmp eq i32 %54, 47, !dbg !73
  br i1 %55, label %56, label %59, !dbg !73

; <label>:56                                      ; preds = %50, %44
  %57 = load %struct.__sFILE** @__stderrp, align 8, !dbg !74
  %58 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %57, i8* getelementptr inbounds ([54 x i8]* @.str1, i32 0, i32 0)), !dbg !74
  br label %181, !dbg !76

; <label>:59                                      ; preds = %50
  %60 = sext i32 %i.0 to i64, !dbg !77
  %61 = getelementptr inbounds i8* %4, i64 %60, !dbg !77
  %62 = load i8* %61, align 1, !dbg !77
  %63 = sext i8 %62 to i32, !dbg !77
  %64 = icmp eq i32 %63, 58, !dbg !77
  br i1 %64, label %65, label %68, !dbg !77

; <label>:65                                      ; preds = %59
  %66 = load %struct.__sFILE** @__stderrp, align 8, !dbg !78
  %67 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %66, i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0)), !dbg !78
  br label %181, !dbg !80

; <label>:68                                      ; preds = %59
  %69 = sext i32 %i.0 to i64, !dbg !81
  %70 = getelementptr inbounds i8* %4, i64 %69, !dbg !81
  %71 = load i8* %70, align 1, !dbg !81
  %72 = sext i8 %71 to i32, !dbg !81
  %73 = icmp eq i32 %72, 46, !dbg !81
  br i1 %73, label %74, label %84, !dbg !81

; <label>:74                                      ; preds = %68
  %75 = add nsw i32 %i.0, 1, !dbg !81
  %76 = sext i32 %75 to i64, !dbg !81
  %77 = getelementptr inbounds i8* %4, i64 %76, !dbg !81
  %78 = load i8* %77, align 1, !dbg !81
  %79 = sext i8 %78 to i32, !dbg !81
  %80 = icmp eq i32 %79, 46, !dbg !81
  br i1 %80, label %81, label %84, !dbg !81

; <label>:81                                      ; preds = %74
  %82 = load %struct.__sFILE** @__stderrp, align 8, !dbg !82
  %83 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %82, i8* getelementptr inbounds ([70 x i8]* @.str3, i32 0, i32 0)), !dbg !82
  br label %181, !dbg !84

; <label>:84                                      ; preds = %74, %68
  %85 = add nsw i32 %i.0, 1, !dbg !85
  br label %36, !dbg !85

; <label>:86                                      ; preds = %38, %36
  %87 = call %struct.__sFILE* @"\01_fopen"(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0)), !dbg !86
  %88 = icmp eq %struct.__sFILE* %87, null, !dbg !87
  br i1 %88, label %89, label %92, !dbg !87

; <label>:89                                      ; preds = %86
  %90 = load %struct.__sFILE** @__stderrp, align 8, !dbg !88
  %91 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %90, i8* getelementptr inbounds ([27 x i8]* @.str5, i32 0, i32 0)), !dbg !88
  br label %181, !dbg !90

; <label>:92                                      ; preds = %86
  %93 = call i64 @llvm.objectsize.i64(i8* %7, i1 false), !dbg !91
  %94 = icmp ne i64 %93, -1, !dbg !91
  br i1 %94, label %95, label %98, !dbg !91

; <label>:95                                      ; preds = %92
  %96 = call i64 @llvm.objectsize.i64(i8* %7, i1 false), !dbg !91
  %97 = call i8* @__memset_chk(i8* %7, i32 0, i64 256, i64 %96) nounwind, !dbg !91
  br label %100, !dbg !91

; <label>:98                                      ; preds = %92
  %99 = call i8* @__inline_memset_chk(i8* %7, i32 0, i64 256), !dbg !91
  br label %100, !dbg !91

; <label>:100                                     ; preds = %156, %151, %130, %120, %98, %95
  %multi_line_comment.0 = phi i32 [ 0, %95 ], [ %multi_line_comment.1, %130 ], [ %multi_line_comment.1, %151 ], [ %multi_line_comment.1, %156 ], [ %multi_line_comment.1, %120 ], [ 0, %98 ]
  %lines_of_code.0 = phi i8 [ 0, %95 ], [ %lines_of_code.2, %130 ], [ %lines_of_code.2, %151 ], [ %lines_of_code.2, %156 ], [ %lines_of_code.2, %120 ], [ 0, %98 ]
  %101 = call i8* @fgets(i8* %7, i32 256, %struct.__sFILE* %87), !dbg !92
  %102 = icmp ne i8* %101, null, !dbg !92
  br i1 %102, label %103, label %174, !dbg !92

; <label>:103                                     ; preds = %100
  %104 = sext i8 %lines_of_code.0 to i32, !dbg !93
  %105 = icmp slt i32 %104, 0, !dbg !93
  br i1 %105, label %106, label %108, !dbg !93

; <label>:106                                     ; preds = %106, %103
  %lines_of_code.1 = phi i8 [ %lines_of_code.0, %103 ], [ %107, %106 ]
  %107 = add i8 %lines_of_code.1, 1, !dbg !95
  br label %106, !dbg !98

; <label>:108                                     ; preds = %103
  %109 = call i64 @strlen(i8* %7), !dbg !99
  %110 = sub i64 %109, 1, !dbg !99
  %111 = getelementptr inbounds i8* %7, i64 %110, !dbg !99
  %112 = load i8* %111, align 1, !dbg !99
  %113 = sext i8 %112 to i32, !dbg !99
  %114 = icmp eq i32 %113, 10, !dbg !99
  br i1 %114, label %115, label %119, !dbg !99

; <label>:115                                     ; preds = %108
  %116 = call i64 @strlen(i8* %7), !dbg !100
  %117 = sub i64 %116, 1, !dbg !100
  %118 = getelementptr inbounds i8* %7, i64 %117, !dbg !100
  store i8 0, i8* %118, align 1, !dbg !100
  br label %119, !dbg !100

; <label>:119                                     ; preds = %115, %108
  br label %120, !dbg !101

; <label>:120                                     ; preds = %172, %164, %145, %140, %119
  %line_already_counted.0 = phi i32 [ 0, %119 ], [ %line_already_counted.0, %140 ], [ %line_already_counted.0, %145 ], [ %line_already_counted.0, %164 ], [ %line_already_counted.1, %172 ]
  %line_pointer.0 = phi i8* [ %7, %119 ], [ %141, %140 ], [ %146, %145 ], [ %165, %164 ], [ %173, %172 ]
  %multi_line_comment.1 = phi i32 [ %multi_line_comment.0, %119 ], [ %multi_line_comment.2, %140 ], [ %multi_line_comment.1, %145 ], [ 1, %164 ], [ %multi_line_comment.1, %172 ]
  %lines_of_code.2 = phi i8 [ %lines_of_code.0, %119 ], [ %lines_of_code.2, %140 ], [ %lines_of_code.2, %145 ], [ %lines_of_code.2, %164 ], [ %lines_of_code.3, %172 ]
  %121 = load i8* %line_pointer.0, align 1, !dbg !101
  %122 = sext i8 %121 to i32, !dbg !101
  %123 = icmp ne i32 %122, 0, !dbg !101
  br i1 %123, label %124, label %100, !dbg !101

; <label>:124                                     ; preds = %120
  %125 = icmp eq i32 %multi_line_comment.1, 1, !dbg !102
  %126 = load i8* %line_pointer.0, align 1, !dbg !104
  %127 = sext i8 %126 to i32, !dbg !104
  br i1 %125, label %128, label %142, !dbg !102

; <label>:128                                     ; preds = %124
  %129 = icmp eq i32 %127, 42, !dbg !104
  br i1 %129, label %130, label %140, !dbg !104

; <label>:130                                     ; preds = %128
  %131 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !106
  %132 = load i8* %131, align 1, !dbg !108
  %133 = sext i8 %132 to i32, !dbg !108
  %134 = icmp eq i32 %133, 0, !dbg !108
  br i1 %134, label %100, label %135, !dbg !108

; <label>:135                                     ; preds = %130
  %136 = load i8* %131, align 1, !dbg !109
  %137 = sext i8 %136 to i32, !dbg !109
  %138 = icmp eq i32 %137, 47, !dbg !109
  br i1 %138, label %139, label %140, !dbg !109

; <label>:139                                     ; preds = %135
  br label %140, !dbg !110

; <label>:140                                     ; preds = %139, %135, %128
  %line_pointer.1 = phi i8* [ %131, %139 ], [ %131, %135 ], [ %line_pointer.0, %128 ]
  %multi_line_comment.2 = phi i32 [ 0, %139 ], [ %multi_line_comment.1, %135 ], [ %multi_line_comment.1, %128 ]
  %141 = getelementptr inbounds i8* %line_pointer.1, i32 1, !dbg !112
  br label %120, !dbg !113

; <label>:142                                     ; preds = %124
  %143 = call i32 @isspace(i32 %127), !dbg !114, !intrange !115
  %144 = icmp ne i32 %143, 0, !dbg !114
  br i1 %144, label %145, label %147, !dbg !114

; <label>:145                                     ; preds = %142
  %146 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !116
  br label %120, !dbg !118

; <label>:147                                     ; preds = %142
  %148 = load i8* %line_pointer.0, align 1, !dbg !119
  %149 = sext i8 %148 to i32, !dbg !119
  %150 = icmp eq i32 %149, 47, !dbg !119
  br i1 %150, label %151, label %166, !dbg !119

; <label>:151                                     ; preds = %147
  %152 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !120
  %153 = load i8* %152, align 1, !dbg !122
  %154 = sext i8 %153 to i32, !dbg !122
  %155 = icmp eq i32 %154, 0, !dbg !122
  br i1 %155, label %100, label %156, !dbg !122

; <label>:156                                     ; preds = %151
  %157 = load i8* %152, align 1, !dbg !123
  %158 = sext i8 %157 to i32, !dbg !123
  %159 = icmp eq i32 %158, 47, !dbg !123
  br i1 %159, label %100, label %160, !dbg !123

; <label>:160                                     ; preds = %156
  %161 = load i8* %152, align 1, !dbg !124
  %162 = sext i8 %161 to i32, !dbg !124
  %163 = icmp eq i32 %162, 42, !dbg !124
  br i1 %163, label %164, label %166, !dbg !124

; <label>:164                                     ; preds = %160
  %165 = getelementptr inbounds i8* %152, i32 1, !dbg !125
  br label %120, !dbg !127

; <label>:166                                     ; preds = %160, %147
  %line_pointer.2 = phi i8* [ %152, %160 ], [ %line_pointer.0, %147 ]
  %167 = icmp eq i32 %line_already_counted.0, 0, !dbg !128
  br i1 %167, label %168, label %172, !dbg !128

; <label>:168                                     ; preds = %166
  %169 = add i8 %lines_of_code.2, 1, !dbg !129
  %170 = sext i8 %169 to i32, !dbg !131
  %171 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 %170), !dbg !131
  br label %172, !dbg !132

; <label>:172                                     ; preds = %168, %166
  %line_already_counted.1 = phi i32 [ 1, %168 ], [ %line_already_counted.0, %166 ]
  %lines_of_code.3 = phi i8 [ %169, %168 ], [ %lines_of_code.2, %166 ]
  %173 = getelementptr inbounds i8* %line_pointer.2, i32 1, !dbg !133
  br label %120, !dbg !134

; <label>:174                                     ; preds = %100
  %175 = call i32 @fclose(%struct.__sFILE* %87), !dbg !135
  %176 = icmp ne i32 %175, 0, !dbg !135
  br i1 %176, label %177, label %180, !dbg !135

; <label>:177                                     ; preds = %174
  %178 = load %struct.__sFILE** @__stderrp, align 8, !dbg !136
  %179 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %178, i8* getelementptr inbounds ([27 x i8]* @.str7, i32 0, i32 0)), !dbg !136
  br label %181, !dbg !138

; <label>:180                                     ; preds = %174
  br label %181, !dbg !139

; <label>:181                                     ; preds = %180, %177, %89, %81, %65, %56, %9
  %.0 = phi i32 [ 1, %9 ], [ 1, %89 ], [ 1, %177 ], [ 0, %180 ], [ 1, %56 ], [ 1, %65 ], [ 1, %81 ]
  call void @llvm.stackrestore(i8* %3), !dbg !140
  ret i32 %.0, !dbg !141
}

declare i8* @llvm.stacksave() nounwind

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memset_chk(i8*, i32, i64, i64) nounwind

define internal i8* @__inline_memset_chk(i8* %__dest, i32 %__val, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len2 = call i64 @kint_arg.i64(), !id !142, !intrange !143
  %__val1 = call i32 @kint_arg.i32(), !id !144, !intrange !145
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !146
  %2 = call i8* @__memset_chk(i8* %__dest, i32 %__val1, i64 %__len2, i64 %1) nounwind, !dbg !146
  ret i8* %2, !dbg !146
}

declare i8* @__strncpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_strncpy_chk(i8* noalias %__dest, i8* noalias %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !148, !intrange !149
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !150
  %2 = call i8* @__strncpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !150
  ret i8* %2, !dbg !150
}

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i64 @strlen(i8*)

define internal i32 @isspace(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !152
  %1 = call i32 @__istype(i32 %_c1, i64 16384), !dbg !153, !intrange !115
  ret i32 %1, !dbg !153
}

declare i32 @printf(i8*, ...)

declare i32 @fclose(%struct.__sFILE*)

declare void @llvm.stackrestore(i8*) nounwind

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !155, !intrange !156
  %_c1 = call i32 @kint_arg.i32(), !id !157
  %1 = call i32 @isascii(i32 %_c1), !dbg !158, !intrange !115
  %2 = icmp ne i32 %1, 0, !dbg !158
  br i1 %2, label %3, label %10, !dbg !158

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !158
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !158
  %6 = load i32* %5, align 4, !dbg !158
  %7 = zext i32 %6 to i64, !dbg !158
  %8 = and i64 %7, %_f2, !dbg !158
  %9 = icmp ne i64 %8, 0, !dbg !158
  br label %13, !dbg !158

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c1, i64 %_f2), !dbg !160
  %12 = icmp ne i32 %11, 0, !dbg !160
  br label %13, !dbg !160

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !158
  %15 = xor i1 %14, true, !dbg !158
  %16 = zext i1 %15 to i32, !dbg !158
  ret i32 %16, !dbg !160
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !161
  %1 = and i32 %_c1, -128, !dbg !162
  %2 = icmp eq i32 %1, 0, !dbg !162
  %3 = zext i1 %2 to i32, !dbg !162
  ret i32 %3, !dbg !162
}

declare i32 @__maskrune(i32, i64)

declare i32 @kint_arg.i32()

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !10, metadata !11, metadata !14, metadata !20, metadata !24, metadata !29, metadata !30, metadata !40}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"foo", metadata !"foo", metadata !"", metadata !6, i32 48, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @foo, null, null, metadata !1, i32 49} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [foo]
!6 = metadata !{i32 786473, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, i32 0, metadata !6, metadata !"bar", metadata !"bar", metadata !"", metadata !6, i32 55, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @bar, null, null, metadata !1, i32 56} ; [ DW_TAG_subprogram ] [line 55] [def] [scope 56] [bar]
!11 = metadata !{i32 786478, i32 0, metadata !6, metadata !"func", metadata !"func", metadata !"", metadata !6, i32 60, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @func, null, null, metadata !1, i32 60} ; [ DW_TAG_subprogram ] [line 60] [def] [func]
!12 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{metadata !9}
!14 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 66, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 67} ; [ DW_TAG_subprogram ] [line 66] [def] [scope 67] [main]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !9, metadata !9, metadata !17}
!17 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{i32 786478, i32 0, metadata !21, metadata !"isspace", metadata !"isspace", metadata !"", metadata !21, i32 284, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isspace, null, null, metadata !1, i32 285} ; [ DW_TAG_subprogram ] [line 284] [local] [def] [scope 285] [isspace]
!21 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint", null} ; [ DW_TAG_file_type ]
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !9, metadata !9}
!24 = metadata !{i32 786478, i32 0, metadata !21, metadata !"__istype", metadata !"__istype", metadata !"", metadata !21, i32 170, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !9, metadata !27, metadata !28}
!27 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !21, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!28 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!29 = metadata !{i32 786478, i32 0, metadata !21, metadata !"isascii", metadata !"isascii", metadata !"", metadata !21, i32 152, metadata !22, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!30 = metadata !{i32 786478, i32 0, metadata !31, metadata !"__inline_strncpy_chk", metadata !"__inline_strncpy_chk", metadata !"", metadata !31, i32 128, metadata !32, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_strncpy_chk, null, null, metadata !1, i32 130} ; [ DW_TAG_subprogram ] [line 128] [local] [def] [scope 130] [__inline_strncpy_chk]
!31 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint", null} ; [ DW_TAG_file_type ]
!32 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{metadata !18, metadata !34, metadata !35, metadata !38}
!34 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!37 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!38 = metadata !{i32 786454, null, metadata !"size_t", metadata !31, i32 78, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ] [size_t] [line 78, size 0, align 0, offset 0] [from __darwin_size_t]
!39 = metadata !{i32 786454, null, metadata !"__darwin_size_t", metadata !31, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ] [__darwin_size_t] [line 90, size 0, align 0, offset 0] [from long unsigned int]
!40 = metadata !{i32 786478, i32 0, metadata !31, metadata !"__inline_memset_chk", metadata !"__inline_memset_chk", metadata !"", metadata !31, i32 81, metadata !41, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i32, i64)* @__inline_memset_chk, null, null, metadata !1, i32 82} ; [ DW_TAG_subprogram ] [line 81] [local] [def] [scope 82] [__inline_memset_chk]
!41 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{metadata !43, metadata !43, metadata !9, metadata !38}
!43 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!44 = metadata !{metadata !"arg.foo.0"}
!45 = metadata !{i32 8, i32 9}
!46 = metadata !{i32 50, i32 2, metadata !47, null}
!47 = metadata !{i32 786443, metadata !5, i32 49, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!48 = metadata !{i32 52, i32 2, metadata !47, null}
!49 = metadata !{i32 53, i32 1, metadata !47, null}
!50 = metadata !{metadata !"arg.bar.0"}
!51 = metadata !{i32 57, i32 2, metadata !52, null}
!52 = metadata !{i32 786443, metadata !10, i32 56, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!53 = metadata !{i32 58, i32 1, metadata !52, null}
!54 = metadata !{i32 62, i32 17, metadata !55, null}
!55 = metadata !{i32 786443, metadata !11, i32 60, i32 11, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!56 = metadata !{metadata !"arg.main.0"}
!57 = metadata !{i32 71, i32 16, metadata !58, null}
!58 = metadata !{i32 786443, metadata !14, i32 67, i32 1, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!59 = metadata !{i32 256, i32 257}
!60 = metadata !{i32 72, i32 12, metadata !58, null}
!61 = metadata !{i32 88, i32 2, metadata !58, null}
!62 = metadata !{i32 90, i32 3, metadata !63, null}
!63 = metadata !{i32 786443, metadata !58, i32 89, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!64 = metadata !{i32 91, i32 3, metadata !63, null}
!65 = metadata !{i32 100, i32 2, metadata !58, null}
!66 = metadata !{i32 101, i32 2, metadata !58, null}
!67 = metadata !{i32 104, i32 2, metadata !58, null}
!68 = metadata !{i32 107, i32 2, metadata !58, null}
!69 = metadata !{i32 116, i32 7, metadata !70, null}
!70 = metadata !{i32 786443, metadata !58, i32 116, i32 2, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!71 = metadata !{i32 118, i32 3, metadata !72, null}
!72 = metadata !{i32 786443, metadata !70, i32 117, i32 2, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!73 = metadata !{i32 120, i32 3, metadata !72, null}
!74 = metadata !{i32 122, i32 4, metadata !75, null}
!75 = metadata !{i32 786443, metadata !72, i32 121, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!76 = metadata !{i32 123, i32 4, metadata !75, null}
!77 = metadata !{i32 126, i32 3, metadata !72, null}
!78 = metadata !{i32 128, i32 4, metadata !79, null}
!79 = metadata !{i32 786443, metadata !72, i32 127, i32 3, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!80 = metadata !{i32 129, i32 4, metadata !79, null}
!81 = metadata !{i32 132, i32 3, metadata !72, null}
!82 = metadata !{i32 134, i32 4, metadata !83, null}
!83 = metadata !{i32 786443, metadata !72, i32 133, i32 3, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!84 = metadata !{i32 135, i32 4, metadata !83, null}
!85 = metadata !{i32 116, i32 17, metadata !70, null}
!86 = metadata !{i32 141, i32 7, metadata !58, null}
!87 = metadata !{i32 142, i32 2, metadata !58, null}
!88 = metadata !{i32 144, i32 3, metadata !89, null}
!89 = metadata !{i32 786443, metadata !58, i32 143, i32 2, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!90 = metadata !{i32 145, i32 3, metadata !89, null}
!91 = metadata !{i32 157, i32 2, metadata !58, null}
!92 = metadata !{i32 159, i32 9, metadata !58, null}
!93 = metadata !{i32 162, i32 3, metadata !94, null}
!94 = metadata !{i32 786443, metadata !58, i32 160, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!95 = metadata !{i32 165, i32 8, metadata !96, null}
!96 = metadata !{i32 786443, metadata !97, i32 165, i32 6, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!97 = metadata !{i32 786443, metadata !94, i32 163, i32 3, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!98 = metadata !{i32 165, i32 25, metadata !96, null}
!99 = metadata !{i32 175, i32 12, metadata !94, null}
!100 = metadata !{i32 175, i32 42, metadata !94, null}
!101 = metadata !{i32 183, i32 3, metadata !94, null}
!102 = metadata !{i32 188, i32 4, metadata !103, null}
!103 = metadata !{i32 786443, metadata !94, i32 184, i32 3, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!104 = metadata !{i32 190, i32 5, metadata !105, null}
!105 = metadata !{i32 786443, metadata !103, i32 189, i32 4, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!106 = metadata !{i32 196, i32 6, metadata !107, null}
!107 = metadata !{i32 786443, metadata !105, i32 191, i32 5, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!108 = metadata !{i32 197, i32 6, metadata !107, null}
!109 = metadata !{i32 199, i32 6, metadata !107, null}
!110 = metadata !{i32 206, i32 6, metadata !111, null}
!111 = metadata !{i32 786443, metadata !107, i32 200, i32 6, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!112 = metadata !{i32 209, i32 5, metadata !105, null}
!113 = metadata !{i32 210, i32 5, metadata !105, null}
!114 = metadata !{i32 216, i32 8, metadata !103, null}
!115 = metadata !{i32 0, i32 2}
!116 = metadata !{i32 218, i32 5, metadata !117, null}
!117 = metadata !{i32 786443, metadata !103, i32 217, i32 4, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!118 = metadata !{i32 219, i32 5, metadata !117, null}
!119 = metadata !{i32 227, i32 4, metadata !103, null}
!120 = metadata !{i32 233, i32 5, metadata !121, null}
!121 = metadata !{i32 786443, metadata !103, i32 228, i32 4, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!122 = metadata !{i32 234, i32 5, metadata !121, null}
!123 = metadata !{i32 239, i32 5, metadata !121, null}
!124 = metadata !{i32 248, i32 5, metadata !121, null}
!125 = metadata !{i32 251, i32 6, metadata !126, null}
!126 = metadata !{i32 786443, metadata !121, i32 249, i32 5, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!127 = metadata !{i32 252, i32 6, metadata !126, null}
!128 = metadata !{i32 263, i32 4, metadata !103, null}
!129 = metadata !{i32 265, i32 5, metadata !130, null}
!130 = metadata !{i32 786443, metadata !103, i32 264, i32 4, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!131 = metadata !{i32 266, i32 5, metadata !130, null}
!132 = metadata !{i32 268, i32 4, metadata !130, null}
!133 = metadata !{i32 273, i32 4, metadata !103, null}
!134 = metadata !{i32 274, i32 3, metadata !103, null}
!135 = metadata !{i32 279, i32 7, metadata !58, null}
!136 = metadata !{i32 281, i32 3, metadata !137, null}
!137 = metadata !{i32 786443, metadata !58, i32 280, i32 3, metadata !6, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint/countlines.c]
!138 = metadata !{i32 282, i32 3, metadata !137, null}
!139 = metadata !{i32 288, i32 2, metadata !58, null}
!140 = metadata !{i32 289, i32 1, metadata !58, null}
!141 = metadata !{i32 289, i32 1, metadata !14, null}
!142 = metadata !{metadata !"arg._kint.__inline_memset_chk.2"}
!143 = metadata !{i64 256, i64 257}
!144 = metadata !{metadata !"arg._kint.__inline_memset_chk.1"}
!145 = metadata !{i32 0, i32 1}
!146 = metadata !{i32 83, i32 56, metadata !147, null}
!147 = metadata !{i32 786443, metadata !40, i32 82, i32 1, metadata !31, i32 27} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint//usr/include/secure/_string.h]
!148 = metadata !{metadata !"arg._kint.__inline_strncpy_chk.2"}
!149 = metadata !{i64 255, i64 256}
!150 = metadata !{i32 131, i32 57, metadata !151, null}
!151 = metadata !{i32 786443, metadata !30, i32 130, i32 1, metadata !31, i32 26} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint//usr/include/secure/_string.h]
!152 = metadata !{metadata !"arg._kint.isspace.0"}
!153 = metadata !{i32 286, i32 10, metadata !154, null}
!154 = metadata !{i32 786443, metadata !20, i32 285, i32 1, metadata !21, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint//usr/include/ctype.h]
!155 = metadata !{metadata !"arg._kint.__istype.1"}
!156 = metadata !{i64 16384, i64 16385}
!157 = metadata !{metadata !"arg._kint.__istype.0"}
!158 = metadata !{i32 175, i32 10, metadata !159, null}
!159 = metadata !{i32 786443, metadata !24, i32 171, i32 1, metadata !21, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint//usr/include/ctype.h]
!160 = metadata !{i32 176, i32 7, metadata !159, null}
!161 = metadata !{metadata !"arg._kint.isascii.0"}
!162 = metadata !{i32 154, i32 2, metadata !163, null}
!163 = metadata !{i32 786443, metadata !29, i32 153, i32 1, metadata !21, i32 25} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v499/src/kint//usr/include/ctype.h]
