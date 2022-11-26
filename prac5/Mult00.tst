// Sample Test file for Mult.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load Mult.asm,
output-file Mult00.out,
compare-to Mult00.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 2,  // Set R1
set RAM[2] 2;  // Set R2
repeat 50 {
  ticktock;    // Run for 200 clock cycles
}
set RAM[1] 2,  // Restore arguments in case program used them
set RAM[2] 2,
output;        // Output to file

set PC 0,
set RAM[0] 3,  // Set R0
set RAM[1] 0,  // Set R1
set RAM[2] 2;  // Set R2
repeat 50 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 2,  // Set R1
set RAM[2] 0;  // Set R2
repeat 50 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 2,  // Set R0
set RAM[1] 0,  // Set R1
set RAM[2] 0;  // Set R2
repeat 50 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 2,  // Set R0
set RAM[1] 5,  // Set R1
set RAM[2] -5;  // Set R2
repeat 200 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 2,  // Set R0
set RAM[1] -5,  // Set R1
set RAM[2] 5;  // Set R2
repeat 200 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 2,  // Set R0
set RAM[1] 5,  // Set R1
set RAM[2] 5;  // Set R2
repeat 200 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 2,  // Set R0
set RAM[1] 1,  // Set R1
set RAM[2] 32767;  // Set R2
repeat 100 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 2,  // Set R0
set RAM[1] 2,  // Set R1
set RAM[2] 32767;  // Set R2
repeat 100 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 32767,  // Set R1
set RAM[2] 2;  // Set R2
repeat 100 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 32767,  // Set R1
set RAM[2] 1;  // Set R2
repeat 100 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 222,  // Set R1
set RAM[2] 55;  // Set R2
repeat 5000 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 8,  // Set R1
set RAM[2] 998;  // Set R2
repeat 5000 {
  ticktock;    // Run for 200 clock cycles
}
output;        // Output to file