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
%struct.__shmid_ds_new = type <{ %struct.ipc_perm, i64, i32, i32, i16, [2 x i8], i64, i64, i64, i8* }>
%struct.ipc_perm = type { i32, i32, i32, i32, i16, i16, i32 }

@.str = private unnamed_addr constant [12 x i8] c"116-53-6526\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"benign_junk\00", align 1
@.str2 = private unnamed_addr constant [30 x i8] c"error allocating config_data\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"\0AERROR: Usage: %s <key>\0A\00", align 1
@.str4 = private unnamed_addr constant [40 x i8] c"Please provide a key between %d and %d\0A\00", align 1
@.str5 = private unnamed_addr constant [33 x i8] c"Error getting shmem, exiting...\0A\00", align 1
@.str6 = private unnamed_addr constant [39 x i8] c"Error attaching to memory, exiting...\0A\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"lockfile\00", align 1
@.str8 = private unnamed_addr constant [6 x i8] c"%s %d\00", align 1
@.str9 = private unnamed_addr constant [58 x i8] c"Error: max_line_length is %d, but must be >=1 and <= 120\0A\00", align 1
@.str10 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a slash character.\0A\00", align 1
@.str11 = private unnamed_addr constant [54 x i8] c"\0AERROR: Filename must not contain a colon character.\0A\00", align 1
@.str12 = private unnamed_addr constant [70 x i8] c"\0AERROR: Filename must not contain a double dot (e.g. '..') sequence.\0A\00", align 1
@.str13 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str14 = private unnamed_addr constant [27 x i8] c"\0AERROR: Cannot open file.\0A\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str15 = private unnamed_addr constant [13 x i8] c"Opened '%s'\0A\00", align 1
@.str16 = private unnamed_addr constant [27 x i8] c"\0AERROR: File close error.\0A\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !23
  %line = alloca [256 x i8], align 16
  %max_line_length = alloca i8, align 1
  %1 = mul nsw i32 16, 16, !dbg !24
  %2 = zext i32 %1 to i64, !dbg !24
  %3 = call i8* @llvm.stacksave(), !dbg !24
  %4 = alloca i8, i64 %2, align 16, !dbg !24
  %5 = call i8* @malloc(i64 16), !dbg !26
  %6 = bitcast i8* %5 to i8**, !dbg !26
  %7 = icmp eq i8** %6, null, !dbg !27
  br i1 %7, label %8, label %10, !dbg !27

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str2, i32 0, i32 0)), !dbg !28
  call void @exit(i32 1) noreturn, !dbg !30
  unreachable, !dbg !30

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds i8** %6, i64 0, !dbg !31
  store i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8** %11, align 8, !dbg !31
  %12 = getelementptr inbounds i8** %6, i64 1, !dbg !32
  store i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i8** %12, align 8, !dbg !32
  %13 = icmp ne i32 %argc1, 2, !dbg !33
  br i1 %13, label %14, label %18, !dbg !33

; <label>:14                                      ; preds = %10
  %15 = getelementptr inbounds i8** %argv, i64 0, !dbg !34
  %16 = load i8** %15, align 8, !dbg !34
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i8* %16), !dbg !34
  br label %232, !dbg !36

; <label>:18                                      ; preds = %10
  %19 = getelementptr inbounds i8** %argv, i64 1, !dbg !37
  %20 = load i8** %19, align 8, !dbg !37
  %21 = call i64 @strtol(i8* %20, i8** null, i32 10), !dbg !37
  %22 = trunc i64 %21 to i32, !dbg !37
  %23 = icmp slt i32 9999, %22, !dbg !38
  %24 = icmp sgt i32 5000, %22, !dbg !38
  %or.cond = or i1 %23, %24, !dbg !38
  br i1 %or.cond, label %25, label %27, !dbg !38

; <label>:25                                      ; preds = %18
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str4, i32 0, i32 0), i32 5000, i32 9999), !dbg !39
  call void @exit(i32 1) noreturn, !dbg !41
  unreachable, !dbg !41

; <label>:27                                      ; preds = %18
  %28 = call i32 @shmget(i32 %22, i64 256, i32 950), !dbg !42
  %29 = icmp sgt i32 0, %28, !dbg !42
  br i1 %29, label %30, label %32, !dbg !42

; <label>:30                                      ; preds = %27
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0)), !dbg !43
  call void @exit(i32 1) noreturn, !dbg !45
  unreachable, !dbg !45

; <label>:32                                      ; preds = %27
  %33 = call i8* @shmat(i32 %28, i8* null, i32 0), !dbg !46
  %34 = icmp eq i8* inttoptr (i64 -1 to i8*), %33, !dbg !47
  br i1 %34, label %35, label %37, !dbg !47

