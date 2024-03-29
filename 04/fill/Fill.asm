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

@8191
D=A
@n_reset
M=D



// CHECKS IF THE KEY IS PRESSED OR NOT
(LOOP_KEY)
    @n
    D=M
    @RESET_N
    D; JLE

    @KBD
    D=M

    @CHECK_WHITE
    D; JLE
    @CHECK_BLACK
    D; JGT


(RESET_N)
    @n_reset
    D=M
    @n
    M=D

    @LOOP_KEY
    0; JMP

// CHECKS IF THE FIRST PIXEL IS BLACK 
// if the first pixel is not black, paint everything black
(CHECK_BLACK)
    @SCREEN
    D=M
    @PAINT_BLACK
    D; JGE

    @LOOP_KEY
    0; JMP

// CHECKS IF THE FIRST PIXEL IS WHITE
// if the first pixel is not white, paint everything white
(CHECK_WHITE)
    @SCREEN
    D=M

    @PAINT_WHITE
    D; JLT
    @LOOP_KEY
    0; JMP

// PAINT BLACK FROM BOTTOM TO TOP
(PAINT_BLACK)
    @SCREEN
    D=A
    @n
    D=D+M
    A=D
    M=-1

    @n
    D=M-1
    M=D

    @PAINT_BLACK
    D; JGE

    @LOOP_KEY
    0; JMP

// PAINT WHITE FROM BOTTOM TO TOP
(PAINT_WHITE)
    @SCREEN
    D=A
    @n
    D=D+M
    A=D
    M=0

    @n
    D=M-1
    M=D

    @PAINT_WHITE
    D; JGE

    @LOOP_KEY
    0; JMP

(END)
    @END
    0; JMP