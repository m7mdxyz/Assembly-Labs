# Quiz 01: Finding the Minimum Value in an Array

This program demonstrates fundamental data manipulation and logical comparisons in Assembly language. The objective is to find the smallest value in an array of user-entered integers.

## Problem Statement
The program should:
1. Prompt the user to enter the size of an array.
2. Prompt the user to enter each integer element of the array.
3. Find the minimum value in the array.
4. Print the minimum value to the console.

## Solution and Implementation
My solution uses a `loop` to read the user-specified number of integers into an array. The program then initializes a `minimum` variable with the first element of the array. It proceeds to iterate through the rest of the array, using a `cmp` instruction to compare the current minimum with each subsequent element. A `jl` (jump if less) instruction is used to update the minimum value if a smaller element is found. The result is then printed by calling a dedicated procedure.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.