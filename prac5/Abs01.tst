load Abs.asm,
output-file Abs01.out,
compare-to Abs01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2;


set PC 0,		//re-run
set RAM[1] 0;  // Set R1
repeat 12{
ticktock;
}
output;       // Output to file
