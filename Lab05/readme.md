# Lab 05: Conditional Structures and Jumps

**Lab PDF:** [CS221 Assembly Language lab 5.pdf](Lab05.pdf)

This lab focuses on conditional structures and different types of jump instructions. The main exercise involves mimicking `if/elif/else` and `switch/case` statements in Assembly language.

## Problem Statement
The exercise problem requires a program that:
- Mimics a C-like `switch` statement using `cmp` and `je`/`jne` instructions. The program should ask for a user-entered value and print a message based on the case number.
- Mimics a Python-like `if/elif/else` structure by asking for two integers, comparing them, and printing a message indicating which condition is met (e.g., equal to, greater than, less than). This should use various jump instructions like `jl`, `jg`, `je`, etc.
- Uses `JMP` to create an infinite loop.

## Solution and Implementation
My solution uses `cmp` followed by conditional jump instructions (`je`, `jne`, `jl`, `jg`) to implement the conditional logic. For the `switch` statement, I created a series of conditional jumps to specific labels, with a final `JMP` to skip the other checks after a match is found. The Python-like structure uses a similar approach with multiple conditional jumps to test different comparison outcomes.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.