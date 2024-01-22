// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

@8192
D=A
@n
M=D

(LOOP_KEY)
    @SCREEN
    D=A
    A=D+1
    D=M
    @KBD
    D= D + M
    @LOOP_INTERNAL
    D; JGE

    @8192
    D=A
    @n
    M=D
    @LOOP_WHITE
    0; JMP

    (LOOP_INTERNAL)    
        @KBD
        D=M
        
        @LOOP_KEY
        D; JEQ
        
        @8192
        D=A
        @n
        M=D
        
        @LOOP_BLACK
        D; JGT
    
    
    

(LOOP_BLACK)
    @n
    D=M
    @LOOP_KEY
    D; JLT


    @SCREEN
    D=A
    @n
    D=D+M
    A=D
    M=-1

    @n
    D=M-1
    M=D
    
    @LOOP_BLACK // WE LOOP WHILE N >= 0
    D; JGE

    @LOOP_KEY
    0; JMP

    
(LOOP_WHITE)
    @n
    D=M
    @LOOP_KEY
    D; JLT

    @SCREEN
    D=A
    @n
    D=D+M
    A=D
    M=0

    @n
    D=M-1
    M=D
    
    @LOOP_WHITE
    D; JGE

    @LOOP_KEY
    0; JMP

(END)
    @END
    0; JMP