; ModuleID = './kint.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct._RuneLocale = type { [8 x i8], [32 x i8], i32 (i8*, i64, i8**)*, i32 (i32, i8*, i64, i8**)*, i32, [256 x i32], [256 x i32], [256 x i32], %struct._RuneRange, %struct._RuneRange, %struct._RuneRange, i8*, i32, i32, %struct._RuneCharClass* }
%struct._RuneRange = type { i32, %struct._RuneEntry* }
%struct._RuneEntry = type { i32, i32, i32, i32* }
%struct._RuneCharClass = type { [14 x i8], i32 }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque

@.str = private unnamed_addr constant [38 x i8] c"\0AERROR: Usage: countlines <filename>\0A\00", align 1
@.str1 = private unnamed_addr constant [58 x i8] c"Error: max_line_length is %d, but must be >=1 and <= 120\0A\00", align 1
@.str2 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a slash character.\0A\00", align 1
@.str3 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a colon character.\0A\00", align 1
@.str4 = private unnamed_addr constant [70 x i8] c"\0AERROR: Filename must not contain a double dot (e.g. '..') sequence.\0A\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str6 = private unnamed_addr constant [27 x i8] c"\0AERROR: Cannot open file.\0A\00", align 1
@.str7 = private unnamed_addr constant [27 x i8] c"\0AERROR: File close error.\0A\00", align 1
@.str8 = private unnamed_addr constant [21 x i8] c"remaining_chars: %u\0A\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !37
  %line = alloca [256 x i8], align 16
  %1 = mul nsw i32 16, 16, !dbg !38
  %2 = zext i32 %1 to i64, !dbg !38
  %3 = call i8* @llvm.stacksave(), !dbg !38
  %4 = alloca i8, i64 %2, align 16, !dbg !38
  %5 = icmp ne i32 %argc1, 3, !dbg !40
  br i1 %5, label %6, label %8, !dbg !40

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str, i32 0, i32 0)), !dbg !41
  br label %198, !dbg !43

; <label>:8                                       ; preds = %0
  %9 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !44
  %10 = icmp ne i64 %9, -1, !dbg !44
  br i1 %10, label %11, label %14, !dbg !44

; <label>:11                                      ; preds = %8
  %12 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !44
  %13 = call i8* @__memset_chk(i8* %4, i32 0, i64 256, i64 %12) nounwind, !dbg !44
  br label %16, !dbg !44

; <label>:14                                      ; preds = %8
  %15 = call i8* @__inline_memset_chk(i8* %4, i32 0, i64 256), !dbg !44
  br label %16, !dbg !44

; <label>:16                                      ; preds = %14, %11
  %17 = phi i8* [ %13, %11 ], [ %15, %14 ], !dbg !44
  %18 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !45
  %19 = icmp ne i64 %18, -1, !dbg !45
  %20 = getelementptr inbounds i8** %argv, i64 1, !dbg !45
  %21 = load i8** %20, align 8, !dbg !45
  br i1 %19, label %22, label %25, !dbg !45

; <label>:22                                      ; preds = %16
  %23 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !45
  %24 = call i8* @__strncpy_chk(i8* %4, i8* %21, i64 255, i64 %23) nounwind, !dbg !45
  br label %27, !dbg !45

; <label>:25                                      ; preds = %16
  %26 = call i8* @__inline_strncpy_chk(i8* %4, i8* %21, i64 255), !dbg !45
  br label %27, !dbg !45

; <label>:27                                      ; preds = %25, %22
  %28 = phi i8* [ %24, %22 ], [ %26, %25 ], !dbg !45
  %29 = getelementptr inbounds i8* %4, i64 255, !dbg !46
  store i8 0, i8* %29, align 1, !dbg !46
  %30 = getelementptr inbounds i8** %argv, i64 2, !dbg !47
  %31 = load i8** %30, align 8, !dbg !47
  %32 = call i32 @atoi(i8* %31), !dbg !47
  %33 = trunc i32 %32 to i8, !dbg !47
  %34 = sext i8 %33 to i32, !dbg !48
  %35 = icmp slt i32 %34, 1, !dbg !48
  br i1 %35, label %39, label %36, !dbg !48

