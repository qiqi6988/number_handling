; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sbuf = type { i8*, i32 }
%struct.__sFILEX = type opaque

@.str = private unnamed_addr constant [20 x i8] c"Register %d is: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [38 x i8] c"Registers are:\0A\0A 1 2 3 4 5 6 7 8 9 0\0A\00", align 1
@.str2 = private unnamed_addr constant [450 x i8] c"The following commands are acceptable:\0A100 - halts and quits\0A2dn - Sets register d to n. Example 234\0A3dn - Add n to register d\0A4dn - Multiply register d by n Example 459\0A5dn - Print register d.  Sample 59\0A6 output.txt - Get the next argument containing the filename to import. The file contains values to set the registers to.\0A7 d n - Print from register d to register n. Make sure you include spaces between the start and end indexes.Sample 7 5 9\0A\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c"Command: %s\0A\00", align 1
@.str4 = private unnamed_addr constant [46 x i8] c"Set register d %d to n %d (between 0 and 9) \0A\00", align 1
@.str5 = private unnamed_addr constant [18 x i8] c"Register d is %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"Add n %d to register d %d \0A\00", align 1
@.str7 = private unnamed_addr constant [32 x i8] c"Multiply register d %d by n %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"Invalid register %d\00", align 1
@.str9 = private unnamed_addr constant [38 x i8] c"Print register %d\0ARegister %d is: %d\0A\00", align 1
@.str10 = private unnamed_addr constant [30 x i8] c"Set up register from file %s\0A\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str12 = private unnamed_addr constant [38 x i8] c"Unable to open file because of error\0A\00", align 1
@.str13 = private unnamed_addr constant [13 x i8] c"Memory error\00", align 1
@.str14 = private unnamed_addr constant [14 x i8] c"Contents: %s\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"Print registers %d - %d\0A\00", align 1
@.str16 = private unnamed_addr constant [41 x i8] c"d is larger than n. Invalid input: %d %d\00", align 1
@.str17 = private unnamed_addr constant [22 x i8] c"Output filename '%s'\0A\00", align 1
@.str18 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str19 = private unnamed_addr constant [47 x i8] c"Unable to create output file because of error\0A\00", align 1
@.str20 = private unnamed_addr constant [4 x i8] c"100\00", align 1
@.str21 = private unnamed_addr constant [15 x i8] c"Found halt %s\0A\00", align 1
@.str22 = private unnamed_addr constant [20 x i8] c"Command not found!\0A\00", align 1
@.str23 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1

define void @copyReg(i32* %registers, i32 %i, i32 %end, %struct.__sFILE* %otfil) nounwind uwtable ssp {
  %1 = mul nsw i32 2, 2, !dbg !88
  %2 = sub nsw i32 %1, 4, !dbg !88
  %3 = mul i32 1, %i, !dbg !88
  %4 = add i32 %2, %3, !dbg !88
  %5 = sext i32 %4 to i64, !dbg !88
  %6 = getelementptr inbounds i32* %registers, i64 %5, !dbg !88
  %7 = load i32* %6, align 4, !dbg !88
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %i, i32 %7), !dbg !90
  %9 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %otfil, i8* getelementptr inbounds ([20 x i8]* @.str, i32 0, i32 0), i32 %i, i32 %7), !dbg !91
  %10 = add i32 %i, 1, !dbg !92
  call void @copyRegs(i32* %registers, i32 %10, i32 %end, %struct.__sFILE* %otfil), !dbg !92
  ret void, !dbg !93
}

declare i32 @printf(i8*, ...)

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

define void @copyRegs(i32* %registers, i32 %i, i32 %end, %struct.__sFILE* %otfil) nounwind uwtable ssp {
  %1 = icmp ult i32 %i, %end, !dbg !94
  br i1 %1, label %2, label %3, !dbg !94

; <label>:2                                       ; preds = %0
  call void @copyReg(i32* %registers, i32 %i, i32 %end, %struct.__sFILE* %otfil), !dbg !96
  br label %3, !dbg !98

; <label>:3                                       ; preds = %2, %0
  ret void, !dbg !99
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable ssp {
  %number = alloca [10 x i8], align 1
  %1 = mul nsw i32 2, 2, !dbg !100
  %2 = mul nsw i32 %1, 3, !dbg !100
  %3 = sub nsw i32 %2, 2, !dbg !100
  %4 = zext i32 %3 to i64, !dbg !100
  %5 = call i8* @llvm.stacksave(), !dbg !100
  %6 = mul nuw i64 3, %4, !dbg !100
  %7 = alloca i32, i64 %6, align 16, !dbg !100
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str1, i32 0, i32 0)), !dbg !102
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([450 x i8]* @.str2, i32 0, i32 0)), !dbg !103
  %10 = mul nsw i64 1, %4, !dbg !104
  %11 = getelementptr inbounds i32* %7, i64 %10, !dbg !104
  %12 = bitcast i32* %11 to i8*, !dbg !104
  %13 = call i64 @llvm.objectsize.i64(i8* %12, i1 false), !dbg !104
  %14 = icmp ne i64 %13, -1, !dbg !104
  %15 = mul nsw i64 1, %4, !dbg !104
  %16 = getelementptr inbounds i32* %7, i64 %15, !dbg !104
  %17 = bitcast i32* %16 to i8*, !dbg !104
  %18 = mul nsw i64 1, %4, !dbg !104
  %19 = getelementptr inbounds i32* %7, i64 %18, !dbg !104
  %20 = mul nuw i64 4, %4, !dbg !104
  br i1 %14, label %21, label %27, !dbg !104

; <label>:21                                      ; preds = %0
  %22 = mul nsw i64 1, %4, !dbg !104
  %23 = getelementptr inbounds i32* %7, i64 %22, !dbg !104
  %24 = bitcast i32* %23 to i8*, !dbg !104
  %25 = call i64 @llvm.objectsize.i64(i8* %24, i1 false), !dbg !104
  %26 = call i8* @__memset_chk(i8* %17, i32 0, i64 %20, i64 %25) nounwind, !dbg !104
  br label %29, !dbg !104

; <label>:27                                      ; preds = %0
  %28 = call i8* @__inline_memset_chk(i8* %17, i32 0, i64 %20), !dbg !104
  br label %29, !dbg !104

; <label>:29                                      ; preds = %27, %21
  %30 = phi i8* [ %26, %21 ], [ %28, %27 ], !dbg !104
  %31 = mul nsw i64 0, %4, !dbg !105
  %32 = getelementptr inbounds i32* %7, i64 %31, !dbg !105
  %33 = bitcast i32* %32 to i8*, !dbg !105
  %34 = call i64 @llvm.objectsize.i64(i8* %33, i1 false), !dbg !105
  %35 = icmp ne i64 %34, -1, !dbg !105
  %36 = mul nsw i64 0, %4, !dbg !105
  %37 = getelementptr inbounds i32* %7, i64 %36, !dbg !105
  %38 = bitcast i32* %37 to i8*, !dbg !105
  %39 = mul nsw i64 0, %4, !dbg !105
  %40 = getelementptr inbounds i32* %7, i64 %39, !dbg !105
  %41 = mul nuw i64 4, %4, !dbg !105
  br i1 %35, label %42, label %48, !dbg !105

