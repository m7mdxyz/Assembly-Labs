# 💻 CS221: Assembly Language Labs

This repository contains all my laboratory exercises, quizzes, and final exam solutions for the **CS221: Assembly Language** course. The projects are implemented on a Windows platform using the Microsoft Macro Assembler (MASM) and the Irvine32 library, demonstrating a strong grasp of low-level programming concepts.

## Key Concepts and Skills Demonstrated
* **Low-Level Programming**: Direct manipulation of memory, registers, and the CPU instruction set.
* **Data Representation**: Working with binary, hexadecimal, and various data types.
* **Control Flow**: Implementing loops, conditional branching (`JMP`, `JNE`, etc.), and procedure calls.
* **System Calls**: Interacting with the operating system for input/output using the Irvine32 library.
* **Debugging and Optimization**: Writing efficient code and troubleshooting at the machine level.
* **Procedure & Stack Management**: Implementing reusable procedures and managing the stack for parameter passing.

## Lab and Assessment Index
* **Lab 01**: [Data Declaration & Basic Data Transfer](Lab01/README.md)
* **Lab 02**: [Array Manipulation and Loops](Lab02/README.md)
* **Lab 03**: [Addressing Modes](Lab03/README.md)
* **Lab 04**: [Procedures and Subroutines](Lab04/README.md)
* **Lab 05**: [Conditional Structures and Jumps](Lab05/README.md)
* **Lab 06**: [Advanced Procedures and Stack Usage](Lab06/README.md)
* **Lab 07**: [String Manipulation and Palindrome Check](Lab07/README.md)
* **Lab 08**: [Encryption and Decryption Algorithms](Lab08/README.md)
* **Quiz 01**: [Quiz 1 Solution](Quiz01/README.md)
* **Quiz 02**: [Quiz 2 Solution](Quiz02/README.md)
* **Final Exam**: [Final Exam Solution](FinalExam/README.md)

---

## How to Compile and Run
These projects require a Windows environment and the MASM assembler. You must have the Irvine32 library installed in the correct location.

### Prerequisites
* **Visual Studio**: A compatible version of Visual Studio with the Desktop development with C++ workload.
* **Irvine32.inc**: The `Irvine32.inc` library and its related files must be placed in your `C:\` directory.

### Compilation
To compile any of the `.asm` files, you can use the command line with `ml64.exe` (part of the Visual Studio tools). Navigate to the folder containing the `.asm` file and run the following commands:

```bash
# To compile the assembly code
ml64.exe /c /Cx /coff <filename>.asm

# To link the object file into an executable
link64.exe <filename>.obj