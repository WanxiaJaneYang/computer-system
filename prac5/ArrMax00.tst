// Sample Test file for ArrMax.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load ArrMax.asm,
output-file ArrMax00.out,
compare-to ArrMax00.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[2048]%D2.6.2 RAM[2049]%D2.6.2 RAM[2050]%D2.6.2 RAM[2051]%D2.6.2;

set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1] 2048,  // Set R1
set RAM[2]    4,  // Set R2
set RAM[2048] 2,  // Set Arr[0]
set RAM[2049] 1,  // Set Arr[1]
set RAM[2050] 4,  // Set Arr[2]
set RAM[2051] 3;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 2048,  // Restore arguments in case program used them
set RAM[2] 4,
output;           // Output to file

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

set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1]  200,  // Set R1
set RAM[2]    0,  // Set R2
set RAM[200] 2,  // Set Arr[0]
set RAM[201] 1,  // Set Arr[1]
set RAM[202] 4,  // Set Arr[2]
set RAM[203] 3;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] 0,
output;           // Output to file

set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1]  200,  // Set R1
set RAM[2]   -1,  // Set R2
set RAM[200] 2,  // Set Arr[0]
set RAM[201] 1,  // Set Arr[1]
set RAM[202] 4,  // Set Arr[2]
set RAM[203] 3;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] -1,
output;           // Output to file

set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1]  200,  // Set R1
set RAM[2]    2,  // Set R2
set RAM[200] 2,  // Set Arr[0]
set RAM[201] 1,  // Set Arr[1]
set RAM[202] 4,  // Set Arr[2]
set RAM[203] 3;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] 2,
output;           // Output to file

set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1]  200,  // Set R1
set RAM[2]    1,  // Set R2
set RAM[200] 1,  // Set Arr[0]
set RAM[201] 2,  // Set Arr[1]
set RAM[202] 4,  // Set Arr[2]
set RAM[203] 3;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] 1,
output;           // Output to file

set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1]  200,  // Set R1
set RAM[2]    4,  // Set R2
set RAM[200] 1024,  // Set Arr[0]
set RAM[201] -1024,  // Set Arr[1]
set RAM[202] 2048,  // Set Arr[2]
set RAM[203] -2345;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] 4,
output;           // Output to file

set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1]  200,  // Set R1
set RAM[2]    4,  // Set R2
set RAM[200] 32767,  // Set Arr[0]
set RAM[201] -1024,  // Set Arr[1]
set RAM[202] 0,  // Set Arr[2]
set RAM[203] -32768;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] 4,
output;           // Output to file

output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[200]%D2.6.2 RAM[201]%D2.6.2 RAM[202]%D2.6.2 RAM[203]%D2.6.2 RAM[204]%D2.6.2;
set PC 0,
set RAM[0]    0,  // Set R0
set RAM[1]  200,  // Set R1
set RAM[2]    5,  // Set R2
set RAM[200]  8,  // Set Arr[0]
set RAM[201] -1024,  // Set Arr[1]
set RAM[202] 0,  // Set Arr[2]
set RAM[203] -32768;  // Set Arr[3]
set RAM[204]  32760;  // Set Arr[3]
repeat 300 {
  ticktock;       // Run for 300 clock cycles
}
set RAM[1] 200,  // Restore arguments in case program used them
set RAM[2] 5,
output;           // Output to file
