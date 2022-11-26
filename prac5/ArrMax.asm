// Finds the largest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//RAM[R0]->max
// max=arr[0];
// for(i=1;i<length;i++){
//	max=math.max(max, arr[i]);
// }

//math.max
//if(a>0){
//	if(b>0){
//		max=a-b>0?a:b
//	}
//else{
//	if(b>0){
//		max=b
//	}else{
//		max=a-b>0?a:b
//	}				
//}

//exeception case is that RAM[2]<=0
//address=RAM[R1]
//arr[i]=RAM[address+i]

@R2
D=M
@END		
D;JLE	//end the program if length<=0

@R1	//select the address of first element 
A=M	//M=RAM[RAM[R1]] now, which is M=arr[0]
D=M	//D=arr[0]
@R0	//use a variable max to store the current max 
M=D  //max=arr[0]

@i	//declare i
M=1	//i=1 

(FOR_STATEMENT)
@R2	//get the length of the array
D=M	//store the length of the array in D register
@NEGATIVE_LENGTH_OR_ZERO
D;JLE	//jump if length is less or equal to zero
@i	//get the current i
D=M-D	//D=i-length
@LOOP
D;JLT	//if i-length<0, loop

(END)
@END		//end the program
0;JMP

(LOOP)
@i		//get i
D=M		//D=i
@R1		//M=address of arr[0]
D=D+M	//D=address of arr[i]
@address //this is to store the address of arr[i]
M=D		//address=i+1
A=M		//set A register as the address, M now is arr[i]
D=M		//D=arr[i]
@another	//set a variable to store the new element for further comparison
M=D		//another=arr[i]

@ANOTHER_POSITIVE
D;JGE	//jump to the branch that arr[i] is positive or zero
@ANOTHER_NEGATIVE
D;JLT	//jump to the branch that arr[i] is negative

@CHANGE_MAX
D;JLT	//jump if current max is smaller than arr[i]
@i
M=M+1	//i++
@FOR_STATEMENT
0;JMP	//jump to judge if the loop need to continue

(CHANGE_MAX)
@another	//get the another element
D=M		//store the element at D
@R0		//select R0
M=D		//max=another
@i
M=M+1	//i++
@FOR_STATEMENT
0;JMP	//jump to judge if the loop need to continue

(NEGATIVE_LENGTH_OR_ZERO)
@END
0;JMP	//exception case, simply end the program

(ANOTHER_POSITIVE)
@R0		//get max
D=M		//D=max
@SAME_SIGN
D;JGE	//jump to the branch that they have the same sign
@CHANGE_MAX
0;JMP	//if max is negative, change the current max as arr[i]

(ANOTHER_NEGATIVE)
@R0		//get max
D=M
@SAME_SIGN
D;JLT	//jump to the branch that they have the same sign
@i
M=M+1	//i++
@FOR_STATEMENT
0;JMP	//otherwise jump to judge if the loop need to continue

(SAME_SIGN)
@R0		//get max
D=M		//D=max
@another		//get another
D=D-M		//D=max-another
@CHANGE_MAX	
D;JLT		//if max<another,change max
@i
M=M+1	//i++
@FOR_STATEMENT
0;JMP	//otherwise jump to judge if the loop need to continue

