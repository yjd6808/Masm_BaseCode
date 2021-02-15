; =================================

.386
.model flat, stdcall	; 32��Ʈ �޸� ��(flat), �Լ� ȣ�� ��Ģ�� stdcall�� ����
option casemap: none	; ��ҹ��ڸ� �����ϰڴ�.

; =================================

include test.inc

; =================================

.data

text1	db		'HelloWorld!',				10,	0
text2	db		'My Name Is ������',		10,	0

; =================================

.code
Memcpy proc uses esi edi ecx pSrc:dword, pDst:dword, copyMemorySize:dword
		mov		edi,	pSrc
		mov		esi,	pDst
		mov		ecx,	0			;	i = 0

W_1:	cmp		ecx,	copyMemorySize
		jge		W_E_1

		lodsb 
		stosb

		; �Ʒ� 4���� ���� 2�� ��ɰ� ������ ����� �մϴ�.
		; mov		al,		[esi]
		; mov		[edi],	al
		; add		esi,	1
		; add		edi,	1

		inc		ecx
		jmp		W_1

W_E_1:	ret		12
Memcpy endp

AssmblyMain proc
	; ����ü ��� �׽�Ʈ

	LOCAL		kDataBasket:DATA_BASKET
	LOCAL		kBasket:BASKET

	mov			kDataBasket.dword_data,			1
	mov			kDataBasket.word_data,			2
	mov			kDataBasket.byte_data,			3


	; ����ü �迭 ����

	mov			dword ptr[kBasket.data_arr],		1		;	kBasket.data_arr[0] = 1;
	mov			dword ptr[kBasket.data_arr + 4],	2		;	kBasket.data_arr[1] = 2;
	mov			dword ptr[kBasket.data_arr + 8],	3
	mov			dword ptr[kBasket.data_arr + 12],	4

	; memcpy �Լ��� ����Ͽ� kDataBasket�� �����͸� kBasket.data_basket���� ������ ����

	


	; �Լ� ȣ�� �׽�Ʈ

	push		offset	text1
	call		PrintText

	push		offset	text2
	call		PrintText

	push		kDataBasket.word_data
	call		PrintWordNumber
	add			esp,	2


	push		dword ptr[kBasket.data_arr + 4]
	call		PrintDwordNumber							;	PrintDwordNumber(kBasket.data_arr[1]);
	add			esp,	4

	push		300
	push		400
	call		Print2DwordNumber
	add			esp,	8

	ret			0
AssmblyMain endp
end

