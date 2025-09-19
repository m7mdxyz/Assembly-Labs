# Lab 07: String Manipulation and Palindrome Check

**Lab PDF:** [CS221 Assembly Language lab 7.pdf](Lab07.pdf)

This lab focuses on string manipulation and uses procedures to check if a string is a palindrome. It requires implementing two different methods to check for a palindrome.

## Problem Statement
The exercise problem requires a program that:
- Asks the user to enter a string.
- Checks if the string is a palindrome using two different methods:
    1.  **Comparison Method**: A procedure that compares the first and last characters of the string, moving inward.
    2.  **Reversal Method**: A procedure that reverses the entire string and then compares it to the original.
- The program should use separate procedures for each check and output the result.

## Solution and Implementation
I implemented two main procedures for the palindrome check. The first procedure uses two pointers (registers) and a loop to compare characters from both ends of the string. The second procedure calls a `reversestring` subroutine which copies the string in reverse into a new buffer. The program then compares the original string with the reversed one to determine if it's a palindrome. I also used addressing modes like base and index to access the string characters.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.