; <label>:36                                      ; preds = %27
  %37 = sext i8 %33 to i32, !dbg !48
  %38 = icmp sgt i32 %37, 120, !dbg !48
  br i1 %38, label %39, label %42, !dbg !48

; <label>:39                                      ; preds = %36, %27
  %40 = sext i8 %33 to i32, !dbg !49
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str1, i32 0, i32 0), i32 %40), !dbg !49
  call void @exit(i32 1) noreturn, !dbg !51
  unreachable, !dbg !51

; <label>:42                                      ; preds = %36
  br label %43, !dbg !52

; <label>:43                                      ; preds = %88, %42
  %i.0 = phi i32 [ 0, %42 ], [ %89, %88 ]
  %44 = icmp slt i32 %i.0, 255, !dbg !52
  br i1 %44, label %45, label %90, !dbg !52

; <label>:45                                      ; preds = %43
  %46 = sext i32 %i.0 to i64, !dbg !54
  %47 = getelementptr inbounds i8* %4, i64 %46, !dbg !54
  %48 = load i8* %47, align 1, !dbg !54
  %49 = sext i8 %48 to i32, !dbg !54
  %50 = icmp eq i32 %49, 0, !dbg !54
  br i1 %50, label %90, label %51, !dbg !54

; <label>:51                                      ; preds = %45
  %52 = sext i32 %i.0 to i64, !dbg !56
  %53 = getelementptr inbounds i8* %4, i64 %52, !dbg !56
  %54 = load i8* %53, align 1, !dbg !56
  %55 = sext i8 %54 to i32, !dbg !56
  %56 = icmp eq i32 %55, 92, !dbg !56
  br i1 %56, label %63, label %57, !dbg !56

; <label>:57                                      ; preds = %51
  %58 = sext i32 %i.0 to i64, !dbg !56
  %59 = getelementptr inbounds i8* %4, i64 %58, !dbg !56
  %60 = load i8* %59, align 1, !dbg !56
  %61 = sext i8 %60 to i32, !dbg !56
  %62 = icmp eq i32 %61, 47, !dbg !56
  br i1 %62, label %63, label %65, !dbg !56

; <label>:63                                      ; preds = %57, %51
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0)), !dbg !57
  br label %198, !dbg !59

; <label>:65                                      ; preds = %57
  %66 = sext i32 %i.0 to i64, !dbg !60
  %67 = getelementptr inbounds i8* %4, i64 %66, !dbg !60
  %68 = load i8* %67, align 1, !dbg !60
  %69 = sext i8 %68 to i32, !dbg !60
  %70 = icmp eq i32 %69, 58, !dbg !60
  br i1 %70, label %71, label %73, !dbg !60

; <label>:71                                      ; preds = %65
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str3, i32 0, i32 0)), !dbg !61
  br label %198, !dbg !63

; <label>:73                                      ; preds = %65
  %74 = sext i32 %i.0 to i64, !dbg !64
  %75 = getelementptr inbounds i8* %4, i64 %74, !dbg !64
  %76 = load i8* %75, align 1, !dbg !64
  %77 = sext i8 %76 to i32, !dbg !64
  %78 = icmp eq i32 %77, 46, !dbg !64
  br i1 %78, label %79, label %88, !dbg !64

; <label>:79                                      ; preds = %73
  %80 = add nsw i32 %i.0, 1, !dbg !64
  %81 = sext i32 %80 to i64, !dbg !64
  %82 = getelementptr inbounds i8* %4, i64 %81, !dbg !64
  %83 = load i8* %82, align 1, !dbg !64
  %84 = sext i8 %83 to i32, !dbg !64
  %85 = icmp eq i32 %84, 46, !dbg !64
  br i1 %85, label %86, label %88, !dbg !64

; <label>:86                                      ; preds = %79
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([70 x i8]* @.str4, i32 0, i32 0)), !dbg !65
  br label %198, !dbg !67

