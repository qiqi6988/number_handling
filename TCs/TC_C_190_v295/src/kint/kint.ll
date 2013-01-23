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
@.str = private unnamed_addr constant [30 x i8] c"\0AERROR: Usage: %s <filename>\0A\00", align 1
@.str1 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a slash character.\0A\00", align 1
@.str2 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a colon character.\0A\00", align 1
@.str3 = private unnamed_addr constant [70 x i8] c"\0AERROR: Filename must not contain a double dot (e.g. '..') sequence.\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str5 = private unnamed_addr constant [27 x i8] c"\0AERROR: Cannot open file.\0A\00", align 1
@.str6 = private unnamed_addr constant [27 x i8] c"\0AERROR: File close error.\0A\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"\0ARESULT: %d\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !37
  %1 = mul nsw i32 128, 2, !dbg !38
  %2 = zext i32 %1 to i64, !dbg !38
  %3 = call i8* @llvm.stacksave(), !dbg !38
  %4 = alloca i8, i64 %2, align 16, !dbg !38
  %5 = mul nsw i32 128, 2, !dbg !40
  %6 = zext i32 %5 to i64, !dbg !40
  %7 = alloca i8, i64 %6, align 16, !dbg !40
  %8 = icmp ne i32 %argc1, 2, !dbg !41
  br i1 %8, label %9, label %14, !dbg !41

; <label>:9                                       ; preds = %0
  %10 = load %struct.__sFILE** @__stderrp, align 8, !dbg !42
  %11 = getelementptr inbounds i8** %argv, i64 0, !dbg !42
  %12 = load i8** %11, align 8, !dbg !42
  %13 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([30 x i8]* @.str, i32 0, i32 0), i8* %12), !dbg !42
  br label %183, !dbg !44

; <label>:14                                      ; preds = %0
  %15 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !45
  %16 = icmp ne i64 %15, -1, !dbg !45
  br i1 %16, label %17, label %20, !dbg !45

; <label>:17                                      ; preds = %14
  %18 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !45
  %19 = call i8* @__memset_chk(i8* %4, i32 0, i64 256, i64 %18) nounwind, !dbg !45
  br label %22, !dbg !45

; <label>:20                                      ; preds = %14
  %21 = call i8* @__inline_memset_chk(i8* %4, i32 0, i64 256), !dbg !45
  br label %22, !dbg !45

; <label>:22                                      ; preds = %20, %17
  %23 = phi i8* [ %19, %17 ], [ %21, %20 ], !dbg !45
  %24 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !46
  %25 = icmp ne i64 %24, -1, !dbg !46
  %26 = getelementptr inbounds i8** %argv, i64 1, !dbg !46
  %27 = load i8** %26, align 8, !dbg !46
  br i1 %25, label %28, label %31, !dbg !46

; <label>:28                                      ; preds = %22
  %29 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !46
  %30 = call i8* @__strncpy_chk(i8* %4, i8* %27, i64 255, i64 %29) nounwind, !dbg !46
  br label %33, !dbg !46

; <label>:31                                      ; preds = %22
  %32 = call i8* @__inline_strncpy_chk(i8* %4, i8* %27, i64 255), !dbg !46
  br label %33, !dbg !46

; <label>:33                                      ; preds = %31, %28
  %34 = phi i8* [ %30, %28 ], [ %32, %31 ], !dbg !46
  %35 = mul nsw i32 128, 2, !dbg !47
  %36 = sext i32 %35 to i64, !dbg !47
  %37 = getelementptr inbounds i8* %4, i64 %36, !dbg !47
  store i8 0, i8* %37, align 1, !dbg !47
  br label %38, !dbg !48

; <label>:38                                      ; preds = %86, %33
  %i.0 = phi i32 [ 0, %33 ], [ %87, %86 ]
  %39 = icmp slt i32 %i.0, 255, !dbg !48
  br i1 %39, label %40, label %88, !dbg !48

; <label>:40                                      ; preds = %38
  %41 = sext i32 %i.0 to i64, !dbg !50
  %42 = getelementptr inbounds i8* %4, i64 %41, !dbg !50
  %43 = load i8* %42, align 1, !dbg !50
  %44 = sext i8 %43 to i32, !dbg !50
  %45 = icmp eq i32 %44, 0, !dbg !50
  br i1 %45, label %88, label %46, !dbg !50

