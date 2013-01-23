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

@.str = private unnamed_addr constant [12 x i8] c"116-53-6526\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"benign_junk\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str2 = private unnamed_addr constant [30 x i8] c"error allocating config_data\0A\00", align 1
@.str3 = private unnamed_addr constant [30 x i8] c"\0AERROR: Usage: %s <filename>\0A\00", align 1
@.str4 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a slash character.\0A\00", align 1
@.str5 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a colon character.\0A\00", align 1
@.str6 = private unnamed_addr constant [70 x i8] c"\0AERROR: Filename must not contain a double dot (e.g. '..') sequence.\0A\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str8 = private unnamed_addr constant [27 x i8] c"\0AERROR: Cannot open file.\0A\00", align 1
@.str9 = private unnamed_addr constant [27 x i8] c"\0AERROR: File close error.\0A\00", align 1
@.str10 = private unnamed_addr constant [7 x i8] c"%s %d\0A\00", align 1
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
  %8 = call i8* @malloc(i64 16), !dbg !41
  %9 = bitcast i8* %8 to i8**, !dbg !41
  %10 = icmp eq i8** %9, null, !dbg !42
  br i1 %10, label %11, label %14, !dbg !42

; <label>:11                                      ; preds = %0
  %12 = load %struct.__sFILE** @__stderrp, align 8, !dbg !43
  %13 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %12, i8* getelementptr inbounds ([30 x i8]* @.str2, i32 0, i32 0)), !dbg !43
  call void @exit(i32 1) noreturn, !dbg !45
  unreachable, !dbg !45

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds i8** %9, i64 0, !dbg !46
  store i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8** %15, align 8, !dbg !46
  %16 = getelementptr inbounds i8** %9, i64 1, !dbg !47
  store i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i8** %16, align 8, !dbg !47
  %17 = icmp ne i32 %argc1, 2, !dbg !48
  br i1 %17, label %18, label %23, !dbg !48

; <label>:18                                      ; preds = %14
  %19 = load %struct.__sFILE** @__stderrp, align 8, !dbg !49
  %20 = getelementptr inbounds i8** %argv, i64 0, !dbg !49
  %21 = load i8** %20, align 8, !dbg !49
  %22 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %19, i8* getelementptr inbounds ([30 x i8]* @.str3, i32 0, i32 0), i8* %21), !dbg !49
  br label %194, !dbg !51

; <label>:23                                      ; preds = %14
  %24 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !52
  %25 = icmp ne i64 %24, -1, !dbg !52
  br i1 %25, label %26, label %29, !dbg !52

; <label>:26                                      ; preds = %23
  %27 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !52
  %28 = call i8* @__memset_chk(i8* %4, i32 0, i64 256, i64 %27) nounwind, !dbg !52
  br label %31, !dbg !52

; <label>:29                                      ; preds = %23
  %30 = call i8* @__inline_memset_chk(i8* %4, i32 0, i64 256), !dbg !52
  br label %31, !dbg !52

; <label>:31                                      ; preds = %29, %26
  %32 = phi i8* [ %28, %26 ], [ %30, %29 ], !dbg !52
  %33 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !53
  %34 = icmp ne i64 %33, -1, !dbg !53
  %35 = getelementptr inbounds i8** %argv, i64 1, !dbg !53
  %36 = load i8** %35, align 8, !dbg !53
  br i1 %34, label %37, label %40, !dbg !53

; <label>:37                                      ; preds = %31
  %38 = call i64 @llvm.objectsize.i64(i8* %4, i1 false), !dbg !53
  %39 = call i8* @__strncpy_chk(i8* %4, i8* %36, i64 255, i64 %38) nounwind, !dbg !53
  br label %42, !dbg !53

; <label>:40                                      ; preds = %31
  %41 = call i8* @__inline_strncpy_chk(i8* %4, i8* %36, i64 255), !dbg !53
  br label %42, !dbg !53

