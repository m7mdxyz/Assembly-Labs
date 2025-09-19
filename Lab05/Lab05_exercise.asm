INCLUDE Irvine32.inc

.DATA

casesMSG byte "Choose case number 1 - 2", 0dh, 0ah, 0

case1Msg byte "Case 1 executed ", 0dh, 0ah, 0
case2Msg byte "Case 2 executed ", 0dh, 0ah, 0
defaultMsg byte "default part is executed ", 0dh, 0ah, 0



.code
main proc

start:

	lea edx, casesMSG
	call writestring
	call readint

	cmp eax, 1
	je case1

	cmp eax, 2
	je case2

	jmp default

case1:
	lea edx, case1Msg
	call writestring
	call crlf

	jmp start

case2:
	lea edx, case2Msg
	call writestring
	call crlf

	jmp start

default:
	lea edx, defaultMsg
	call writestring
	call crlf

	jmp start

	exit
main endp
end main