; <label>:46                                      ; preds = %40
  %47 = sext i32 %i.0 to i64, !dbg !52
  %48 = getelementptr inbounds i8* %4, i64 %47, !dbg !52
  %49 = load i8* %48, align 1, !dbg !52
  %50 = sext i8 %49 to i32, !dbg !52
  %51 = icmp eq i32 %50, 92, !dbg !52
  br i1 %51, label %58, label %52, !dbg !52

; <label>:52                                      ; preds = %46
  %53 = sext i32 %i.0 to i64, !dbg !52
  %54 = getelementptr inbounds i8* %4, i64 %53, !dbg !52
  %55 = load i8* %54, align 1, !dbg !52
  %56 = sext i8 %55 to i32, !dbg !52
  %57 = icmp eq i32 %56, 47, !dbg !52
  br i1 %57, label %58, label %61, !dbg !52

; <label>:58                                      ; preds = %52, %46
  %59 = load %struct.__sFILE** @__stderrp, align 8, !dbg !53
  %60 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %59, i8* getelementptr inbounds ([54 x i8]* @.str1, i32 0, i32 0)), !dbg !53
  br label %183, !dbg !55

; <label>:61                                      ; preds = %52
  %62 = sext i32 %i.0 to i64, !dbg !56
  %63 = getelementptr inbounds i8* %4, i64 %62, !dbg !56
  %64 = load i8* %63, align 1, !dbg !56
  %65 = sext i8 %64 to i32, !dbg !56
  %66 = icmp eq i32 %65, 58, !dbg !56
  br i1 %66, label %67, label %70, !dbg !56

; <label>:67                                      ; preds = %61
  %68 = load %struct.__sFILE** @__stderrp, align 8, !dbg !57
  %69 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %68, i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0)), !dbg !57
  br label %183, !dbg !59

; <label>:70                                      ; preds = %61
  %71 = sext i32 %i.0 to i64, !dbg !60
  %72 = getelementptr inbounds i8* %4, i64 %71, !dbg !60
  %73 = load i8* %72, align 1, !dbg !60
  %74 = sext i8 %73 to i32, !dbg !60
  %75 = icmp eq i32 %74, 46, !dbg !60
  br i1 %75, label %76, label %86, !dbg !60

; <label>:76                                      ; preds = %70
  %77 = add nsw i32 %i.0, 1, !dbg !60
  %78 = sext i32 %77 to i64, !dbg !60
  %79 = getelementptr inbounds i8* %4, i64 %78, !dbg !60
  %80 = load i8* %79, align 1, !dbg !60
  %81 = sext i8 %80 to i32, !dbg !60
  %82 = icmp eq i32 %81, 46, !dbg !60
  br i1 %82, label %83, label %86, !dbg !60

; <label>:83                                      ; preds = %76
  %84 = load %struct.__sFILE** @__stderrp, align 8, !dbg !61
  %85 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %84, i8* getelementptr inbounds ([70 x i8]* @.str3, i32 0, i32 0)), !dbg !61
  br label %183, !dbg !63

; <label>:86                                      ; preds = %76, %70
  %87 = add nsw i32 %i.0, 1, !dbg !64
  br label %38, !dbg !64

; <label>:88                                      ; preds = %40, %38
  %89 = call %struct.__sFILE* @"\01_fopen"(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0)), !dbg !65
  %90 = icmp eq %struct.__sFILE* %89, null, !dbg !66
  br i1 %90, label %91, label %94, !dbg !66

; <label>:91                                      ; preds = %88
  %92 = load %struct.__sFILE** @__stderrp, align 8, !dbg !67
  %93 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %92, i8* getelementptr inbounds ([27 x i8]* @.str5, i32 0, i32 0)), !dbg !67
  br label %183, !dbg !69

; <label>:94                                      ; preds = %88
  %95 = call i64 @llvm.objectsize.i64(i8* %7, i1 false), !dbg !70
  %96 = icmp ne i64 %95, -1, !dbg !70
  br i1 %96, label %97, label %100, !dbg !70

; <label>:97                                      ; preds = %94
  %98 = call i64 @llvm.objectsize.i64(i8* %7, i1 false), !dbg !70
  %99 = call i8* @__memset_chk(i8* %7, i32 0, i64 256, i64 %98) nounwind, !dbg !70
  br label %102, !dbg !70

