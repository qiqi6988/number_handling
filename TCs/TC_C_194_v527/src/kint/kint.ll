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

@.str = private unnamed_addr constant [12 x i8] c"116-53-6526\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"benign_junk\00", align 1
@.str2 = private unnamed_addr constant [30 x i8] c"error allocating config_data\0A\00", align 1
@.str3 = private unnamed_addr constant [38 x i8] c"\0AERROR: Usage: countlines <filename>\0A\00", align 1
@.str4 = private unnamed_addr constant [58 x i8] c"Error: max_line_length is %d, but must be >=1 and <= 120\0A\00", align 1
@.str5 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a slash character.\0A\00", align 1
@.str6 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a colon character.\0A\00", align 1
@.str7 = private unnamed_addr constant [70 x i8] c"\0AERROR: Filename must not contain a double dot (e.g. '..') sequence.\0A\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str9 = private unnamed_addr constant [27 x i8] c"\0AERROR: Cannot open file.\0A\00", align 1
@.str10 = private unnamed_addr constant [27 x i8] c"\0AERROR: File close error.\0A\00", align 1
@.str11 = private unnamed_addr constant [7 x i8] c"%s %d\0A\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !37
  %line = alloca [256 x i8], align 16
  %1 = mul nsw i32 16, 16, !dbg !38
  %2 = zext i32 %1 to i64, !dbg !38
  %3 = call i8* @llvm.stacksave(), !dbg !38
  %4 = alloca i8, i64 %2, align 16, !dbg !38
  %5 = call i8* @malloc(i64 16), !dbg !40
  %6 = bitcast i8* %5 to i8**, !dbg !40
  %7 = icmp eq i8** %6, null, !dbg !41
  br i1 %7, label %8, label %10, !dbg !41

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str2, i32 0, i32 0)), !dbg !42
  call void @exit(i32 1) noreturn, !dbg !44
  unreachable, !dbg !44

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds i8** %6, i64 0, !dbg !45
  store i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8** %11, align 8, !dbg !45
  %12 = getelementptr inbounds i8** %6, i64 1, !dbg !46
  store i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i8** %12, align 8, !dbg !46
  %13 = icmp ne i32 %argc1, 3, !dbg !47
  br i1 %13, label %14, label %16, !dbg !47

; <label>:14                                      ; preds = %10
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str3, i32 0, i32 0)), !dbg !48
  br label %206, !dbg !50

; <label>:16                                      ; preds = %10
  %17 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !51
  %18 = icmp ne i64 %17, -1, !dbg !51
  br i1 %18, label %19, label %22, !dbg !51

; <label>:19                                      ; preds = %16
  %20 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !51
  %21 = call i8* @__memset_chk(i8* %4, i32 0, i64 256, i64 %20) nounwind, !dbg !51
  br label %24, !dbg !51

; <label>:22                                      ; preds = %16
  %23 = call i8* @__inline_memset_chk(i8* %4, i32 0, i64 256), !dbg !51
  br label %24, !dbg !51

; <label>:24                                      ; preds = %22, %19
  %25 = phi i8* [ %21, %19 ], [ %23, %22 ], !dbg !51
  %26 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !52
  %27 = icmp ne i64 %26, -1, !dbg !52
  %28 = getelementptr inbounds i8** %argv, i64 1, !dbg !52
  %29 = load i8** %28, align 8, !dbg !52
  br i1 %27, label %30, label %33, !dbg !52

; <label>:30                                      ; preds = %24
  %31 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !52
  %32 = call i8* @__strncpy_chk(i8* %4, i8* %29, i64 255, i64 %31) nounwind, !dbg !52
  br label %35, !dbg !52

; <label>:33                                      ; preds = %24
  %34 = call i8* @__inline_strncpy_chk(i8* %4, i8* %29, i64 255), !dbg !52
  br label %35, !dbg !52

