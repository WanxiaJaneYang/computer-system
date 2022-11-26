// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//RAM[1]=a, RAM[2]=b

//sum=0
//if(a==0||b==0){
//	return
//}
//int abs_a=Math.abs(a)
//int abs_b=Math.abs(b)
//
//if(abs_a>abs_b){
//	swap(abs_a, abs_b)
//}
//
//for(int count=abs_a;count>0;count--){
//	sum+=abs_b;
//}
//
//if(a>0){
//	if(b<0){
//		sum=-sum
//	}
//}else{
//	if(b>0){
//		sum=-sum
//	}
//}
//RAM[1]=a, RAM[2]=b

@R0
M=0	//initialize sum=0

@R1
D=M		//D=a
@abs_a
M=D		//abs_a=a
@ABS_A
D;JLT	//a<0;jump to set the abs_a
@END
D;JEQ	//if a==0,return

(CONTINUE_SET_B)
@R2
D=M		//D=b
@abs_b
M=D		//abs_b=b
@ABS_B
D;JLT	//b<0;jump to set the abs_b
@END
D;JEQ	//if b==0,return

(JUDGE_SWAP)
@abs_a
D=M
@abs_b
D=D-M
@SWAP
D;JGT

(INITIALIZE_LOOP)
@abs_a
D=M		//D=abs_a
@count
M=D		//count=abs_a

(JUDGE_COUNT)
@count
D=M		//D=count
@GET_SIGN
D;JEQ	//jump to get the sign when count==0

@abs_b
D=M		//D=b
@R0
M=D+M	//sum+=abs_b

@count
M=M-1	//i--
@JUDGE_COUNT
0;JMP

(END)
@END		//LABEL END
0;JMP

(ABS_A)
@abs_a	
M=-M		//if a<0; negate abs_a
@CONTINUE_SET_B
0;JMP	//go to set the abs_b

(ABS_B)
@abs_b	
M=-M		//if b<0;negate abs_b
@JUDGE_SWAP
0;JMP	//continue to find if we need swap

(GET_SIGN)
@R1
D=M		//D=a
@POSITIVE_A
D;JGT	//jump to the branch that a>0
@R2		//continue when a<0
D=M		//D=b
@NEGATE_RESULT
D;JGT	//if a<0 b>0, negate the result
@END
0;JMP	//otherwise end the program

(POSITIVE_A)
@R2
D=M		//D=b
@NEGATE_RESULT
D;JLT	//if b<0 while a>0, negate the result
@END
0;JMP	//otherwise end the program

(NEGATE_RESULT)
@R0		
M=-M		//if a>0&&b<0 ||a<0&&b>0, negate the result 
@END
0;JMP

(SWAP)
@abs_a	//M=abs_a
D=M		//D=abs_a
@temp	
M=D		//temp=abs_a
@abs_b	//M=abs_b
D=M		//D=abs_b
@abs_a	//M=abs_a
M=D		//abs_a=abs_b
@temp	//M=abs_a
D=M		//D=abs_a
@abs_b	//M=abs_b
M=D		//abs_b=abs_a
@INITIALIZE_LOOP
0;JMP	//continue to initialize the loop
