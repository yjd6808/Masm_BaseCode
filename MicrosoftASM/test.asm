; =================================

.386
.model flat

; =================================

includelib legacy_stdio_definitions.lib			; printf 함수 호출을 위해.
printf PROTO C:VARARG							; printf 함수 포워드 선언

; =================================

.data
hd_str	db	'%hd ', 10, 0						; char hd_str[5] = "%hd ";
d_str	db	'%d ', 10, 0						; char d_str[4] = "%d ";
d2_str	db	'%d %d ', 10, 0

; =================================

.code
_PrintText@4 proc
	push	ebp
	mov		ebp,			esp

	push	[ebp + 8]
	call	printf

	mov		esp,			ebp
	pop		ebp
	ret		4
_PrintText@4 endp

_PrintDwordNumber proc
	push	ebp
	mov		ebp,			esp

	push	[ebp + 8]
	push	offset d_str
	call	printf

	mov		esp,			ebp
	pop		ebp
	ret
_PrintDwordNumber endp

_PrintWordNumber proc
	push	ebp
	mov		ebp,			esp

	push	[ebp + 8]
	push	offset hd_str
	call	printf

	mov		esp,			ebp
	pop		ebp
	ret
_PrintWordNumber endp

_Print2DwordNumber proc
	push	ebp
	mov		ebp,			esp

	push	[ebp + 8]
	push	[ebp + 12]
	push	offset d2_str
	call	printf

	mov		esp,			ebp
	pop		ebp
	ret
_Print2DwordNumber endp
end
