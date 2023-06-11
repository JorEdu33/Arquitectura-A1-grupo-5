// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

@R2 // RAM[2]=0
M=0 // RAM[2]


(LOOP)
@R1
D=M // D=RAM[1] 
@END
D;JLE // If R1<=0 goto END
@R0
D=M // D=RAM[0]
@R2
M=D+M // R2=RAM[0]+R2
@R1
M=M-1 // R1=R1-1
@LOOP
0;JMP // Goto LOOP
(END)
@END
0;JMP // Infinite loop