; <label>:42                                      ; preds = %29
  %43 = mul nsw i64 0, %4, !dbg !105
  %44 = getelementptr inbounds i32* %7, i64 %43, !dbg !105
  %45 = bitcast i32* %44 to i8*, !dbg !105
  %46 = call i64 @llvm.objectsize.i64(i8* %45, i1 false), !dbg !105
  %47 = call i8* @__memset_chk(i8* %38, i32 65, i64 %41, i64 %46) nounwind, !dbg !105
  br label %50, !dbg !105

; <label>:48                                      ; preds = %29
  %49 = call i8* @__inline_memset_chk(i8* %38, i32 65, i64 %41), !dbg !105
  br label %50, !dbg !105

; <label>:50                                      ; preds = %48, %42
  %51 = phi i8* [ %47, %42 ], [ %49, %48 ], !dbg !105
  %52 = mul nsw i64 2, %4, !dbg !106
  %53 = getelementptr inbounds i32* %7, i64 %52, !dbg !106
  %54 = bitcast i32* %53 to i8*, !dbg !106
  %55 = call i64 @llvm.objectsize.i64(i8* %54, i1 false), !dbg !106
  %56 = icmp ne i64 %55, -1, !dbg !106
  %57 = mul nsw i64 2, %4, !dbg !106
  %58 = getelementptr inbounds i32* %7, i64 %57, !dbg !106
  %59 = bitcast i32* %58 to i8*, !dbg !106
  %60 = mul nsw i64 2, %4, !dbg !106
  %61 = getelementptr inbounds i32* %7, i64 %60, !dbg !106
  %62 = mul nuw i64 4, %4, !dbg !106
  br i1 %56, label %63, label %69, !dbg !106

; <label>:63                                      ; preds = %50
  %64 = mul nsw i64 2, %4, !dbg !106
  %65 = getelementptr inbounds i32* %7, i64 %64, !dbg !106
  %66 = bitcast i32* %65 to i8*, !dbg !106
  %67 = call i64 @llvm.objectsize.i64(i8* %66, i1 false), !dbg !106
  %68 = call i8* @__memset_chk(i8* %59, i32 65, i64 %62, i64 %67) nounwind, !dbg !106
  br label %71, !dbg !106

; <label>:69                                      ; preds = %50
  %70 = call i8* @__inline_memset_chk(i8* %59, i32 65, i64 %62), !dbg !106
  br label %71, !dbg !106

; <label>:71                                      ; preds = %69, %63
  %72 = phi i8* [ %68, %63 ], [ %70, %69 ], !dbg !106
  %73 = mul nsw i64 1, %4, !dbg !107
  %74 = getelementptr inbounds i32* %7, i64 %73, !dbg !107
  br label %75, !dbg !108

; <label>:75                                      ; preds = %355, %71
  %point.0 = phi i32* [ %74, %71 ], [ %point.1, %355 ]
  %holder.0 = phi i32 [ 1, %71 ], [ %holder.1, %355 ]
  %76 = icmp slt i32 %holder.0, %argc, !dbg !108
  br i1 %76, label %77, label %357, !dbg !108

; <label>:77                                      ; preds = %75
  %78 = sext i32 %holder.0 to i64, !dbg !109
  %79 = getelementptr inbounds i8** %argv, i64 %78, !dbg !109
  %80 = load i8** %79, align 8, !dbg !109
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), i8* %80), !dbg !109
  %82 = sext i32 %holder.0 to i64, !dbg !111
  %83 = getelementptr inbounds i8** %argv, i64 %82, !dbg !111
  %84 = load i8** %83, align 8, !dbg !111
  %85 = getelementptr inbounds i8* %84, i64 1, !dbg !111
  %86 = load i8* %85, align 1, !dbg !111
  %87 = sext i8 %86 to i32, !dbg !111
  %88 = sub nsw i32 %87, 48, !dbg !111
  %89 = sext i32 %holder.0 to i64, !dbg !112
  %90 = getelementptr inbounds i8** %argv, i64 %89, !dbg !112
  %91 = load i8** %90, align 8, !dbg !112
  %92 = getelementptr inbounds i8* %91, i64 2, !dbg !112
  %93 = load i8* %92, align 1, !dbg !112
  %94 = sext i8 %93 to i32, !dbg !112
  %95 = sub nsw i32 %94, 48, !dbg !112
  %96 = sext i32 %holder.0 to i64, !dbg !113
  %97 = getelementptr inbounds i8** %argv, i64 %96, !dbg !113
  %98 = load i8** %97, align 8, !dbg !113
  %99 = getelementptr inbounds i8* %98, i64 0, !dbg !113
  %100 = load i8* %99, align 1, !dbg !113
  %101 = sext i8 %100 to i32, !dbg !113
  %102 = icmp eq i32 %101, 50, !dbg !113
  br i1 %102, label %103, label %120, !dbg !113

; <label>:103                                     ; preds = %77
  %104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str4, i32 0, i32 0), i32 %88, i32 %95), !dbg !114
  %105 = sext i32 %88 to i64, !dbg !116
  %106 = mul nsw i64 1, %4, !dbg !116
  %107 = getelementptr inbounds i32* %7, i64 %106, !dbg !116
  %108 = getelementptr inbounds i32* %107, i64 %105, !dbg !116
  %109 = sext i32 %95 to i64, !dbg !117
  %110 = mul nsw i64 1, %4, !dbg !117
  %111 = getelementptr inbounds i32* %7, i64 %110, !dbg !117
  %112 = getelementptr inbounds i32* %111, i64 %109, !dbg !117
  %113 = load i32* %112, align 4, !dbg !117
  store i32 %113, i32* %108, align 4, !dbg !118
  %114 = sext i32 %88 to i64, !dbg !119
  %115 = mul nsw i64 1, %4, !dbg !119
  %116 = getelementptr inbounds i32* %7, i64 %115, !dbg !119
  %117 = getelementptr inbounds i32* %116, i64 %114, !dbg !119
  %118 = load i32* %117, align 4, !dbg !119
  %119 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %118), !dbg !119
  br label %333, !dbg !120

; <label>:120                                     ; preds = %77
  %121 = sext i32 %holder.0 to i64, !dbg !121
  %122 = getelementptr inbounds i8** %argv, i64 %121, !dbg !121
  %123 = load i8** %122, align 8, !dbg !121
  %124 = getelementptr inbounds i8* %123, i64 0, !dbg !121
  %125 = load i8* %124, align 1, !dbg !121
  %126 = sext i8 %125 to i32, !dbg !121
  %127 = icmp eq i32 %126, 51, !dbg !121
  br i1 %127, label %128, label %151, !dbg !121

