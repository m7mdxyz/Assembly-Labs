INCLUDE Irvine32.inc
.STACK

.DATA

msg1 byte "upper", 0
msg2 byte "LOWER", 0

.CODE
main PROC
	
	mov ecx, lengthof msg1
	lea esi, msg1
	push esi
L1:
	AND byte ptr [esi], 11011111b
	inc esi
	loop L1

	pop esi
	mov edx, esi
	call writestring
	call crlf

	;lea edx, msg1
	;call writestring
	;call crlf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov ecx, lengthof msg2
	lea esi, msg2
	push esi
L2:
	OR byte ptr [esi], 00100000b
	inc esi
	loop L2

	pop esi
	mov edx, esi
	call writestring
	

	exit
main endp
end main