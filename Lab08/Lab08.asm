TITLE "Lab 8: Information Security"

.686
.MODEL FLAT, STDCALL
.STACK

INCLUDE Irvine32.inc

.data
msgMaxSize EQU 100
msg byte msgMaxSize dup(0)
msgLength byte ?
encMsg byte msgMaxSize dup(0)
key byte ?
extractedKey byte ?
decMsg byte msgMaxSize dup(0)

readMsg_msg byte "Enter a message: ", 0
getKey_msg  byte "Enter the key number(between 100 and 200): ", 0
getKey_msg_again byte "Error, Please enter a value between 100 and 200: ", 0
PrintEncMsg_msg byte "Encrypted message -> ", 0
PrintReceivedMsg_msg byte "Decrypted message -> ", 0

.code
main proc
	;; Here you call your sender and receiver procedures
	
	call sender
	call receiver


	exit
main endp



;;;;;;;;;;
;; sender
sender proc
	; add here the sender code

	call readMsg
	call getKey
	movzx ecx, msgLength
	call encryption
	call insertKey
	call PrintEncMsg

	ret
sender endp
;; sender functions
readMsg proc

	lea edx, readMsg_msg
	call writeString
	lea edx, msg		; point to the input buffer
	mov ecx, msgMaxSize ; number of chars to read
	call readString
	mov msgLength, al ; save msg length, use it later in looping in encryption and decryption functions

	ret
readMsg endp

getKey proc
	jmp first
	
again:
	lea edx, getKey_msg_again
	call writeString
	call readDec
	jmp check
first:
	lea edx, getKey_msg
	call writeString
	call readDec
	
check:
	cmp eax, 200
	JG again
	cmp eax, 100
	JL again
	
	;if key value is ok then continue..
	mov key, al

	ret
getKey endp

encryption proc uses ecx
	
	lea ebx, msg
	lea esi, encMsg
	;movzx eax, key
	push ecx
	push ebx
ll:
	XOR [ebx], eax
	inc ebx
	loop ll
	
	pop ebx
	pop ecx
	;mov esi, 0
cpy:
	mov eax, [ebx]
	mov [esi], eax
	inc ebx
	inc esi
	loop cpy


	ret
encryption endp

insertKey proc

	movzx esi, msgLength
	mov al, key
	mov encMsg[esi+1], al
	
	ret
insertKey endp

PrintEncMsg proc
	
	lea edx, PrintEncMsg_msg
	call writeString
	lea edx, encMsg
	call writeString

	ret
PrintEncMsg endp



;;;;;;;;;;
;; receiver
receiver proc
	; add here the receiver code
	
	movzx ecx, msgLength
	call extractKey
	call Decryption
	call crlf
	call PrintReceivedMsg
	
	ret
receiver endp

extractKey proc uses ecx
	
	movzx esi, msgLength
	mov al, encMsg[esi+1]
	mov extractedKey, al
	movzx eax, extractedKey
	;call writeDec
	
	ret
extractKey endp

Decryption proc uses ecx
	
	mov esi, 0
	mov edi, 0
	movzx eax, extractedKey
	push ecx
ll:
	XOR msg[esi], al
	inc esi
	loop ll
	
	pop ecx
	mov esi, 0
cpy:
	mov al, msg[edi]
	mov decMsg[esi], al
	inc esi
	inc edi
	loop cpy
	
	ret
Decryption endp

PrintReceivedMsg proc
	lea edx, PrintReceivedMsg_msg
	call writeString
	lea edx, decMsg
	call writeString
	
	ret
PrintReceivedMsg endp

END main