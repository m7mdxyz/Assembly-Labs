# Lab 08: Encryption and Decryption Algorithms

**Lab PDF:** [CS221 Assembly Language lab 8.pdf](Lab08.pdf)

This final lab focuses on information security by implementing a basic encryption and decryption system using Assembly language procedures. The project models a sender and a receiver communicating a message.

## Problem Statement
The exercise problem requires a program with two main procedures, `sender` and `receiver`:
* **Sender**: This procedure calls subroutines to:
    * Read a message and a key from the user.
    * Encrypt the message using the key with the `xor` instruction.
    * Insert the key at the end of the encrypted message.
    * Print the final encrypted message.
* **Receiver**: This procedure calls subroutines to:
    * Extract the key from the received message.
    * Decrypt the message using the extracted key.
    * Print the final decrypted message.

## Solution and Implementation
I structured the program with `sender` and `receiver` procedures, each calling a series of subroutines to perform specific tasks (`readMsg`, `encryption`, `decryption`, etc.). I used the `xor` instruction for encryption and decryption, taking advantage of its reversible nature. I used base and index addressing modes to process the message and key, ensuring that the size of the entered string (`ecx`) is preserved across procedure calls as required.

## How to Compile and Run
Follow the instructions in the main repository's `README.md` to compile and run the `.asm` file.