; <label>:35                                      ; preds = %33, %30
  %36 = phi i8* [ %32, %30 ], [ %34, %33 ], !dbg !52
  %37 = getelementptr inbounds i8* %4, i64 255, !dbg !53
  store i8 0, i8* %37, align 1, !dbg !53
  %38 = getelementptr inbounds i8** %argv, i64 2, !dbg !54
  %39 = load i8** %38, align 8, !dbg !54
  %40 = call i32 @atoi(i8* %39), !dbg !54
  %41 = trunc i32 %40 to i8, !dbg !54
  %42 = sext i8 %41 to i32, !dbg !55
  %43 = icmp slt i32 %42, 1, !dbg !55
  br i1 %43, label %47, label %44, !dbg !55

; <label>:44                                      ; preds = %35
  %45 = sext i8 %41 to i32, !dbg !55
  %46 = icmp sgt i32 %45, 120, !dbg !55
  br i1 %46, label %47, label %50, !dbg !55

; <label>:47                                      ; preds = %44, %35
  %48 = sext i8 %41 to i32, !dbg !56
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str4, i32 0, i32 0), i32 %48), !dbg !56
  call void @exit(i32 1) noreturn, !dbg !58
  unreachable, !dbg !58

; <label>:50                                      ; preds = %44
  br label %51, !dbg !59

; <label>:51                                      ; preds = %96, %50
  %i.0 = phi i32 [ 0, %50 ], [ %97, %96 ]
  %52 = icmp slt i32 %i.0, 255, !dbg !59
  br i1 %52, label %53, label %98, !dbg !59

; <label>:53                                      ; preds = %51
  %54 = sext i32 %i.0 to i64, !dbg !61
  %55 = getelementptr inbounds i8* %4, i64 %54, !dbg !61
  %56 = load i8* %55, align 1, !dbg !61
  %57 = sext i8 %56 to i32, !dbg !61
  %58 = icmp eq i32 %57, 0, !dbg !61
  br i1 %58, label %98, label %59, !dbg !61

; <label>:59                                      ; preds = %53
  %60 = sext i32 %i.0 to i64, !dbg !63
  %61 = getelementptr inbounds i8* %4, i64 %60, !dbg !63
  %62 = load i8* %61, align 1, !dbg !63
  %63 = sext i8 %62 to i32, !dbg !63
  %64 = icmp eq i32 %63, 92, !dbg !63
  br i1 %64, label %71, label %65, !dbg !63

; <label>:65                                      ; preds = %59
  %66 = sext i32 %i.0 to i64, !dbg !63
  %67 = getelementptr inbounds i8* %4, i64 %66, !dbg !63
  %68 = load i8* %67, align 1, !dbg !63
  %69 = sext i8 %68 to i32, !dbg !63
  %70 = icmp eq i32 %69, 47, !dbg !63
  br i1 %70, label %71, label %73, !dbg !63

; <label>:71                                      ; preds = %65, %59
  %72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str5, i32 0, i32 0)), !dbg !64
  br label %206, !dbg !66

; <label>:73                                      ; preds = %65
  %74 = sext i32 %i.0 to i64, !dbg !67
  %75 = getelementptr inbounds i8* %4, i64 %74, !dbg !67
  %76 = load i8* %75, align 1, !dbg !67
  %77 = sext i8 %76 to i32, !dbg !67
  %78 = icmp eq i32 %77, 58, !dbg !67
  br i1 %78, label %79, label %81, !dbg !67

; <label>:79                                      ; preds = %73
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str6, i32 0, i32 0)), !dbg !68
  br label %206, !dbg !70

; <label>:81                                      ; preds = %73
  %82 = sext i32 %i.0 to i64, !dbg !71
  %83 = getelementptr inbounds i8* %4, i64 %82, !dbg !71
  %84 = load i8* %83, align 1, !dbg !71
  %85 = sext i8 %84 to i32, !dbg !71
  %86 = icmp eq i32 %85, 46, !dbg !71
  br i1 %86, label %87, label %96, !dbg !71

