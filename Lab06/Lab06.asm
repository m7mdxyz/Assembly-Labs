INCLUDE Irvine32.inc
.STACK

.DATA

array DWORD 6 DUP(0)
even_array DWORD 6 DUP(0)
odd_array DWORD 6 DUP(0)

evenL BYTE 6
oddL  BYTE 6


menu BYTE		"1- Enter values", 0dh, 0ah,
				"2- Print even numbers", 0dh, 0ah,
				"3- Print odd numbers", 0dh, 0ah,
				"4- Print totals", 0dh, 0ah,
				"5- Exit", 0dh, 0ah,
				"Your choice: ", 0dh, 0ah, 0


space BYTE " ", 0

even_total BYTE 0
odd_total  BYTE 0
all_total  BYTE 0

msg1  BYTE "even total = ", 0
msg2  BYTE "odd total = ", 0
msg3  BYTE "all total = ", 0


.CODE
main PROC
	mov eax, 0
	start:

		lea edx, menu
		call writeString

		call readInt ; take user choice
	
	;ch1:
		cmp eax, 1
		jne ch2

		mov ecx, lengthof array
		lea ebx, array

		call read_array
		call crlf
		jmp start ; loop again

	ch2:
		cmp eax, 2
		jne ch3
		
		lea ebx, even_array
		movzx ecx, evenL
		mov esi, 0

		call print_values
		call crlf
		jmp start ; loop again
		
	ch3:
		cmp eax, 3
		jne ch4
		
		lea ebx, odd_array
		movzx ecx, oddL
		mov esi, 0

		call print_values
		call crlf
		jmp start ; loop again

	ch4:
		cmp eax, 4
		jne ch5

		; even total
		
		lea edx, msg1
		call writeString

		lea ebx, even_array
		movzx ecx, evenL
		mov esi, 0
		mov eax, 0
		
		call calculate_total
		
		call crlf

		; odd total

		lea edx, msg2
		call writeString
		
		lea ebx, odd_array
		movzx ecx, oddL
		;mov esi, 0
		;mov eax, 0

		call calculate_total

		call crlf

		; all total
		
		lea edx, msg3
		call writeString

		lea ebx, array
		mov ecx, lengthof array
		;mov esi, 0
		;mov eax, 0

		call calculate_total

		call crlf

		call crlf
		jmp start ; loop again

	ch5:
		; EXIT
		
	exit
main endp

read_array PROC USES ecx ebx
	
	l:
		call readInt
		mov [ebx], eax
		add ebx, type array ; ebx + 4 (dword)

		loop l
	
	
	mov ecx, lengthof array
	lea ebx, array
	lea esi, even_array
	lea edi, odd_array

	call fill_even_odd
	ret
read_array ENDP

fill_even_odd PROC USES ecx ebx esi edi
	mov edx, 0 ; dh = even counter .. dl = odd counter
	l:
		mov eax, [ebx] ;load element into eax
		
		push eax
		AND eax, 1 ; check the least significant bit
		pop eax
		
		jp is_even
		jnp is_odd
		
		is_even:
			mov [esi], eax ; add the number to even array
			add esi, type array
			inc dh
			jmp next
			
		
		is_odd:
			mov [edi], eax ; add the number to odd array
			add edi, type array

			inc dl


		next:
		;---- move to next element----
		add ebx, type array		

		loop l

	mov evenL, dh
	mov oddL, dl

	ret
fill_even_odd ENDP

print_values PROC USES ebx ecx esi
	l:
		mov eax, [ebx + esi * 4]
		call writeDec
		lea edx, space
		call writeString
		inc esi
		
		loop l

	ret
print_values ENDP

calculate_total PROC USES ebx ecx esi eax

	l:
		add eax, [ebx + esi * 4]
		inc esi
		loop l
	
	call writeDec
	ret
calculate_total ENDP

end main