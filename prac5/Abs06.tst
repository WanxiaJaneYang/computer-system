
load Abs.asm,
output-file Abs06.out,
compare-to Abs06.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2;
set PC 0,		//re-run
set RAM[1] -32767;  // Set R1
repeat 12{
ticktock;
}
output;       // Output to file