; <label>:35                                      ; preds = %32
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str6, i32 0, i32 0)), !dbg !48
  call void @exit(i32 1) noreturn, !dbg !50
  unreachable, !dbg !50

; <label>:37                                      ; preds = %40, %32
  %38 = call i32 @access(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0), i32 0), !dbg !51
  %39 = icmp ne i32 %38, 0, !dbg !51
  br i1 %39, label %40, label %42, !dbg !51

; <label>:40                                      ; preds = %37
  %41 = call i32 @"\01_sleep"(i32 1), !dbg !52
  br label %37, !dbg !54

; <label>:42                                      ; preds = %37
  %43 = getelementptr inbounds i8* %33, i64 255, !dbg !55
  store i8 0, i8* %43, align 1, !dbg !55
  %44 = bitcast i8* %max_line_length to i32*, !dbg !56
  %45 = call i32 (i8*, i8*, ...)* @sscanf(i8* %33, i8* getelementptr inbounds ([6 x i8]* @.str8, i32 0, i32 0), i8* %4, i32* %44), !dbg !56
  %46 = getelementptr inbounds i8* %4, i64 255, !dbg !57
  store i8 0, i8* %46, align 1, !dbg !57
  %47 = load i8* %max_line_length, align 1, !dbg !58
  %48 = sext i8 %47 to i32, !dbg !58
  %49 = icmp slt i32 %48, 1, !dbg !58
  br i1 %49, label %54, label %50, !dbg !58

; <label>:50                                      ; preds = %42
  %51 = load i8* %max_line_length, align 1, !dbg !58
  %52 = sext i8 %51 to i32, !dbg !58
  %53 = icmp sgt i32 %52, 120, !dbg !58
  br i1 %53, label %54, label %58, !dbg !58

; <label>:54                                      ; preds = %50, %42
  %55 = load i8* %max_line_length, align 1, !dbg !59
  %56 = sext i8 %55 to i32, !dbg !59
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str9, i32 0, i32 0), i32 %56), !dbg !59
  call void @exit(i32 1) noreturn, !dbg !61
  unreachable, !dbg !61

; <label>:58                                      ; preds = %50
  br label %59, !dbg !62

; <label>:59                                      ; preds = %104, %58
  %i.0 = phi i32 [ 0, %58 ], [ %105, %104 ]
  %60 = icmp slt i32 %i.0, 255, !dbg !62
  br i1 %60, label %61, label %106, !dbg !62

; <label>:61                                      ; preds = %59
  %62 = sext i32 %i.0 to i64, !dbg !64
  %63 = getelementptr inbounds i8* %4, i64 %62, !dbg !64
  %64 = load i8* %63, align 1, !dbg !64
  %65 = sext i8 %64 to i32, !dbg !64
  %66 = icmp eq i32 %65, 0, !dbg !64
  br i1 %66, label %106, label %67, !dbg !64

; <label>:67                                      ; preds = %61
  %68 = sext i32 %i.0 to i64, !dbg !66
  %69 = getelementptr inbounds i8* %4, i64 %68, !dbg !66
  %70 = load i8* %69, align 1, !dbg !66
  %71 = sext i8 %70 to i32, !dbg !66
  %72 = icmp eq i32 %71, 92, !dbg !66
  br i1 %72, label %79, label %73, !dbg !66

; <label>:73                                      ; preds = %67
  %74 = sext i32 %i.0 to i64, !dbg !66
  %75 = getelementptr inbounds i8* %4, i64 %74, !dbg !66
  %76 = load i8* %75, align 1, !dbg !66
  %77 = sext i8 %76 to i32, !dbg !66
  %78 = icmp eq i32 %77, 47, !dbg !66
  br i1 %78, label %79, label %81, !dbg !66

; <label>:79                                      ; preds = %73, %67
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str10, i32 0, i32 0)), !dbg !67
  br label %232, !dbg !69

; <label>:81                                      ; preds = %73
  %82 = sext i32 %i.0 to i64, !dbg !70
  %83 = getelementptr inbounds i8* %4, i64 %82, !dbg !70
  %84 = load i8* %83, align 1, !dbg !70
  %85 = sext i8 %84 to i32, !dbg !70
  %86 = icmp eq i32 %85, 58, !dbg !70
  br i1 %86, label %87, label %89, !dbg !70

; <label>:87                                      ; preds = %81
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str11, i32 0, i32 0)), !dbg !71
  br label %232, !dbg !73