; <label>:87                                      ; preds = %81
  %88 = add nsw i32 %i.0, 1, !dbg !71
  %89 = sext i32 %88 to i64, !dbg !71
  %90 = getelementptr inbounds i8* %4, i64 %89, !dbg !71
  %91 = load i8* %90, align 1, !dbg !71
  %92 = sext i8 %91 to i32, !dbg !71
  %93 = icmp eq i32 %92, 46, !dbg !71
  br i1 %93, label %94, label %96, !dbg !71

; <label>:94                                      ; preds = %87
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([70 x i8]* @.str7, i32 0, i32 0)), !dbg !72
  br label %206, !dbg !74

; <label>:96                                      ; preds = %87, %81
  %97 = add nsw i32 %i.0, 1, !dbg !75
  br label %51, !dbg !75

; <label>:98                                      ; preds = %53, %51
  %99 = call %struct.__sFILE* @"\01_fopen"(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0)), !dbg !76
  %100 = icmp eq %struct.__sFILE* %99, null, !dbg !77
  br i1 %100, label %101, label %103, !dbg !77

; <label>:101                                     ; preds = %98
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str9, i32 0, i32 0)), !dbg !78
  br label %206, !dbg !80

; <label>:103                                     ; preds = %98
  %104 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* %104, i8 0, i64 256, i32 1, i1 false), !dbg !81
  br label %105, !dbg !82

; <label>:105                                     ; preds = %169, %163, %139, %129, %103
  %place.0 = phi i8 [ 0, %103 ], [ %141, %139 ], [ %165, %163 ], [ %165, %169 ], [ %place.1, %129 ]
  %multi_line_comment.0 = phi i32 [ 0, %103 ], [ %multi_line_comment.1, %139 ], [ %multi_line_comment.1, %163 ], [ %multi_line_comment.1, %169 ], [ %multi_line_comment.1, %129 ]
  %total_lines.0 = phi i32 [ 0, %103 ], [ %114, %139 ], [ %114, %163 ], [ %114, %169 ], [ %114, %129 ]
  %lines_of_code.0 = phi i32 [ 0, %103 ], [ %lines_of_code.1, %139 ], [ %lines_of_code.1, %163 ], [ %lines_of_code.1, %169 ], [ %lines_of_code.1, %129 ]
  %106 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !83
  %107 = call i8* @fgets(i8* %106, i32 256, %struct.__sFILE* %99), !dbg !83
  %108 = icmp ne i8* %107, null, !dbg !83
  br i1 %108, label %109, label %.critedge, !dbg !83

; <label>:109                                     ; preds = %105
  %110 = sext i8 %place.0 to i32, !dbg !83
  %111 = sext i8 %41 to i32, !dbg !83
  %112 = icmp sle i32 %110, %111, !dbg !83
  br i1 %112, label %113, label %.critedge

; <label>:113                                     ; preds = %109
  %114 = add nsw i32 %total_lines.0, 1, !dbg !84
  %115 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !86
  %116 = call i64 @strlen(i8* %115), !dbg !86
  %117 = sub i64 %116, 1, !dbg !86
  %118 = getelementptr inbounds [256 x i8]* %line, i32 0, i64 %117, !dbg !86
  %119 = load i8* %118, align 1, !dbg !86
  %120 = sext i8 %119 to i32, !dbg !86
  %121 = icmp eq i32 %120, 10, !dbg !86
  br i1 %121, label %122, label %127, !dbg !86

; <label>:122                                     ; preds = %113
  %123 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !87
  %124 = call i64 @strlen(i8* %123), !dbg !87
  %125 = sub i64 %124, 1, !dbg !87
  %126 = getelementptr inbounds [256 x i8]* %line, i32 0, i64 %125, !dbg !87
  store i8 0, i8* %126, align 1, !dbg !87
  br label %127, !dbg !87

; <label>:127                                     ; preds = %122, %113
  %128 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !88
  br label %129, !dbg !89

