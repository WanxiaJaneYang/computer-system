// Sample Test file for Mult.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load Mult.asm,
output-file Mult12.out,
compare-to Mult12.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 8,  // Set R1
set RAM[2] 998;  // Set R2
repeat 5000 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file