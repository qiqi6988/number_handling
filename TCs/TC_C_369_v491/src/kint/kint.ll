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

@PC = global i32 0, align 4
@A = global i32 0, align 4
@B = global i32 0, align 4
@sigA = global i32 1, align 4
@sigB = global i32 1, align 4
@C = global i32 0, align 4
@programMemory = common global [1000 x [2 x i32]] zeroinitializer, align 16
@dataMemory = common global [1000 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"LOAD\00", align 1
@.str3 = private unnamed_addr constant [6 x i8] c"STORE\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"ADD\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"SUB\00", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"JNZ\00", align 1
@.str7 = private unnamed_addr constant [5 x i8] c"CONS\00", align 1
@.str8 = private unnamed_addr constant [5 x i8] c"STOP\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"DIV\00", align 1
@.str10 = private unnamed_addr constant [51 x i8] c"Estimated string length exceeded before finding %c\00", align 1
@.str11 = private unnamed_addr constant [20 x i8] c"%c not found in %s\0A\00", align 1
@.str12 = private unnamed_addr constant [16 x i8] c"No more memory\0A\00", align 1
@.str13 = private unnamed_addr constant [32 x i8] c"give progam file name argument\0A\00", align 1
@.str14 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str15 = private unnamed_addr constant [17 x i8] c"No program file\0A\00", align 1
@.str16 = private unnamed_addr constant [6 x i8] c"%s %s\00", align 1
@.str17 = private unnamed_addr constant [17 x i8] c"Bad instruction\0A\00", align 1
@_DefaultRuneLocale = external global %struct._RuneLocale

define i32 @signum(i32 %x) nounwind uwtable ssp {
  %x1 = call i32 @kint_arg.i32(), !id !55, !intrange !56
  %1 = icmp slt i32 %x1, 0, !dbg !57
  br i1 %1, label %2, label %3, !dbg !57

; <label>:2                                       ; preds = %0
  br label %3, !dbg !59

; <label>:3                                       ; preds = %2, %0
  %y.0 = phi i32 [ -1, %2 ], [ 1, %0 ]
  ret i32 %y.0, !dbg !61
}

define i32 @execute() nounwind uwtable ssp {
  store i32 0, i32* @PC, align 4, !dbg !62, !id !64
  br label %1, !dbg !65

; <label>:1                                       ; preds = %81, %79, %74, %57, %32, %21, %10, %0
  %2 = load i32* @PC, align 4, !dbg !65, !id !64
  %3 = icmp sle i32 %2, 1000, !dbg !65
  br i1 %3, label %4, label %115, !dbg !65

; <label>:4                                       ; preds = %1
  %5 = load i32* @PC, align 4, !dbg !66, !id !64
  %6 = sext i32 %5 to i64, !dbg !66
  %7 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %6, !dbg !66
  %8 = getelementptr inbounds [2 x i32]* %7, i32 0, i64 0, !dbg !66
  %9 = load i32* %8, align 4, !dbg !66
  switch i32 %9, label %114 [
    i32 1, label %10
    i32 2, label %21
    i32 3, label %32
    i32 4, label %45
    i32 5, label %70
    i32 6, label %81
    i32 7, label %89
    i32 8, label %92
  ], !dbg !66

; <label>:10                                      ; preds = %4
  %11 = load i32* @PC, align 4, !dbg !68, !id !64
  %12 = sext i32 %11 to i64, !dbg !68
  %13 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %12, !dbg !68
  %14 = getelementptr inbounds [2 x i32]* %13, i32 0, i64 1, !dbg !68
  %15 = load i32* %14, align 4, !dbg !68
  %16 = sext i32 %15 to i64, !dbg !68
  %17 = getelementptr inbounds [1000 x i32]* @dataMemory, i32 0, i64 %16, !dbg !68
  %18 = load i32* %17, align 4, !dbg !68
  store i32 %18, i32* @A, align 4, !dbg !68, !id !70
  %19 = load i32* @PC, align 4, !dbg !71, !id !64
  %20 = add nsw i32 %19, 1, !dbg !71
  store i32 %20, i32* @PC, align 4, !dbg !71, !id !64
  br label %1, !dbg !72

; <label>:21                                      ; preds = %4
  %22 = load i32* @A, align 4, !dbg !73, !id !70, !intrange !56
  %23 = load i32* @PC, align 4, !dbg !73, !id !64
  %24 = sext i32 %23 to i64, !dbg !73
  %25 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %24, !dbg !73
  %26 = getelementptr inbounds [2 x i32]* %25, i32 0, i64 1, !dbg !73
  %27 = load i32* %26, align 4, !dbg !73
  %28 = sext i32 %27 to i64, !dbg !73
  %29 = getelementptr inbounds [1000 x i32]* @dataMemory, i32 0, i64 %28, !dbg !73
  store i32 %22, i32* %29, align 4, !dbg !73
  %30 = load i32* @PC, align 4, !dbg !74, !id !64
  %31 = add nsw i32 %30, 1, !dbg !74
  store i32 %31, i32* @PC, align 4, !dbg !74, !id !64
  br label %1, !dbg !75

; <label>:32                                      ; preds = %4
  %33 = load i32* @PC, align 4, !dbg !76, !id !64
  %34 = sext i32 %33 to i64, !dbg !76
  %35 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %34, !dbg !76
  %36 = getelementptr inbounds [2 x i32]* %35, i32 0, i64 1, !dbg !76
  %37 = load i32* %36, align 4, !dbg !76
  %38 = sext i32 %37 to i64, !dbg !76
  %39 = getelementptr inbounds [1000 x i32]* @dataMemory, i32 0, i64 %38, !dbg !76
  %40 = load i32* %39, align 4, !dbg !76
  %41 = load i32* @A, align 4, !dbg !76, !id !70, !intrange !56
  %42 = add nsw i32 %41, %40, !dbg !76
  store i32 %42, i32* @A, align 4, !dbg !76, !id !70
  %43 = load i32* @PC, align 4, !dbg !77, !id !64
  %44 = add nsw i32 %43, 1, !dbg !77
  store i32 %44, i32* @PC, align 4, !dbg !77, !id !64
  br label %1, !dbg !78

; <label>:45                                      ; preds = %4
  %46 = load i32* @A, align 4, !dbg !79, !id !70, !intrange !56
  %47 = load i32* @PC, align 4, !dbg !79, !id !64
  %48 = sext i32 %47 to i64, !dbg !79
  %49 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %48, !dbg !79
  %50 = getelementptr inbounds [2 x i32]* %49, i32 0, i64 1, !dbg !79
  %51 = load i32* %50, align 4, !dbg !79
  %52 = sext i32 %51 to i64, !dbg !79
  %53 = getelementptr inbounds [1000 x i32]* @dataMemory, i32 0, i64 %52, !dbg !79
  %54 = load i32* %53, align 4, !dbg !79
  %55 = icmp slt i32 %46, %54, !dbg !79
  br i1 %55, label %56, label %57, !dbg !79

; <label>:56                                      ; preds = %45
  br label %116, !dbg !80

; <label>:57                                      ; preds = %45
  %58 = load i32* @PC, align 4, !dbg !82, !id !64
  %59 = sext i32 %58 to i64, !dbg !82
  %60 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %59, !dbg !82
  %61 = getelementptr inbounds [2 x i32]* %60, i32 0, i64 1, !dbg !82
  %62 = load i32* %61, align 4, !dbg !82
  %63 = sext i32 %62 to i64, !dbg !82
  %64 = getelementptr inbounds [1000 x i32]* @dataMemory, i32 0, i64 %63, !dbg !82
  %65 = load i32* %64, align 4, !dbg !82
  %66 = load i32* @A, align 4, !dbg !82, !id !70, !intrange !56
  %67 = sub nsw i32 %66, %65, !dbg !82
  store i32 %67, i32* @A, align 4, !dbg !82, !id !70
  %68 = load i32* @PC, align 4, !dbg !83, !id !64
  %69 = add nsw i32 %68, 1, !dbg !83
  store i32 %69, i32* @PC, align 4, !dbg !83, !id !64
  br label %1, !dbg !84

; <label>:70                                      ; preds = %4
  %71 = load i32* @A, align 4, !dbg !85, !id !70, !intrange !56
  %72 = icmp ne i32 %71, 0, !dbg !85
  %73 = load i32* @PC, align 4, !dbg !86, !id !64
  br i1 %72, label %74, label %79, !dbg !85

; <label>:74                                      ; preds = %70
  %75 = sext i32 %73 to i64, !dbg !86
  %76 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %75, !dbg !86
  %77 = getelementptr inbounds [2 x i32]* %76, i32 0, i64 1, !dbg !86
  %78 = load i32* %77, align 4, !dbg !86
  store i32 %78, i32* @PC, align 4, !dbg !86, !id !64
  br label %1, !dbg !88

; <label>:79                                      ; preds = %70
  %80 = add nsw i32 %73, 1, !dbg !89
  store i32 %80, i32* @PC, align 4, !dbg !89, !id !64
  br label %1

; <label>:81                                      ; preds = %4
  %82 = load i32* @PC, align 4, !dbg !91, !id !64
  %83 = sext i32 %82 to i64, !dbg !91
  %84 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %83, !dbg !91
  %85 = getelementptr inbounds [2 x i32]* %84, i32 0, i64 1, !dbg !91
  %86 = load i32* %85, align 4, !dbg !91
  store i32 %86, i32* @A, align 4, !dbg !91, !id !70
  %87 = load i32* @PC, align 4, !dbg !92, !id !64
  %88 = add nsw i32 %87, 1, !dbg !92
  store i32 %88, i32* @PC, align 4, !dbg !92, !id !64
  br label %1, !dbg !93

; <label>:89                                      ; preds = %4
  %90 = load i32* @A, align 4, !dbg !94, !id !70, !intrange !56
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %90), !dbg !94
  br label %116, !dbg !95

; <label>:92                                      ; preds = %4
  %93 = load i32* @PC, align 4, !dbg !96, !id !64
  %94 = sext i32 %93 to i64, !dbg !96
  %95 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %94, !dbg !96
  %96 = getelementptr inbounds [2 x i32]* %95, i32 0, i64 1, !dbg !96
  %97 = load i32* %96, align 4, !dbg !96
  %98 = sext i32 %97 to i64, !dbg !96
  %99 = getelementptr inbounds [1000 x i32]* @dataMemory, i32 0, i64 %98, !dbg !96
  %100 = load i32* %99, align 4, !dbg !96
  store i32 %100, i32* @B, align 4, !dbg !96, !id !97
  %101 = load i32* @A, align 4, !dbg !98, !id !70, !intrange !56
  %102 = call i32 @signum(i32 %101), !dbg !98, !intrange !99
  store i32 %102, i32* @sigA, align 4, !dbg !98, !id !100
  %103 = load i32* @B, align 4, !dbg !101, !id !97, !intrange !56
  %104 = call i32 @signum(i32 %103), !dbg !101, !intrange !99
  store i32 %104, i32* @sigB, align 4, !dbg !101, !id !102
  %105 = load i32* @sigA, align 4, !dbg !103, !id !100, !intrange !99
  %106 = load i32* @A, align 4, !dbg !103, !id !70, !intrange !56
  %107 = mul nsw i32 %105, %106, !dbg !103
  store i32 %107, i32* @A, align 4, !dbg !103, !id !70
  %108 = load i32* @sigB, align 4, !dbg !104, !id !102, !intrange !99
  %109 = load i32* @B, align 4, !dbg !104, !id !97, !intrange !56
  %110 = mul nsw i32 %108, %109, !dbg !104
  store i32 %110, i32* @B, align 4, !dbg !104, !id !97
  %111 = load i32* @A, align 4, !dbg !105, !id !70, !intrange !56
  %112 = load i32* @B, align 4, !dbg !105, !id !97, !intrange !56
  %113 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %111, i32 %112), !dbg !105
  call void @exit(i32 1) noreturn, !dbg !106
  unreachable, !dbg !106