; <label>:88                                      ; preds = %79, %73
  %89 = add nsw i32 %i.0, 1, !dbg !68
  br label %43, !dbg !68

; <label>:90                                      ; preds = %45, %43
  %91 = call %struct.__sFILE* @"\01_fopen"(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0)), !dbg !69
  %92 = icmp eq %struct.__sFILE* %91, null, !dbg !70
  br i1 %92, label %93, label %95, !dbg !70

; <label>:93                                      ; preds = %90
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str6, i32 0, i32 0)), !dbg !71
  br label %198, !dbg !73

; <label>:95                                      ; preds = %90
  %96 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* %96, i8 0, i64 256, i32 1, i1 false), !dbg !74
  br label %97, !dbg !75

; <label>:97                                      ; preds = %161, %155, %131, %121, %95
  %place.0 = phi i8 [ 0, %95 ], [ %133, %131 ], [ %157, %155 ], [ %157, %161 ], [ %place.1, %121 ]
  %multi_line_comment.0 = phi i32 [ 0, %95 ], [ %multi_line_comment.1, %131 ], [ %multi_line_comment.1, %155 ], [ %multi_line_comment.1, %161 ], [ %multi_line_comment.1, %121 ]
  %total_lines.0 = phi i32 [ 0, %95 ], [ %106, %131 ], [ %106, %155 ], [ %106, %161 ], [ %106, %121 ]
  %lines_of_code.0 = phi i32 [ 0, %95 ], [ %lines_of_code.1, %131 ], [ %lines_of_code.1, %155 ], [ %lines_of_code.1, %161 ], [ %lines_of_code.1, %121 ]
  %98 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !76
  %99 = call i8* @fgets(i8* %98, i32 256, %struct.__sFILE* %91), !dbg !76
  %100 = icmp ne i8* %99, null, !dbg !76
  br i1 %100, label %101, label %.critedge, !dbg !76

; <label>:101                                     ; preds = %97
  %102 = sext i8 %place.0 to i32, !dbg !76
  %103 = sext i8 %33 to i32, !dbg !76
  %104 = icmp sle i32 %102, %103, !dbg !76
  br i1 %104, label %105, label %.critedge

; <label>:105                                     ; preds = %101
  %106 = add nsw i32 %total_lines.0, 1, !dbg !77
  %107 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !79
  %108 = call i64 @strlen(i8* %107), !dbg !79
  %109 = sub i64 %108, 1, !dbg !79
  %110 = getelementptr inbounds [256 x i8]* %line, i32 0, i64 %109, !dbg !79
  %111 = load i8* %110, align 1, !dbg !79
  %112 = sext i8 %111 to i32, !dbg !79
  %113 = icmp eq i32 %112, 10, !dbg !79
  br i1 %113, label %114, label %119, !dbg !79

; <label>:114                                     ; preds = %105
  %115 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !80
  %116 = call i64 @strlen(i8* %115), !dbg !80
  %117 = sub i64 %116, 1, !dbg !80
  %118 = getelementptr inbounds [256 x i8]* %line, i32 0, i64 %117, !dbg !80
  store i8 0, i8* %118, align 1, !dbg !80
  br label %119, !dbg !80

; <label>:119                                     ; preds = %114, %105
  %120 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !81
  br label %121, !dbg !82

