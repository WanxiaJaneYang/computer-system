// Sample Test file for AddSub.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load AddSub.asm,
output-file AddSub08.out,
compare-to AddSub08.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;


set PC 0,
set RAM[1] -2048,  // Set R1
set RAM[2] -1024,  // Set R2
set RAM[3] -8192;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