; <label>:114                                     ; preds = %4
  br label %116, !dbg !107

; <label>:115                                     ; preds = %1
  br label %116, !dbg !108

; <label>:116                                     ; preds = %115, %114, %89, %56
  %.0 = phi i32 [ 0, %114 ], [ 1, %89 ], [ 0, %56 ], [ 0, %115 ]
  ret i32 %.0, !dbg !109
}

declare i32 @printf(i8*, ...)

declare void @exit(i32) noreturn

define i32 @getInstruction(i8* %inst) nounwind uwtable ssp {
  %1 = call i64 @strlen(i8* %inst), !dbg !110
  %2 = icmp ugt i64 %1, 5, !dbg !110
  br i1 %2, label %3, label %4, !dbg !110

; <label>:3                                       ; preds = %0
  br label %37, !dbg !112

; <label>:4                                       ; preds = %0
  %5 = call i32 @strcmp(i8* %inst, i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0)), !dbg !114
  %6 = icmp eq i32 %5, 0, !dbg !114
  br i1 %6, label %7, label %8, !dbg !114

; <label>:7                                       ; preds = %4
  br label %37, !dbg !115

; <label>:8                                       ; preds = %4
  %9 = call i32 @strcmp(i8* %inst, i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0)), !dbg !117
  %10 = icmp eq i32 %9, 0, !dbg !117
  br i1 %10, label %11, label %12, !dbg !117