; <label>:129                                     ; preds = %184, %177, %156, %150, %127
  %line_already_counted.0 = phi i32 [ 0, %127 ], [ %line_already_counted.0, %150 ], [ %line_already_counted.0, %156 ], [ %line_already_counted.0, %177 ], [ %line_already_counted.1, %184 ]
  %place.1 = phi i8 [ 0, %127 ], [ %152, %150 ], [ %158, %156 ], [ %179, %177 ], [ %186, %184 ]
  %line_pointer.0 = phi i8* [ %128, %127 ], [ %151, %150 ], [ %157, %156 ], [ %178, %177 ], [ %185, %184 ]
  %multi_line_comment.1 = phi i32 [ %multi_line_comment.0, %127 ], [ %multi_line_comment.2, %150 ], [ %multi_line_comment.1, %156 ], [ 1, %177 ], [ %multi_line_comment.1, %184 ]
  %lines_of_code.1 = phi i32 [ %lines_of_code.0, %127 ], [ %lines_of_code.1, %150 ], [ %lines_of_code.1, %156 ], [ %lines_of_code.1, %177 ], [ %lines_of_code.2, %184 ]
  %130 = load i8* %line_pointer.0, align 1, !dbg !89
  %131 = sext i8 %130 to i32, !dbg !89
  %132 = icmp ne i32 %131, 0, !dbg !89
  br i1 %132, label %133, label %105, !dbg !89

; <label>:133                                     ; preds = %129
  %134 = icmp eq i32 %multi_line_comment.1, 1, !dbg !90
  %135 = load i8* %line_pointer.0, align 1, !dbg !92
  %136 = sext i8 %135 to i32, !dbg !92
  br i1 %134, label %137, label %153, !dbg !90

; <label>:137                                     ; preds = %133
  %138 = icmp eq i32 %136, 42, !dbg !92
  br i1 %138, label %139, label %150, !dbg !92

; <label>:139                                     ; preds = %137
  %140 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !94
  %141 = add i8 %place.1, 1, !dbg !96
  %142 = load i8* %140, align 1, !dbg !97
  %143 = sext i8 %142 to i32, !dbg !97
  %144 = icmp eq i32 %143, 0, !dbg !97
  br i1 %144, label %105, label %145, !dbg !97

; <label>:145                                     ; preds = %139
  %146 = load i8* %140, align 1, !dbg !98
  %147 = sext i8 %146 to i32, !dbg !98
  %148 = icmp eq i32 %147, 47, !dbg !98
  br i1 %148, label %149, label %150, !dbg !98

; <label>:149                                     ; preds = %145
  br label %150, !dbg !99

; <label>:150                                     ; preds = %149, %145, %137
  %place.2 = phi i8 [ %141, %149 ], [ %141, %145 ], [ %place.1, %137 ]
  %line_pointer.1 = phi i8* [ %140, %149 ], [ %140, %145 ], [ %line_pointer.0, %137 ]
  %multi_line_comment.2 = phi i32 [ 0, %149 ], [ %multi_line_comment.1, %145 ], [ %multi_line_comment.1, %137 ]
  %151 = getelementptr inbounds i8* %line_pointer.1, i32 1, !dbg !101
  %152 = add i8 %place.2, 1, !dbg !102
  br label %129, !dbg !103

; <label>:153                                     ; preds = %133
  %154 = call i32 @isspace(i32 %136), !dbg !104, !intrange !105
  %155 = icmp ne i32 %154, 0, !dbg !104
  br i1 %155, label %156, label %159, !dbg !104

; <label>:156                                     ; preds = %153
  %157 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !106
  %158 = add i8 %place.1, 1, !dbg !108
  br label %129, !dbg !109

; <label>:159                                     ; preds = %153
  %160 = load i8* %line_pointer.0, align 1, !dbg !110
  %161 = sext i8 %160 to i32, !dbg !110
  %162 = icmp eq i32 %161, 47, !dbg !110
  br i1 %162, label %163, label %180, !dbg !110