; <label>:42                                      ; preds = %40, %37
  %43 = phi i8* [ %39, %37 ], [ %41, %40 ], !dbg !53
  %44 = mul nsw i32 128, 2, !dbg !54
  %45 = sext i32 %44 to i64, !dbg !54
  %46 = getelementptr inbounds i8* %4, i64 %45, !dbg !54
  store i8 0, i8* %46, align 1, !dbg !54
  br label %47, !dbg !55

; <label>:47                                      ; preds = %95, %42
  %i.0 = phi i32 [ 0, %42 ], [ %96, %95 ]
  %48 = icmp slt i32 %i.0, 255, !dbg !55
  br i1 %48, label %49, label %97, !dbg !55

; <label>:49                                      ; preds = %47
  %50 = sext i32 %i.0 to i64, !dbg !57
  %51 = getelementptr inbounds i8* %4, i64 %50, !dbg !57
  %52 = load i8* %51, align 1, !dbg !57
  %53 = sext i8 %52 to i32, !dbg !57
  %54 = icmp eq i32 %53, 0, !dbg !57
  br i1 %54, label %97, label %55, !dbg !57

; <label>:55                                      ; preds = %49
  %56 = sext i32 %i.0 to i64, !dbg !59
  %57 = getelementptr inbounds i8* %4, i64 %56, !dbg !59
  %58 = load i8* %57, align 1, !dbg !59
  %59 = sext i8 %58 to i32, !dbg !59
  %60 = icmp eq i32 %59, 92, !dbg !59
  br i1 %60, label %67, label %61, !dbg !59

; <label>:61                                      ; preds = %55
  %62 = sext i32 %i.0 to i64, !dbg !59
  %63 = getelementptr inbounds i8* %4, i64 %62, !dbg !59
  %64 = load i8* %63, align 1, !dbg !59
  %65 = sext i8 %64 to i32, !dbg !59
  %66 = icmp eq i32 %65, 47, !dbg !59
  br i1 %66, label %67, label %70, !dbg !59

; <label>:67                                      ; preds = %61, %55
  %68 = load %struct.__sFILE** @__stderrp, align 8, !dbg !60
  %69 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %68, i8* getelementptr inbounds ([54 x i8]* @.str4, i32 0, i32 0)), !dbg !60
  br label %194, !dbg !62

; <label>:70                                      ; preds = %61
  %71 = sext i32 %i.0 to i64, !dbg !63
  %72 = getelementptr inbounds i8* %4, i64 %71, !dbg !63
  %73 = load i8* %72, align 1, !dbg !63
  %74 = sext i8 %73 to i32, !dbg !63
  %75 = icmp eq i32 %74, 58, !dbg !63
  br i1 %75, label %76, label %79, !dbg !63

; <label>:76                                      ; preds = %70
  %77 = load %struct.__sFILE** @__stderrp, align 8, !dbg !64
  %78 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %77, i8* getelementptr inbounds ([54 x i8]* @.str5, i32 0, i32 0)), !dbg !64
  br label %194, !dbg !66

; <label>:79                                      ; preds = %70
  %80 = sext i32 %i.0 to i64, !dbg !67
  %81 = getelementptr inbounds i8* %4, i64 %80, !dbg !67
  %82 = load i8* %81, align 1, !dbg !67
  %83 = sext i8 %82 to i32, !dbg !67
  %84 = icmp eq i32 %83, 46, !dbg !67
  br i1 %84, label %85, label %95, !dbg !67

; <label>:85                                      ; preds = %79
  %86 = add nsw i32 %i.0, 1, !dbg !67
  %87 = sext i32 %86 to i64, !dbg !67
  %88 = getelementptr inbounds i8* %4, i64 %87, !dbg !67
  %89 = load i8* %88, align 1, !dbg !67
  %90 = sext i8 %89 to i32, !dbg !67
  %91 = icmp eq i32 %90, 46, !dbg !67
  br i1 %91, label %92, label %95, !dbg !67

