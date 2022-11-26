// Sorts the array of length R2 whose first element is at RAM[R1] in descending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//bubble sort
//void sort(int[] &arr){
//	if length<=1; return
//	bool isSwapped=false;	
//	for(int i=0;i<length()-1;i++){
//		for(int j=0; j<length()-1-i; j++){
//			if(arrj_is_bigger(arr[j],arr[j+1])){
//				swap(arr[j], arr[j+1]);
//				isSwapped=true;
//			}	
//		}
//		if(!isSwapped){
//			break;
//		}
//	}	
//}

//swap(arr[i],arr[j]){
//	var temp=arr[i];
//	arr[i]=arr[j];
//	arr[j]=temp;
//}

//convert between i and RAM address: address=RAM[1], arr[i]=RAM[address=RAM[1]+i]

@R2
D=M		//D=length
D=D-1	//D=length-1
@SET_END_FLAG
D;JLE	//end the program if length<=1

@isSwapped
M=0	//bool isSwapped=false
	
@i
M=0	//i=0

(JUDGE_I)
@R2
D=M-1	//D=length-1
@i
D=M-D	//D=i-(length-1)
@SET_END_FLAG
D;JGE	//jump to end the loop if i>=length-1

(CONTINUE_OUTER_LOOP)
@j
M=0		//j=0

(JUDGE_J)
@R2
D=M		//D=length
D=D-1	//D=length-1
@i
D=D-M	//D=length-1-i
@j
D=M-D	//D=j-(length-1-i)
@BREAK_INNER_LOOP
D;JGE	//jump to break the inner loop if j>=length-1-i

(CONIINUE_INNER_LOOP)
@j
D=M+1	//D=j+1
@j_1
M=D		//j_1=j+1

@j
D=M		//D=j
@R1
D=D+M	//D=address of arrj
A=D		//M=arr[j]
D=M		//D=arr[i]
@arr_j	
M=D		//arr_j=arr[j]

@j_1		
D=M		//D=j+1
@R1		
D=D+M	//D=address of arr[j+1]
A=D		//M=arr[j+1]
D=M		//D=arr[j+1]
@arr_j_1
M=D		//M=arr[j+1]
@POSITVE_ARR_J_1
D;JGE	//jump to the branch that arr[j+1] is positive or zero
@arr_j
D=M		//D=arr[j]
@SAME_SIGN
D;JLT	//if arr[j]<0 where arr[j+1]<0, jump to same sign comparison
@J_PLUS_PLUS
0;JMP	//when arr[j]>0 where arr[j+1]<0, continue to j++

(SAME_SIGN)
@arr_j
D=M		//D=arr[j]
@arr_j_1	
D=D-M	//D=arr[j]-arr[j+1]
@SWAP
D;JLT	//if arr[j]<arr[j+1] swap the two

(J_PLUS_PLUS)
@j
M=M+1	//j++
@JUDGE_J
0;JMP	//jump to find if the inner loop should be break

(BREAK_INNER_LOOP)
@i
M=M+1	//i++
@isSwapped
D=M		//D=isSwapped
@SET_END_FLAG
D;JEQ	//is isSwapped==false(0), jump to break the outer loop
@JUDGE_I
0;JMP

(END)
@END
0;JMP

(SWAP)
@R1
D=M
@j
D=D+M	//D=address of arr[j]
@address_of_arr_j
M=D		//M=address of arr[j]
@arr_j_1	//M=arr[j+1]
D=M		//D=arr[j+1]
@address_of_arr_j	//M=address of arr[j]
A=M		//M=arr[j]
M=D		//arr[j]=arr[j+1]

@R1
D=M		
@j_1
D=D+M	//D=address of arr[j+1]
@address_of_arr_j_1
M=D		//M=address of arr[j+1]
@arr_j	//M=arr[j]
D=M		//D=arr[j]
@address_of_arr_j_1	//M=address of arr[j+1]
A=M		//M=arr[j+1]
M=D		//arr[j+1]=arr[j]
@isSwapped
M=1		//isSwapped=true
@J_PLUS_PLUS
0;JMP	//jump to j++

(POSITVE_ARR_J_1)
@arr_j
D=M		//D=arr[j]
@SAME_SIGN
D;JGE	//if arr[j]>=0, jump to same sign comparison
@SWAP
0;JMP	//if arr[j+1]>0 and arr[j]<0, jump to swap arr[j] and arr[j+1] 

(SET_END_FLAG)
@R0
M=-1
@END
0;JMP