; <label>:128                                     ; preds = %120
  %129 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %95, i32 %88), !dbg !122
  %130 = sext i32 %88 to i64, !dbg !124
  %131 = mul nsw i64 1, %4, !dbg !124
  %132 = getelementptr inbounds i32* %7, i64 %131, !dbg !124
  %133 = getelementptr inbounds i32* %132, i64 %130, !dbg !124
  %134 = load i32* %133, align 4, !dbg !124
  store i32 %134, i32* %point.0, align 4, !dbg !124
  %135 = sext i32 %88 to i64, !dbg !125
  %136 = mul nsw i64 1, %4, !dbg !125
  %137 = getelementptr inbounds i32* %7, i64 %136, !dbg !125
  %138 = getelementptr inbounds i32* %137, i64 %135, !dbg !125
  %139 = load i32* %138, align 4, !dbg !125
  %140 = add nsw i32 %139, %95, !dbg !126
  %141 = sext i32 %88 to i64, !dbg !127
  %142 = mul nsw i64 1, %4, !dbg !127
  %143 = getelementptr inbounds i32* %7, i64 %142, !dbg !127
  %144 = getelementptr inbounds i32* %143, i64 %141, !dbg !127
  store i32 %140, i32* %144, align 4, !dbg !127
  %145 = sext i32 %88 to i64, !dbg !128
  %146 = mul nsw i64 1, %4, !dbg !128
  %147 = getelementptr inbounds i32* %7, i64 %146, !dbg !128
  %148 = getelementptr inbounds i32* %147, i64 %145, !dbg !128
  %149 = load i32* %148, align 4, !dbg !128
  %150 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %149), !dbg !128
  br label %333, !dbg !129

; <label>:151                                     ; preds = %120
  %152 = sext i32 %holder.0 to i64, !dbg !130
  %153 = getelementptr inbounds i8** %argv, i64 %152, !dbg !130
  %154 = load i8** %153, align 8, !dbg !130
  %155 = getelementptr inbounds i8* %154, i64 0, !dbg !130
  %156 = load i8* %155, align 1, !dbg !130
  %157 = sext i8 %156 to i32, !dbg !130
  %158 = icmp eq i32 %157, 52, !dbg !130
  br i1 %158, label %159, label %182, !dbg !130

; <label>:159                                     ; preds = %151
  %160 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0), i32 %88, i32 %95), !dbg !131
  %161 = sext i32 %88 to i64, !dbg !133
  %162 = mul nsw i64 1, %4, !dbg !133
  %163 = getelementptr inbounds i32* %7, i64 %162, !dbg !133
  %164 = getelementptr inbounds i32* %163, i64 %161, !dbg !133
  %165 = load i32* %164, align 4, !dbg !133
  %166 = sext i32 %95 to i64, !dbg !133
  %167 = mul nsw i64 1, %4, !dbg !133
  %168 = getelementptr inbounds i32* %7, i64 %167, !dbg !133
  %169 = getelementptr inbounds i32* %168, i64 %166, !dbg !133
  %170 = load i32* %169, align 4, !dbg !133
  %171 = mul nsw i32 %165, %170, !dbg !133
  %172 = sext i32 %88 to i64, !dbg !133
  %173 = mul nsw i64 1, %4, !dbg !133
  %174 = getelementptr inbounds i32* %7, i64 %173, !dbg !133
  %175 = getelementptr inbounds i32* %174, i64 %172, !dbg !133
  store i32 %171, i32* %175, align 4, !dbg !133
  %176 = sext i32 %88 to i64, !dbg !134
  %177 = mul nsw i64 1, %4, !dbg !134
  %178 = getelementptr inbounds i32* %7, i64 %177, !dbg !134
  %179 = getelementptr inbounds i32* %178, i64 %176, !dbg !134
  %180 = load i32* %179, align 4, !dbg !134
  %181 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %180), !dbg !134
  br label %333, !dbg !135

; <label>:182                                     ; preds = %151
  %183 = sext i32 %holder.0 to i64, !dbg !136
  %184 = getelementptr inbounds i8** %argv, i64 %183, !dbg !136
  %185 = load i8** %184, align 8, !dbg !136
  %186 = getelementptr inbounds i8* %185, i64 0, !dbg !136
  %187 = load i8* %186, align 1, !dbg !136
  %188 = sext i8 %187 to i32, !dbg !136
  %189 = icmp eq i32 %188, 53, !dbg !136
  br i1 %189, label %190, label %201, !dbg !136

; <label>:190                                     ; preds = %182
  %191 = icmp sgt i32 %88, 9, !dbg !137
  br i1 %191, label %192, label %194, !dbg !137

; <label>:192                                     ; preds = %190
  %193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %88), !dbg !139
  br label %333, !dbg !141

; <label>:194                                     ; preds = %190
  %195 = sext i32 %88 to i64, !dbg !142
  %196 = mul nsw i64 1, %4, !dbg !142
  %197 = getelementptr inbounds i32* %7, i64 %196, !dbg !142
  %198 = getelementptr inbounds i32* %197, i64 %195, !dbg !142
  %199 = load i32* %198, align 4, !dbg !142
  %200 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str9, i32 0, i32 0), i32 %88, i32 %88, i32 %199), !dbg !142
  br label %333

; <label>:201                                     ; preds = %182
  %202 = sext i32 %holder.0 to i64, !dbg !144
  %203 = getelementptr inbounds i8** %argv, i64 %202, !dbg !144
  %204 = load i8** %203, align 8, !dbg !144
  %205 = getelementptr inbounds i8* %204, i64 0, !dbg !144
  %206 = load i8* %205, align 1, !dbg !144
  %207 = sext i8 %206 to i32, !dbg !144
  %208 = icmp eq i32 %207, 54, !dbg !144
  br i1 %208, label %209, label %277, !dbg !144

; <label>:209                                     ; preds = %201
  %210 = add nsw i32 %holder.0, 1, !dbg !145
  %211 = sext i32 %210 to i64, !dbg !145
  %212 = getelementptr inbounds i8** %argv, i64 %211, !dbg !145
  %213 = load i8** %212, align 8, !dbg !145
  %214 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str10, i32 0, i32 0), i8* %213), !dbg !145
  %215 = bitcast [10 x i8]* %number to i8*, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* %215, i8 0, i64 10, i32 1, i1 false), !dbg !147
  %216 = add nsw i32 %holder.0, 1, !dbg !148
  %217 = sext i32 %216 to i64, !dbg !148
  %218 = getelementptr inbounds i8** %argv, i64 %217, !dbg !148
  %219 = load i8** %218, align 8, !dbg !148
  %220 = call %struct.__sFILE* @"\01_fopen"(i8* %219, i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0)), !dbg !148
  %221 = icmp eq %struct.__sFILE* %220, null, !dbg !148
  br i1 %221, label %222, label %225, !dbg !148

; <label>:222                                     ; preds = %209
  %223 = load %struct.__sFILE** @__stderrp, align 8, !dbg !149
  %224 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %223, i8* getelementptr inbounds ([38 x i8]* @.str12, i32 0, i32 0)), !dbg !149
  br label %358, !dbg !151