; <label>:121                                     ; preds = %176, %169, %148, %142, %119
  %place.1 = phi i8 [ 0, %119 ], [ %144, %142 ], [ %150, %148 ], [ %171, %169 ], [ %178, %176 ]
  %line_pointer.0 = phi i8* [ %120, %119 ], [ %143, %142 ], [ %149, %148 ], [ %170, %169 ], [ %177, %176 ]
  %line_already_counted.0 = phi i32 [ 0, %119 ], [ %line_already_counted.0, %142 ], [ %line_already_counted.0, %148 ], [ %line_already_counted.0, %169 ], [ %line_already_counted.1, %176 ]
  %multi_line_comment.1 = phi i32 [ %multi_line_comment.0, %119 ], [ %multi_line_comment.2, %142 ], [ %multi_line_comment.1, %148 ], [ 1, %169 ], [ %multi_line_comment.1, %176 ]
  %lines_of_code.1 = phi i32 [ %lines_of_code.0, %119 ], [ %lines_of_code.1, %142 ], [ %lines_of_code.1, %148 ], [ %lines_of_code.1, %169 ], [ %lines_of_code.2, %176 ]
  %122 = load i8* %line_pointer.0, align 1, !dbg !82
  %123 = sext i8 %122 to i32, !dbg !82
  %124 = icmp ne i32 %123, 0, !dbg !82
  br i1 %124, label %125, label %97, !dbg !82

; <label>:125                                     ; preds = %121
  %126 = icmp eq i32 %multi_line_comment.1, 1, !dbg !83
  %127 = load i8* %line_pointer.0, align 1, !dbg !85
  %128 = sext i8 %127 to i32, !dbg !85
  br i1 %126, label %129, label %145, !dbg !83

; <label>:129                                     ; preds = %125
  %130 = icmp eq i32 %128, 42, !dbg !85
  br i1 %130, label %131, label %142, !dbg !85

; <label>:131                                     ; preds = %129
  %132 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !87
  %133 = add i8 %place.1, 1, !dbg !89
  %134 = load i8* %132, align 1, !dbg !90
  %135 = sext i8 %134 to i32, !dbg !90
  %136 = icmp eq i32 %135, 0, !dbg !90
  br i1 %136, label %97, label %137, !dbg !90

; <label>:137                                     ; preds = %131
  %138 = load i8* %132, align 1, !dbg !91
  %139 = sext i8 %138 to i32, !dbg !91
  %140 = icmp eq i32 %139, 47, !dbg !91
  br i1 %140, label %141, label %142, !dbg !91

; <label>:141                                     ; preds = %137
  br label %142, !dbg !92

; <label>:142                                     ; preds = %141, %137, %129
  %place.2 = phi i8 [ %133, %141 ], [ %133, %137 ], [ %place.1, %129 ]
  %line_pointer.1 = phi i8* [ %132, %141 ], [ %132, %137 ], [ %line_pointer.0, %129 ]
  %multi_line_comment.2 = phi i32 [ 0, %141 ], [ %multi_line_comment.1, %137 ], [ %multi_line_comment.1, %129 ]
  %143 = getelementptr inbounds i8* %line_pointer.1, i32 1, !dbg !94
  %144 = add i8 %place.2, 1, !dbg !95
  br label %121, !dbg !96

; <label>:145                                     ; preds = %125
  %146 = call i32 @isspace(i32 %128), !dbg !97, !intrange !98
  %147 = icmp ne i32 %146, 0, !dbg !97
  br i1 %147, label %148, label %151, !dbg !97

; <label>:148                                     ; preds = %145
  %149 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !99
  %150 = add i8 %place.1, 1, !dbg !101
  br label %121, !dbg !102

; <label>:151                                     ; preds = %145
  %152 = load i8* %line_pointer.0, align 1, !dbg !103
  %153 = sext i8 %152 to i32, !dbg !103
  %154 = icmp eq i32 %153, 47, !dbg !103
  br i1 %154, label %155, label %172, !dbg !103

; <label>:155                                     ; preds = %151
  %156 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !104
  %157 = add i8 %place.1, 1, !dbg !106
  %158 = load i8* %156, align 1, !dbg !107
  %159 = sext i8 %158 to i32, !dbg !107
  %160 = icmp eq i32 %159, 0, !dbg !107
  br i1 %160, label %97, label %161, !dbg !107

; <label>:161                                     ; preds = %155
  %162 = load i8* %156, align 1, !dbg !108
  %163 = sext i8 %162 to i32, !dbg !108
  %164 = icmp eq i32 %163, 47, !dbg !108
  br i1 %164, label %97, label %165, !dbg !108

