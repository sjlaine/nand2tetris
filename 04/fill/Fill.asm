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

(LISTEN)
  @KBD
  D=M

  @EMPTY // clear screen if kbd 0
  D;JEQ

  @FILL // fill screen if key pressed
  D;JGT


(PAINT)
  @oloops
  M=-1

  @32
  D=A
  @cols
  M=D

  (OUTER)
    @255
    D=A
    @rows
    M=D

    @iloops
    M=0

    @oloops
    D=M
    @cols
    D=D-M

    @LISTEN
    D;JEQ

    @SCREEN
    D=A
    @addr
    M=D

    @oloops
    M=M+1
    D=M

    @addr
    M=M+D

    (INNER)
      @iloops
      D=M

      @rows
      D=D-M

      @OUTER
      D;JEQ

      @color
      D=M
      @addr
      A=M
      M=D

      @iloops
      M=M+1
      @32
      D=A
      @addr
      M=D+M

      @INNER
      0;JMP

(EMPTY)
  @color
  M=0
  @PAINT
  0;JEQ

(FILL)
  @color
  M=-1
  @PAINT
  0;JEQ

(END)
  @END
  0;JMP
