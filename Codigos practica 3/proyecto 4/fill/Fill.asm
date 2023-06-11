// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

if(KBD > 0) goto BLACK
else goto WHITE

(RESTART)
@SCREEN
D=A
@0
M=D   

(KBDCHECK)

@KBD
D=M
@BLACK
D;JGT   
@WHITE
D;JEQ   

@KBDCHECK
0;JMP

(BLACK)
@1
M=-1 
@CHANGE
0;JMP

(WHITE)
@1
M=0     //CON QUÉ LLENAR LA PANTALLA
@CHANGE
0;JMP

(CHANGE)
@1     //COMPROBAR CON QUÉ LLENAR LA PANTALLA
D=M    //D CONTIENE NEGRO O BLANCO

@0
A=M    //OBTENER DIRECCIÓN DE PÍXEL DE PANTALLA PARA LLENAR
M=D    //LO LLENAMOS

@0
D=M+1    //INCREMENTAR AL SIGUIENTE PÍXEL
@KBD
D=A-D    //KBD-SCREEN=A

@0
M=M+1    //INCREMENTAR AL SIGUIENTE PÍXEL
A=M

@CHANGE
D;JGT    

@RESTART
0;JMP