; <label>:100                                     ; preds = %94
  %101 = call i8* @__inline_memset_chk(i8* %7, i32 0, i64 256), !dbg !70
  br label %102, !dbg !70

; <label>:102                                     ; preds = %158, %153, %132, %122, %100, %97
  %multi_line_comment.0 = phi i32 [ 0, %97 ], [ %multi_line_comment.1, %132 ], [ %multi_line_comment.1, %153 ], [ %multi_line_comment.1, %158 ], [ %multi_line_comment.1, %122 ], [ 0, %100 ]
  %lines_of_code.0 = phi i8 [ 0, %97 ], [ %lines_of_code.2, %132 ], [ %lines_of_code.2, %153 ], [ %lines_of_code.2, %158 ], [ %lines_of_code.2, %122 ], [ 0, %100 ]
  %103 = call i8* @fgets(i8* %7, i32 256, %struct.__sFILE* %89), !dbg !71
  %104 = icmp ne i8* %103, null, !dbg !71
  br i1 %104, label %105, label %174, !dbg !71

; <label>:105                                     ; preds = %102
  %106 = sext i8 %lines_of_code.0 to i32, !dbg !72
  %107 = icmp slt i32 %106, 0, !dbg !72
  br i1 %107, label %108, label %110, !dbg !72

; <label>:108                                     ; preds = %108, %105
  %lines_of_code.1 = phi i8 [ %lines_of_code.0, %105 ], [ %109, %108 ]
  %109 = add i8 %lines_of_code.1, 1, !dbg !74
  br label %108, !dbg !77

; <label>:110                                     ; preds = %105
  %111 = call i64 @strlen(i8* %7), !dbg !78
  %112 = sub i64 %111, 1, !dbg !78
  %113 = getelementptr inbounds i8* %7, i64 %112, !dbg !78
  %114 = load i8* %113, align 1, !dbg !78
  %115 = sext i8 %114 to i32, !dbg !78
  %116 = icmp eq i32 %115, 10, !dbg !78
  br i1 %116, label %117, label %121, !dbg !78

; <label>:117                                     ; preds = %110
  %118 = call i64 @strlen(i8* %7), !dbg !79
  %119 = sub i64 %118, 1, !dbg !79
  %120 = getelementptr inbounds i8* %7, i64 %119, !dbg !79
  store i8 0, i8* %120, align 1, !dbg !79
  br label %121, !dbg !79

; <label>:121                                     ; preds = %117, %110
  br label %122, !dbg !80

; <label>:122                                     ; preds = %172, %166, %147, %142, %121
  %line_pointer.0 = phi i8* [ %7, %121 ], [ %143, %142 ], [ %148, %147 ], [ %167, %166 ], [ %173, %172 ]
  %line_already_counted.0 = phi i32 [ 0, %121 ], [ %line_already_counted.0, %142 ], [ %line_already_counted.0, %147 ], [ %line_already_counted.0, %166 ], [ %line_already_counted.1, %172 ]
  %multi_line_comment.1 = phi i32 [ %multi_line_comment.0, %121 ], [ %multi_line_comment.2, %142 ], [ %multi_line_comment.1, %147 ], [ 1, %166 ], [ %multi_line_comment.1, %172 ]
  %lines_of_code.2 = phi i8 [ %lines_of_code.0, %121 ], [ %lines_of_code.2, %142 ], [ %lines_of_code.2, %147 ], [ %lines_of_code.2, %166 ], [ %lines_of_code.3, %172 ]
  %123 = load i8* %line_pointer.0, align 1, !dbg !80
  %124 = sext i8 %123 to i32, !dbg !80
  %125 = icmp ne i32 %124, 0, !dbg !80
  br i1 %125, label %126, label %102, !dbg !80

; <label>:126                                     ; preds = %122
  %127 = icmp eq i32 %multi_line_comment.1, 1, !dbg !81
  %128 = load i8* %line_pointer.0, align 1, !dbg !83
  %129 = sext i8 %128 to i32, !dbg !83
  br i1 %127, label %130, label %144, !dbg !81

; <label>:130                                     ; preds = %126
  %131 = icmp eq i32 %129, 42, !dbg !83
  br i1 %131, label %132, label %142, !dbg !83