; <label>:11                                      ; preds = %8
  br label %37, !dbg !118

; <label>:12                                      ; preds = %8
  %13 = call i32 @strcmp(i8* %inst, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0)), !dbg !120
  %14 = icmp eq i32 %13, 0, !dbg !120
  br i1 %14, label %15, label %16, !dbg !120

; <label>:15                                      ; preds = %12
  br label %37, !dbg !121

; <label>:16                                      ; preds = %12
  %17 = call i32 @strcmp(i8* %inst, i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0)), !dbg !123
  %18 = icmp eq i32 %17, 0, !dbg !123
  br i1 %18, label %19, label %20, !dbg !123

; <label>:19                                      ; preds = %16
  br label %37, !dbg !124

; <label>:20                                      ; preds = %16
  %21 = call i32 @strcmp(i8* %inst, i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0)), !dbg !126
  %22 = icmp eq i32 %21, 0, !dbg !126
  br i1 %22, label %23, label %24, !dbg !126

; <label>:23                                      ; preds = %20
  br label %37, !dbg !127

; <label>:24                                      ; preds = %20
  %25 = call i32 @strcmp(i8* %inst, i8* getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0)), !dbg !129
  %26 = icmp eq i32 %25, 0, !dbg !129
  br i1 %26, label %27, label %28, !dbg !129

; <label>:27                                      ; preds = %24
  br label %37, !dbg !130

; <label>:28                                      ; preds = %24
  %29 = call i32 @strcmp(i8* %inst, i8* getelementptr inbounds ([5 x i8]* @.str8, i32 0, i32 0)), !dbg !132
  %30 = icmp eq i32 %29, 0, !dbg !132
  br i1 %30, label %31, label %32, !dbg !132

; <label>:31                                      ; preds = %28
  br label %37, !dbg !133

; <label>:32                                      ; preds = %28
  %33 = call i32 @strcmp(i8* %inst, i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0)), !dbg !135
  %34 = icmp eq i32 %33, 0, !dbg !135
  br i1 %34, label %35, label %36, !dbg !135

; <label>:35                                      ; preds = %32
  br label %37, !dbg !136

; <label>:36                                      ; preds = %32
  br label %37, !dbg !138

; <label>:37                                      ; preds = %36, %35, %31, %27, %23, %19, %15, %11, %7, %3
  %.0 = phi i32 [ 0, %3 ], [ 1, %7 ], [ 2, %11 ], [ 3, %15 ], [ 4, %19 ], [ 5, %23 ], [ 6, %27 ], [ 7, %31 ], [ 8, %35 ], [ 0, %36 ]
  ret i32 %.0, !dbg !140
}

declare i64 @strlen(i8*)

declare i32 @strcmp(i8*, i8*)

define i32 @allDigits(i8* %s) nounwind uwtable ssp {
  %1 = call i64 @strlen(i8* %s), !dbg !141
  %2 = trunc i64 %1 to i32, !dbg !141
  br label %3, !dbg !143

; <label>:3                                       ; preds = %13, %0
  %i.0 = phi i32 [ 0, %0 ], [ %14, %13 ]
  %4 = icmp slt i32 %i.0, %2, !dbg !143
  br i1 %4, label %5, label %15, !dbg !143

; <label>:5                                       ; preds = %3
  %6 = sext i32 %i.0 to i64, !dbg !145
  %7 = getelementptr inbounds i8* %s, i64 %6, !dbg !145
  %8 = load i8* %7, align 1, !dbg !145
  %9 = sext i8 %8 to i32, !dbg !145
  %10 = call i32 @isdigit(i32 %9), !dbg !145, !intrange !147
  %11 = icmp ne i32 %10, 0, !dbg !145
  br i1 %11, label %13, label %12, !dbg !145

; <label>:12                                      ; preds = %5
  br label %16, !dbg !148

; <label>:13                                      ; preds = %5
  %14 = add nsw i32 %i.0, 1, !dbg !150
  br label %3, !dbg !150

; <label>:15                                      ; preds = %3
  br label %16, !dbg !151

; <label>:16                                      ; preds = %15, %12
  %.0 = phi i32 [ 0, %12 ], [ 1, %15 ]
  ret i32 %.0, !dbg !152
}

define internal i32 @isdigit(i32 %_c) nounwind uwtable inlinehint ssp {
  %_c1 = call i32 @kint_arg.i32(), !id !153
  %1 = call i32 @__isctype(i32 %_c1, i64 1024), !dbg !154, !intrange !147
  ret i32 %1, !dbg !154
}

define i32 @getArgument(i8* %arg) nounwind uwtable ssp {
  %1 = call i64 @strlen(i8* %arg), !dbg !156
  %2 = icmp ugt i64 %1, 0, !dbg !156
  br i1 %2, label %3, label %11, !dbg !156

; <label>:3                                       ; preds = %0
  %4 = call i32 @allDigits(i8* %arg), !dbg !158, !intrange !147
  %5 = icmp ne i32 %4, 0, !dbg !158
  br i1 %5, label %6, label %11, !dbg !158

; <label>:6                                       ; preds = %3
  %7 = call double @atof(i8* %arg), !dbg !159
  %8 = fcmp ole double %7, 0x41DFFFFFFFC00000, !dbg !161
  br i1 %8, label %9, label %11, !dbg !161

; <label>:9                                       ; preds = %6
  %10 = call i32 @atoi(i8* %arg), !dbg !162
  br label %12, !dbg !162

; <label>:11                                      ; preds = %6, %3, %0
  br label %12, !dbg !164

; <label>:12                                      ; preds = %11, %9
  %.0 = phi i32 [ %10, %9 ], [ -1, %11 ]
  ret i32 %.0, !dbg !165
}

declare double @atof(i8*)

declare i32 @atoi(i8*)

