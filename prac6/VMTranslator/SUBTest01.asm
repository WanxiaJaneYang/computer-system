@2
D=A
@SP
A=M
M=D
@SP
M=M+1

@3000
D=A
@SP
A=M
M=D
@SP
M=M+1

@SP
AM=M-1
D=M
A=A-1
M=M-D

@SP
AM=M-1
D=M
@R13
M=D
@5
D=A
@0
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D

@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

@SP
AM=M-1
D=M
A=A-1
M=M-D

@SP
AM=M-1
D=M
@R13
M=D
@5
D=A
@1
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D

@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

@SP
AM=M-1
D=M
A=A-1
M=M-D

@SP
AM=M-1
D=M
@R13
M=D
@5
D=A
@2
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D

@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

@SP
AM=M-1
D=M
A=A-1
M=M-D

@SP
AM=M-1
D=M
@R13
M=D
@5
D=A
@3
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D

@3
D=M
@SP
A=M
M=D
@SP
M=M+1

@4
D=M
@SP
A=M
M=D
@SP
M=M+1

@SP
AM=M-1
D=M
A=A-1
M=M-D

@SP
AM=M-1
D=M
@R13
M=D
@5
D=A
@4
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D

@16
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

@16
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

@SP
AM=M-1
D=M
A=A-1
M=M-D

@SP
AM=M-1
D=M
@R13
M=D
@5
D=A
@5
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D