; <label>:132                                     ; preds = %130
  %133 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !85
  %134 = load i8* %133, align 1, !dbg !87
  %135 = sext i8 %134 to i32, !dbg !87
  %136 = icmp eq i32 %135, 0, !dbg !87
  br i1 %136, label %102, label %137, !dbg !87

; <label>:137                                     ; preds = %132
  %138 = load i8* %133, align 1, !dbg !88
  %139 = sext i8 %138 to i32, !dbg !88
  %140 = icmp eq i32 %139, 47, !dbg !88
  br i1 %140, label %141, label %142, !dbg !88

; <label>:141                                     ; preds = %137
  br label %142, !dbg !89

; <label>:142                                     ; preds = %141, %137, %130
  %line_pointer.1 = phi i8* [ %133, %141 ], [ %133, %137 ], [ %line_pointer.0, %130 ]
  %multi_line_comment.2 = phi i32 [ 0, %141 ], [ %multi_line_comment.1, %137 ], [ %multi_line_comment.1, %130 ]
  %143 = getelementptr inbounds i8* %line_pointer.1, i32 1, !dbg !91
  br label %122, !dbg !92

; <label>:144                                     ; preds = %126
  %145 = call i32 @isspace(i32 %129), !dbg !93, !intrange !94
  %146 = icmp ne i32 %145, 0, !dbg !93
  br i1 %146, label %147, label %149, !dbg !93

; <label>:147                                     ; preds = %144
  %148 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !95
  br label %122, !dbg !97

; <label>:149                                     ; preds = %144
  %150 = load i8* %line_pointer.0, align 1, !dbg !98
  %151 = sext i8 %150 to i32, !dbg !98
  %152 = icmp eq i32 %151, 47, !dbg !98
  br i1 %152, label %153, label %168, !dbg !98

; <label>:153                                     ; preds = %149
  %154 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !99
  %155 = load i8* %154, align 1, !dbg !101
  %156 = sext i8 %155 to i32, !dbg !101
  %157 = icmp eq i32 %156, 0, !dbg !101
  br i1 %157, label %102, label %158, !dbg !101

; <label>:158                                     ; preds = %153
  %159 = load i8* %154, align 1, !dbg !102
  %160 = sext i8 %159 to i32, !dbg !102
  %161 = icmp eq i32 %160, 47, !dbg !102
  br i1 %161, label %102, label %162, !dbg !102

; <label>:162                                     ; preds = %158
  %163 = load i8* %154, align 1, !dbg !103
  %164 = sext i8 %163 to i32, !dbg !103
  %165 = icmp eq i32 %164, 42, !dbg !103
  br i1 %165, label %166, label %168, !dbg !103

; <label>:166                                     ; preds = %162
  %167 = getelementptr inbounds i8* %154, i32 1, !dbg !104
  br label %122, !dbg !106

; <label>:168                                     ; preds = %162, %149
  %line_pointer.2 = phi i8* [ %154, %162 ], [ %line_pointer.0, %149 ]
  %169 = icmp eq i32 %line_already_counted.0, 0, !dbg !107
  br i1 %169, label %170, label %172, !dbg !107

; <label>:170                                     ; preds = %168
  %171 = add i8 %lines_of_code.2, 1, !dbg !108
  br label %172, !dbg !110

; <label>:172                                     ; preds = %170, %168
  %line_already_counted.1 = phi i32 [ 1, %170 ], [ %line_already_counted.0, %168 ]
  %lines_of_code.3 = phi i8 [ %171, %170 ], [ %lines_of_code.2, %168 ]
  %173 = getelementptr inbounds i8* %line_pointer.2, i32 1, !dbg !111
  br label %122, !dbg !112

; <label>:174                                     ; preds = %102
  %175 = call i32 @fclose(%struct.__sFILE* %89), !dbg !113
  %176 = icmp ne i32 %175, 0, !dbg !113
  br i1 %176, label %177, label %180, !dbg !113

; <label>:177                                     ; preds = %174
  %178 = load %struct.__sFILE** @__stderrp, align 8, !dbg !114
  %179 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %178, i8* getelementptr inbounds ([27 x i8]* @.str6, i32 0, i32 0)), !dbg !114
  br label %183, !dbg !116

; <label>:180                                     ; preds = %174
  %181 = sext i8 %lines_of_code.0 to i32, !dbg !117
  %182 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0), i32 %181), !dbg !117
  br label %183, !dbg !118

