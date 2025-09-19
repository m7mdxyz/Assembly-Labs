# Quiz 02: Vowel and Consonant Counter

This program showcases string traversal, character comparison, and conditional logic to categorize characters in a string. The objective is to count the number of vowels and consonants in a predefined string.

## Problem Statement
The program should:
1. Take a predefined string (`input0`).
2. Loop through each character of the string.
3. Identify if the character is an alphabet (a-z, A-Z).
4. For each alphabet, determine if it is a vowel or a consonant.
5. Keep a running count of both vowels and consonants.
6. Print the final count of vowels and consonants.

## Solution and Implementation
My solution uses a nested loop structure. The outer loop iterates over the `input0` string. Conditional jump instructions (`jl`, `jg`, `jle`) are used to check if the character falls within the alphabetical range. If it is an alphabet, a nested loop is entered to iterate through a predefined `vowels` array. A `cmp` instruction is used to check for a match. If a match is found, a counter for vowels is incremented; otherwise, the consonant counter is incremented.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.