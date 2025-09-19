; Lab 1 - Practice

include Irvine32.inc

.data
v1 BYTE 'A'
v2 BYTE 0
v3 BYTE 255
v4 BYTE -128
v5 BYTE +127
v6 BYTE ?

list1 BYTE 10, 20, 30, 40
list2 BYTE 10, 20, 30, 40
	  BYTE 50, 60, 70, 80
	  BYTE 81, 82, 83, 84

list3 BYTE ?, 32, 41h, 00100010b
list4 BYTE 0Ah, 20h, 'A', 22h

v7 WORD 'B'
v8 WORD 0
v9 WORD 255

str1 BYTE 'Hello, World!', 0

.code
main proc

	;Exercise

	mov edx, OFFSET str1
	call WriteString

	mov eax, 0F1E2D3Ch

	mov ebx, 0
	mov ecx, 0

	mov bx, ax

	mov cl, ah
	mov ch, al

	call DumpRegs

	exit
main endp
end main