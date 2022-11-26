// Sample Test file for AddSub.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load AddSub.asm,
output-file AddSub00.out,
compare-to AddSub00.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set PC 0,
set RAM[1] 3,  // Set R1
set RAM[2] 2,  // Set R2
set RAM[3] 1;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] -32768,  // Set R1
set RAM[2] -32768,  // Set R2
set RAM[3] -32768;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] 32767,  // Set R1
set RAM[2] 32767,  // Set R2
set RAM[3] 32767;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] -32768,  // Set R1
set RAM[2] 32767,  // Set R2
set RAM[3] 32767;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] -32768,  // Set R1
set RAM[2] -32768,  // Set R2
set RAM[3] 32767;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] -32768,  // Set R1
set RAM[2] 32767,  // Set R2
set RAM[3] -32768;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] 45,  // Set R1
set RAM[2] -32768,  // Set R2
set RAM[3] 25536;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] 2048,  // Set R1
set RAM[2] 1024,  // Set R2
set RAM[3] 8192;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] -2048,  // Set R1
set RAM[2] -1024,  // Set R2
set RAM[3] -8192;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] 1,  // Set R1
set RAM[2] 1,  // Set R2
set RAM[3] 0;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] 0,  // Set R1
set RAM[2] 0,  // Set R2
set RAM[3] 0;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;

set PC 0,
set RAM[1] 1,  // Set R1
set RAM[2] 1,  // Set R2
set RAM[3] 1;  // Set R3
repeat 10 {
  ticktock;    // Run for 10 clock cycles
}
output;