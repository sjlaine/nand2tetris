// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

  @R0
  D=M
  @sum
  M=0 // load val of R0 into sum

  @R1
  D=M
  @loops
  M=D // load R1 val into loops

  @R2
  M=0

  (LOOP)
    @loops
    D=M
    @END // end if loops zero
    D;JEQ

    // add sum in R2 plus the R0 val
    @R0
    D=M // D = val of R0
    @sum
    M=M+D

    @loops
    D=M-1
    M=D // decrement loops

    @LOOP
    D;JGT

  @sum
  D=M

  @R2
  M=D

  (END)
    @END
    0;JMP