; <label>:163                                     ; preds = %159
  %164 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !111
  %165 = add i8 %place.1, 1, !dbg !113
  %166 = load i8* %164, align 1, !dbg !114
  %167 = sext i8 %166 to i32, !dbg !114
  %168 = icmp eq i32 %167, 0, !dbg !114
  br i1 %168, label %105, label %169, !dbg !114

; <label>:169                                     ; preds = %163
  %170 = load i8* %164, align 1, !dbg !115
  %171 = sext i8 %170 to i32, !dbg !115
  %172 = icmp eq i32 %171, 47, !dbg !115
  br i1 %172, label %105, label %173, !dbg !115

; <label>:173                                     ; preds = %169
  %174 = load i8* %164, align 1, !dbg !116
  %175 = sext i8 %174 to i32, !dbg !116
  %176 = icmp eq i32 %175, 42, !dbg !116
  br i1 %176, label %177, label %180, !dbg !116

; <label>:177                                     ; preds = %173
  %178 = getelementptr inbounds i8* %164, i32 1, !dbg !117
  %179 = add i8 %165, 1, !dbg !119
  br label %129, !dbg !120

; <label>:180                                     ; preds = %173, %159
  %place.3 = phi i8 [ %165, %173 ], [ %place.1, %159 ]
  %line_pointer.2 = phi i8* [ %164, %173 ], [ %line_pointer.0, %159 ]
  %181 = icmp eq i32 %line_already_counted.0, 0, !dbg !121
  br i1 %181, label %182, label %184, !dbg !121

; <label>:182                                     ; preds = %180
  %183 = add nsw i32 %lines_of_code.1, 1, !dbg !122
  br label %184, !dbg !124

; <label>:184                                     ; preds = %182, %180
  %line_already_counted.1 = phi i32 [ 1, %182 ], [ %line_already_counted.0, %180 ]
  %lines_of_code.2 = phi i32 [ %183, %182 ], [ %lines_of_code.1, %180 ]
  %185 = getelementptr inbounds i8* %line_pointer.2, i32 1, !dbg !125
  %186 = add i8 %place.3, 1, !dbg !126
  br label %129, !dbg !127

.critedge:                                        ; preds = %109, %105
  %187 = call i32 @fclose(%struct.__sFILE* %99), !dbg !128
  %188 = icmp ne i32 %187, 0, !dbg !128
  br i1 %188, label %189, label %191, !dbg !128

; <label>:189                                     ; preds = %.critedge
  %190 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str10, i32 0, i32 0)), !dbg !129
  br label %206, !dbg !131

; <label>:191                                     ; preds = %.critedge
  %192 = sext i8 %place.0 to i32, !dbg !132
  %193 = sext i8 %41 to i32, !dbg !132
  %194 = icmp sgt i32 %192, %193, !dbg !132
  br i1 %194, label %195, label %201, !dbg !132

; <label>:195                                     ; preds = %191
  %196 = sext i8 %41 to i32, !dbg !133
  %197 = sext i8 %place.0 to i32, !dbg !133
  %198 = sub nsw i32 %196, %197, !dbg !133
  %199 = icmp ugt i32 %198, 0, !dbg !135
  br i1 %199, label %200, label %201, !dbg !135

; <label>:200                                     ; preds = %195
  br label %201, !dbg !136

; <label>:201                                     ; preds = %200, %195, %191
  %output_data_index.0 = phi i32 [ 0, %200 ], [ 1, %195 ], [ 1, %191 ]
  %202 = sext i32 %output_data_index.0 to i64, !dbg !138
  %203 = getelementptr inbounds i8** %6, i64 %202, !dbg !138
  %204 = load i8** %203, align 8, !dbg !138
  %205 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0), i8* %204, i32 %lines_of_code.0), !dbg !138
  br label %206, !dbg !139

