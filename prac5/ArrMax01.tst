// Sample Test file for ArrMax.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load ArrMax.asm,
output-file ArrMax01.out,
compare-to ArrMax01.cmp,

output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[200]%D2.6.2 RAM[201]%D2.6.2 RAM[202]%D2.6.2 RAM[203]%D2.6.2;
set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1]  200,  // Set R1
set RAM[2]    4,  // Set R2
set RAM[200] 2,  // Set Arr[0]
set RAM[201] 1,  // Set Arr[1]
set RAM[202] 4,  // Set Arr[2]
set RAM[203] 3;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] 4,
output;           // Output to file

