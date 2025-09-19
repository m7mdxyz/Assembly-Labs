INCLUDE Irvine32.inc

.DATA

v0 BYTE 15
v1 BYTE 'A'
v2 BYTE '128'
v3 WORD 12345
v4 WORD "XY"
v5 BYTE ?

val1 DWORD 10000000h
val2 DWORD 20000000h


a1 BYTE 1,2,3,4,5,6,7,8,9,10
a2 BYTE 10 DUP(?)
Total WORD 0
msg BYTE 'the total of the array a1 is: ', 0
space BYTE ' '

.CODE
main PROC
	comment @ practice
	mov ah, al
	mov al, v0
	mov v0, ah
	mov bl, 7
	mov v5, 7

	movzx ecx, ch
	mov dx, 01111h
	movsx edx, dh
	

	xchg ah, al
	xchg ax, bx
	xchg eax, ebx
	xchg val1, ebx
	;xchg val1, val2 ;error: two memories
	exercise @

	mov ecx, 9 ; for looping
	mov edi, 0 ; edi is the index register
	mov eax, 0 ; this to initialize the 32 bits to 0 even if you will use smaller register size.
	mov edx, offset space

	xx:
	; print a1[edi], the element number edi of a1
	; Note that you should get the value in eax to use WriteInt
	
	mov al, a1[edi]
	call writeDec
	call writeString
	
	; mov a1[edi] in a2[edi] ; don�t forget the mov restrictions
	mov a2[edi], al

	; add the a1[edi] with total in total ; don�t forget the add restrictions
	add Total, ax

	inc edi
	loop xx ; note that loop subtracts 1 from ecx and jump to xx if ecx is not 0.

	call crlf
	;print the (message) �the total of the array a1 is: � and then the value of total (in the same line)
	mov edx, OFFSET msg
	call writeString
	mov ax, Total
	call writeDec

	call crlf
	call crlf


	exit
main ENDP
END main