; <label>:225                                     ; preds = %209
  %226 = call i8* @malloc(i64 100), !dbg !152
  %227 = icmp eq i8* %226, null, !dbg !153
  br i1 %227, label %228, label %231, !dbg !153

; <label>:228                                     ; preds = %225
  %229 = load %struct.__sFILE** @__stderrp, align 8, !dbg !154
  %230 = call i32 @"\01_fputs"(i8* getelementptr inbounds ([13 x i8]* @.str13, i32 0, i32 0), %struct.__sFILE* %229), !dbg !154
  call void @exit(i32 2) noreturn, !dbg !156
  unreachable, !dbg !156

; <label>:231                                     ; preds = %225
  %232 = call i64 @fread(i8* %226, i64 1, i64 100, %struct.__sFILE* %220), !dbg !157
  %233 = trunc i64 %232 to i32, !dbg !157
  %234 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str14, i32 0, i32 0), i8* %226), !dbg !158
  br label %235, !dbg !159

; <label>:235                                     ; preds = %273, %231
  %i.0 = phi i32 [ 0, %231 ], [ %274, %273 ]
  %x.0 = phi i32 [ 0, %231 ], [ %x.1, %273 ]
  %place.0 = phi i32 [ 0, %231 ], [ %place.1, %273 ]
  %236 = icmp slt i32 %i.0, 100, !dbg !159
  br i1 %236, label %237, label %275, !dbg !159

; <label>:237                                     ; preds = %235
  %238 = icmp sge i32 %place.0, 10, !dbg !161
  br i1 %238, label %275, label %239, !dbg !161

; <label>:239                                     ; preds = %237
  %240 = sext i32 %i.0 to i64, !dbg !163
  %241 = getelementptr inbounds i8* %226, i64 %240, !dbg !163
  %242 = load i8* %241, align 1, !dbg !163
  %243 = sext i8 %242 to i32, !dbg !163
  %244 = icmp eq i32 %243, 32, !dbg !163
  br i1 %244, label %251, label %245, !dbg !163

; <label>:245                                     ; preds = %239
  %246 = sext i32 %i.0 to i64, !dbg !163
  %247 = getelementptr inbounds i8* %226, i64 %246, !dbg !163
  %248 = load i8* %247, align 1, !dbg !163
  %249 = sext i8 %248 to i32, !dbg !163
  %250 = icmp eq i32 %249, 0, !dbg !163
  br i1 %250, label %251, label %266, !dbg !163

; <label>:251                                     ; preds = %245, %239
  %252 = getelementptr inbounds [10 x i8]* %number, i32 0, i32 0, !dbg !164
  %253 = call i32 @atoi(i8* %252), !dbg !164
  %254 = sext i32 %place.0 to i64, !dbg !164
  %255 = mul nsw i64 1, %4, !dbg !164
  %256 = getelementptr inbounds i32* %7, i64 %255, !dbg !164
  %257 = getelementptr inbounds i32* %256, i64 %254, !dbg !164
  store i32 %253, i32* %257, align 4, !dbg !164
  %258 = add nsw i32 %place.0, 1, !dbg !166
  br label %259, !dbg !167

; <label>:259                                     ; preds = %261, %251
  %y.0 = phi i32 [ 0, %251 ], [ %264, %261 ]
  %260 = icmp slt i32 %y.0, 10, !dbg !167
  br i1 %260, label %261, label %265, !dbg !167

; <label>:261                                     ; preds = %259
  %262 = sext i32 %y.0 to i64, !dbg !169
  %263 = getelementptr inbounds [10 x i8]* %number, i32 0, i64 %262, !dbg !169
  store i8 0, i8* %263, align 1, !dbg !169
  %264 = add nsw i32 %y.0, 1, !dbg !171
  br label %259, !dbg !171

; <label>:265                                     ; preds = %259
  br label %273, !dbg !172

; <label>:266                                     ; preds = %245
  %267 = sext i32 %i.0 to i64, !dbg !173
  %268 = getelementptr inbounds i8* %226, i64 %267, !dbg !173
  %269 = load i8* %268, align 1, !dbg !173
  %270 = sext i32 %x.0 to i64, !dbg !173
  %271 = getelementptr inbounds [10 x i8]* %number, i32 0, i64 %270, !dbg !173
  store i8 %269, i8* %271, align 1, !dbg !173
  %272 = add nsw i32 %x.0, 1, !dbg !175
  br label %273

; <label>:273                                     ; preds = %265, %266
  %x.1 = phi i32 [ 0, %265 ], [ %272, %266 ]
  %place.1 = phi i32 [ %258, %265 ], [ %place.0, %266 ]
  %274 = add nsw i32 %i.0, 1, !dbg !176
  br label %235, !dbg !176

; <label>:275                                     ; preds = %237, %235
  %276 = call i32 @fclose(%struct.__sFILE* %220), !dbg !177
  call void @free(i8* %226), !dbg !178
  br label %333, !dbg !179

; <label>:277                                     ; preds = %201
  %278 = sext i32 %holder.0 to i64, !dbg !180
  %279 = getelementptr inbounds i8** %argv, i64 %278, !dbg !180
  %280 = load i8** %279, align 8, !dbg !180
  %281 = getelementptr inbounds i8* %280, i64 0, !dbg !180
  %282 = load i8* %281, align 1, !dbg !180
  %283 = sext i8 %282 to i32, !dbg !180
  %284 = icmp eq i32 %283, 55, !dbg !180
  br i1 %284, label %285, label %320, !dbg !180

; <label>:285                                     ; preds = %277
  %286 = add nsw i32 %holder.0, 1, !dbg !181
  %287 = sext i32 %286 to i64, !dbg !181
  %288 = getelementptr inbounds i8** %argv, i64 %287, !dbg !181
  %289 = load i8** %288, align 8, !dbg !181
  %290 = call i32 @getInteger(i8* %289), !dbg !181
  %291 = add nsw i32 %holder.0, 2, !dbg !183
  %292 = sext i32 %291 to i64, !dbg !183
  %293 = getelementptr inbounds i8** %argv, i64 %292, !dbg !183
  %294 = load i8** %293, align 8, !dbg !183
  %295 = call i32 @getInteger(i8* %294), !dbg !183
  %296 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i32 0, i32 0), i32 %290, i32 %295), !dbg !184
  %297 = icmp ugt i32 %290, %295, !dbg !185
  br i1 %297, label %298, label %300, !dbg !185

; <label>:298                                     ; preds = %285
  %299 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str16, i32 0, i32 0), i32 %88, i32 %95), !dbg !186
  br label %300, !dbg !188

