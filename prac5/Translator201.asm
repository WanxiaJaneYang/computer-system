//This is a file to test lable and lable statement

(TEST)
@TEST
D;JGT
D=D+1
(NEGATIVE)
@NEGATIVE
D;JLT
@TEST
D;JNE
@POSITIVE
D;JGT

(POSITIVE)
@END
0;JMP

(END)
@END
0;JMP