; <label>:165                                     ; preds = %161
  %166 = load i8* %156, align 1, !dbg !109
  %167 = sext i8 %166 to i32, !dbg !109
  %168 = icmp eq i32 %167, 42, !dbg !109
  br i1 %168, label %169, label %172, !dbg !109

; <label>:169                                     ; preds = %165
  %170 = getelementptr inbounds i8* %156, i32 1, !dbg !110
  %171 = add i8 %157, 1, !dbg !112
  br label %121, !dbg !113

; <label>:172                                     ; preds = %165, %151
  %place.3 = phi i8 [ %157, %165 ], [ %place.1, %151 ]
  %line_pointer.2 = phi i8* [ %156, %165 ], [ %line_pointer.0, %151 ]
  %173 = icmp eq i32 %line_already_counted.0, 0, !dbg !114
  br i1 %173, label %174, label %176, !dbg !114

; <label>:174                                     ; preds = %172
  %175 = add nsw i32 %lines_of_code.1, 1, !dbg !115
  br label %176, !dbg !117

; <label>:176                                     ; preds = %174, %172
  %line_already_counted.1 = phi i32 [ 1, %174 ], [ %line_already_counted.0, %172 ]
  %lines_of_code.2 = phi i32 [ %175, %174 ], [ %lines_of_code.1, %172 ]
  %177 = getelementptr inbounds i8* %line_pointer.2, i32 1, !dbg !118
  %178 = add i8 %place.3, 1, !dbg !119
  br label %121, !dbg !120

.critedge:                                        ; preds = %101, %97
  %179 = call i32 @fclose(%struct.__sFILE* %91), !dbg !121
  %180 = icmp ne i32 %179, 0, !dbg !121
  br i1 %180, label %181, label %183, !dbg !121

; <label>:181                                     ; preds = %.critedge
  %182 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str7, i32 0, i32 0)), !dbg !122
  br label %198, !dbg !124

; <label>:183                                     ; preds = %.critedge
  %184 = sext i8 %place.0 to i32, !dbg !125
  %185 = sext i8 %33 to i32, !dbg !125
  %186 = icmp sgt i32 %184, %185, !dbg !125
  br i1 %186, label %187, label %195, !dbg !125

; <label>:187                                     ; preds = %183
  %188 = sext i8 %33 to i32, !dbg !126
  %189 = sext i8 %place.0 to i32, !dbg !126
  %190 = sub nsw i32 %188, %189, !dbg !126
  %191 = icmp ugt i32 %190, 0, !dbg !128
  br i1 %191, label %192, label %193, !dbg !128

; <label>:192                                     ; preds = %192, %187
  br label %192, !dbg !129

; <label>:193                                     ; preds = %187
  %194 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str8, i32 0, i32 0), i32 %190), !dbg !131
  br label %197, !dbg !132

; <label>:195                                     ; preds = %183
  %196 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i32 %lines_of_code.0), !dbg !133
  br label %197

; <label>:197                                     ; preds = %195, %193
  br label %198, !dbg !135

; <label>:198                                     ; preds = %197, %181, %93, %86, %71, %63, %6
  %.0 = phi i32 [ 1, %6 ], [ 1, %93 ], [ 1, %181 ], [ 0, %197 ], [ 1, %63 ], [ 1, %71 ], [ 1, %86 ]
  call void @llvm.stackrestore(i8* %3), !dbg !136
  ret i32 %.0, !dbg !137
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memset_chk(i8*, i32, i64, i64) nounwind

define internal i8* @__inline_memset_chk(i8* %__dest, i32 %__val, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len2 = call i64 @kint_arg.i64(), !id !138, !intrange !139
  %__val1 = call i32 @kint_arg.i32(), !id !140, !intrange !141
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !142
  %2 = call i8* @__memset_chk(i8* %__dest, i32 %__val1, i64 %__len2, i64 %1) nounwind, !dbg !142
  ret i8* %2, !dbg !142
}

declare i8* @__strncpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_strncpy_chk(i8* noalias %__dest, i8* noalias %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !144, !intrange !145
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !146
  %2 = call i8* @__strncpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !146
  ret i8* %2, !dbg !146
}