; <label>:300                                     ; preds = %298, %285
  %301 = load %struct.__sFILE** @__stderrp, align 8, !dbg !189
  %302 = sub nsw i32 %argc, 1, !dbg !189
  %303 = sext i32 %302 to i64, !dbg !189
  %304 = getelementptr inbounds i8** %argv, i64 %303, !dbg !189
  %305 = load i8** %304, align 8, !dbg !189
  %306 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %301, i8* getelementptr inbounds ([22 x i8]* @.str17, i32 0, i32 0), i8* %305), !dbg !189
  %307 = sub nsw i32 %argc, 1, !dbg !190
  %308 = sext i32 %307 to i64, !dbg !190
  %309 = getelementptr inbounds i8** %argv, i64 %308, !dbg !190
  %310 = load i8** %309, align 8, !dbg !190
  %311 = call %struct.__sFILE* @"\01_fopen"(i8* %310, i8* getelementptr inbounds ([3 x i8]* @.str18, i32 0, i32 0)), !dbg !190
  %312 = icmp eq %struct.__sFILE* %311, null, !dbg !190
  br i1 %312, label %313, label %316, !dbg !190

; <label>:313                                     ; preds = %300
  %314 = load %struct.__sFILE** @__stderrp, align 8, !dbg !191
  %315 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %314, i8* getelementptr inbounds ([47 x i8]* @.str19, i32 0, i32 0)), !dbg !191
  br label %358, !dbg !193

; <label>:316                                     ; preds = %300
  %317 = mul nsw i64 1, %4, !dbg !194
  %318 = getelementptr inbounds i32* %7, i64 %317, !dbg !194
  call void @copyRegs(i32* %318, i32 %290, i32 %295, %struct.__sFILE* %311), !dbg !194
  %319 = call i32 @fclose(%struct.__sFILE* %311), !dbg !195
  br label %333, !dbg !196

; <label>:320                                     ; preds = %277
  %321 = sext i32 %holder.0 to i64, !dbg !197
  %322 = getelementptr inbounds i8** %argv, i64 %321, !dbg !197
  %323 = load i8** %322, align 8, !dbg !197
  %324 = call i32 @strcmp(i8* %323, i8* getelementptr inbounds ([4 x i8]* @.str20, i32 0, i32 0)), !dbg !197
  %325 = icmp ne i32 %324, 0, !dbg !197
  br i1 %325, label %331, label %326, !dbg !197

; <label>:326                                     ; preds = %320
  %327 = sext i32 %holder.0 to i64, !dbg !198
  %328 = getelementptr inbounds i8** %argv, i64 %327, !dbg !198
  %329 = load i8** %328, align 8, !dbg !198
  %330 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str21, i32 0, i32 0), i8* %329), !dbg !198
  call void @exit(i32 -1) noreturn, !dbg !200
  unreachable, !dbg !200

; <label>:331                                     ; preds = %320
  %332 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str22, i32 0, i32 0)), !dbg !201
  br label %333

; <label>:333                                     ; preds = %128, %194, %192, %316, %331, %275, %159, %103
  %point.1 = phi i32* [ %108, %103 ], [ %point.0, %128 ], [ %point.0, %159 ], [ %point.0, %192 ], [ %point.0, %194 ], [ %point.0, %275 ], [ %point.0, %316 ], [ %point.0, %331 ]
  %334 = sext i32 %holder.0 to i64, !dbg !203
  %335 = getelementptr inbounds i8** %argv, i64 %334, !dbg !203
  %336 = load i8** %335, align 8, !dbg !203
  %337 = getelementptr inbounds i8* %336, i64 0, !dbg !203
  %338 = load i8* %337, align 1, !dbg !203
  %339 = sext i8 %338 to i32, !dbg !203
  %340 = icmp eq i32 %339, 55, !dbg !203
  br i1 %340, label %341, label %343, !dbg !203

; <label>:341                                     ; preds = %333
  %342 = add nsw i32 %holder.0, 4, !dbg !204
  br label %355, !dbg !206

; <label>:343                                     ; preds = %333
  %344 = sext i32 %holder.0 to i64, !dbg !207
  %345 = getelementptr inbounds i8** %argv, i64 %344, !dbg !207
  %346 = load i8** %345, align 8, !dbg !207
  %347 = getelementptr inbounds i8* %346, i64 0, !dbg !207
  %348 = load i8* %347, align 1, !dbg !207
  %349 = sext i8 %348 to i32, !dbg !207
  %350 = icmp eq i32 %349, 54, !dbg !207
  br i1 %350, label %351, label %353, !dbg !207

; <label>:351                                     ; preds = %343
  %352 = add nsw i32 %holder.0, 2, !dbg !208
  br label %355, !dbg !210

; <label>:353                                     ; preds = %343
  %354 = add nsw i32 %holder.0, 1, !dbg !211
  br label %355

; <label>:355                                     ; preds = %351, %353, %341
  %holder.1 = phi i32 [ %342, %341 ], [ %352, %351 ], [ %354, %353 ]
  %356 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str23, i32 0, i32 0)), !dbg !213
  br label %75, !dbg !214

; <label>:357                                     ; preds = %75
  br label %358, !dbg !215

; <label>:358                                     ; preds = %357, %313, %222
  %.0 = phi i32 [ 1, %222 ], [ 1, %313 ], [ 0, %357 ]
  call void @llvm.stackrestore(i8* %5), !dbg !216
  ret i32 %.0, !dbg !217
}

declare i8* @llvm.stacksave() nounwind

declare i64 @llvm.objectsize.i64(i8*, i1) nounwind readnone

declare i8* @__memset_chk(i8*, i32, i64, i64) nounwind

define internal i8* @__inline_memset_chk(i8* %__dest, i32 %__val, i64 %__len) nounwind uwtable inlinehint ssp {
  %1 = call i64 @llvm.objectsize.i64(i8* %__dest, i1 false), !dbg !218
  %2 = call i8* @__memset_chk(i8* %__dest, i32 %__val, i64 %__len, i64 %1) nounwind, !dbg !218
  ret i8* %2, !dbg !218
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*)

declare i8* @malloc(i64)

declare i32 @"\01_fputs"(i8*, %struct.__sFILE*)

declare void @exit(i32) noreturn

declare i64 @fread(i8*, i64, i64, %struct.__sFILE*)

declare i32 @atoi(i8*)

declare i32 @fclose(%struct.__sFILE*)

declare void @free(i8*)

define i32 @getInteger(i8* %input) nounwind uwtable ssp {
  %1 = call i32 @atoi(i8* %input), !dbg !220
  ret i32 %1, !dbg !220
}

declare i32 @strcmp(i8*, i8*)