; <label>:92                                      ; preds = %85
  %93 = load %struct.__sFILE** @__stderrp, align 8, !dbg !68
  %94 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %93, i8* getelementptr inbounds ([70 x i8]* @.str6, i32 0, i32 0)), !dbg !68
  br label %194, !dbg !70

; <label>:95                                      ; preds = %85, %79
  %96 = add nsw i32 %i.0, 1, !dbg !71
  br label %47, !dbg !71

; <label>:97                                      ; preds = %49, %47
  %98 = call %struct.__sFILE* @"\01_fopen"(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0)), !dbg !72
  %99 = icmp eq %struct.__sFILE* %98, null, !dbg !73
  br i1 %99, label %100, label %103, !dbg !73

; <label>:100                                     ; preds = %97
  %101 = load %struct.__sFILE** @__stderrp, align 8, !dbg !74
  %102 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %101, i8* getelementptr inbounds ([27 x i8]* @.str8, i32 0, i32 0)), !dbg !74
  br label %194, !dbg !76

; <label>:103                                     ; preds = %97
  %104 = call i64 @llvm.objectsize.i64(i8* %7, i1 false), !dbg !77
  %105 = icmp ne i64 %104, -1, !dbg !77
  br i1 %105, label %106, label %109, !dbg !77

; <label>:106                                     ; preds = %103
  %107 = call i64 @llvm.objectsize.i64(i8* %7, i1 false), !dbg !77
  %108 = call i8* @__memset_chk(i8* %7, i32 0, i64 256, i64 %107) nounwind, !dbg !77
  br label %111, !dbg !77

; <label>:109                                     ; preds = %103
  %110 = call i8* @__inline_memset_chk(i8* %7, i32 0, i64 256), !dbg !77
  br label %111, !dbg !77

; <label>:111                                     ; preds = %166, %161, %140, %130, %109, %106
  %multi_line_comment.0 = phi i32 [ 0, %106 ], [ %multi_line_comment.1, %140 ], [ %multi_line_comment.1, %161 ], [ %multi_line_comment.1, %166 ], [ %multi_line_comment.1, %130 ], [ 0, %109 ]
  %lines_of_code.0 = phi i8 [ 0, %106 ], [ %lines_of_code.1, %140 ], [ %lines_of_code.1, %161 ], [ %lines_of_code.1, %166 ], [ %lines_of_code.1, %130 ], [ 0, %109 ]
  %output_data_index.0 = phi i32 [ 1, %106 ], [ %output_data_index.1, %140 ], [ %output_data_index.1, %161 ], [ %output_data_index.1, %166 ], [ %output_data_index.1, %130 ], [ 1, %109 ]
  %112 = call i8* @fgets(i8* %7, i32 256, %struct.__sFILE* %98), !dbg !78
  %113 = icmp ne i8* %112, null, !dbg !78
  br i1 %113, label %114, label %182, !dbg !78

; <label>:114                                     ; preds = %111
  %115 = sext i8 %lines_of_code.0 to i32, !dbg !79
  %116 = icmp slt i32 %115, 0, !dbg !79
  br i1 %116, label %117, label %118, !dbg !79

; <label>:117                                     ; preds = %114
  br label %118, !dbg !81

; <label>:118                                     ; preds = %117, %114
  %output_data_index.1 = phi i32 [ 0, %117 ], [ %output_data_index.0, %114 ]
  %119 = call i64 @strlen(i8* %7), !dbg !83
  %120 = sub i64 %119, 1, !dbg !83
  %121 = getelementptr inbounds i8* %7, i64 %120, !dbg !83
  %122 = load i8* %121, align 1, !dbg !83
  %123 = sext i8 %122 to i32, !dbg !83
  %124 = icmp eq i32 %123, 10, !dbg !83
  br i1 %124, label %125, label %129, !dbg !83

