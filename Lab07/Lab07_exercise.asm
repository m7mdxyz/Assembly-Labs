INCLUDE Irvine32.inc
.STACK

.DATA

MAX = 100

enterStrMsg BYTE "Enter a string: ", 0
str1 BYTE MAX DUP(0)
str2 BYTE MAX DUP(0)
temp BYTE ?


menu BYTE	 "1- Way 1 (base index mode)", 0dh, 0ah,
			 "2- Way 1 (index addressing mode)", 0dh, 0ah, 
			 "3- Way 2", 0dh, 0ah, 
			 "9- Exit", 0dh, 0ah, 0

palindromeMsg	 BYTE "string is palindrome",     0dh, 0ah, 0
notPalindromeMsg BYTE "string is not palindrome", 0dh, 0ah, 0

.CODE
main PROC
start:
	lea edx, menu
	call writeString
	call readInt
	
	cmp eax, 1
	je way1Base
	
	cmp eax, 2
	je way1Index
	
	cmp eax, 3
	je way2_
	
	cmp eax, 9
	je exit_
	
	; loop again if invalid input
	jmp nextLoop

	;;;;
	way1Base:
		call getString
		call way1_Base
		call crlf

		jmp nextLoop

	way1Index:
		call getString
		call way1_Index
		call crlf
		
		jmp nextLoop

	way2_:
		call getString
		call way2
		call crlf

		jmp nextLoop
	
	nextLoop:
		jmp start

	;;;;

	exit_:
	exit
main ENDP

getString PROC

	lea edx, enterStrMsg
	call writeString

	lea edx, str1
	mov ecx, MAX ; load the length of the string variable
	call ReadString
	
	ret
getString ENDP


way1_Base PROC
	
	lea ebx, str1

	outter:
		mov esi, 0
		dec eax ; last char

		inner:
			mov ch, [ebx + eax]
			mov cl, [ebx + esi]
			cmp ch, cl
			je same
			jmp notPalindrome

			same:
				inc esi
				dec eax
				cmp eax, esi
				jle isPalindrome
				jmp inner

	isPalindrome:
		call crlf
		lea edx, palindromeMsg
		call writeString
		call crlf
		jmp exit_

	notPalindrome:
		call crlf
		lea edx, notPalindromeMsg
		call writeString
		call crlf
	
	exit_:
	ret
way1_Base ENDP


way1_Index PROC

	outter:
		mov esi, 0
		dec eax

		inner:
			mov ch, str1[eax]
			mov cl, str1[esi]
			cmp ch, cl
			je same
			jmp notPalindrome

			same:
				inc esi
				dec eax
				cmp eax, esi
				jle isPalindrome
				jmp inner


	isPalindrome:
		call crlf
		lea edx, palindromeMsg
		call writeString
		call crlf
		jmp exit_

	notPalindrome:
		call crlf
		lea edx, notPalindromeMsg
		call writeString
		call crlf
	
	exit_:
	ret
way1_Index ENDP


way2 PROC

	mov ecx, eax
	mov ebx, eax
	mov temp, bl
	
	mov esi, 0
	dec ebx ; last char

	cpy:
		mov al, str1[ebx]
		mov str2[esi], al
		inc esi
		dec ebx
		loop cpy

	mov esi, 0
	movzx ecx, temp

	compare:
		mov ah, str2[esi]
		mov al, str1[esi]
		cmp ah, al
		jne notPalindrome
		inc esi
		loop compare

	call crlf
	lea edx, palindromeMsg
	call writeString
	call crlf
	jmp exit_


	notPalindrome:
		call crlf
		lea edx, notPalindromeMsg
		call writeString
		call crlf
	
	exit_:
	ret
way2 ENDP

end main