define i32 @indexOf(i8* %s, i8 signext %c, i32 %sLengthEstimate, i32 %errorExit) nounwind uwtable ssp {
  %errorExit3 = call i32 @kint_arg.i32(), !id !166, !intrange !56
  %sLengthEstimate2 = call i32 @kint_arg.i32(), !id !167, !intrange !168
  %c1 = call i8 @kint_arg.i8(), !id !169, !intrange !170
  br label %1, !dbg !171

; <label>:1                                       ; preds = %21, %0
  %.01 = phi i32 [ %sLengthEstimate2, %0 ], [ %16, %21 ]
  %index.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = sext i32 %index.0 to i64, !dbg !171
  %3 = getelementptr inbounds i8* %s, i64 %2, !dbg !171
  %4 = load i8* %3, align 1, !dbg !171
  %5 = sext i8 %4 to i32, !dbg !171
  %6 = icmp ne i32 %5, 0, !dbg !171
  br i1 %6, label %7, label %23, !dbg !171

; <label>:7                                       ; preds = %1
  %8 = sext i32 %index.0 to i64, !dbg !173
  %9 = getelementptr inbounds i8* %s, i64 %8, !dbg !173
  %10 = load i8* %9, align 1, !dbg !173
  %11 = sext i8 %10 to i32, !dbg !173
  %12 = sext i8 %c1 to i32, !dbg !173
  %13 = icmp eq i32 %11, %12, !dbg !173
  br i1 %13, label %14, label %15, !dbg !173

; <label>:14                                      ; preds = %7
  br label %29, !dbg !175

; <label>:15                                      ; preds = %7
  %16 = add nsw i32 %.01, -1, !dbg !177
  %17 = icmp eq i32 %16, 0, !dbg !178
  br i1 %17, label %18, label %21, !dbg !178

; <label>:18                                      ; preds = %15
  %19 = sext i8 %c1 to i32, !dbg !179
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str10, i32 0, i32 0), i32 %19), !dbg !179
  call void @exit(i32 -1) noreturn, !dbg !181
  unreachable, !dbg !181

; <label>:21                                      ; preds = %15
  %22 = add nsw i32 %index.0, 1, !dbg !182
  br label %1, !dbg !183

; <label>:23                                      ; preds = %1
  %24 = icmp ne i32 %errorExit3, 0, !dbg !184
  br i1 %24, label %25, label %28, !dbg !184

; <label>:25                                      ; preds = %23
  %26 = sext i8 %c1 to i32, !dbg !185
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str11, i32 0, i32 0), i32 %26, i8* %s), !dbg !185
  call void @exit(i32 -1) noreturn, !dbg !187
  unreachable, !dbg !187

; <label>:28                                      ; preds = %23
  br label %29, !dbg !188

; <label>:29                                      ; preds = %28, %14
  %.0 = phi i32 [ %index.0, %14 ], [ -1, %28 ]
  ret i32 %.0, !dbg !190
}

define void @dump(i32 %numLocations) nounwind uwtable ssp {
  %numLocations1 = call i32 @kint_arg.i32(), !id !191
  br label %1, !dbg !192

; <label>:1                                       ; preds = %7, %0
  %i.0 = phi i32 [ 0, %0 ], [ %8, %7 ]
  %2 = icmp slt i32 %i.0, %numLocations1, !dbg !192
  br i1 %2, label %3, label %9, !dbg !192

; <label>:3                                       ; preds = %1
  %4 = icmp sgt i32 %i.0, 999, !dbg !195
  br i1 %4, label %5, label %7, !dbg !195

; <label>:5                                       ; preds = %3
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str12, i32 0, i32 0)), !dbg !197
  br label %9, !dbg !199

; <label>:7                                       ; preds = %3
  %8 = add nsw i32 %i.0, 1, !dbg !200
  br label %1, !dbg !200

; <label>:9                                       ; preds = %5, %1
  ret void, !dbg !201
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %argc1 = call i32 @kint_arg.i32(), !id !202
  %line = alloca [80 x i8], align 16
  %inst = alloca [80 x i8], align 16
  %inst_arg = alloca [80 x i8], align 16
  %1 = icmp ne i32 %argc1, 2, !dbg !203
  br i1 %1, label %2, label %4, !dbg !203

; <label>:2                                       ; preds = %0
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str13, i32 0, i32 0)), !dbg !205
  call void @exit(i32 1) noreturn, !dbg !207
  unreachable, !dbg !207

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8** %argv, i64 1, !dbg !208
  %6 = load i8** %5, align 8, !dbg !208
  %7 = call %struct.__sFILE* @"\01_fopen"(i8* %6, i8* getelementptr inbounds ([2 x i8]* @.str14, i32 0, i32 0)), !dbg !209
  %8 = icmp eq %struct.__sFILE* %7, null, !dbg !210
  br i1 %8, label %9, label %11, !dbg !210

; <label>:9                                       ; preds = %4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str15, i32 0, i32 0)), !dbg !211
  call void @exit(i32 -1) noreturn, !dbg !213
  unreachable, !dbg !213

; <label>:11                                      ; preds = %4
  br label %12, !dbg !214

; <label>:12                                      ; preds = %66, %11
  %i.0 = phi i32 [ 0, %11 ], [ %67, %66 ]
  %13 = getelementptr inbounds [80 x i8]* %line, i32 0, i32 0, !dbg !215
  %14 = call i8* @fgets(i8* %13, i32 80, %struct.__sFILE* %7), !dbg !215
  %15 = icmp ne i8* %14, null, !dbg !215
  br i1 %15, label %16, label %68, !dbg !215

; <label>:16                                      ; preds = %12
  %17 = getelementptr inbounds [80 x i8]* %line, i32 0, i32 0, !dbg !216
  %18 = call i32 @indexOf(i8* %17, i8 signext 13, i32 80, i32 0), !dbg !216, !intrange !218
  %19 = icmp eq i32 %18, -1, !dbg !219
  br i1 %19, label %20, label %23, !dbg !219

; <label>:20                                      ; preds = %16
  %21 = getelementptr inbounds [80 x i8]* %line, i32 0, i32 0, !dbg !220
  %22 = call i32 @indexOf(i8* %21, i8 signext 10, i32 80, i32 0), !dbg !220, !intrange !218
  br label %23, !dbg !222

; <label>:23                                      ; preds = %20, %16
  %placeForNull.0 = phi i32 [ %22, %20 ], [ %18, %16 ]
  %24 = icmp eq i32 %placeForNull.0, -1, !dbg !223
  br i1 %24, label %25, label %26, !dbg !223

; <label>:25                                      ; preds = %23
  br label %26, !dbg !224

; <label>:26                                      ; preds = %25, %23
  %placeForNull.1 = phi i32 [ 79, %25 ], [ %placeForNull.0, %23 ]
  %27 = sext i32 %placeForNull.1 to i64, !dbg !226
  %28 = getelementptr inbounds [80 x i8]* %line, i32 0, i64 %27, !dbg !226
  store i8 0, i8* %28, align 1, !dbg !226
  %29 = getelementptr inbounds [80 x i8]* %line, i32 0, i32 0, !dbg !227
  %30 = getelementptr inbounds [80 x i8]* %inst, i32 0, i32 0, !dbg !227
  %31 = getelementptr inbounds [80 x i8]* %inst_arg, i32 0, i32 0, !dbg !227
  %32 = call i32 (i8*, i8*, ...)* @sscanf(i8* %29, i8* getelementptr inbounds ([6 x i8]* @.str16, i32 0, i32 0), i8* %30, i8* %31), !dbg !227
  %33 = icmp sgt i32 %32, 0, !dbg !228
  br i1 %33, label %34, label %40, !dbg !228