; <label>:183                                     ; preds = %180, %177, %91, %83, %67, %58, %9
  %.0 = phi i32 [ 1, %9 ], [ 1, %91 ], [ 1, %177 ], [ 0, %180 ], [ 1, %58 ], [ 1, %67 ], [ 1, %83 ]
  call void @llvm.stackrestore(i8* %3), !dbg !119
  ret i32 %.0, !dbg !120
}

declare i8* @llvm.stacksave() nounwind

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memset_chk(i8*, i32, i64, i64) nounwind

define internal i8* @__inline_memset_chk(i8* %__dest, i32 %__val, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len2 = call i64 @kint_arg.i64(), !id !121, !intrange !122
  %__val1 = call i32 @kint_arg.i32(), !id !123, !intrange !124
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !125
  %2 = call i8* @__memset_chk(i8* %__dest, i32 %__val1, i64 %__len2, i64 %1) nounwind, !dbg !125
  ret i8* %2, !dbg !125
}

declare i8* @__strncpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_strncpy_chk(i8* noalias %__dest, i8* noalias %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !127, !intrange !128
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !129
  %2 = call i8* @__strncpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !129
  ret i8* %2, !dbg !129
}

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i64 @strlen(i8*)

define internal i32 @isspace(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !131
  %1 = call i32 @__istype(i32 %_c1, i64 16384), !dbg !132, !intrange !94
  ret i32 %1, !dbg !132
}

declare i32 @fclose(%struct.__sFILE*)

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !134, !intrange !135
  %_c1 = call i32 @kint_arg.i32(), !id !136
  %1 = call i32 @isascii(i32 %_c1), !dbg !137, !intrange !94
  %2 = icmp ne i32 %1, 0, !dbg !137
  br i1 %2, label %3, label %10, !dbg !137

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !137
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !137
  %6 = load i32* %5, align 4, !dbg !137
  %7 = zext i32 %6 to i64, !dbg !137
  %8 = and i64 %7, %_f2, !dbg !137
  %9 = icmp ne i64 %8, 0, !dbg !137
  br label %13, !dbg !137

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c1, i64 %_f2), !dbg !139
  %12 = icmp ne i32 %11, 0, !dbg !139
  br label %13, !dbg !139

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !137
  %15 = xor i1 %14, true, !dbg !137
  %16 = zext i1 %15 to i32, !dbg !137
  ret i32 %16, !dbg !139
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !140
  %1 = and i32 %_c1, -128, !dbg !141
  %2 = icmp eq i32 %1, 0, !dbg !141
  %3 = zext i1 %2 to i32, !dbg !141
  ret i32 %3, !dbg !141
}

declare i32 @__maskrune(i32, i64)

