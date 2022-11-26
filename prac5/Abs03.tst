// Sample Test file for Abs.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load Abs.asm,
output-file Abs03.out,
compare-to Abs03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2;

set PC 0,		//re-run
set RAM[1] 32767;  // Set R1
repeat 12{
ticktock;
}
output;       // Output to file