; <label>:89                                      ; preds = %81
  %90 = sext i32 %i.0 to i64, !dbg !74
  %91 = getelementptr inbounds i8* %4, i64 %90, !dbg !74
  %92 = load i8* %91, align 1, !dbg !74
  %93 = sext i8 %92 to i32, !dbg !74
  %94 = icmp eq i32 %93, 46, !dbg !74
  br i1 %94, label %95, label %104, !dbg !74

; <label>:95                                      ; preds = %89
  %96 = add nsw i32 %i.0, 1, !dbg !74
  %97 = sext i32 %96 to i64, !dbg !74
  %98 = getelementptr inbounds i8* %4, i64 %97, !dbg !74
  %99 = load i8* %98, align 1, !dbg !74
  %100 = sext i8 %99 to i32, !dbg !74
  %101 = icmp eq i32 %100, 46, !dbg !74
  br i1 %101, label %102, label %104, !dbg !74

; <label>:102                                     ; preds = %95
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([70 x i8]* @.str12, i32 0, i32 0)), !dbg !75
  br label %232, !dbg !77

; <label>:104                                     ; preds = %95, %89
  %105 = add nsw i32 %i.0, 1, !dbg !78
  br label %59, !dbg !78

; <label>:106                                     ; preds = %61, %59
  %107 = call %struct.__sFILE* @"\01_fopen"(i8* %4, i8* getelementptr inbounds ([2 x i8]* @.str13, i32 0, i32 0)), !dbg !79
  %108 = icmp eq %struct.__sFILE* %107, null, !dbg !80
  br i1 %108, label %109, label %111, !dbg !80

; <label>:109                                     ; preds = %106
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str14, i32 0, i32 0)), !dbg !81
  br label %232, !dbg !83

; <label>:111                                     ; preds = %106
  %112 = load %struct.__sFILE** @__stderrp, align 8, !dbg !84
  %113 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %112, i8* getelementptr inbounds ([13 x i8]* @.str15, i32 0, i32 0), i8* %4), !dbg !84
  %114 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* %114, i8 0, i64 256, i32 1, i1 false), !dbg !85
  br label %115, !dbg !86

; <label>:115                                     ; preds = %180, %174, %150, %140, %111
  %place.0 = phi i8 [ 0, %111 ], [ %152, %150 ], [ %176, %174 ], [ %176, %180 ], [ %place.1, %140 ]
  %multi_line_comment.0 = phi i32 [ 0, %111 ], [ %multi_line_comment.1, %150 ], [ %multi_line_comment.1, %174 ], [ %multi_line_comment.1, %180 ], [ %multi_line_comment.1, %140 ]
  %total_lines.0 = phi i32 [ 0, %111 ], [ %125, %150 ], [ %125, %174 ], [ %125, %180 ], [ %125, %140 ]
  %lines_of_code.0 = phi i32 [ 0, %111 ], [ %lines_of_code.1, %150 ], [ %lines_of_code.1, %174 ], [ %lines_of_code.1, %180 ], [ %lines_of_code.1, %140 ]
  %116 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !87
  %117 = call i8* @fgets(i8* %116, i32 256, %struct.__sFILE* %107), !dbg !87
  %118 = icmp ne i8* %117, null, !dbg !87
  br i1 %118, label %119, label %.critedge, !dbg !87

; <label>:119                                     ; preds = %115
  %120 = sext i8 %place.0 to i32, !dbg !87
  %121 = load i8* %max_line_length, align 1, !dbg !87
  %122 = sext i8 %121 to i32, !dbg !87
  %123 = icmp sle i32 %120, %122, !dbg !87
  br i1 %123, label %124, label %.critedge

; <label>:124                                     ; preds = %119
  %125 = add nsw i32 %total_lines.0, 1, !dbg !88
  %126 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !90
  %127 = call i64 @strlen(i8* %126), !dbg !90
  %128 = sub i64 %127, 1, !dbg !90
  %129 = getelementptr inbounds [256 x i8]* %line, i32 0, i64 %128, !dbg !90
  %130 = load i8* %129, align 1, !dbg !90
  %131 = sext i8 %130 to i32, !dbg !90
  %132 = icmp eq i32 %131, 10, !dbg !90
  br i1 %132, label %133, label %138, !dbg !90

; <label>:133                                     ; preds = %124
  %134 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !91
  %135 = call i64 @strlen(i8* %134), !dbg !91
  %136 = sub i64 %135, 1, !dbg !91
  %137 = getelementptr inbounds [256 x i8]* %line, i32 0, i64 %136, !dbg !91
  store i8 0, i8* %137, align 1, !dbg !91
  br label %138, !dbg !91

