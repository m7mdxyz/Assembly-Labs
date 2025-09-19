# Lab 02: Array Manipulation and Loops

**Lab PDF:** [CS221 Assembly Language lab 2-students version.pdf](Lab02.pdf)

This lab focuses on array manipulation, data transfer, and using loop instructions. The main exercise involves declaring and initializing arrays, and then using a loop to process their elements.

## Problem Statement
The exercise problem requires a program that:
- Declares and initializes an array (`a1`) of 10 byte integers.
- Declares an uninitialized array (`a2`) of 10 bytes.
- Declares a word variable (`Total`) initialized to 0.
- Uses a `loop` to:
    - Print each element of `a1`.
    - Copy each element from `a1` to `a2`.
    - Add each element of `a1` to `Total`.
- Prints the message "The total of the array a1 is: " followed by the final value of `Total`.

## Solution and Implementation
I used a `loop` instruction controlled by the `ecx` register to iterate through the arrays. The `edi` register was used as an index to access array elements. I used `movzx` to correctly transfer the byte values from the arrays to a 32-bit register (`eax`) before calling `WriteDec` to print them. The `add` instruction was used to accumulate the total in the `Total` variable.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.