declare i32 @kint_arg.i32()

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !17, metadata !22, metadata !23, metadata !33}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 65, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 66} ; [ DW_TAG_subprogram ] [line 65] [def] [scope 66] [main]
!6 = metadata !{i32 786473, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isspace", metadata !"isspace", metadata !"", metadata !14, i32 284, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isspace, null, null, metadata !1, i32 285} ; [ DW_TAG_subprogram ] [line 284] [local] [def] [scope 285] [isspace]
!14 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint", null} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !9, metadata !9}
!17 = metadata !{i32 786478, i32 0, metadata !14, metadata !"__istype", metadata !"__istype", metadata !"", metadata !14, i32 170, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !20, metadata !21}
!20 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !14, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!21 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!22 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isascii", metadata !"isascii", metadata !"", metadata !14, i32 152, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!23 = metadata !{i32 786478, i32 0, metadata !24, metadata !"__inline_strncpy_chk", metadata !"__inline_strncpy_chk", metadata !"", metadata !24, i32 128, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_strncpy_chk, null, null, metadata !1, i32 130} ; [ DW_TAG_subprogram ] [line 128] [local] [def] [scope 130] [__inline_strncpy_chk]
!24 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint", null} ; [ DW_TAG_file_type ]
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !11, metadata !27, metadata !28, metadata !31}
!27 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{i32 786487, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!31 = metadata !{i32 786454, null, metadata !"size_t", metadata !24, i32 78, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ] [size_t] [line 78, size 0, align 0, offset 0] [from __darwin_size_t]
!32 = metadata !{i32 786454, null, metadata !"__darwin_size_t", metadata !24, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ] [__darwin_size_t] [line 90, size 0, align 0, offset 0] [from long unsigned int]
!33 = metadata !{i32 786478, i32 0, metadata !24, metadata !"__inline_memset_chk", metadata !"__inline_memset_chk", metadata !"", metadata !24, i32 81, metadata !34, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i32, i64)* @__inline_memset_chk, null, null, metadata !1, i32 82} ; [ DW_TAG_subprogram ] [line 81] [local] [def] [scope 82] [__inline_memset_chk]
!34 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{metadata !36, metadata !36, metadata !9, metadata !31}
!36 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!37 = metadata !{metadata !"arg.main.0"}
!38 = metadata !{i32 72, i32 20, metadata !39, null}
!39 = metadata !{i32 786443, metadata !5, i32 66, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!40 = metadata !{i32 74, i32 16, metadata !39, null}
!41 = metadata !{i32 90, i32 2, metadata !39, null}
!42 = metadata !{i32 92, i32 3, metadata !43, null}
!43 = metadata !{i32 786443, metadata !39, i32 91, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!44 = metadata !{i32 93, i32 3, metadata !43, null}
!45 = metadata !{i32 102, i32 2, metadata !39, null}
!46 = metadata !{i32 103, i32 2, metadata !39, null}
!47 = metadata !{i32 104, i32 2, metadata !39, null}
!48 = metadata !{i32 114, i32 7, metadata !49, null}
!49 = metadata !{i32 786443, metadata !39, i32 114, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!50 = metadata !{i32 116, i32 3, metadata !51, null}
!51 = metadata !{i32 786443, metadata !49, i32 115, i32 2, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!52 = metadata !{i32 118, i32 3, metadata !51, null}
!53 = metadata !{i32 120, i32 4, metadata !54, null}
!54 = metadata !{i32 786443, metadata !51, i32 119, i32 3, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!55 = metadata !{i32 121, i32 4, metadata !54, null}
!56 = metadata !{i32 124, i32 3, metadata !51, null}
!57 = metadata !{i32 126, i32 4, metadata !58, null}
!58 = metadata !{i32 786443, metadata !51, i32 125, i32 3, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!59 = metadata !{i32 127, i32 4, metadata !58, null}
!60 = metadata !{i32 130, i32 3, metadata !51, null}
!61 = metadata !{i32 132, i32 4, metadata !62, null}
!62 = metadata !{i32 786443, metadata !51, i32 131, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!63 = metadata !{i32 133, i32 4, metadata !62, null}
!64 = metadata !{i32 114, i32 17, metadata !49, null}
!65 = metadata !{i32 139, i32 7, metadata !39, null}
!66 = metadata !{i32 140, i32 2, metadata !39, null}
!67 = metadata !{i32 142, i32 3, metadata !68, null}
!68 = metadata !{i32 786443, metadata !39, i32 141, i32 2, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!69 = metadata !{i32 143, i32 3, metadata !68, null}
!70 = metadata !{i32 155, i32 2, metadata !39, null}
!71 = metadata !{i32 160, i32 10, metadata !39, null}
!72 = metadata !{i32 165, i32 3, metadata !73, null}
!73 = metadata !{i32 786443, metadata !39, i32 161, i32 2, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!74 = metadata !{i32 168, i32 8, metadata !75, null}
!75 = metadata !{i32 786443, metadata !76, i32 168, i32 6, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!76 = metadata !{i32 786443, metadata !73, i32 166, i32 3, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!77 = metadata !{i32 168, i32 25, metadata !75, null}
!78 = metadata !{i32 179, i32 12, metadata !73, null}
!79 = metadata !{i32 179, i32 42, metadata !73, null}
!80 = metadata !{i32 187, i32 3, metadata !73, null}
!81 = metadata !{i32 192, i32 4, metadata !82, null}
!82 = metadata !{i32 786443, metadata !73, i32 188, i32 3, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!83 = metadata !{i32 194, i32 5, metadata !84, null}
!84 = metadata !{i32 786443, metadata !82, i32 193, i32 4, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!85 = metadata !{i32 200, i32 6, metadata !86, null}
!86 = metadata !{i32 786443, metadata !84, i32 195, i32 5, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!87 = metadata !{i32 201, i32 6, metadata !86, null}
!88 = metadata !{i32 204, i32 6, metadata !86, null}
!89 = metadata !{i32 211, i32 6, metadata !90, null}
!90 = metadata !{i32 786443, metadata !86, i32 205, i32 6, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!91 = metadata !{i32 214, i32 5, metadata !84, null}
!92 = metadata !{i32 215, i32 5, metadata !84, null}
!93 = metadata !{i32 221, i32 8, metadata !82, null}
!94 = metadata !{i32 0, i32 2}
!95 = metadata !{i32 223, i32 5, metadata !96, null}
!96 = metadata !{i32 786443, metadata !82, i32 222, i32 4, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!97 = metadata !{i32 224, i32 5, metadata !96, null}
!98 = metadata !{i32 232, i32 4, metadata !82, null}
!99 = metadata !{i32 238, i32 5, metadata !100, null}
!100 = metadata !{i32 786443, metadata !82, i32 233, i32 4, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!101 = metadata !{i32 239, i32 5, metadata !100, null}
!102 = metadata !{i32 244, i32 5, metadata !100, null}
!103 = metadata !{i32 253, i32 5, metadata !100, null}
!104 = metadata !{i32 256, i32 6, metadata !105, null}
!105 = metadata !{i32 786443, metadata !100, i32 254, i32 5, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!106 = metadata !{i32 257, i32 6, metadata !105, null}
!107 = metadata !{i32 268, i32 4, metadata !82, null}
!108 = metadata !{i32 270, i32 5, metadata !109, null}
!109 = metadata !{i32 786443, metadata !82, i32 269, i32 4, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!110 = metadata !{i32 272, i32 4, metadata !109, null}
!111 = metadata !{i32 277, i32 4, metadata !82, null}
!112 = metadata !{i32 278, i32 3, metadata !82, null}
!113 = metadata !{i32 283, i32 7, metadata !39, null}
!114 = metadata !{i32 285, i32 3, metadata !115, null}
!115 = metadata !{i32 786443, metadata !39, i32 284, i32 3, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint/countlines.c]
!116 = metadata !{i32 286, i32 3, metadata !115, null}
!117 = metadata !{i32 291, i32 2, metadata !39, null}
!118 = metadata !{i32 293, i32 2, metadata !39, null}
!119 = metadata !{i32 294, i32 1, metadata !39, null}
!120 = metadata !{i32 294, i32 1, metadata !5, null}
!121 = metadata !{metadata !"arg._kint.__inline_memset_chk.2"}
!122 = metadata !{i64 256, i64 257}
!123 = metadata !{metadata !"arg._kint.__inline_memset_chk.1"}
!124 = metadata !{i32 0, i32 1}
!125 = metadata !{i32 83, i32 56, metadata !126, null}
!126 = metadata !{i32 786443, metadata !33, i32 82, i32 1, metadata !24, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint//usr/include/secure/_string.h]
!127 = metadata !{metadata !"arg._kint.__inline_strncpy_chk.2"}
!128 = metadata !{i64 255, i64 256}
!129 = metadata !{i32 131, i32 57, metadata !130, null}
!130 = metadata !{i32 786443, metadata !23, i32 130, i32 1, metadata !24, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint//usr/include/secure/_string.h]
!131 = metadata !{metadata !"arg._kint.isspace.0"}
!132 = metadata !{i32 286, i32 10, metadata !133, null}
!133 = metadata !{i32 786443, metadata !13, i32 285, i32 1, metadata !14, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint//usr/include/ctype.h]
!134 = metadata !{metadata !"arg._kint.__istype.1"}
!135 = metadata !{i64 16384, i64 16385}
!136 = metadata !{metadata !"arg._kint.__istype.0"}
!137 = metadata !{i32 175, i32 10, metadata !138, null}
!138 = metadata !{i32 786443, metadata !17, i32 171, i32 1, metadata !14, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint//usr/include/ctype.h]
!139 = metadata !{i32 176, i32 7, metadata !138, null}
!140 = metadata !{metadata !"arg._kint.isascii.0"}
!141 = metadata !{i32 154, i32 2, metadata !142, null}
!142 = metadata !{i32 786443, metadata !22, i32 153, i32 1, metadata !14, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v295/src/kint//usr/include/ctype.h]