; <label>:138                                     ; preds = %133, %124
  %139 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0, !dbg !92
  br label %140, !dbg !93

; <label>:140                                     ; preds = %195, %188, %167, %161, %138
  %line_pointer.0 = phi i8* [ %139, %138 ], [ %162, %161 ], [ %168, %167 ], [ %189, %188 ], [ %196, %195 ]
  %place.1 = phi i8 [ 0, %138 ], [ %163, %161 ], [ %169, %167 ], [ %190, %188 ], [ %197, %195 ]
  %line_already_counted.0 = phi i32 [ 0, %138 ], [ %line_already_counted.0, %161 ], [ %line_already_counted.0, %167 ], [ %line_already_counted.0, %188 ], [ %line_already_counted.1, %195 ]
  %multi_line_comment.1 = phi i32 [ %multi_line_comment.0, %138 ], [ %multi_line_comment.2, %161 ], [ %multi_line_comment.1, %167 ], [ 1, %188 ], [ %multi_line_comment.1, %195 ]
  %lines_of_code.1 = phi i32 [ %lines_of_code.0, %138 ], [ %lines_of_code.1, %161 ], [ %lines_of_code.1, %167 ], [ %lines_of_code.1, %188 ], [ %lines_of_code.2, %195 ]
  %141 = load i8* %line_pointer.0, align 1, !dbg !93
  %142 = sext i8 %141 to i32, !dbg !93
  %143 = icmp ne i32 %142, 0, !dbg !93
  br i1 %143, label %144, label %115, !dbg !93

; <label>:144                                     ; preds = %140
  %145 = icmp eq i32 %multi_line_comment.1, 1, !dbg !94
  %146 = load i8* %line_pointer.0, align 1, !dbg !96
  %147 = sext i8 %146 to i32, !dbg !96
  br i1 %145, label %148, label %164, !dbg !94

; <label>:148                                     ; preds = %144
  %149 = icmp eq i32 %147, 42, !dbg !96
  br i1 %149, label %150, label %161, !dbg !96

; <label>:150                                     ; preds = %148
  %151 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !98
  %152 = add i8 %place.1, 1, !dbg !100
  %153 = load i8* %151, align 1, !dbg !101
  %154 = sext i8 %153 to i32, !dbg !101
  %155 = icmp eq i32 %154, 0, !dbg !101
  br i1 %155, label %115, label %156, !dbg !101

; <label>:156                                     ; preds = %150
  %157 = load i8* %151, align 1, !dbg !102
  %158 = sext i8 %157 to i32, !dbg !102
  %159 = icmp eq i32 %158, 47, !dbg !102
  br i1 %159, label %160, label %161, !dbg !102

; <label>:160                                     ; preds = %156
  br label %161, !dbg !103

; <label>:161                                     ; preds = %160, %156, %148
  %line_pointer.1 = phi i8* [ %151, %160 ], [ %151, %156 ], [ %line_pointer.0, %148 ]
  %place.2 = phi i8 [ %152, %160 ], [ %152, %156 ], [ %place.1, %148 ]
  %multi_line_comment.2 = phi i32 [ 0, %160 ], [ %multi_line_comment.1, %156 ], [ %multi_line_comment.1, %148 ]
  %162 = getelementptr inbounds i8* %line_pointer.1, i32 1, !dbg !105
  %163 = add i8 %place.2, 1, !dbg !106
  br label %140, !dbg !107

; <label>:164                                     ; preds = %144
  %165 = call i32 @isspace(i32 %147), !dbg !108, !intrange !109
  %166 = icmp ne i32 %165, 0, !dbg !108
  br i1 %166, label %167, label %170, !dbg !108

; <label>:167                                     ; preds = %164
  %168 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !110
  %169 = add i8 %place.1, 1, !dbg !112
  br label %140, !dbg !113

; <label>:170                                     ; preds = %164
  %171 = load i8* %line_pointer.0, align 1, !dbg !114
  %172 = sext i8 %171 to i32, !dbg !114
  %173 = icmp eq i32 %172, 47, !dbg !114
  br i1 %173, label %174, label %191, !dbg !114

; <label>:174                                     ; preds = %170
  %175 = getelementptr inbounds i8* %line_pointer.0, i32 1, !dbg !115
  %176 = add i8 %place.1, 1, !dbg !117
  %177 = load i8* %175, align 1, !dbg !118
  %178 = sext i8 %177 to i32, !dbg !118
  %179 = icmp eq i32 %178, 0, !dbg !118
  br i1 %179, label %115, label %180, !dbg !118

