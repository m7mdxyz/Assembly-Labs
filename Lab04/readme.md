# Lab 04: Procedures and Subroutines

**Lab PDF:** [CS221 Assembly Language lab 4.pdf](Lab04.pdf)

This lab introduces the concept of procedures to modularize code. The main task is to refactor the Lab 3 exercise into a series of procedures that are called from the main procedure.

## Problem Statement
The exercise problem requires a program that:
- Refactors the intersection-finding program from Lab 3 into separate procedures.
- The `main` procedure should act as a menu, presenting options to the user.
- One of the options should call a procedure that encapsulates the logic for finding and printing the intersection of the two arrays.

## Solution and Implementation
I defined a procedure using the `PROC` and `ENDP` directives to contain the logic from Lab 3. The `main` procedure uses a loop and conditional jumps (`JMP`) to display a menu and call the appropriate procedure based on user input. I used `gotoxy` to ensure the menu is always displayed in the same location on the screen.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.