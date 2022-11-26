// Sample Test file for Mult.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load Mult.asm,
output-file Mult10.out,
compare-to Mult10.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 32767,  // Set R1
set RAM[2] 1;  // Set R2
repeat 100 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