; <label>:180                                     ; preds = %174
  %181 = load i8* %175, align 1, !dbg !119
  %182 = sext i8 %181 to i32, !dbg !119
  %183 = icmp eq i32 %182, 47, !dbg !119
  br i1 %183, label %115, label %184, !dbg !119

; <label>:184                                     ; preds = %180
  %185 = load i8* %175, align 1, !dbg !120
  %186 = sext i8 %185 to i32, !dbg !120
  %187 = icmp eq i32 %186, 42, !dbg !120
  br i1 %187, label %188, label %191, !dbg !120

; <label>:188                                     ; preds = %184
  %189 = getelementptr inbounds i8* %175, i32 1, !dbg !121
  %190 = add i8 %176, 1, !dbg !123
  br label %140, !dbg !124

; <label>:191                                     ; preds = %184, %170
  %line_pointer.2 = phi i8* [ %175, %184 ], [ %line_pointer.0, %170 ]
  %place.3 = phi i8 [ %176, %184 ], [ %place.1, %170 ]
  %192 = icmp eq i32 %line_already_counted.0, 0, !dbg !125
  br i1 %192, label %193, label %195, !dbg !125

; <label>:193                                     ; preds = %191
  %194 = add nsw i32 %lines_of_code.1, 1, !dbg !126
  br label %195, !dbg !128

; <label>:195                                     ; preds = %193, %191
  %line_already_counted.1 = phi i32 [ 1, %193 ], [ %line_already_counted.0, %191 ]
  %lines_of_code.2 = phi i32 [ %194, %193 ], [ %lines_of_code.1, %191 ]
  %196 = getelementptr inbounds i8* %line_pointer.2, i32 1, !dbg !129
  %197 = add i8 %place.3, 1, !dbg !130
  br label %140, !dbg !131

.critedge:                                        ; preds = %119, %115
  %198 = call i32 @fclose(%struct.__sFILE* %107), !dbg !132
  %199 = icmp ne i32 %198, 0, !dbg !132
  br i1 %199, label %200, label %202, !dbg !132

; <label>:200                                     ; preds = %.critedge
  %201 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str16, i32 0, i32 0)), !dbg !133
  br label %232, !dbg !135

; <label>:202                                     ; preds = %.critedge
  %203 = sext i8 %place.0 to i32, !dbg !136
  %204 = load i8* %max_line_length, align 1, !dbg !136
  %205 = sext i8 %204 to i32, !dbg !136
  %206 = icmp sgt i32 %203, %205, !dbg !136
  br i1 %206, label %207, label %214, !dbg !136

; <label>:207                                     ; preds = %202
  %208 = load i8* %max_line_length, align 1, !dbg !137
  %209 = sext i8 %208 to i32, !dbg !137
  %210 = sext i8 %place.0 to i32, !dbg !137
  %211 = sub nsw i32 %209, %210, !dbg !137
  %212 = icmp ule i32 %211, 0, !dbg !139
  br i1 %212, label %214, label %213, !dbg !139

; <label>:213                                     ; preds = %207
  br label %214

; <label>:214                                     ; preds = %213, %207, %202
  %output_data_index.0 = phi i32 [ 1, %207 ], [ 0, %213 ], [ 1, %202 ]
  %215 = call i64 @llvm.objectsize.i64(i8* %33, i1 false), !dbg !140
  %216 = sext i32 %output_data_index.0 to i64, !dbg !140
  %217 = getelementptr inbounds i8** %6, i64 %216, !dbg !140
  %218 = load i8** %217, align 8, !dbg !140
  %219 = call i32 (i8*, i64, i32, i64, i8*, ...)* @__snprintf_chk(i8* %33, i64 256, i32 0, i64 %215, i8* getelementptr inbounds ([6 x i8]* @.str8, i32 0, i32 0), i8* %218, i32 %lines_of_code.0), !dbg !140
  %220 = getelementptr inbounds i8* %33, i64 255, !dbg !141
  store i8 0, i8* %220, align 1, !dbg !141
  %221 = call i32 @remove(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0)), !dbg !142
  br label %222, !dbg !143

; <label>:222                                     ; preds = %227, %214
  %223 = getelementptr inbounds i8* %33, i64 0, !dbg !143
  %224 = load i8* %223, align 1, !dbg !143
  %225 = sext i8 %224 to i32, !dbg !143
  %226 = icmp ne i32 %225, 0, !dbg !143
  br i1 %226, label %227, label %229, !dbg !143

; <label>:227                                     ; preds = %222
  %228 = call i32 @"\01_sleep"(i32 1), !dbg !144
  br label %222, !dbg !146