; <label>:125                                     ; preds = %118
  %126 = call i64 @strlen(i8* %7), !dbg !84
  %127 = sub i64 %126, 1, !dbg !84
  %128 = getelementptr inbounds i8* %7, i64 %127, !dbg !84
  store i8 0, i8* %128, align 1, !dbg !84
  br label %129, !dbg !84

; <label>:129                                     ; preds = %125, %118
  br label %130, !dbg !85

; <label>:130                                     ; preds = %180, %174, %155, %150, %129
  %line_pointer.0 = phi i8* [ %7, %129 ], [ %151, %150 ], [ %156, %155 ], [ %175, %174 ], [ %181, %180 ]
  %line_already_counted.0 = phi i32 [ 0, %129 ], [ %line_already_counted.0, %150 ], [ %line_already_counted.0, %155 ], [ %line_already_counted.0, %174 ], [ %line_already_counted.1, %180 ]
  %multi_line_comment.1 = phi i32 [ %multi_line_comment.0, %129 ], [ %multi_line_comment.2, %150 ], [ %multi_line_comment.1, %155 ], [ 1, %174 ], [ %multi_line_comment.1, %180 ]
  %lines_of_code.1 = phi i8 [ %lines_of_code.0, %129 ], [ %lines_of_code.1, %150 ], [ %lines_of_code.1, %155 ], [ %lines_of_code.1, %174 ], [ %lines_of_code.2, %180 ]
  %131 = load i8* %line_pointer.0, align 1, !dbg !85
  %132 = sext i8 %131 to i32, !dbg !85
  %133 = icmp ne i32 %132, 0, !dbg !85
  br i1 %133, label %134, label %111, !dbg !85

; <label>:134                                     ; preds = %130
  %135 = icmp eq i32 %multi_line_comment.1, 1, !dbg !86
  %136 = load i8* %line_pointer.0, align 1, !dbg !88
  %137 = sext i8 %136 to i32, !dbg !88
  br i1 %135, label %138, label %152, !dbg !86

; <label>:138                                     ; preds = %134
  %139 = icmp eq i32 %137, 42, !dbg !88
  br i1 %139, label %140, label %150, !dbg !88

; <label>:140                                     ; preds = %138
  %141 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !90
  %142 = load i8* %141, align 1, !dbg !92
  %143 = sext i8 %142 to i32, !dbg !92
  %144 = icmp eq i32 %143, 0, !dbg !92
  br i1 %144, label %111, label %145, !dbg !92

; <label>:145                                     ; preds = %140
  %146 = load i8* %141, align 1, !dbg !93
  %147 = sext i8 %146 to i32, !dbg !93
  %148 = icmp eq i32 %147, 47, !dbg !93
  br i1 %148, label %149, label %150, !dbg !93

; <label>:149                                     ; preds = %145
  br label %150, !dbg !94

; <label>:150                                     ; preds = %149, %145, %138
  %line_pointer.1 = phi i8* [ %141, %149 ], [ %141, %145 ], [ %line_pointer.0, %138 ]
  %multi_line_comment.2 = phi i32 [ 0, %149 ], [ %multi_line_comment.1, %145 ], [ %multi_line_comment.1, %138 ]
  %151 = getelementptr inbounds i8* %line_pointer.1, i32 1, !dbg !96
  br label %130, !dbg !97

; <label>:152                                     ; preds = %134
  %153 = call i32 @isspace(i32 %137), !dbg !98, !intrange !99
  %154 = icmp ne i32 %153, 0, !dbg !98
  br i1 %154, label %155, label %157, !dbg !98

; <label>:155                                     ; preds = %152
  %156 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !100
  br label %130, !dbg !102

; <label>:157                                     ; preds = %152
  %158 = load i8* %line_pointer.0, align 1, !dbg !103
  %159 = sext i8 %158 to i32, !dbg !103
  %160 = icmp eq i32 %159, 47, !dbg !103
  br i1 %160, label %161, label %176, !dbg !103