; <label>:34                                      ; preds = %26
  %35 = getelementptr inbounds [80 x i8]* %inst, i32 0, i32 0, !dbg !229
  %36 = call i32 @getInstruction(i8* %35), !dbg !229, !intrange !231
  %37 = sext i32 %i.0 to i64, !dbg !229
  %38 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %37, !dbg !229
  %39 = getelementptr inbounds [2 x i32]* %38, i32 0, i64 0, !dbg !229
  store i32 %36, i32* %39, align 4, !dbg !229
  br label %40, !dbg !232

; <label>:40                                      ; preds = %34, %26
  %41 = icmp eq i32 %32, 1, !dbg !233
  br i1 %41, label %42, label %51, !dbg !233

; <label>:42                                      ; preds = %40
  %43 = sext i32 %i.0 to i64, !dbg !234
  %44 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %43, !dbg !234
  %45 = getelementptr inbounds [2 x i32]* %44, i32 0, i64 0, !dbg !234
  %46 = load i32* %45, align 4, !dbg !234
  %47 = icmp ne i32 %46, 7, !dbg !234
  br i1 %47, label %48, label %57, !dbg !234

; <label>:48                                      ; preds = %42
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str17, i32 0, i32 0)), !dbg !236
  %50 = call i32 @fclose(%struct.__sFILE* %7), !dbg !238
  call void @exit(i32 -1) noreturn, !dbg !239
  unreachable, !dbg !239

; <label>:51                                      ; preds = %40
  %52 = getelementptr inbounds [80 x i8]* %inst_arg, i32 0, i32 0, !dbg !240
  %53 = call i32 @getArgument(i8* %52), !dbg !240, !intrange !242
  %54 = sext i32 %i.0 to i64, !dbg !240
  %55 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %54, !dbg !240
  %56 = getelementptr inbounds [2 x i32]* %55, i32 0, i64 1, !dbg !240
  store i32 %53, i32* %56, align 4, !dbg !240
  br label %57

; <label>:57                                      ; preds = %51, %42
  %58 = sext i32 %i.0 to i64, !dbg !243
  %59 = getelementptr inbounds [1000 x [2 x i32]]* @programMemory, i32 0, i64 %58, !dbg !243
  %60 = getelementptr inbounds [2 x i32]* %59, i32 0, i64 1, !dbg !243
  %61 = load i32* %60, align 4, !dbg !243
  %62 = icmp eq i32 %61, -1, !dbg !243
  br i1 %62, label %63, label %66, !dbg !243

; <label>:63                                      ; preds = %57
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str17, i32 0, i32 0)), !dbg !244
  %65 = call i32 @fclose(%struct.__sFILE* %7), !dbg !246
  call void @exit(i32 -1) noreturn, !dbg !247
  unreachable, !dbg !247

; <label>:66                                      ; preds = %57
  %67 = add nsw i32 %i.0, 1, !dbg !248
  br label %12, !dbg !249

; <label>:68                                      ; preds = %12
  %69 = call i32 @fclose(%struct.__sFILE* %7), !dbg !250
  %70 = call i32 @execute(), !dbg !251, !intrange !147
  ret i32 0, !dbg !252
}

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare i8* @fgets(i8*, i32, %struct.__sFILE*)

declare i32 @sscanf(i8*, i8*, ...)

declare i32 @fclose(%struct.__sFILE*)

define internal i32 @__isctype(i32 %_c, i64 %_f) nounwind uwtable inlinehint ssp {
  %_f2 = call i64 @kint_arg.i64(), !id !253, !intrange !254
  %_c1 = call i32 @kint_arg.i32(), !id !255
  %1 = icmp slt i32 %_c1, 0, !dbg !256
  %2 = icmp sge i32 %_c1, 256, !dbg !256
  %or.cond = or i1 %1, %2, !dbg !256
  br i1 %or.cond, label %13, label %3, !dbg !256

; <label>:3                                       ; preds = %0
  %4 = sext i32 %_c1 to i64, !dbg !256
  %5 = getelementptr inbounds [256 x i32]* getelementptr inbounds (%struct._RuneLocale* @_DefaultRuneLocale, i32 0, i32 5), i32 0, i64 %4, !dbg !256
  %6 = load i32* %5, align 4, !dbg !256
  %7 = zext i32 %6 to i64, !dbg !256
  %8 = and i64 %7, %_f2, !dbg !256
  %9 = icmp ne i64 %8, 0, !dbg !256
  %10 = xor i1 %9, true, !dbg !256
  %11 = xor i1 %10, true, !dbg !256
  %12 = zext i1 %11 to i32, !dbg !256
  br label %13, !dbg !256

; <label>:13                                      ; preds = %3, %0
  %14 = phi i32 [ %12, %3 ], [ 0, %0 ], !dbg !256
  ret i32 %14, !dbg !256
}

declare i32 @kint_arg.i32()

declare i8 @kint_arg.i8()