; <label>:229                                     ; preds = %222
  %230 = call i32 @shmdt(i8* %33), !dbg !147
  %231 = call i32 @"\01_shmctl"(i32 %28, i32 0, %struct.__shmid_ds_new* null), !dbg !148
  br label %232, !dbg !149

; <label>:232                                     ; preds = %229, %200, %109, %102, %87, %79, %14
  %.0 = phi i32 [ 1, %14 ], [ 1, %109 ], [ 1, %200 ], [ 0, %229 ], [ 1, %79 ], [ 1, %87 ], [ 1, %102 ]
  call void @llvm.stackrestore(i8* %3), !dbg !150
  ret i32 %.0, !dbg !151
}

declare i8* @llvm.stacksave() nounwind

declare i8* @malloc(i64)

declare i32 @printf(i8*, ...)

declare void @exit(i32) noreturn

declare i64 @strtol(i8*, i8**, i32)

declare i32 @shmget(i32, i64, i32)

declare i8* @shmat(i32, i8*, i32)

declare i32 @access(i8*, i32)

declare i32 @"\01_sleep"(i32)

declare i32 @sscanf(i8*, i8*, ...)

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i64 @strlen(i8*)

define internal i32 @isspace(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !152
  %1 = call i32 @__istype(i32 %_c1, i64 16384), !dbg !153, !intrange !109
  ret i32 %1, !dbg !153
}

declare i32 @fclose(%struct.__sFILE*)

declare i32 @__snprintf_chk(i8*, i64, i32, i64, i8*, ...)

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i32 @remove(i8*)

declare i32 @shmdt(i8*)

declare i32 @"\01_shmctl"(i32, i32, %struct.__shmid_ds_new*)

declare void @llvm.stackrestore(i8*) nounwind

