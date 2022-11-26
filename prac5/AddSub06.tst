// Sample Test file for AddSub.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load AddSub.asm,
output-file AddSub06.out,
compare-to AddSub06.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set PC 0,
set RAM[1] 45,  // Set R1
set RAM[2] -32768,  // Set R2
set RAM[3] 25536;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

