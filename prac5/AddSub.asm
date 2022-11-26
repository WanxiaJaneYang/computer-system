// Calculates R1 - R2 + R3 and stores the result in R0.
// (R0, R1, R2, R3 refer to RAM[0], RAM[1], RAM[2], and RAM[3], respectively.)

// Put your code here.
@R1	//select R1
D=M	//D=R1
@R2	//select R2
D=D-M //D=R1-R2
@R3	//select R3
D=D+M //D=R1-R2+R3
@R0	//select R0
M=D	//R0=R1-R2+R3
(END)
@END	//end of the program
0;JMP