declare i32 @atoi(i8*)

declare void @exit(i32) noreturn

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i64 @strlen(i8*)

define internal i32 @isspace(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !148
  %1 = call i32 @__istype(i32 %_c1, i64 16384), !dbg !149, !intrange !98
  ret i32 %1, !dbg !149
}

declare i32 @fclose(%struct.__sFILE*)

declare void @llvm.stackrestore(i8*) nounwind

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !151, !intrange !152
  %_c1 = call i32 @kint_arg.i32(), !id !153
  %1 = call i32 @isascii(i32 %_c1), !dbg !154, !intrange !98
  %2 = icmp ne i32 %1, 0, !dbg !154
  br i1 %2, label %3, label %10, !dbg !154

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !154
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !154
  %6 = load i32* %5, align 4, !dbg !154
  %7 = zext i32 %6 to i64, !dbg !154
  %8 = and i64 %7, %_f2, !dbg !154
  %9 = icmp ne i64 %8, 0, !dbg !154
  br label %13, !dbg !154

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c1, i64 %_f2), !dbg !156
  %12 = icmp ne i32 %11, 0, !dbg !156
  br label %13, !dbg !156

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !154
  %15 = xor i1 %14, true, !dbg !154
  %16 = zext i1 %15 to i32, !dbg !154
  ret i32 %16, !dbg !156
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !157
  %1 = and i32 %_c1, -128, !dbg !158
  %2 = icmp eq i32 %1, 0, !dbg !158
  %3 = zext i1 %2 to i32, !dbg !158
  ret i32 %3, !dbg !158
}

declare i32 @__maskrune(i32, i64)

