# Lab 01: Data Declaration and Basic Data Transfer

**Lab PDF:** [CS221 Assembly Language Lab 1 - Student version.pdf](Lab01.pdf)

This lab focuses on the fundamentals of Assembly language, including data declaration and basic data transfer instructions. The lab exercises require declaring various data types and moving values between registers and memory.

## Problem Statement
The exercise problem (`Exercise.asm`) requires a program that:
- Prints a predefined string to the console.
- Initializes a register with a hexadecimal value.
- Initializes multiple registers to zero.
- Moves the content of one register to another.
- Dumps the current state of all registers for verification.

## Solution and Implementation
My solution uses the `mov` instruction to transfer data and the `WriteString` and `DumpRegs` macros from the Irvine32 library for I/O and debugging. The `mov edx, OFFSET buffer` instruction is used to prepare the string for printing. The program then initializes the specified registers and performs the required data moves before calling `DumpRegs` to show the final state.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.