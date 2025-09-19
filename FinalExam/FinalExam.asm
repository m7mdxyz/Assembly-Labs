include Irvine32.inc
.STACK

.DATA

myString byte 20 dup(0)
stringSize dword ?
Cnbr dword 0 ; consents counter
Ubnr dword 0 ; uppercase letters counter

msg0 byte 'Please enter a string without spaces with mixed Upper and Lower letters: ', 0
msg1 byte 'The entered string has ', 0
msg2 byte ' consents and ', 0
msg3 byte ' upper case letters', 0ah, 0dh, 0

.code

main proc
	lea ebx, myString
	call enterString
	call UpperNbr
	call ConsentsNbr
	call printResult
	
	exit
main endp

enterString PROC
	lea edx, msg0
	call writeString

	mov ecx, 20
	mov edx, ebx
	call readString
	mov stringSize, eax

	ret
enterString ENDP

ConsentsNbr PROC
	
	lea ebx, myString
	mov ecx, stringSize
ll:
	mov dl, [ebx]
	cmp dl, 'A'
	je next
	cmp dl, 'E'
	je next
	cmp dl, 'I'
	je next
	cmp dl, 'O'
	je next
	cmp dl, 'U'
	je next
	cmp dl, 'a'
	je next
	cmp dl, 'e'
	je next
	cmp dl, 'i'
	je next
	cmp dl, 'o'
	je next
	cmp dl, 'u'
	je next

	isConsent:
		inc Cnbr

	next:
	inc ebx
	loop ll
	
	ret
ConsentsNbr ENDP

UpperNbr PROC

	lea ebx, myString
	mov ecx, stringSize
ll:
	mov dl, [ebx]
	cmp dl, 'A'
	jl next
	cmp dl, 'Z'
	jg next

	isUpper:
		inc Ubnr

	next:
	inc ebx
	loop ll

	ret
UpperNbr ENDP

printResult PROC
	
	lea edx, msg1
	call writeString

	mov eax, Cnbr
	call writeDec

	lea edx, msg2
	call writeString

	mov eax, Ubnr
	call writeDec

	lea edx, msg3
	call writeString

	ret
printResult ENDP


end main