; <label>:161                                     ; preds = %157
  %162 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !104
  %163 = load i8* %162, align 1, !dbg !106
  %164 = sext i8 %163 to i32, !dbg !106
  %165 = icmp eq i32 %164, 0, !dbg !106
  br i1 %165, label %111, label %166, !dbg !106

; <label>:166                                     ; preds = %161
  %167 = load i8* %162, align 1, !dbg !107
  %168 = sext i8 %167 to i32, !dbg !107
  %169 = icmp eq i32 %168, 47, !dbg !107
  br i1 %169, label %111, label %170, !dbg !107

; <label>:170                                     ; preds = %166
  %171 = load i8* %162, align 1, !dbg !108
  %172 = sext i8 %171 to i32, !dbg !108
  %173 = icmp eq i32 %172, 42, !dbg !108
  br i1 %173, label %174, label %176, !dbg !108

; <label>:174                                     ; preds = %170
  %175 = getelementptr inbounds i8* %162, i32 1, !dbg !109
  br label %130, !dbg !111

; <label>:176                                     ; preds = %170, %157
  %line_pointer.2 = phi i8* [ %162, %170 ], [ %line_pointer.0, %157 ]
  %177 = icmp eq i32 %line_already_counted.0, 0, !dbg !112
  br i1 %177, label %178, label %180, !dbg !112

; <label>:178                                     ; preds = %176
  %179 = add i8 %lines_of_code.1, 1, !dbg !113
  br label %180, !dbg !115

; <label>:180                                     ; preds = %178, %176
  %line_already_counted.1 = phi i32 [ 1, %178 ], [ %line_already_counted.0, %176 ]
  %lines_of_code.2 = phi i8 [ %179, %178 ], [ %lines_of_code.1, %176 ]
  %181 = getelementptr inbounds i8* %line_pointer.2, i32 1, !dbg !116
  br label %130, !dbg !117

; <label>:182                                     ; preds = %111
  %183 = call i32 @fclose(%struct.__sFILE* %98), !dbg !118
  %184 = icmp ne i32 %183, 0, !dbg !118
  br i1 %184, label %185, label %188, !dbg !118

; <label>:185                                     ; preds = %182
  %186 = load %struct.__sFILE** @__stderrp, align 8, !dbg !119
  %187 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %186, i8* getelementptr inbounds ([27 x i8]* @.str9, i32 0, i32 0)), !dbg !119
  br label %194, !dbg !121

; <label>:188                                     ; preds = %182
  %189 = sext i32 %output_data_index.0 to i64, !dbg !122
  %190 = getelementptr inbounds i8** %9, i64 %189, !dbg !122
  %191 = load i8** %190, align 8, !dbg !122
  %192 = sext i8 %lines_of_code.0 to i32, !dbg !122
  %193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0), i8* %191, i32 %192), !dbg !122
  br label %194, !dbg !123

; <label>:194                                     ; preds = %188, %185, %100, %92, %76, %67, %18
  %.0 = phi i32 [ 1, %18 ], [ 1, %100 ], [ 1, %185 ], [ 0, %188 ], [ 1, %67 ], [ 1, %76 ], [ 1, %92 ]
  call void @llvm.stackrestore(i8* %3), !dbg !124
  ret i32 %.0, !dbg !125
}

declare i8* @llvm.stacksave() nounwind

declare i8* @malloc(i64)

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

declare void @exit(i32) noreturn

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memset_chk(i8*, i32, i64, i64) nounwind

define internal i8* @__inline_memset_chk(i8* %__dest, i32 %__val, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len2 = call i64 @kint_arg.i64(), !id !126, !intrange !127
  %__val1 = call i32 @kint_arg.i32(), !id !128, !intrange !129
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !130
  %2 = call i8* @__memset_chk(i8* %__dest, i32 %__val1, i64 %__len2, i64 %1) nounwind, !dbg !130
  ret i8* %2, !dbg !130
}

declare i8* @__strncpy_chk(i8*, i8*, i64, i64) nounwind