declare i64 @kint_arg.i64()

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"machine.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !39} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !10, metadata !13, metadata !19, metadata !20, metadata !21, metadata !24, metadata !27, metadata !32, metadata !34}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"signum", metadata !"signum", metadata !"", metadata !6, i32 52, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @signum, null, null, metadata !1, i32 53} ; [ DW_TAG_subprogram ] [line 52] [def] [scope 53] [signum]
!6 = metadata !{i32 786473, metadata !"machine.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, i32 0, metadata !6, metadata !"execute", metadata !"execute", metadata !"", metadata !6, i32 59, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @execute, null, null, metadata !1, i32 59} ; [ DW_TAG_subprogram ] [line 59] [def] [execute]
!11 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !9}
!13 = metadata !{i32 786478, i32 0, metadata !6, metadata !"getInstruction", metadata !"getInstruction", metadata !"", metadata !6, i32 121, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @getInstruction, null, null, metadata !1, i32 121} ; [ DW_TAG_subprogram ] [line 121] [def] [getInstruction]
!14 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !9, metadata !16}
!16 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!18 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = metadata !{i32 786478, i32 0, metadata !6, metadata !"allDigits", metadata !"allDigits", metadata !"", metadata !6, i32 156, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @allDigits, null, null, metadata !1, i32 156} ; [ DW_TAG_subprogram ] [line 156] [def] [allDigits]
!20 = metadata !{i32 786478, i32 0, metadata !6, metadata !"getArgument", metadata !"getArgument", metadata !"", metadata !6, i32 168, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @getArgument, null, null, metadata !1, i32 168} ; [ DW_TAG_subprogram ] [line 168] [def] [getArgument]
!21 = metadata !{i32 786478, i32 0, metadata !6, metadata !"indexOf", metadata !"indexOf", metadata !"", metadata !6, i32 179, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*, i8, i32, i32)* @indexOf, null, null, metadata !1, i32 179} ; [ DW_TAG_subprogram ] [line 179] [def] [indexOf]
!22 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{metadata !9, metadata !16, metadata !18, metadata !9, metadata !9}
!24 = metadata !{i32 786478, i32 0, metadata !6, metadata !"dump", metadata !"dump", metadata !"", metadata !6, i32 201, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @dump, null, null, metadata !1, i32 201} ; [ DW_TAG_subprogram ] [line 201] [def] [dump]
!25 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{null, metadata !9}
!27 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 215, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 215} ; [ DW_TAG_subprogram ] [line 215] [def] [main]
!28 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{metadata !9, metadata !9, metadata !30}
!30 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = metadata !{i32 786478, i32 0, metadata !33, metadata !"isdigit", metadata !"isdigit", metadata !"", metadata !33, i32 254, metadata !7, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @isdigit, null, null, metadata !1, i32 255} ; [ DW_TAG_subprogram ] [line 254] [local] [def] [scope 255] [isdigit]
!33 = metadata !{i32 786473, metadata !"/usr/include/ctype.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint", null} ; [ DW_TAG_file_type ]
!34 = metadata !{i32 786478, i32 0, metadata !33, metadata !"__isctype", metadata !"__isctype", metadata !"", metadata !33, i32 181, metadata !35, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i64)* @__isctype, null, null, metadata !1, i32 182} ; [ DW_TAG_subprogram ] [line 181] [local] [def] [scope 182] [__isctype]
!35 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{metadata !37, metadata !37, metadata !38}
!37 = metadata !{i32 786454, null, metadata !"__darwin_ct_rune_t", metadata !33, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__darwin_ct_rune_t] [line 70, size 0, align 0, offset 0] [from int]
!38 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !47, metadata !52}
!41 = metadata !{i32 786484, i32 0, null, metadata !"PC", metadata !"PC", metadata !"", metadata !6, i32 45, metadata !9, i32 0, i32 1, i32* @PC} ; [ DW_TAG_variable ] [PC] [line 45] [def]
!42 = metadata !{i32 786484, i32 0, null, metadata !"A", metadata !"A", metadata !"", metadata !6, i32 46, metadata !9, i32 0, i32 1, i32* @A} ; [ DW_TAG_variable ] [A] [line 46] [def]
!43 = metadata !{i32 786484, i32 0, null, metadata !"B", metadata !"B", metadata !"", metadata !6, i32 47, metadata !9, i32 0, i32 1, i32* @B} ; [ DW_TAG_variable ] [B] [line 47] [def]
!44 = metadata !{i32 786484, i32 0, null, metadata !"sigA", metadata !"sigA", metadata !"", metadata !6, i32 48, metadata !9, i32 0, i32 1, i32* @sigA} ; [ DW_TAG_variable ] [sigA] [line 48] [def]
!45 = metadata !{i32 786484, i32 0, null, metadata !"sigB", metadata !"sigB", metadata !"", metadata !6, i32 49, metadata !9, i32 0, i32 1, i32* @sigB} ; [ DW_TAG_variable ] [sigB] [line 49] [def]
!46 = metadata !{i32 786484, i32 0, null, metadata !"C", metadata !"C", metadata !"", metadata !6, i32 50, metadata !9, i32 0, i32 1, i32* @C} ; [ DW_TAG_variable ] [C] [line 50] [def]
!47 = metadata !{i32 786484, i32 0, null, metadata !"programMemory", metadata !"programMemory", metadata !"", metadata !6, i32 43, metadata !48, i32 0, i32 1, [1000 x [2 x i32]]* @programMemory} ; [ DW_TAG_variable ] [programMemory] [line 43] [def]
!48 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64000, i64 32, i32 0, i32 0, metadata !9, metadata !49, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 64000, align 32, offset 0] [from int]
!49 = metadata !{metadata !50, metadata !51}
!50 = metadata !{i32 786465, i64 0, i64 999}      ; [ DW_TAG_subrange_type ] [0, 998]
!51 = metadata !{i32 786465, i64 0, i64 1}        ; [ DW_TAG_subrange_type ] [0, 0]
!52 = metadata !{i32 786484, i32 0, null, metadata !"dataMemory", metadata !"dataMemory", metadata !"", metadata !6, i32 44, metadata !53, i32 0, i32 1, [1000 x i32]* @dataMemory} ; [ DW_TAG_variable ] [dataMemory] [line 44] [def]
!53 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 32000, i64 32, i32 0, i32 0, metadata !9, metadata !54, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 32000, align 32, offset 0] [from int]
!54 = metadata !{metadata !50}
!55 = metadata !{metadata !"arg.signum.0"}
!56 = metadata !{i32 0, i32 1}
!57 = metadata !{i32 55, i32 3, metadata !58, null}
!58 = metadata !{i32 786443, metadata !5, i32 53, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!59 = metadata !{i32 55, i32 26, metadata !60, null}
!60 = metadata !{i32 786443, metadata !58, i32 55, i32 16, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!61 = metadata !{i32 56, i32 3, metadata !58, null}
!62 = metadata !{i32 60, i32 3, metadata !63, null}
!63 = metadata !{i32 786443, metadata !10, i32 59, i32 15, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!64 = metadata !{metadata !"var.PC"}
!65 = metadata !{i32 61, i32 3, metadata !63, null}
!66 = metadata !{i32 64, i32 7, metadata !67, null}
!67 = metadata !{i32 786443, metadata !63, i32 62, i32 5, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!68 = metadata !{i32 66, i32 2, metadata !69, null}
!69 = metadata !{i32 786443, metadata !67, i32 64, i32 37, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!70 = metadata !{metadata !"var.A"}
!71 = metadata !{i32 67, i32 2, metadata !69, null}
!72 = metadata !{i32 68, i32 2, metadata !69, null}
!73 = metadata !{i32 70, i32 2, metadata !69, null}
!74 = metadata !{i32 71, i32 2, metadata !69, null}
!75 = metadata !{i32 72, i32 2, metadata !69, null}
!76 = metadata !{i32 74, i32 2, metadata !69, null}
!77 = metadata !{i32 75, i32 2, metadata !69, null}
!78 = metadata !{i32 76, i32 2, metadata !69, null}
!79 = metadata !{i32 78, i32 2, metadata !69, null}
!80 = metadata !{i32 79, i32 4, metadata !81, null}
!81 = metadata !{i32 786443, metadata !69, i32 78, i32 44, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!82 = metadata !{i32 81, i32 2, metadata !69, null}
!83 = metadata !{i32 82, i32 2, metadata !69, null}
!84 = metadata !{i32 83, i32 2, metadata !69, null}
!85 = metadata !{i32 85, i32 2, metadata !69, null}
!86 = metadata !{i32 86, i32 4, metadata !87, null}
!87 = metadata !{i32 786443, metadata !69, i32 85, i32 14, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!88 = metadata !{i32 87, i32 2, metadata !87, null}
!89 = metadata !{i32 88, i32 4, metadata !90, null}
!90 = metadata !{i32 786443, metadata !69, i32 87, i32 9, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!91 = metadata !{i32 92, i32 2, metadata !69, null}
!92 = metadata !{i32 93, i32 2, metadata !69, null}
!93 = metadata !{i32 94, i32 2, metadata !69, null}
!94 = metadata !{i32 96, i32 2, metadata !69, null}
!95 = metadata !{i32 97, i32 2, metadata !69, null}
!96 = metadata !{i32 99, i32 2, metadata !69, null}
!97 = metadata !{metadata !"var.B"}
!98 = metadata !{i32 100, i32 9, metadata !69, null}
!99 = metadata !{i32 -1, i32 2}                   ; [ DW_TAG_hi_user ]
!100 = metadata !{metadata !"var.sigA"}
!101 = metadata !{i32 101, i32 9, metadata !69, null}
!102 = metadata !{metadata !"var.sigB"}
!103 = metadata !{i32 102, i32 2, metadata !69, null}
!104 = metadata !{i32 103, i32 2, metadata !69, null}
!105 = metadata !{i32 104, i32 2, metadata !69, null}
!106 = metadata !{i32 104, i32 21, metadata !69, null}
!107 = metadata !{i32 115, i32 2, metadata !69, null}
!108 = metadata !{i32 118, i32 3, metadata !63, null}
!109 = metadata !{i32 119, i32 1, metadata !63, null}
!110 = metadata !{i32 124, i32 7, metadata !111, null}
!111 = metadata !{i32 786443, metadata !13, i32 121, i32 38, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!112 = metadata !{i32 125, i32 5, metadata !113, null}
!113 = metadata !{i32 786443, metadata !111, i32 124, i32 55, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!114 = metadata !{i32 127, i32 12, metadata !111, null}
!115 = metadata !{i32 128, i32 5, metadata !116, null}
!116 = metadata !{i32 786443, metadata !111, i32 127, i32 39, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!117 = metadata !{i32 130, i32 12, metadata !111, null}
!118 = metadata !{i32 131, i32 5, metadata !119, null}
!119 = metadata !{i32 786443, metadata !111, i32 130, i32 40, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!120 = metadata !{i32 133, i32 12, metadata !111, null}
!121 = metadata !{i32 134, i32 5, metadata !122, null}
!122 = metadata !{i32 786443, metadata !111, i32 133, i32 38, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!123 = metadata !{i32 136, i32 12, metadata !111, null}
!124 = metadata !{i32 137, i32 5, metadata !125, null}
!125 = metadata !{i32 786443, metadata !111, i32 136, i32 38, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!126 = metadata !{i32 139, i32 12, metadata !111, null}
!127 = metadata !{i32 140, i32 5, metadata !128, null}
!128 = metadata !{i32 786443, metadata !111, i32 139, i32 38, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!129 = metadata !{i32 142, i32 12, metadata !111, null}
!130 = metadata !{i32 143, i32 5, metadata !131, null}
!131 = metadata !{i32 786443, metadata !111, i32 142, i32 39, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!132 = metadata !{i32 145, i32 12, metadata !111, null}
!133 = metadata !{i32 146, i32 5, metadata !134, null}
!134 = metadata !{i32 786443, metadata !111, i32 145, i32 39, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!135 = metadata !{i32 148, i32 12, metadata !111, null}
!136 = metadata !{i32 149, i32 5, metadata !137, null}
!137 = metadata !{i32 786443, metadata !111, i32 148, i32 38, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!138 = metadata !{i32 152, i32 5, metadata !139, null}
!139 = metadata !{i32 786443, metadata !111, i32 151, i32 8, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!140 = metadata !{i32 154, i32 1, metadata !111, null}
!141 = metadata !{i32 159, i32 14, metadata !142, null}
!142 = metadata !{i32 786443, metadata !19, i32 156, i32 30, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!143 = metadata !{i32 160, i32 8, metadata !144, null}
!144 = metadata !{i32 786443, metadata !142, i32 160, i32 3, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!145 = metadata !{i32 161, i32 10, metadata !146, null}
!146 = metadata !{i32 786443, metadata !144, i32 160, i32 30, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!147 = metadata !{i32 0, i32 2}
!148 = metadata !{i32 162, i32 7, metadata !149, null}
!149 = metadata !{i32 786443, metadata !146, i32 161, i32 25, metadata !6, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!150 = metadata !{i32 160, i32 25, metadata !144, null}
!151 = metadata !{i32 165, i32 3, metadata !142, null}
!152 = metadata !{i32 166, i32 1, metadata !142, null}
!153 = metadata !{metadata !"arg._kint.isdigit.0"}
!154 = metadata !{i32 256, i32 10, metadata !155, null}
!155 = metadata !{i32 786443, metadata !32, i32 255, i32 1, metadata !33, i32 47} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint//usr/include/ctype.h]
!156 = metadata !{i32 170, i32 7, metadata !157, null}
!157 = metadata !{i32 786443, metadata !20, i32 168, i32 34, metadata !6, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!158 = metadata !{i32 170, i32 26, metadata !157, null}
!159 = metadata !{i32 171, i32 23, metadata !160, null}
!160 = metadata !{i32 786443, metadata !157, i32 170, i32 42, metadata !6, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!161 = metadata !{i32 172, i32 5, metadata !160, null}
!162 = metadata !{i32 173, i32 14, metadata !163, null}
!163 = metadata !{i32 786443, metadata !160, i32 172, i32 39, metadata !6, i32 25} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!164 = metadata !{i32 176, i32 3, metadata !157, null}
!165 = metadata !{i32 177, i32 1, metadata !157, null}
!166 = metadata !{metadata !"arg.indexOf.3"}
!167 = metadata !{metadata !"arg.indexOf.2"}
!168 = metadata !{i32 80, i32 81}
!169 = metadata !{metadata !"arg.indexOf.1"}
!170 = metadata !{i8 10, i8 14}
!171 = metadata !{i32 182, i32 3, metadata !172, null}
!172 = metadata !{i32 786443, metadata !21, i32 179, i32 72, metadata !6, i32 26} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!173 = metadata !{i32 183, i32 5, metadata !174, null}
!174 = metadata !{i32 786443, metadata !172, i32 182, i32 30, metadata !6, i32 27} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!175 = metadata !{i32 184, i32 7, metadata !176, null}
!176 = metadata !{i32 786443, metadata !174, i32 183, i32 26, metadata !6, i32 28} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!177 = metadata !{i32 186, i32 5, metadata !174, null}
!178 = metadata !{i32 187, i32 5, metadata !174, null}
!179 = metadata !{i32 188, i32 7, metadata !180, null}
!180 = metadata !{i32 786443, metadata !174, i32 187, i32 31, metadata !6, i32 29} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!181 = metadata !{i32 189, i32 7, metadata !180, null}
!182 = metadata !{i32 191, i32 5, metadata !174, null}
!183 = metadata !{i32 192, i32 3, metadata !174, null}
!184 = metadata !{i32 193, i32 3, metadata !172, null}
!185 = metadata !{i32 194, i32 5, metadata !186, null}
!186 = metadata !{i32 786443, metadata !172, i32 193, i32 18, metadata !6, i32 30} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!187 = metadata !{i32 195, i32 5, metadata !186, null}
!188 = metadata !{i32 197, i32 5, metadata !189, null}
!189 = metadata !{i32 786443, metadata !172, i32 196, i32 10, metadata !6, i32 31} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!190 = metadata !{i32 199, i32 1, metadata !172, null}
!191 = metadata !{metadata !"arg.dump.0"}
!192 = metadata !{i32 205, i32 8, metadata !193, null}
!193 = metadata !{i32 786443, metadata !194, i32 205, i32 3, metadata !6, i32 33} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!194 = metadata !{i32 786443, metadata !24, i32 201, i32 29, metadata !6, i32 32} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!195 = metadata !{i32 206, i32 5, metadata !196, null}
!196 = metadata !{i32 786443, metadata !193, i32 205, i32 38, metadata !6, i32 34} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!197 = metadata !{i32 207, i32 7, metadata !198, null}
!198 = metadata !{i32 786443, metadata !196, i32 206, i32 32, metadata !6, i32 35} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!199 = metadata !{i32 208, i32 7, metadata !198, null}
!200 = metadata !{i32 205, i32 33, metadata !193, null}
!201 = metadata !{i32 213, i32 1, metadata !194, null}
!202 = metadata !{metadata !"arg.main.0"}
!203 = metadata !{i32 218, i32 3, metadata !204, null}
!204 = metadata !{i32 786443, metadata !27, i32 215, i32 33, metadata !6, i32 36} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!205 = metadata !{i32 218, i32 21, metadata !206, null}
!206 = metadata !{i32 786443, metadata !204, i32 218, i32 19, metadata !6, i32 37} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!207 = metadata !{i32 218, i32 65, metadata !206, null}
!208 = metadata !{i32 219, i32 28, metadata !204, null}
!209 = metadata !{i32 220, i32 20, metadata !204, null}
!210 = metadata !{i32 221, i32 3, metadata !204, null}
!211 = metadata !{i32 222, i32 5, metadata !212, null}
!212 = metadata !{i32 786443, metadata !204, i32 221, i32 25, metadata !6, i32 38} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!213 = metadata !{i32 223, i32 5, metadata !212, null}
!214 = metadata !{i32 230, i32 3, metadata !204, null}
!215 = metadata !{i32 230, i32 10, metadata !204, null}
!216 = metadata !{i32 232, i32 24, metadata !217, null}
!217 = metadata !{i32 786443, metadata !204, i32 230, i32 58, metadata !6, i32 39} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!218 = metadata !{i32 -1, i32 1}                  ; [ DW_TAG_hi_user ]
!219 = metadata !{i32 233, i32 5, metadata !217, null}
!220 = metadata !{i32 234, i32 22, metadata !221, null}
!221 = metadata !{i32 786443, metadata !217, i32 233, i32 29, metadata !6, i32 40} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!222 = metadata !{i32 235, i32 5, metadata !221, null}
!223 = metadata !{i32 236, i32 5, metadata !217, null}
!224 = metadata !{i32 238, i32 5, metadata !225, null}
!225 = metadata !{i32 786443, metadata !217, i32 236, i32 29, metadata !6, i32 41} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!226 = metadata !{i32 239, i32 5, metadata !217, null}
!227 = metadata !{i32 241, i32 21, metadata !217, null}
!228 = metadata !{i32 242, i32 5, metadata !217, null}
!229 = metadata !{i32 243, i32 29, metadata !230, null}
!230 = metadata !{i32 786443, metadata !217, i32 242, i32 24, metadata !6, i32 42} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!231 = metadata !{i32 0, i32 9}
!232 = metadata !{i32 244, i32 5, metadata !230, null}
!233 = metadata !{i32 245, i32 5, metadata !217, null}
!234 = metadata !{i32 246, i32 7, metadata !235, null}
!235 = metadata !{i32 786443, metadata !217, i32 245, i32 25, metadata !6, i32 43} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!236 = metadata !{i32 247, i32 2, metadata !237, null}
!237 = metadata !{i32 786443, metadata !235, i32 246, i32 40, metadata !6, i32 44} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!238 = metadata !{i32 248, i32 2, metadata !237, null}
!239 = metadata !{i32 249, i32 2, metadata !237, null}
!240 = metadata !{i32 252, i32 29, metadata !241, null}
!241 = metadata !{i32 786443, metadata !217, i32 251, i32 12, metadata !6, i32 45} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!242 = metadata !{i32 -1, i32 0}                  ; [ DW_TAG_hi_user ]
!243 = metadata !{i32 254, i32 5, metadata !217, null}
!244 = metadata !{i32 255, i32 7, metadata !245, null}
!245 = metadata !{i32 786443, metadata !217, i32 254, i32 36, metadata !6, i32 46} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint/machine.c]
!246 = metadata !{i32 256, i32 7, metadata !245, null}
!247 = metadata !{i32 257, i32 7, metadata !245, null}
!248 = metadata !{i32 259, i32 5, metadata !217, null}
!249 = metadata !{i32 260, i32 3, metadata !217, null}
!250 = metadata !{i32 261, i32 3, metadata !204, null}
!251 = metadata !{i32 263, i32 3, metadata !204, null}
!252 = metadata !{i32 264, i32 3, metadata !204, null}
!253 = metadata !{metadata !"arg._kint.__isctype.1"}
!254 = metadata !{i64 1024, i64 1025}
!255 = metadata !{metadata !"arg._kint.__isctype.0"}
!256 = metadata !{i32 186, i32 2, metadata !257, null}
!257 = metadata !{i32 786443, metadata !34, i32 182, i32 1, metadata !33, i32 48} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_369_v491/src/kint//usr/include/ctype.h]
