INCLUDE Irvine32.inc

.DATA


msg byte "enter eax and ebx values", 0dh, 0ah, 0

jzMsg byte "ZF = 1", 0dh, 0ah, 0
jnzMsg byte "ZF = 0", 0dh, 0ah, 0
jeMsg byte "eax = ebx", 0dh, 0ah, 0

jcMsg byte "JC = 1", 0dh, 0ah, 0
jncMsg byte "JC = 0", 0dh, 0ah, 0


eaxVal byte "eax = ", 0
ebxVal byte "ebx = ", 0



.code
main proc
	
start:
		lea edx, msg
		call writeString

		lea edx, eaxVal
		call writeString
		call readInt

		mov ebx, eax

		lea edx, ebxVal 
		call writeString
		call readInt

		xchg eax, ebx
		call crlf
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;

		cmp eax, ebx
		jc jc_jump ; jump if carry to jc_jump
		jnc jnc_jump

		jc_jump:
					lea edx, jcMsg
					call writestring
					call crlf

					jmp start
		jnc_jump:
					lea edx, jncMsg
					call writestring
					call crlf
					;jmp start


		;;;;;;;;;;;;;;;;;;;;;;;;;;

		cmp eax, ebx
		jz jz_jump ;if eax-ebx=0 (eax=ebx)

		; if eax-ebx!=0 (eax != ebx)
		lea edx, jnzMsg
		call writestring
		call crlf
		
		;;;;;;;;;;

		nextcmp:
		cmp eax, ebx
		je je_jump ;

		
		call crlf
		jmp start ; loop again

		jz_jump:
			lea edx, jzMsg
			call writestring
			call crlf

		jmp nextcmp

		je_jump:
		lea edx, jeMsg
		call writestring
		call crlf

		jmp start ; loop again

	exit
main endp
end main