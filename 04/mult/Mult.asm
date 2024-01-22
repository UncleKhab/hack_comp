// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//// Replace this comment with your code.
@0
D=A 
@sum 
M=D // initialize sum as 0


@R1
D=M
@OUT
D; JEQ // We goto zerocase if r0 is 0 (because any int x * 0 = 0)

@R0
D=M
@OUT // we goto zerocase if r1 is 0 because any int x * 0 = 0
D; JEQ


@R0
D=M

@R1
D=D-M

@ITEM_R0_ITERATOR_R1 // if r0 >= r1 goto ifr0
D; JGE

@ITEM_R1_ITERATOR_R0 // if r0 < r1 goto ifr1
D; JLT

(ITEM_R0_ITERATOR_R1)
    @R0 
    D=M 
    @item  // init item with value of r0
    M=D 

    @R1
    D=M
    @n // initialize n with value of r1
    M=D    
    @LOOP
    0; JMP

(ITEM_R1_ITERATOR_R0)
    @R1
    D=M
    @item // initialize item with value of r1
    M=D

    @R0
    D=M
    @n // initialize n wit value of r0
    M=D 
    @LOOP
    0;JMP

(LOOP)
    @item
    D=M
    @sum // Add item to sum
    D=D+M
    M=D

    @n  // Decrement n
    D=M-1
    M=D
    
    @OUT // When n <=0 goto out
    D; JLE 

    @LOOP
    0; JMP

(OUT)
    @sum    
    D=M     
    @R2 // Write sum to R2
    M=D 
    @END
    0; JMP

(END)
    @END
    0; JMP