define internal i32 @__istype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !155, !intrange !156
  %_c1 = call i32 @kint_arg.i32(), !id !157
  %1 = call i32 @isascii(i32 %_c1), !dbg !158, !intrange !109
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

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"CountLinesServer.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !13, metadata !17, metadata !22}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 47, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 48} ; [ DW_TAG_subprogram ] [line 47] [def] [scope 48] [main]
!6 = metadata !{i32 786473, metadata !"CountLinesServer.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isspace", metadata !"isspace", metadata !"", metadata !14, i32 284, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isspace, null, null, metadata !1, i32 285} ; [ DW_TAG_subprogram ] [line 284] [local] [def] [scope 285] [isspace]
!14 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint", null} ; [ DW_TAG_file_type ]
!15 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{metadata !9, metadata !9}
!17 = metadata !{i32 786478, i32 0, metadata !14, metadata !"__istype", metadata !"__istype", metadata !"", metadata !14, i32 170, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__istype, null, null, metadata !1, i32 171} ; [ DW_TAG_subprogram ] [line 170] [local] [def] [scope 171] [__istype]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !9, metadata !20, metadata !21}
!20 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !14, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!21 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!22 = metadata !{i32 786478, i32 0, metadata !14, metadata !"isascii", metadata !"isascii", metadata !"", metadata !14, i32 152, metadata !15, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isascii, null, null, metadata !1, i32 153} ; [ DW_TAG_subprogram ] [line 152] [local] [def] [scope 153] [isascii]
!23 = metadata !{metadata !"arg.main.0"}
!24 = metadata !{i32 59, i32 22, metadata !25, null}
!25 = metadata !{i32 786443, metadata !5, i32 48, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!26 = metadata !{i32 80, i32 25, metadata !25, null}
!27 = metadata !{i32 81, i32 2, metadata !25, null}
!28 = metadata !{i32 83, i32 6, metadata !29, null}
!29 = metadata !{i32 786443, metadata !25, i32 82, i32 4, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!30 = metadata !{i32 84, i32 6, metadata !29, null}
!31 = metadata !{i32 86, i32 2, metadata !25, null}
!32 = metadata !{i32 87, i32 2, metadata !25, null}
!33 = metadata !{i32 96, i32 2, metadata !25, null}
!34 = metadata !{i32 98, i32 3, metadata !35, null}
!35 = metadata !{i32 786443, metadata !25, i32 97, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!36 = metadata !{i32 99, i32 3, metadata !35, null}
!37 = metadata !{i32 103, i32 14, metadata !25, null}
!38 = metadata !{i32 106, i32 3, metadata !25, null}
!39 = metadata !{i32 108, i32 7, metadata !40, null}
!40 = metadata !{i32 786443, metadata !25, i32 107, i32 5, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!41 = metadata !{i32 109, i32 7, metadata !40, null}
!42 = metadata !{i32 113, i32 23, metadata !25, null}
!43 = metadata !{i32 115, i32 7, metadata !44, null}
!44 = metadata !{i32 786443, metadata !25, i32 114, i32 5, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!45 = metadata !{i32 116, i32 7, metadata !44, null}
!46 = metadata !{i32 119, i32 9, metadata !25, null}
!47 = metadata !{i32 120, i32 3, metadata !25, null}
!48 = metadata !{i32 122, i32 7, metadata !49, null}
!49 = metadata !{i32 786443, metadata !25, i32 121, i32 5, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!50 = metadata !{i32 123, i32 7, metadata !49, null}
!51 = metadata !{i32 128, i32 9, metadata !25, null}
!52 = metadata !{i32 130, i32 5, metadata !53, null}
!53 = metadata !{i32 786443, metadata !25, i32 129, i32 5, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!54 = metadata !{i32 131, i32 5, metadata !53, null}
!55 = metadata !{i32 133, i32 3, metadata !25, null}
!56 = metadata !{i32 137, i32 3, metadata !25, null}
!57 = metadata !{i32 139, i32 3, metadata !25, null}
!58 = metadata !{i32 143, i32 2, metadata !25, null}
!59 = metadata !{i32 145, i32 6, metadata !60, null}
!60 = metadata !{i32 786443, metadata !25, i32 144, i32 4, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!61 = metadata !{i32 146, i32 6, metadata !60, null}
!62 = metadata !{i32 150, i32 7, metadata !63, null}
!63 = metadata !{i32 786443, metadata !25, i32 150, i32 2, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!64 = metadata !{i32 152, i32 3, metadata !65, null}
!65 = metadata !{i32 786443, metadata !63, i32 151, i32 2, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!66 = metadata !{i32 154, i32 3, metadata !65, null}
!67 = metadata !{i32 156, i32 5, metadata !68, null}
!68 = metadata !{i32 786443, metadata !65, i32 155, i32 4, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!69 = metadata !{i32 157, i32 5, metadata !68, null}
!70 = metadata !{i32 160, i32 3, metadata !65, null}
!71 = metadata !{i32 162, i32 4, metadata !72, null}
!72 = metadata !{i32 786443, metadata !65, i32 161, i32 3, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!73 = metadata !{i32 163, i32 4, metadata !72, null}
!74 = metadata !{i32 166, i32 3, metadata !65, null}
!75 = metadata !{i32 168, i32 4, metadata !76, null}
!76 = metadata !{i32 786443, metadata !65, i32 167, i32 3, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!77 = metadata !{i32 169, i32 4, metadata !76, null}
!78 = metadata !{i32 150, i32 17, metadata !63, null}
!79 = metadata !{i32 174, i32 7, metadata !25, null}
!80 = metadata !{i32 175, i32 2, metadata !25, null}
!81 = metadata !{i32 177, i32 3, metadata !82, null}
!82 = metadata !{i32 786443, metadata !25, i32 176, i32 2, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!83 = metadata !{i32 178, i32 3, metadata !82, null}
!84 = metadata !{i32 181, i32 2, metadata !25, null}
!85 = metadata !{i32 192, i32 2, metadata !25, null}
!86 = metadata !{i32 194, i32 2, metadata !25, null}
!87 = metadata !{i32 194, i32 11, metadata !25, null}
!88 = metadata !{i32 196, i32 3, metadata !89, null}
!89 = metadata !{i32 786443, metadata !25, i32 195, i32 2, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!90 = metadata !{i32 206, i32 12, metadata !89, null}
!91 = metadata !{i32 206, i32 42, metadata !89, null}
!92 = metadata !{i32 210, i32 3, metadata !89, null}
!93 = metadata !{i32 215, i32 3, metadata !89, null}
!94 = metadata !{i32 220, i32 4, metadata !95, null}
!95 = metadata !{i32 786443, metadata !89, i32 216, i32 3, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!96 = metadata !{i32 222, i32 5, metadata !97, null}
!97 = metadata !{i32 786443, metadata !95, i32 221, i32 4, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!98 = metadata !{i32 228, i32 6, metadata !99, null}
!99 = metadata !{i32 786443, metadata !97, i32 223, i32 5, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!100 = metadata !{i32 229, i32 6, metadata !99, null}
!101 = metadata !{i32 230, i32 6, metadata !99, null}
!102 = metadata !{i32 232, i32 6, metadata !99, null}
!103 = metadata !{i32 239, i32 6, metadata !104, null}
!104 = metadata !{i32 786443, metadata !99, i32 233, i32 6, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!105 = metadata !{i32 242, i32 5, metadata !97, null}
!106 = metadata !{i32 243, i32 5, metadata !97, null}
!107 = metadata !{i32 244, i32 5, metadata !97, null}
!108 = metadata !{i32 250, i32 8, metadata !95, null}
!109 = metadata !{i32 0, i32 2}
!110 = metadata !{i32 252, i32 5, metadata !111, null}
!111 = metadata !{i32 786443, metadata !95, i32 251, i32 4, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!112 = metadata !{i32 253, i32 5, metadata !111, null}
!113 = metadata !{i32 254, i32 5, metadata !111, null}
!114 = metadata !{i32 262, i32 4, metadata !95, null}
!115 = metadata !{i32 268, i32 5, metadata !116, null}
!116 = metadata !{i32 786443, metadata !95, i32 263, i32 4, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!117 = metadata !{i32 269, i32 5, metadata !116, null}
!118 = metadata !{i32 270, i32 5, metadata !116, null}
!119 = metadata !{i32 275, i32 5, metadata !116, null}
!120 = metadata !{i32 284, i32 5, metadata !116, null}
!121 = metadata !{i32 287, i32 6, metadata !122, null}
!122 = metadata !{i32 786443, metadata !116, i32 285, i32 5, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!123 = metadata !{i32 288, i32 6, metadata !122, null}
!124 = metadata !{i32 289, i32 6, metadata !122, null}
!125 = metadata !{i32 300, i32 4, metadata !95, null}
!126 = metadata !{i32 303, i32 5, metadata !127, null}
!127 = metadata !{i32 786443, metadata !95, i32 301, i32 4, metadata !6, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!128 = metadata !{i32 305, i32 4, metadata !127, null}
!129 = metadata !{i32 310, i32 4, metadata !95, null}
!130 = metadata !{i32 311, i32 4, metadata !95, null}
!131 = metadata !{i32 312, i32 3, metadata !95, null}
!132 = metadata !{i32 317, i32 7, metadata !25, null}
!133 = metadata !{i32 319, i32 3, metadata !134, null}
!134 = metadata !{i32 786443, metadata !25, i32 318, i32 3, metadata !6, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!135 = metadata !{i32 320, i32 3, metadata !134, null}
!136 = metadata !{i32 323, i32 3, metadata !25, null}
!137 = metadata !{i32 325, i32 7, metadata !138, null}
!138 = metadata !{i32 786443, metadata !25, i32 324, i32 5, metadata !6, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!139 = metadata !{i32 329, i32 14, metadata !138, null}
!140 = metadata !{i32 347, i32 3, metadata !25, null}
!141 = metadata !{i32 348, i32 3, metadata !25, null}
!142 = metadata !{i32 350, i32 3, metadata !25, null}
!143 = metadata !{i32 353, i32 3, metadata !25, null}
!144 = metadata !{i32 355, i32 5, metadata !145, null}
!145 = metadata !{i32 786443, metadata !25, i32 354, i32 5, metadata !6, i32 27} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint/CountLinesServer.c]
!146 = metadata !{i32 356, i32 5, metadata !145, null}
!147 = metadata !{i32 358, i32 3, metadata !25, null}
!148 = metadata !{i32 359, i32 3, metadata !25, null}
!149 = metadata !{i32 361, i32 3, metadata !25, null}
!150 = metadata !{i32 362, i32 1, metadata !25, null}
!151 = metadata !{i32 362, i32 1, metadata !5, null}
!152 = metadata !{metadata !"arg._kint.isspace.0"}
!153 = metadata !{i32 286, i32 10, metadata !154, null}
!154 = metadata !{i32 786443, metadata !13, i32 285, i32 1, metadata !14, i32 28} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint//usr/include/ctype.h]
!155 = metadata !{metadata !"arg._kint.__istype.1"}
!156 = metadata !{i64 16384, i64 16385}
!157 = metadata !{metadata !"arg._kint.__istype.0"}
!158 = metadata !{i32 175, i32 10, metadata !159, null}
!159 = metadata !{i32 786443, metadata !17, i32 171, i32 1, metadata !14, i32 29} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint//usr/include/ctype.h]
!160 = metadata !{i32 176, i32 7, metadata !159, null}
!161 = metadata !{metadata !"arg._kint.isascii.0"}
!162 = metadata !{i32 154, i32 2, metadata !163, null}
!163 = metadata !{i32 786443, metadata !22, i32 153, i32 1, metadata !14, i32 30} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_194_vx80/src/kint//usr/include/ctype.h]
