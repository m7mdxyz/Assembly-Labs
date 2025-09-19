INCLUDE Irvine32.inc

.data
a1 word 1,2,3,4,5,7,9,11,13,15
a2 word 1,2,3,4,4,8,10,12,14,16
intersection word 10 dup(?)

message byte "The content of intersection array ", 0
space byte " ", 0
count dword 0
temp dword 0

.code
main proc

	call findIntersection

	exit
main endp

findIntersection PROC
	mov eax ,0 ; reset the regester
mov ecx ,10 ; loop counter

mov ebx ,0 ; index of a1 array
mov edi ,0 ; index of intersection array

outter:

mov esi ,0 ; index of a2
mov ax , a1[ebx]
mov temp , ecx; to save the counter of outter loop before going to the  inner loop
	mov ecx ,10 ; reset the counter to 10 for inner loop
	inner:
	cmp ax , a2[esi] 
	jne notEqual
	;------ if equal? ------
	mov intersection[edi],ax 
	add edi , 2 ; to move to next location in intersection 
	inc count ; to increament the counter by one 
	
	notEqual:
	add esi , 2 ; to move to the next location in a2 
	
	loop inner

	mov ecx , temp ; to resore the counter of outter loop
	add ebx , 2 ; to move to the next location in a1 


loop outter

	mov ecx , count
	mov eax ,0
	mov esi ,0
	mov eax,0
	mov edx , offset message 
	call writeString

print:
	mov ax,intersection[esi]
	add esi,2
	call writeDec
	mov edx , offset space 

	call writeString

loop print

	ret
findIntersection ENDP

end main