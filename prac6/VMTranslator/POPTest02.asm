@3005
D=A
@SP
A=M
M=D
@SP
M=M+1

@3050
D=A
@SP
A=M
M=D
@SP
M=M+1

@3
D=A
@SP
A=M
M=D
@SP
M=M+1

@2
D=A
@SP
A=M
M=D
@SP
M=M+1

@SP
AM=M-1
D=M
@R13
M=D
@THIS
D=M
@0
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D

@SP
AM=M-1
D=M
@R13
M=D
@THAT
D=M
@1
D=D+A
@R14
M=D
@R13
D=M
@R14
A=M
M=D

@SP
AM=M-1
D=M
@R13
M=D
@3
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

@SP
AM=M-1
D=M
@R13
M=D
@3
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