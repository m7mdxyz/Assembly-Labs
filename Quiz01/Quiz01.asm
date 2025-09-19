; Mohammed .. - myid. 
; ( D )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include Irvine32.inc

.data

count DWORD ?
array1 WORD 100 DUP(0) ;
minimum WORD 0

msg1 byte "enter array size:", 0
msg2 byte "enter array elements:", 0
msg3 byte "minimum is: "0

.code
main proc

	lea edx, msg1
	call writestring
	call readint

	mov count, eax


	mov ecx, count
	mov ebx, array1
	mov edi, 0

	lea edx, msg2
	call writestring


getElementsLoop:
	call readint
	mov ebx[edi*2], eax
	inc edi
	
	loop getElementsLoop

	mov ax, array1
	mov minimum, ax
	call min_print

	exit
main endp


min_print PROC

	mov ecx, count
	mov edi, 0
L:
	cmp minimum, array1[edi*2]
	mov edx, array1[edi*2]
	jl x
	inc edi
	loop L

x:
	mov minimum, edx

	lea edx, msg3
	call writestring
	movzx eax, minimum
	call writedec

	ret
min_print ENDP

end main