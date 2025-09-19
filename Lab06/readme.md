# Lab 06: Advanced Procedures and Stack Usage

**Lab PDF:** [CS221 Assembly Language lab 6.pdf](Lab06.pdf)

This lab expands on procedures and introduces the use of the stack for parameter passing. The goal is to build a menu-driven program that reads an array, processes it, and prints totals using a set of well-defined procedures.

## Problem Statement
The exercise problem requires a menu-driven program that perpetually loops and asks for user input. The program should contain several procedures to:
- Read an array of integers from the user.
- Fill separate arrays for even and odd numbers.
- Calculate and return the total of even numbers.
- Calculate and return the total of odd numbers.
- Calculate and return the total of all numbers.
- The `main` procedure uses the stack to pass parameters to these subroutines.

## Solution and Implementation
I implemented a `main` loop that calls different procedures based on user input. The procedures (`read_array`, `fill_even_odd`, `calculate_total`, etc.) were designed to receive parameters from the stack. I used the `push` and `pop` instructions to manage data on the stack, ensuring that registers are preserved and parameters are correctly passed between procedures. I also used base addressing and base-index-with-scale addressing modes for array access within the procedures.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.