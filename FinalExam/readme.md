# Final Exam: Character Analysis

This program is a comprehensive demonstration of string handling, procedural programming, and conditional logic. The final exam's objective is to analyze a user-entered string and report the number of consonants and uppercase letters it contains.

## Problem Statement
The program should:
1. Prompt the user to enter a string.
2. Count the total number of consonants in the string.
3. Count the total number of uppercase letters in the string.
4. Print a final report showing both counts.

## Solution and Implementation
My solution is organized into several procedures for modularity: `enterString`, `UpperNbr`, `ConsentsNbr`, and `printResult`.
* The `enterString` procedure handles user input.
* The `UpperNbr` procedure iterates through the string and uses `cmp` with conditional jumps to check if a character's ASCII value falls within the 'A' through 'Z' range, incrementing a counter for each match.
* The `ConsentsNbr` procedure iterates through the string and uses a series of `cmp` and `je` instructions to check if a character is a vowel. If it is not a vowel, a consonant counter is incremented.
* The `printResult` procedure formats and displays the final counts.

This approach demonstrates the use of procedures, register-based string traversal, and logical comparisons for data analysis, showcasing the core skills learned throughout the course.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.