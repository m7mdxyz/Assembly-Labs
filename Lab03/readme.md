# Lab 03: Addressing Modes

**Lab PDF:** [CS221 Assembly Language lab 3 - students version.pdf](Lab03.pdf)

This lab introduces various addressing modes in Assembly language. The exercise focuses on using these modes to find the intersection of two arrays.

## Problem Statement
The exercise problem requires a program that:
- Declares two arrays (`a1`, `a2`) of 10 words, each initialized with integer values.
- Declares an uninitialized array (`intersection`) of 10 words.
- Uses two nested loops to find the intersection of `a1` and `a2`.
- The inner loop checks if a value from `a1` exists in `a2`. If a match is found, the value is added to the `intersection` array and the inner loop is exited.
- Finally, the contents of the `intersection` array are printed.

## Solution and Implementation
I used nested `loop` instructions to iterate through the arrays. The outer loop iterates through `a1`, and the inner loop iterates through `a2`. The `cmp` instruction is used to compare values, and `jne` is used to jump to the next element if they are not equal. I used different addressing modes to access array elements to demonstrate an understanding of direct, base, and index addressing modes.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.