declare i32 @kint_arg.i32()

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !17, metadata !22, metadata !23, metadata !33}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 49, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 50} ; [ DW_TAG_subprogram ] [line 49] [def] [scope 50] [main]
!6 = metadata !{i32 786473, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isspace", metadata !"isspace", metadata !"", metadata !14, i32 284, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isspace, null, null, metadata !1, i32 285} ; [ DW_TAG_subprogram ] [line 284] [local] [def] [scope 285] [isspace]
!14 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint", null} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !9, metadata !9}
!17 = metadata !{i32 786478, i32 0, metadata !14, metadata !"__istype", metadata !"__istype", metadata !"", metadata !14, i32 170, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !20, metadata !21}
!20 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !14, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!21 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!22 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isascii", metadata !"isascii", metadata !"", metadata !14, i32 152, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!23 = metadata !{i32 786478, i32 0, metadata !24, metadata !"__inline_strncpy_chk", metadata !"__inline_strncpy_chk", metadata !"", metadata !24, i32 128, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_strncpy_chk, null, null, metadata !1, i32 130} ; [ DW_TAG_subprogram ] [line 128] [local] [def] [scope 130] [__inline_strncpy_chk]
!24 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint", null} ; [ DW_TAG_file_type ]
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
!38 = metadata !{i32 55, i32 22, metadata !39, null}
!39 = metadata !{i32 786443, metadata !5, i32 50, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!40 = metadata !{i32 70, i32 2, metadata !39, null}
!41 = metadata !{i32 72, i32 3, metadata !42, null}
!42 = metadata !{i32 786443, metadata !39, i32 71, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!43 = metadata !{i32 73, i32 3, metadata !42, null}
!44 = metadata !{i32 77, i32 2, metadata !39, null}
!45 = metadata !{i32 78, i32 2, metadata !39, null}
!46 = metadata !{i32 79, i32 2, metadata !39, null}
!47 = metadata !{i32 82, i32 27, metadata !39, null}
!48 = metadata !{i32 85, i32 2, metadata !39, null}
!49 = metadata !{i32 87, i32 6, metadata !50, null}
!50 = metadata !{i32 786443, metadata !39, i32 86, i32 4, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!51 = metadata !{i32 88, i32 6, metadata !50, null}
!52 = metadata !{i32 92, i32 7, metadata !53, null}
!53 = metadata !{i32 786443, metadata !39, i32 92, i32 2, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!54 = metadata !{i32 94, i32 3, metadata !55, null}
!55 = metadata !{i32 786443, metadata !53, i32 93, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!56 = metadata !{i32 96, i32 3, metadata !55, null}
!57 = metadata !{i32 98, i32 5, metadata !58, null}
!58 = metadata !{i32 786443, metadata !55, i32 97, i32 4, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!59 = metadata !{i32 99, i32 5, metadata !58, null}
!60 = metadata !{i32 102, i32 3, metadata !55, null}
!61 = metadata !{i32 104, i32 4, metadata !62, null}
!62 = metadata !{i32 786443, metadata !55, i32 103, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!63 = metadata !{i32 105, i32 4, metadata !62, null}
!64 = metadata !{i32 108, i32 3, metadata !55, null}
!65 = metadata !{i32 110, i32 4, metadata !66, null}
!66 = metadata !{i32 786443, metadata !55, i32 109, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!67 = metadata !{i32 111, i32 4, metadata !66, null}
!68 = metadata !{i32 92, i32 17, metadata !53, null}
!69 = metadata !{i32 117, i32 7, metadata !39, null}
!70 = metadata !{i32 118, i32 2, metadata !39, null}
!71 = metadata !{i32 120, i32 3, metadata !72, null}
!72 = metadata !{i32 786443, metadata !39, i32 119, i32 2, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!73 = metadata !{i32 121, i32 3, metadata !72, null}
!74 = metadata !{i32 134, i32 2, metadata !39, null}
!75 = metadata !{i32 136, i32 2, metadata !39, null}
!76 = metadata !{i32 136, i32 11, metadata !39, null}
!77 = metadata !{i32 138, i32 3, metadata !78, null}
!78 = metadata !{i32 786443, metadata !39, i32 137, i32 2, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!79 = metadata !{i32 148, i32 12, metadata !78, null}
!80 = metadata !{i32 148, i32 42, metadata !78, null}
!81 = metadata !{i32 152, i32 3, metadata !78, null}
!82 = metadata !{i32 157, i32 3, metadata !78, null}
!83 = metadata !{i32 162, i32 4, metadata !84, null}
!84 = metadata !{i32 786443, metadata !78, i32 158, i32 3, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!85 = metadata !{i32 164, i32 5, metadata !86, null}
!86 = metadata !{i32 786443, metadata !84, i32 163, i32 4, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!87 = metadata !{i32 170, i32 6, metadata !88, null}
!88 = metadata !{i32 786443, metadata !86, i32 165, i32 5, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!89 = metadata !{i32 171, i32 6, metadata !88, null}
!90 = metadata !{i32 172, i32 6, metadata !88, null}
!91 = metadata !{i32 174, i32 6, metadata !88, null}
!92 = metadata !{i32 181, i32 6, metadata !93, null}
!93 = metadata !{i32 786443, metadata !88, i32 175, i32 6, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!94 = metadata !{i32 184, i32 5, metadata !86, null}
!95 = metadata !{i32 185, i32 5, metadata !86, null}
!96 = metadata !{i32 186, i32 5, metadata !86, null}
!97 = metadata !{i32 192, i32 8, metadata !84, null}
!98 = metadata !{i32 0, i32 2}
!99 = metadata !{i32 194, i32 5, metadata !100, null}
!100 = metadata !{i32 786443, metadata !84, i32 193, i32 4, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!101 = metadata !{i32 195, i32 5, metadata !100, null}
!102 = metadata !{i32 196, i32 5, metadata !100, null}
!103 = metadata !{i32 204, i32 4, metadata !84, null}
!104 = metadata !{i32 210, i32 5, metadata !105, null}
!105 = metadata !{i32 786443, metadata !84, i32 205, i32 4, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!106 = metadata !{i32 211, i32 5, metadata !105, null}
!107 = metadata !{i32 212, i32 5, metadata !105, null}
!108 = metadata !{i32 217, i32 5, metadata !105, null}
!109 = metadata !{i32 226, i32 5, metadata !105, null}
!110 = metadata !{i32 229, i32 6, metadata !111, null}
!111 = metadata !{i32 786443, metadata !105, i32 227, i32 5, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!112 = metadata !{i32 230, i32 6, metadata !111, null}
!113 = metadata !{i32 231, i32 6, metadata !111, null}
!114 = metadata !{i32 242, i32 4, metadata !84, null}
!115 = metadata !{i32 245, i32 5, metadata !116, null}
!116 = metadata !{i32 786443, metadata !84, i32 243, i32 4, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!117 = metadata !{i32 247, i32 4, metadata !116, null}
!118 = metadata !{i32 252, i32 4, metadata !84, null}
!119 = metadata !{i32 253, i32 4, metadata !84, null}
!120 = metadata !{i32 254, i32 3, metadata !84, null}
!121 = metadata !{i32 259, i32 7, metadata !39, null}
!122 = metadata !{i32 261, i32 3, metadata !123, null}
!123 = metadata !{i32 786443, metadata !39, i32 260, i32 3, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!124 = metadata !{i32 262, i32 3, metadata !123, null}
!125 = metadata !{i32 265, i32 3, metadata !39, null}
!126 = metadata !{i32 267, i32 7, metadata !127, null}
!127 = metadata !{i32 786443, metadata !39, i32 266, i32 5, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!128 = metadata !{i32 269, i32 7, metadata !127, null}
!129 = metadata !{i32 271, i32 4, metadata !130, null}
!130 = metadata !{i32 786443, metadata !127, i32 270, i32 9, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!131 = metadata !{i32 273, i32 7, metadata !127, null}
!132 = metadata !{i32 274, i32 5, metadata !127, null}
!133 = metadata !{i32 277, i32 7, metadata !134, null}
!134 = metadata !{i32 786443, metadata !39, i32 276, i32 5, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint/countlines.c]
!135 = metadata !{i32 280, i32 3, metadata !39, null}
!136 = metadata !{i32 281, i32 1, metadata !39, null}
!137 = metadata !{i32 281, i32 1, metadata !5, null}
!138 = metadata !{metadata !"arg._kint.__inline_memset_chk.2"}
!139 = metadata !{i64 256, i64 257}
!140 = metadata !{metadata !"arg._kint.__inline_memset_chk.1"}
!141 = metadata !{i32 0, i32 1}
!142 = metadata !{i32 83, i32 56, metadata !143, null}
!143 = metadata !{i32 786443, metadata !33, i32 82, i32 1, metadata !24, i32 26} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint//usr/include/secure/_string.h]
!144 = metadata !{metadata !"arg._kint.__inline_strncpy_chk.2"}
!145 = metadata !{i64 255, i64 256}
!146 = metadata !{i32 131, i32 57, metadata !147, null}
!147 = metadata !{i32 786443, metadata !23, i32 130, i32 1, metadata !24, i32 25} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint//usr/include/secure/_string.h]
!148 = metadata !{metadata !"arg._kint.isspace.0"}
!149 = metadata !{i32 286, i32 10, metadata !150, null}
!150 = metadata !{i32 786443, metadata !13, i32 285, i32 1, metadata !14, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint//usr/include/ctype.h]
!151 = metadata !{metadata !"arg._kint.__istype.1"}
!152 = metadata !{i64 16384, i64 16385}
!153 = metadata !{metadata !"arg._kint.__istype.0"}
!154 = metadata !{i32 175, i32 10, metadata !155, null}
!155 = metadata !{i32 786443, metadata !17, i32 171, i32 1, metadata !14, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint//usr/include/ctype.h]
!156 = metadata !{i32 176, i32 7, metadata !155, null}
!157 = metadata !{metadata !"arg._kint.isascii.0"}
!158 = metadata !{i32 154, i32 2, metadata !159, null}
!159 = metadata !{i32 786443, metadata !22, i32 153, i32 1, metadata !14, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v526/src/kint//usr/include/ctype.h]