define internal i8* @__inline_strncpy_chk(i8* noalias %__dest, i8* noalias %__src, i64 %__len) nounwind uwtable inlinehint ssp {
  %__len1 = call i64 @kint_arg.i64(), !id !132, !intrange !133
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !134
  %2 = call i8* @__strncpy_chk(i8* %__dest, i8* %__src, i64 %__len1, i64 %1) nounwind, !dbg !134
  ret i8* %2, !dbg !134
}

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i64 @strlen(i8*)

define internal i32 @isspace(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !136
  %1 = call i32 @__istype(i32 %_c1, i64 16384), !dbg !137, !intrange !99
  ret i32 %1, !dbg !137
}

declare i32 @fclose(%struct.__sFILE*)

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !139, !intrange !140
  %_c1 = call i32 @kint_arg.i32(), !id !141
  %1 = call i32 @isascii(i32 %_c1), !dbg !142, !intrange !99
  %2 = icmp ne i32 %1, 0, !dbg !142
  br i1 %2, label %3, label %10, !dbg !142

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !142
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !142
  %6 = load i32* %5, align 4, !dbg !142
  %7 = zext i32 %6 to i64, !dbg !142
  %8 = and i64 %7, %_f2, !dbg !142
  %9 = icmp ne i64 %8, 0, !dbg !142
  br label %13, !dbg !142

; <label>:10                                      ; preds = %0
  %11 = call i32 @__maskrune(i32 %_c1, i64 %_f2), !dbg !144
  %12 = icmp ne i32 %11, 0, !dbg !144
  br label %13, !dbg !144

; <label>:13                                      ; preds = %10, %3
  %.sink = phi i1 [ %9, %3 ], [ %12, %10 ]
  %14 = xor i1 %.sink, true, !dbg !142
  %15 = xor i1 %14, true, !dbg !142
  %16 = zext i1 %15 to i32, !dbg !142
  ret i32 %16, !dbg !144
}

define internal i32 @isascii(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !145
  %1 = and i32 %_c1, -128, !dbg !146
  %2 = icmp eq i32 %1, 0, !dbg !146
  %3 = zext i1 %2 to i32, !dbg !146
  ret i32 %3, !dbg !146
}

declare i32 @__maskrune(i32, i64)

