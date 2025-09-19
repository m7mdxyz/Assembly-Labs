INCLUDE Irvine32.inc

.DATA

a1 WORD 1,2,3,4,5,6,7,8,9,10
totalarray word 0

.CODE
main PROC

;	Direct addressing

	mov eax, 0

	add ax, a1[0]
	add ax, a1[2]
	add ax, a1[4]
	add ax, a1[6]
	add ax, a1[8]
	add ax, a1[10]
	add ax, a1[12]
	add ax, a1[14]
	add ax, a1[16]
	add ax, a1[18]

	call writedec
	call crlf
;---------------------

;	Base addressing
	
	mov eax, 0 ; Reset total to zero
	mov ebx, OFFSET a1

	add ax, [ebx]
	add ax, [ebx+2]
	add ax, [ebx+4]
	add ax, [ebx+6]
	add ax, [ebx+8]
	add ax, [ebx+10]
	add ax, [ebx+12]
	add ax, [ebx+14]
	add ax, [ebx+16]
	add ax, [ebx+18]

	call writedec
	call crlf
;---------------------

;	Index addressing
	
	mov eax, 0 ; Reset total to zero
	mov ecx, lengthof a1 ; reset the counter
	mov esi, 0

L1:
	add ax, a1[esi]
	add esi, 2

loop L1
	
	call writedec
	call crlf
;---------------------

;	Index base addressing

	mov eax, 0 ; reset total to zero
	mov ecx, lengthof a1 ; reset counter
	mov esi, 0
	mov ebx, OFFSET a1

L2:
	add ax, [ebx+esi]
	add esi, 2

loop L2
	
	call writedec
	call crlf

;---------------------

;	mixed base-index addressing

	mov eax, 0 ; Reset total to zero
	mov ecx, lengthof a1 ; reset the counter
	mov esi, 0
	mov ebx, OFFSET a1

L3:
	add ax, [ebx + esi * 2]
	inc esi

loop L3

	call writedec
	call crlf

	exit
main ENDP
END main