declare void @llvm.stackrestore(i8*) nounwind

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"cmdInterpreter.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint", metadata !"Apple clang version 4.1 (tags/Apple/clang-421.11.66) (based on LLVM 3.1svn)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c] [DW_LANG_C99]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !73, metadata !74, metadata !78, metadata !81}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"copyReg", metadata !"copyReg", metadata !"", metadata !6, i32 72, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32, i32, %struct.__sFILE*)* @copyReg, null, null, metadata !1, i32 73} ; [ DW_TAG_subprogram ] [line 72] [def] [scope 73] [copyReg]
!6 = metadata !{i32 786473, metadata !"cmdInterpreter.c", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !11, metadata !11, metadata !12}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!12 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!13 = metadata !{i32 786454, null, metadata !"FILE", metadata !6, i32 161, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ] [FILE] [line 161, size 0, align 0, offset 0] [from __sFILE]
!14 = metadata !{i32 786451, null, metadata !"__sFILE", metadata !15, i32 130, i64 1216, i64 64, i32 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__sFILE] [line 130, size 1216, align 64, offset 0] [from ]
!15 = metadata !{i32 786473, metadata !"/usr/include/stdio.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint", null} ; [ DW_TAG_file_type ]
!16 = metadata !{metadata !17, metadata !20, metadata !21, metadata !22, metadata !24, metadata !25, metadata !30, metadata !31, metadata !33, metadata !37, metadata !43, metadata !51, metadata !57, metadata !58, metadata !61, metadata !62, metadata !66, metadata !70, metadata !71, metadata !72}
!17 = metadata !{i32 786445, metadata !14, metadata !"_p", metadata !15, i32 131, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_member ] [_p] [line 131, size 64, align 64, offset 0] [from ]
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned char]
!19 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!20 = metadata !{i32 786445, metadata !14, metadata !"_r", metadata !15, i32 132, i64 32, i64 32, i64 64, i32 0, metadata !10} ; [ DW_TAG_member ] [_r] [line 132, size 32, align 32, offset 64] [from int]
!21 = metadata !{i32 786445, metadata !14, metadata !"_w", metadata !15, i32 133, i64 32, i64 32, i64 96, i32 0, metadata !10} ; [ DW_TAG_member ] [_w] [line 133, size 32, align 32, offset 96] [from int]
!22 = metadata !{i32 786445, metadata !14, metadata !"_flags", metadata !15, i32 134, i64 16, i64 16, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ] [_flags] [line 134, size 16, align 16, offset 128] [from short]
!23 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!24 = metadata !{i32 786445, metadata !14, metadata !"_file", metadata !15, i32 135, i64 16, i64 16, i64 144, i32 0, metadata !23} ; [ DW_TAG_member ] [_file] [line 135, size 16, align 16, offset 144] [from short]
!25 = metadata !{i32 786445, metadata !14, metadata !"_bf", metadata !15, i32 136, i64 128, i64 64, i64 192, i32 0, metadata !26} ; [ DW_TAG_member ] [_bf] [line 136, size 128, align 64, offset 192] [from __sbuf]
!26 = metadata !{i32 786451, null, metadata !"__sbuf", metadata !15, i32 96, i64 128, i64 64, i32 0, i32 0, null, metadata !27, i32 0, i32 0} ; [ DW_TAG_structure_type ] [__sbuf] [line 96, size 128, align 64, offset 0] [from ]
!27 = metadata !{metadata !28, metadata !29}
!28 = metadata !{i32 786445, metadata !26, metadata !"_base", metadata !15, i32 97, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_member ] [_base] [line 97, size 64, align 64, offset 0] [from ]
!29 = metadata !{i32 786445, metadata !26, metadata !"_size", metadata !15, i32 98, i64 32, i64 32, i64 64, i32 0, metadata !10} ; [ DW_TAG_member ] [_size] [line 98, size 32, align 32, offset 64] [from int]
!30 = metadata !{i32 786445, metadata !14, metadata !"_lbfsize", metadata !15, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !10} ; [ DW_TAG_member ] [_lbfsize] [line 137, size 32, align 32, offset 320] [from int]
!31 = metadata !{i32 786445, metadata !14, metadata !"_cookie", metadata !15, i32 140, i64 64, i64 64, i64 384, i32 0, metadata !32} ; [ DW_TAG_member ] [_cookie] [line 140, size 64, align 64, offset 384] [from ]
!32 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!33 = metadata !{i32 786445, metadata !14, metadata !"_close", metadata !15, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !34} ; [ DW_TAG_member ] [_close] [line 141, size 64, align 64, offset 448] [from ]
!34 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!35 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{metadata !10, metadata !32}
!37 = metadata !{i32 786445, metadata !14, metadata !"_read", metadata !15, i32 142, i64 64, i64 64, i64 512, i32 0, metadata !38} ; [ DW_TAG_member ] [_read] [line 142, size 64, align 64, offset 512] [from ]
!38 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!39 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !10, metadata !32, metadata !41, metadata !10}
!41 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!42 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!43 = metadata !{i32 786445, metadata !14, metadata !"_seek", metadata !15, i32 143, i64 64, i64 64, i64 576, i32 0, metadata !44} ; [ DW_TAG_member ] [_seek] [line 143, size 64, align 64, offset 576] [from ]
!44 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !46, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{metadata !47, metadata !32, metadata !47, metadata !10}
!47 = metadata !{i32 786454, null, metadata !"fpos_t", metadata !15, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ] [fpos_t] [line 85, size 0, align 0, offset 0] [from __darwin_off_t]
!48 = metadata !{i32 786454, null, metadata !"__darwin_off_t", metadata !15, i32 110, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_typedef ] [__darwin_off_t] [line 110, size 0, align 0, offset 0] [from __int64_t]
!49 = metadata !{i32 786454, null, metadata !"__int64_t", metadata !15, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !50} ; [ DW_TAG_typedef ] [__int64_t] [line 46, size 0, align 0, offset 0] [from long long int]
!50 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!51 = metadata !{i32 786445, metadata !14, metadata !"_write", metadata !15, i32 144, i64 64, i64 64, i64 640, i32 0, metadata !52} ; [ DW_TAG_member ] [_write] [line 144, size 64, align 64, offset 640] [from ]
!52 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!53 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{metadata !10, metadata !32, metadata !55, metadata !10}
!55 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !56} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!56 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!57 = metadata !{i32 786445, metadata !14, metadata !"_ub", metadata !15, i32 147, i64 128, i64 64, i64 704, i32 0, metadata !26} ; [ DW_TAG_member ] [_ub] [line 147, size 128, align 64, offset 704] [from __sbuf]
!58 = metadata !{i32 786445, metadata !14, metadata !"_extra", metadata !15, i32 148, i64 64, i64 64, i64 832, i32 0, metadata !59} ; [ DW_TAG_member ] [_extra] [line 148, size 64, align 64, offset 832] [from ]
!59 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __sFILEX]
!60 = metadata !{i32 786451, null, metadata !"__sFILEX", metadata !15, i32 102, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [__sFILEX] [line 102, size 0, align 0, offset 0] [fwd] [from ]
!61 = metadata !{i32 786445, metadata !14, metadata !"_ur", metadata !15, i32 149, i64 32, i64 32, i64 896, i32 0, metadata !10} ; [ DW_TAG_member ] [_ur] [line 149, size 32, align 32, offset 896] [from int]
!62 = metadata !{i32 786445, metadata !14, metadata !"_ubuf", metadata !15, i32 152, i64 24, i64 8, i64 928, i32 0, metadata !63} ; [ DW_TAG_member ] [_ubuf] [line 152, size 24, align 8, offset 928] [from ]
!63 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 24, i64 8, i32 0, i32 0, metadata !19, metadata !64, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 24, align 8, offset 0] [from unsigned char]
!64 = metadata !{metadata !65}
!65 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!66 = metadata !{i32 786445, metadata !14, metadata !"_nbuf", metadata !15, i32 153, i64 8, i64 8, i64 952, i32 0, metadata !67} ; [ DW_TAG_member ] [_nbuf] [line 153, size 8, align 8, offset 952] [from ]
!67 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !19, metadata !68, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from unsigned char]
!68 = metadata !{metadata !69}
!69 = metadata !{i32 786465, i64 0, i64 0}        ; [ DW_TAG_subrange_type ] [0, -1]
!70 = metadata !{i32 786445, metadata !14, metadata !"_lb", metadata !15, i32 156, i64 128, i64 64, i64 960, i32 0, metadata !26} ; [ DW_TAG_member ] [_lb] [line 156, size 128, align 64, offset 960] [from __sbuf]
!71 = metadata !{i32 786445, metadata !14, metadata !"_blksize", metadata !15, i32 159, i64 32, i64 32, i64 1088, i32 0, metadata !10} ; [ DW_TAG_member ] [_blksize] [line 159, size 32, align 32, offset 1088] [from int]
!72 = metadata !{i32 786445, metadata !14, metadata !"_offset", metadata !15, i32 160, i64 64, i64 64, i64 1152, i32 0, metadata !47} ; [ DW_TAG_member ] [_offset] [line 160, size 64, align 64, offset 1152] [from fpos_t]
!73 = metadata !{i32 786478, i32 0, metadata !6, metadata !"copyRegs", metadata !"copyRegs", metadata !"", metadata !6, i32 83, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32, i32, %struct.__sFILE*)* @copyRegs, null, null, metadata !1, i32 84} ; [ DW_TAG_subprogram ] [line 83] [def] [scope 84] [copyRegs]
!74 = metadata !{i32 786478, i32 0, metadata !6, metadata !"main", metadata !"main", metadata !"", metadata !6, i32 90, metadata !75, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !1, i32 91} ; [ DW_TAG_subprogram ] [line 90] [def] [scope 91] [main]
!75 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{metadata !10, metadata !10, metadata !77}
!77 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!78 = metadata !{i32 786478, i32 0, metadata !6, metadata !"getInteger", metadata !"getInteger", metadata !"", metadata !6, i32 265, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @getInteger, null, null, metadata !1, i32 265} ; [ DW_TAG_subprogram ] [line 265] [def] [getInteger]
!79 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{metadata !10, metadata !41}
!81 = metadata !{i32 786478, i32 0, metadata !82, metadata !"__inline_memset_chk", metadata !"__inline_memset_chk", metadata !"", metadata !82, i32 81, metadata !83, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* (i8*, i32, i64)* @__inline_memset_chk, null, null, metadata !1, i32 82} ; [ DW_TAG_subprogram ] [line 81] [local] [def] [scope 82] [__inline_memset_chk]
!82 = metadata !{i32 786473, metadata !"/usr/include/secure/_string.h", metadata !"/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint", null} ; [ DW_TAG_file_type ]
!83 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{metadata !32, metadata !32, metadata !10, metadata !85}
!85 = metadata !{i32 786454, null, metadata !"size_t", metadata !82, i32 78, i64 0, i64 0, i64 0, i32 0, metadata !86} ; [ DW_TAG_typedef ] [size_t] [line 78, size 0, align 0, offset 0] [from __darwin_size_t]
!86 = metadata !{i32 786454, null, metadata !"__darwin_size_t", metadata !82, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !87} ; [ DW_TAG_typedef ] [__darwin_size_t] [line 90, size 0, align 0, offset 0] [from long unsigned int]
!87 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!88 = metadata !{i32 75, i32 60, metadata !89, null}
!89 = metadata !{i32 786443, metadata !5, i32 73, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!90 = metadata !{i32 77, i32 2, metadata !89, null}
!91 = metadata !{i32 79, i32 2, metadata !89, null}
!92 = metadata !{i32 80, i32 2, metadata !89, null}
!93 = metadata !{i32 81, i32 1, metadata !89, null}
!94 = metadata !{i32 85, i32 2, metadata !95, null}
!95 = metadata !{i32 786443, metadata !73, i32 84, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!96 = metadata !{i32 86, i32 3, metadata !97, null}
!97 = metadata !{i32 786443, metadata !95, i32 85, i32 15, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!98 = metadata !{i32 87, i32 2, metadata !97, null}
!99 = metadata !{i32 88, i32 1, metadata !95, null}
!100 = metadata !{i32 94, i32 35, metadata !101, null}
!101 = metadata !{i32 786443, metadata !74, i32 91, i32 1, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!102 = metadata !{i32 103, i32 2, metadata !101, null}
!103 = metadata !{i32 104, i32 2, metadata !101, null}
!104 = metadata !{i32 115, i32 2, metadata !101, null}
!105 = metadata !{i32 116, i32 2, metadata !101, null}
!106 = metadata !{i32 117, i32 2, metadata !101, null}
!107 = metadata !{i32 119, i32 2, metadata !101, null}
!108 = metadata !{i32 121, i32 2, metadata !101, null}
!109 = metadata !{i32 122, i32 3, metadata !110, null}
!110 = metadata !{i32 786443, metadata !101, i32 121, i32 24, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!111 = metadata !{i32 123, i32 31, metadata !110, null}
!112 = metadata !{i32 124, i32 31, metadata !110, null}
!113 = metadata !{i32 130, i32 3, metadata !110, null}
!114 = metadata !{i32 131, i32 4, metadata !115, null}
!115 = metadata !{i32 786443, metadata !110, i32 130, i32 31, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!116 = metadata !{i32 132, i32 4, metadata !115, null}
!117 = metadata !{i32 133, i32 26, metadata !115, null}
!118 = metadata !{i32 134, i32 4, metadata !115, null}
!119 = metadata !{i32 135, i32 4, metadata !115, null}
!120 = metadata !{i32 136, i32 3, metadata !115, null}
!121 = metadata !{i32 142, i32 3, metadata !110, null}
!122 = metadata !{i32 143, i32 4, metadata !123, null}
!123 = metadata !{i32 786443, metadata !110, i32 142, i32 31, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!124 = metadata !{i32 144, i32 4, metadata !123, null}
!125 = metadata !{i32 145, i32 26, metadata !123, null}
!126 = metadata !{i32 146, i32 4, metadata !123, null}
!127 = metadata !{i32 147, i32 4, metadata !123, null}
!128 = metadata !{i32 148, i32 4, metadata !123, null}
!129 = metadata !{i32 149, i32 3, metadata !123, null}
!130 = metadata !{i32 155, i32 3, metadata !110, null}
!131 = metadata !{i32 156, i32 4, metadata !132, null}
!132 = metadata !{i32 786443, metadata !110, i32 155, i32 31, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!133 = metadata !{i32 157, i32 4, metadata !132, null}
!134 = metadata !{i32 158, i32 4, metadata !132, null}
!135 = metadata !{i32 159, i32 3, metadata !132, null}
!136 = metadata !{i32 165, i32 3, metadata !110, null}
!137 = metadata !{i32 166, i32 4, metadata !138, null}
!138 = metadata !{i32 786443, metadata !110, i32 165, i32 31, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!139 = metadata !{i32 167, i32 5, metadata !140, null}
!140 = metadata !{i32 786443, metadata !138, i32 166, i32 15, metadata !6, i32 9} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!141 = metadata !{i32 168, i32 4, metadata !140, null}
!142 = metadata !{i32 169, i32 5, metadata !143, null}
!143 = metadata !{i32 786443, metadata !138, i32 168, i32 11, metadata !6, i32 10} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!144 = metadata !{i32 179, i32 3, metadata !110, null}
!145 = metadata !{i32 180, i32 4, metadata !146, null}
!146 = metadata !{i32 786443, metadata !110, i32 179, i32 31, metadata !6, i32 11} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!147 = metadata !{i32 182, i32 54, metadata !146, null}
!148 = metadata !{i32 185, i32 17, metadata !146, null}
!149 = metadata !{i32 187, i32 5, metadata !150, null}
!150 = metadata !{i32 786443, metadata !146, i32 186, i32 4, metadata !6, i32 12} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!151 = metadata !{i32 188, i32 5, metadata !150, null}
!152 = metadata !{i32 191, i32 21, metadata !146, null}
!153 = metadata !{i32 192, i32 4, metadata !146, null}
!154 = metadata !{i32 193, i32 5, metadata !155, null}
!155 = metadata !{i32 786443, metadata !146, i32 192, i32 24, metadata !6, i32 13} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!156 = metadata !{i32 194, i32 5, metadata !155, null}
!157 = metadata !{i32 197, i32 13, metadata !146, null}
!158 = metadata !{i32 199, i32 4, metadata !146, null}
!159 = metadata !{i32 201, i32 9, metadata !160, null}
!160 = metadata !{i32 786443, metadata !146, i32 201, i32 4, metadata !6, i32 14} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!161 = metadata !{i32 202, i32 5, metadata !162, null}
!162 = metadata !{i32 786443, metadata !160, i32 201, i32 30, metadata !6, i32 15} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!163 = metadata !{i32 204, i32 5, metadata !162, null}
!164 = metadata !{i32 205, i32 31, metadata !165, null}
!165 = metadata !{i32 786443, metadata !162, i32 204, i32 44, metadata !6, i32 16} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!166 = metadata !{i32 206, i32 6, metadata !165, null}
!167 = metadata !{i32 207, i32 11, metadata !168, null}
!168 = metadata !{i32 786443, metadata !165, i32 207, i32 6, metadata !6, i32 17} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!169 = metadata !{i32 208, i32 7, metadata !170, null}
!170 = metadata !{i32 786443, metadata !168, i32 207, i32 31, metadata !6, i32 18} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!171 = metadata !{i32 207, i32 26, metadata !168, null}
!172 = metadata !{i32 211, i32 5, metadata !165, null}
!173 = metadata !{i32 212, i32 6, metadata !174, null}
!174 = metadata !{i32 786443, metadata !162, i32 211, i32 12, metadata !6, i32 19} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!175 = metadata !{i32 213, i32 6, metadata !174, null}
!176 = metadata !{i32 201, i32 25, metadata !160, null}
!177 = metadata !{i32 217, i32 4, metadata !146, null}
!178 = metadata !{i32 218, i32 4, metadata !146, null}
!179 = metadata !{i32 220, i32 3, metadata !146, null}
!180 = metadata !{i32 226, i32 3, metadata !110, null}
!181 = metadata !{i32 229, i32 12, metadata !182, null}
!182 = metadata !{i32 786443, metadata !110, i32 226, i32 31, metadata !6, i32 20} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!183 = metadata !{i32 230, i32 10, metadata !182, null}
!184 = metadata !{i32 231, i32 4, metadata !182, null}
!185 = metadata !{i32 233, i32 4, metadata !182, null}
!186 = metadata !{i32 234, i32 5, metadata !187, null}
!187 = metadata !{i32 786443, metadata !182, i32 233, i32 21, metadata !6, i32 21} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!188 = metadata !{i32 235, i32 4, metadata !187, null}
!189 = metadata !{i32 236, i32 4, metadata !182, null}
!190 = metadata !{i32 237, i32 17, metadata !182, null}
!191 = metadata !{i32 239, i32 5, metadata !192, null}
!192 = metadata !{i32 786443, metadata !182, i32 238, i32 4, metadata !6, i32 22} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!193 = metadata !{i32 241, i32 5, metadata !192, null}
!194 = metadata !{i32 244, i32 4, metadata !182, null}
!195 = metadata !{i32 246, i32 4, metadata !182, null}
!196 = metadata !{i32 247, i32 3, metadata !182, null}
!197 = metadata !{i32 247, i32 15, metadata !110, null}
!198 = metadata !{i32 248, i32 4, metadata !199, null}
!199 = metadata !{i32 786443, metadata !110, i32 247, i32 44, metadata !6, i32 23} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!200 = metadata !{i32 249, i32 4, metadata !199, null}
!201 = metadata !{i32 251, i32 4, metadata !202, null}
!202 = metadata !{i32 786443, metadata !110, i32 250, i32 10, metadata !6, i32 24} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!203 = metadata !{i32 253, i32 3, metadata !110, null}
!204 = metadata !{i32 254, i32 4, metadata !205, null}
!205 = metadata !{i32 786443, metadata !110, i32 253, i32 31, metadata !6, i32 25} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!206 = metadata !{i32 255, i32 3, metadata !205, null}
!207 = metadata !{i32 255, i32 10, metadata !110, null}
!208 = metadata !{i32 256, i32 4, metadata !209, null}
!209 = metadata !{i32 786443, metadata !110, i32 255, i32 38, metadata !6, i32 26} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!210 = metadata !{i32 257, i32 3, metadata !209, null}
!211 = metadata !{i32 258, i32 4, metadata !212, null}
!212 = metadata !{i32 786443, metadata !110, i32 257, i32 10, metadata !6, i32 27} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
!213 = metadata !{i32 260, i32 3, metadata !110, null}
!214 = metadata !{i32 261, i32 2, metadata !110, null}
!215 = metadata !{i32 262, i32 2, metadata !101, null}
!216 = metadata !{i32 263, i32 1, metadata !101, null}
!217 = metadata !{i32 263, i32 1, metadata !74, null}
!218 = metadata !{i32 83, i32 56, metadata !219, null}
!219 = metadata !{i32 786443, metadata !81, i32 82, i32 1, metadata !82, i32 29} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint//usr/include/secure/_string.h]
!220 = metadata !{i32 266, i32 9, metadata !221, null}
!221 = metadata !{i32 786443, metadata !78, i32 265, i32 28, metadata !6, i32 28} ; [ DW_TAG_lexical_block ] [/Users/qiqi/Study/number_handling/TCs/TC_C_195_vx123/src/kint/cmdInterpreter.c]