declare i32 @kint_arg.i32()

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !17, metadata !22, metadata !23, metadata !33}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 27, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 28} ; [ DW_TAG_subprogram ] [line 27] [def] [scope 28] [main]
!6 = metadata !{i32 786473, metadata !"countlines.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isspace", metadata !"isspace", metadata !"", metadata !14, i32 284, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isspace, null, null, metadata !1, i32 285} ; [ DW_TAG_subprogram ] [line 284] [local] [def] [scope 285] [isspace]
!14 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint", null} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !9, metadata !9}
!17 = metadata !{i32 786478, i32 0, metadata !14, metadata !"__istype", metadata !"__istype", metadata !"", metadata !14, i32 170, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !20, metadata !21}
!20 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !14, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!21 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!22 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isascii", metadata !"isascii", metadata !"", metadata !14, i32 152, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!23 = metadata !{i32 786478, i32 0, metadata !24, metadata !"__inline_strncpy_chk", metadata !"__inline_strncpy_chk", metadata !"", metadata !24, i32 128, metadata !25, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i8*, i64)* @__inline_strncpy_chk, null, null, metadata !1, i32 130} ; [ DW_TAG_subprogram ] [line 128] [local] [def] [scope 130] [__inline_strncpy_chk]
!24 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint", null} ; [ DW_TAG_file_type ]
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
!38 = metadata !{i32 34, i32 20, metadata !39, null}
!39 = metadata !{i32 786443, metadata !5, i32 28, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!40 = metadata !{i32 36, i32 16, metadata !39, null}
!41 = metadata !{i32 55, i32 25, metadata !39, null}
!42 = metadata !{i32 56, i32 2, metadata !39, null}
!43 = metadata !{i32 58, i32 6, metadata !44, null}
!44 = metadata !{i32 786443, metadata !39, i32 57, i32 4, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!45 = metadata !{i32 59, i32 6, metadata !44, null}
!46 = metadata !{i32 61, i32 2, metadata !39, null}
!47 = metadata !{i32 62, i32 2, metadata !39, null}
!48 = metadata !{i32 71, i32 2, metadata !39, null}
!49 = metadata !{i32 73, i32 3, metadata !50, null}
!50 = metadata !{i32 786443, metadata !39, i32 72, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!51 = metadata !{i32 74, i32 3, metadata !50, null}
!52 = metadata !{i32 77, i32 2, metadata !39, null}
!53 = metadata !{i32 78, i32 2, metadata !39, null}
!54 = metadata !{i32 79, i32 2, metadata !39, null}
!55 = metadata !{i32 88, i32 7, metadata !56, null}
!56 = metadata !{i32 786443, metadata !39, i32 88, i32 2, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!57 = metadata !{i32 90, i32 3, metadata !58, null}
!58 = metadata !{i32 786443, metadata !56, i32 89, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!59 = metadata !{i32 92, i32 3, metadata !58, null}
!60 = metadata !{i32 94, i32 4, metadata !61, null}
!61 = metadata !{i32 786443, metadata !58, i32 93, i32 3, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!62 = metadata !{i32 95, i32 4, metadata !61, null}
!63 = metadata !{i32 98, i32 3, metadata !58, null}
!64 = metadata !{i32 100, i32 4, metadata !65, null}
!65 = metadata !{i32 786443, metadata !58, i32 99, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!66 = metadata !{i32 101, i32 4, metadata !65, null}
!67 = metadata !{i32 104, i32 3, metadata !58, null}
!68 = metadata !{i32 106, i32 4, metadata !69, null}
!69 = metadata !{i32 786443, metadata !58, i32 105, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!70 = metadata !{i32 107, i32 4, metadata !69, null}
!71 = metadata !{i32 88, i32 17, metadata !56, null}
!72 = metadata !{i32 112, i32 7, metadata !39, null}
!73 = metadata !{i32 113, i32 2, metadata !39, null}
!74 = metadata !{i32 115, i32 3, metadata !75, null}
!75 = metadata !{i32 786443, metadata !39, i32 114, i32 2, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!76 = metadata !{i32 116, i32 3, metadata !75, null}
!77 = metadata !{i32 128, i32 2, metadata !39, null}
!78 = metadata !{i32 133, i32 10, metadata !39, null}
!79 = metadata !{i32 138, i32 3, metadata !80, null}
!80 = metadata !{i32 786443, metadata !39, i32 134, i32 2, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!81 = metadata !{i32 141, i32 3, metadata !82, null}
!82 = metadata !{i32 786443, metadata !80, i32 139, i32 3, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!83 = metadata !{i32 151, i32 12, metadata !80, null}
!84 = metadata !{i32 151, i32 42, metadata !80, null}
!85 = metadata !{i32 159, i32 3, metadata !80, null}
!86 = metadata !{i32 164, i32 4, metadata !87, null}
!87 = metadata !{i32 786443, metadata !80, i32 160, i32 3, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!88 = metadata !{i32 166, i32 5, metadata !89, null}
!89 = metadata !{i32 786443, metadata !87, i32 165, i32 4, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!90 = metadata !{i32 172, i32 6, metadata !91, null}
!91 = metadata !{i32 786443, metadata !89, i32 167, i32 5, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!92 = metadata !{i32 173, i32 6, metadata !91, null}
!93 = metadata !{i32 176, i32 6, metadata !91, null}
!94 = metadata !{i32 183, i32 6, metadata !95, null}
!95 = metadata !{i32 786443, metadata !91, i32 177, i32 6, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!96 = metadata !{i32 186, i32 5, metadata !89, null}
!97 = metadata !{i32 187, i32 5, metadata !89, null}
!98 = metadata !{i32 193, i32 8, metadata !87, null}
!99 = metadata !{i32 0, i32 2}
!100 = metadata !{i32 195, i32 5, metadata !101, null}
!101 = metadata !{i32 786443, metadata !87, i32 194, i32 4, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!102 = metadata !{i32 196, i32 5, metadata !101, null}
!103 = metadata !{i32 204, i32 4, metadata !87, null}
!104 = metadata !{i32 210, i32 5, metadata !105, null}
!105 = metadata !{i32 786443, metadata !87, i32 205, i32 4, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!106 = metadata !{i32 211, i32 5, metadata !105, null}
!107 = metadata !{i32 216, i32 5, metadata !105, null}
!108 = metadata !{i32 225, i32 5, metadata !105, null}
!109 = metadata !{i32 228, i32 6, metadata !110, null}
!110 = metadata !{i32 786443, metadata !105, i32 226, i32 5, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!111 = metadata !{i32 229, i32 6, metadata !110, null}
!112 = metadata !{i32 240, i32 4, metadata !87, null}
!113 = metadata !{i32 242, i32 5, metadata !114, null}
!114 = metadata !{i32 786443, metadata !87, i32 241, i32 4, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!115 = metadata !{i32 244, i32 4, metadata !114, null}
!116 = metadata !{i32 249, i32 4, metadata !87, null}
!117 = metadata !{i32 250, i32 3, metadata !87, null}
!118 = metadata !{i32 255, i32 7, metadata !39, null}
!119 = metadata !{i32 257, i32 3, metadata !120, null}
!120 = metadata !{i32 786443, metadata !39, i32 256, i32 3, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint/countlines.c]
!121 = metadata !{i32 258, i32 3, metadata !120, null}
!122 = metadata !{i32 266, i32 3, metadata !39, null}
!123 = metadata !{i32 268, i32 2, metadata !39, null}
!124 = metadata !{i32 269, i32 1, metadata !39, null}
!125 = metadata !{i32 269, i32 1, metadata !5, null}
!126 = metadata !{metadata !"arg._kint.__inline_memset_chk.2"}
!127 = metadata !{i64 256, i64 257}
!128 = metadata !{metadata !"arg._kint.__inline_memset_chk.1"}
!129 = metadata !{i32 0, i32 1}
!130 = metadata !{i32 83, i32 56, metadata !131, null}
!131 = metadata !{i32 786443, metadata !33, i32 82, i32 1, metadata !24, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint//usr/include/secure/_string.h]
!132 = metadata !{metadata !"arg._kint.__inline_strncpy_chk.2"}
!133 = metadata !{i64 255, i64 256}
!134 = metadata !{i32 131, i32 57, metadata !135, null}
!135 = metadata !{i32 786443, metadata !23, i32 130, i32 1, metadata !24, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint//usr/include/secure/_string.h]
!136 = metadata !{metadata !"arg._kint.isspace.0"}
!137 = metadata !{i32 286, i32 10, metadata !138, null}
!138 = metadata !{i32 786443, metadata !13, i32 285, i32 1, metadata !14, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint//usr/include/ctype.h]
!139 = metadata !{metadata !"arg._kint.__istype.1"}
!140 = metadata !{i64 16384, i64 16385}
!141 = metadata !{metadata !"arg._kint.__istype.0"}
!142 = metadata !{i32 175, i32 10, metadata !143, null}
!143 = metadata !{i32 786443, metadata !17, i32 171, i32 1, metadata !14, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint//usr/include/ctype.h]
!144 = metadata !{i32 176, i32 7, metadata !143, null}
!145 = metadata !{metadata !"arg._kint.isascii.0"}
!146 = metadata !{i32 154, i32 2, metadata !147, null}
!147 = metadata !{i32 786443, metadata !22, i32 153, i32 1, metadata !14, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_190_v503/src/kint//usr/include/ctype.h]
