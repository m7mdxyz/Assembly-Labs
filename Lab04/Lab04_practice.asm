INCLUDE Irvine32.inc

.DATA

a1 WORD 1,2,3,4,5,6,7,8,9,10
totalarray word 0

menu byte "1) Direct addressing", 0dh, 0ah,
		 "2) Base addressing", 0dh, 0ah,
		 "3) Index addressing", 0dh, 0ah,
		 "4) Index base addressing", 0dh, 0ah,
		 "5) mixed base-index addressing", 0dh, 0ah, 0dh, 0ah,
		 "   Select from 1 to 5: ", 0

.CODE
main PROC

start:

	; display menu
	mov edx, offset menu
	call writestring

	; read user input
	call readint

	cmp eax, 1
	jne b
	call DirectAddr
	jmp z

	b:
		cmp eax, 2
		jne cc
		call BaseAddr
		jmp z

	cc:
		cmp eax, 3
		jne d
		call IndexAddr
		jmp z

	d:
		cmp eax, 4
		jne e
		call IndexBaseAddr
		jmp z

	e:
		cmp eax, 5
		;not in (1,2,3,4,5) exit the program
		jne ex
		call MixedAddr

	z:
		; start again
		jmp start

	ex:
		exit
main ENDP

DirectAddr PROC
	mov eax, 0

	add ax, a1[0] ; add ax, al+0
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
	ret
DirectAddr ENDP

BaseAddr PROC
	mov eax, 0 ; Reset total to zero
	mov ebx, OFFSET a1
	mov ecx, lengthof a1



l:
	add ax, [ebx]
	add ebx, 2

	loop l

	call writedec
	call crlf
	ret
BaseAddr ENDP

IndexAddr PROC
	mov eax, 0 ; Reset total to zero
	mov ecx, lengthof a1 ; reset the counter
	mov esi, 0

L1:
	add ax, a1[esi]
	add esi, 2

loop L1
	
	call writedec
	call crlf
	ret
IndexAddr ENDP

IndexBaseAddr PROC
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
	ret
IndexBaseAddr ENDP

MixedAddr PROC
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

	ret
MixedAddr ENDP


END main