include Irvine32.inc
.STACK

.DATA

input0 byte 'assembly hello world', 0
;input0 byte 'ab1a ', 0 ; test input
output0 byte ' vowels. ', 0
output1 byte ' consonant ', 0

vowels byte 'AEIOUaeiou', 0

x byte ? ; vowels count
y byte ? ; consonant count



.CODE

main proc

	mov esi, 0
	mov ecx, lengthof input0

loop_through_string:
	
	mov al, input0[esi]

	; check if the input is alphabet (A-Za-z)
	cmp al, 'A'
	jl loopToNext
	cmp al, 'Z'
	jle loopToNext
	cmp al, 'a'
	jl loopToNext
	cmp al, 'z'
	jg loopToNext
	
	; if reached here then the character is alphabet.. continue.

	mov ebx, 0 ; index for vowels
	push ecx ; push ecx = lengthof input0
	mov ecx, 9 ; counter for vowels
	
	loopVowels:
		mov dl, vowels[ebx]
		cmp dl, al
		je incVowels
		jmp nextVowel
		incVowels:
			inc x
			pop ecx
			jmp loopToNext
	
		nextVowel:
		inc ebx
		loop loopVowels
	
	incConsonant:
		inc y
		pop ecx
		jmp loopToNext
	
	loopToNext:

	inc esi
	loop loop_through_string

	; Counting done.. Printing the result.

	movzx eax, y
	call writeDec

	lea edx, output1
	call writeString

	movzx eax, x
	call writeDec

	lea edx, output0
	call writeString

	exit
main endp

end main