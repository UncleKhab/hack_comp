// Programm Add2.asm
// Computes: RAM[2] = RAM[0] + RAM[1]
// Usage: put values in RAM[0], RAM[1]
@0
D=M // D = RAM[0]

@1
D=D+M // D = D + RAM[1]

@2
M=D // RAM[2] = D

// Best practice is to end program with infinite loop
// It makes sense to block the program such as a bad actor can't 
// Run malicious code after out program runs (if it doesn't end properly);
// But stucking it into an infinite loops seems weird
// TODO -> Look more into how to break the control flow

@6
0;JMP