; <label>:206                                     ; preds = %201, %189, %101, %94, %79, %71, %14
  %.0 = phi i32 [ 1, %14 ], [ 1, %101 ], [ 1, %189 ], [ 0, %201 ], [ 1, %71 ], [ 1, %79 ], [ 1, %94 ]
  call void @llvm.stackrestore(i8* %3), !dbg !140
  ret i32 %.0, !dbg !141
}

declare i8* @llvm.stacksave() nounwind

declare i8* @malloc(i64)

declare i32 @printf(i8*, ...)

declare void @exit(i32) noreturn

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

declare i32 @atoi(i8*)

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i64 @strlen(i8*)

define internal i32 @isspace(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !152
  %1 = call i32 @__istype(i32 %_c1, i64 16384), !dbg !153, !intrange !105
  ret i32 %1, !dbg !153
}

declare i32 @fclose(%struct.__sFILE*)

declare void @llvm.stackrestore(i8*) nounwind

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !155, !intrange !156
  %_c1 = call i32 @kint_arg.i32(), !id !157
  %1 = call i32 @isascii(i32 %_c1), !dbg !158, !intrange !105
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

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !17, metadata !22, metadata !23, metadata !33}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 33, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 34} ; [ DW_TAG_subprogram ] [line 33] [def] [scope 34] [main]
!6 = metadata !{i32 786473, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isspace", metadata !"isspace", metadata !"", metadata !14, i32 284, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isspace, null, null, metadata !1, i32 285} ; [ DW_TAG_subprogram ] [line 284] [local] [def] [scope 285] [isspace]
!14 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint", null} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !9, metadata !9}
!17 = metadata !{i32 786478, i32 0, metadata !14, metadata !"__istype", metadata !"__istype", metadata !"", metadata !14, i32 170, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !20, metadata !21}
!20 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !14, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!21 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!22 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isascii", metadata !"isascii", metadata !"", metadata !14, i32 152, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!23 = metadata !{i32 786478, i32 0, metadata !24, metadata !"__inline_strncpy_chk", metadata !"__inline_strncpy_chk", metadata !"", metadata !24, i32 128, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_strncpy_chk, null, null, metadata !1, i32 130} ; [ DW_TAG_subprogram ] [line 128] [local] [def] [scope 130] [__inline_strncpy_chk]
!24 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint", null} ; [ DW_TAG_file_type ]
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
!38 = metadata !{i32 39, i32 22, metadata !39, null}
!39 = metadata !{i32 786443, metadata !5, i32 34, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!40 = metadata !{i32 60, i32 25, metadata !39, null}
!41 = metadata !{i32 61, i32 2, metadata !39, null}
!42 = metadata !{i32 63, i32 6, metadata !43, null}
!43 = metadata !{i32 786443, metadata !39, i32 62, i32 4, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!44 = metadata !{i32 64, i32 6, metadata !43, null}
!45 = metadata !{i32 66, i32 2, metadata !39, null}
!46 = metadata !{i32 67, i32 2, metadata !39, null}
!47 = metadata !{i32 76, i32 2, metadata !39, null}
!48 = metadata !{i32 78, i32 3, metadata !49, null}
!49 = metadata !{i32 786443, metadata !39, i32 77, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!50 = metadata !{i32 79, i32 3, metadata !49, null}
!51 = metadata !{i32 83, i32 2, metadata !39, null}
!52 = metadata !{i32 84, i32 2, metadata !39, null}
!53 = metadata !{i32 85, i32 2, metadata !39, null}
!54 = metadata !{i32 88, i32 27, metadata !39, null}
!55 = metadata !{i32 91, i32 2, metadata !39, null}
!56 = metadata !{i32 93, i32 6, metadata !57, null}
!57 = metadata !{i32 786443, metadata !39, i32 92, i32 4, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!58 = metadata !{i32 94, i32 6, metadata !57, null}
!59 = metadata !{i32 98, i32 7, metadata !60, null}
!60 = metadata !{i32 786443, metadata !39, i32 98, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!61 = metadata !{i32 100, i32 3, metadata !62, null}
!62 = metadata !{i32 786443, metadata !60, i32 99, i32 2, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!63 = metadata !{i32 102, i32 3, metadata !62, null}
!64 = metadata !{i32 104, i32 5, metadata !65, null}
!65 = metadata !{i32 786443, metadata !62, i32 103, i32 4, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!66 = metadata !{i32 105, i32 5, metadata !65, null}
!67 = metadata !{i32 108, i32 3, metadata !62, null}
!68 = metadata !{i32 110, i32 4, metadata !69, null}
!69 = metadata !{i32 786443, metadata !62, i32 109, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!70 = metadata !{i32 111, i32 4, metadata !69, null}
!71 = metadata !{i32 114, i32 3, metadata !62, null}
!72 = metadata !{i32 116, i32 4, metadata !73, null}
!73 = metadata !{i32 786443, metadata !62, i32 115, i32 3, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!74 = metadata !{i32 117, i32 4, metadata !73, null}
!75 = metadata !{i32 98, i32 17, metadata !60, null}
!76 = metadata !{i32 123, i32 7, metadata !39, null}
!77 = metadata !{i32 124, i32 2, metadata !39, null}
!78 = metadata !{i32 126, i32 3, metadata !79, null}
!79 = metadata !{i32 786443, metadata !39, i32 125, i32 2, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!80 = metadata !{i32 127, i32 3, metadata !79, null}
!81 = metadata !{i32 140, i32 2, metadata !39, null}
!82 = metadata !{i32 142, i32 2, metadata !39, null}
!83 = metadata !{i32 142, i32 11, metadata !39, null}
!84 = metadata !{i32 144, i32 3, metadata !85, null}
!85 = metadata !{i32 786443, metadata !39, i32 143, i32 2, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!86 = metadata !{i32 154, i32 12, metadata !85, null}
!87 = metadata !{i32 154, i32 42, metadata !85, null}
!88 = metadata !{i32 158, i32 3, metadata !85, null}
!89 = metadata !{i32 163, i32 3, metadata !85, null}
!90 = metadata !{i32 168, i32 4, metadata !91, null}
!91 = metadata !{i32 786443, metadata !85, i32 164, i32 3, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!92 = metadata !{i32 170, i32 5, metadata !93, null}
!93 = metadata !{i32 786443, metadata !91, i32 169, i32 4, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!94 = metadata !{i32 176, i32 6, metadata !95, null}
!95 = metadata !{i32 786443, metadata !93, i32 171, i32 5, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!96 = metadata !{i32 177, i32 6, metadata !95, null}
!97 = metadata !{i32 178, i32 6, metadata !95, null}
!98 = metadata !{i32 180, i32 6, metadata !95, null}
!99 = metadata !{i32 187, i32 6, metadata !100, null}
!100 = metadata !{i32 786443, metadata !95, i32 181, i32 6, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!101 = metadata !{i32 190, i32 5, metadata !93, null}
!102 = metadata !{i32 191, i32 5, metadata !93, null}
!103 = metadata !{i32 192, i32 5, metadata !93, null}
!104 = metadata !{i32 198, i32 8, metadata !91, null}
!105 = metadata !{i32 0, i32 2}
!106 = metadata !{i32 200, i32 5, metadata !107, null}
!107 = metadata !{i32 786443, metadata !91, i32 199, i32 4, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!108 = metadata !{i32 201, i32 5, metadata !107, null}
!109 = metadata !{i32 202, i32 5, metadata !107, null}
!110 = metadata !{i32 210, i32 4, metadata !91, null}
!111 = metadata !{i32 216, i32 5, metadata !112, null}
!112 = metadata !{i32 786443, metadata !91, i32 211, i32 4, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!113 = metadata !{i32 217, i32 5, metadata !112, null}
!114 = metadata !{i32 218, i32 5, metadata !112, null}
!115 = metadata !{i32 223, i32 5, metadata !112, null}
!116 = metadata !{i32 232, i32 5, metadata !112, null}
!117 = metadata !{i32 235, i32 6, metadata !118, null}
!118 = metadata !{i32 786443, metadata !112, i32 233, i32 5, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!119 = metadata !{i32 236, i32 6, metadata !118, null}
!120 = metadata !{i32 237, i32 6, metadata !118, null}
!121 = metadata !{i32 248, i32 4, metadata !91, null}
!122 = metadata !{i32 251, i32 5, metadata !123, null}
!123 = metadata !{i32 786443, metadata !91, i32 249, i32 4, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!124 = metadata !{i32 253, i32 4, metadata !123, null}
!125 = metadata !{i32 258, i32 4, metadata !91, null}
!126 = metadata !{i32 259, i32 4, metadata !91, null}
!127 = metadata !{i32 260, i32 3, metadata !91, null}
!128 = metadata !{i32 265, i32 7, metadata !39, null}
!129 = metadata !{i32 267, i32 3, metadata !130, null}
!130 = metadata !{i32 786443, metadata !39, i32 266, i32 3, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!131 = metadata !{i32 268, i32 3, metadata !130, null}
!132 = metadata !{i32 271, i32 3, metadata !39, null}
!133 = metadata !{i32 273, i32 7, metadata !134, null}
!134 = metadata !{i32 786443, metadata !39, i32 272, i32 5, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!135 = metadata !{i32 275, i32 7, metadata !134, null}
!136 = metadata !{i32 278, i32 9, metadata !137, null}
!137 = metadata !{i32 786443, metadata !134, i32 276, i32 9, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint/countlines.c]
!138 = metadata !{i32 287, i32 3, metadata !39, null}
!139 = metadata !{i32 289, i32 3, metadata !39, null}
!140 = metadata !{i32 290, i32 1, metadata !39, null}
!141 = metadata !{i32 290, i32 1, metadata !5, null}
!142 = metadata !{metadata !"arg._kint.__inline_memset_chk.2"}
!143 = metadata !{i64 256, i64 257}
!144 = metadata !{metadata !"arg._kint.__inline_memset_chk.1"}
!145 = metadata !{i32 0, i32 1}
!146 = metadata !{i32 83, i32 56, metadata !147, null}
!147 = metadata !{i32 786443, metadata !33, i32 82, i32 1, metadata !24, i32 26} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint//usr/include/secure/_string.h]
!148 = metadata !{metadata !"arg._kint.__inline_strncpy_chk.2"}
!149 = metadata !{i64 255, i64 256}
!150 = metadata !{i32 131, i32 57, metadata !151, null}
!151 = metadata !{i32 786443, metadata !23, i32 130, i32 1, metadata !24, i32 25} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint//usr/include/secure/_string.h]
!152 = metadata !{metadata !"arg._kint.isspace.0"}
!153 = metadata !{i32 286, i32 10, metadata !154, null}
!154 = metadata !{i32 786443, metadata !13, i32 285, i32 1, metadata !14, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint//usr/include/ctype.h]
!155 = metadata !{metadata !"arg._kint.__istype.1"}
!156 = metadata !{i64 16384, i64 16385}
!157 = metadata !{metadata !"arg._kint.__istype.0"}
!158 = metadata !{i32 175, i32 10, metadata !159, null}
!159 = metadata !{i32 786443, metadata !17, i32 171, i32 1, metadata !14, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint//usr/include/ctype.h]
!160 = metadata !{i32 176, i32 7, metadata !159, null}
!161 = metadata !{metadata !"arg._kint.isascii.0"}
!162 = metadata !{i32 154, i32 2, metadata !163, null}
!163 = metadata !{i32 786443, metadata !22, i32 153, i32 1, metadata !14, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_v527/src/kint//usr/include/ctype.h]
