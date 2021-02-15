IFNDEF	TEST_INC										;	#ifndef TEST_INC
TEST_INC	equ		1									;	#define TEST_INC 1

	; -------- 타입 디파인 정의
	_T_DWORD		typedef	DWORD						;	typedef	dword _T_DWORD
	_T_WORD			typedef	WORD						;	typedef word _T_WORD
	_T_BYTE			typedef	BYTE						;	typedef byte _T_BYTE
	

	; -------- 디파인 정의

	IFDEF	_T_DWORD									;	#ifdef _T_DWORD
		_T_DWORD_DEFINED	equ		10h					;		#define _T_DWORD_DEFINED 0x10
	ENDIF												;	#endif

	IFDEF	_T_WORD										;	#ifdef _T_WORD
		_T_WORD_DEFINED		equ		20h					;		#define _T_WORD_DEFINED 0x20
	ENDIF												;	#endif

	IFDEF	_T_BYTE										;	#ifdef _T_BYTE
		_T_BYTE_DEFINED		equ		30h					;		#define _T_BYTE_DEFINED 0x30
	ENDIF												;	#endif

	; -------- 구조체 정의
	
	DATA_BASKET		STRUCT								;	struct DATA_BASKET {
		dword_data		dword			?				;		int dword_data;
		word_data		word			?				;		short word_data;
		byte_data		byte			?				;		char byte_data;
	DATA_BASKET		ENDS								;	}

	BASKET			STRUCT								;	struct BASKET {
		basket_data		DATA_BASKET 	<>				;		DATA_BASKET data_basket;
		data_arr		dword 4 dup (?)					;		int data_arr[4];  쓰레기 값
		data_brr		dword 4 dup (1)					;		int data_arr[4];  1로 초기화
	BASKET			ENDS								;	}

	; -------- 함수 선언

	PrintText 					PROTO		STDCALL :DWORD			;	void __stdcall 	PrintText(int);
	PrintWordNumber				PROTO		C		:WORD			;	void __cdecl 	PrintWordNumber(short);
	PrintDwordNumber			PROTO		C		:DWORD			;	void __cdecl 	PrintDwordNumber(int);
	Print2DwordNumber			PROTO		C		:DWORD, :DWORD	;	void __cdecl 	Print2DwordNumber(int, int);

ELSE
	echo -------------------------------------------
	echo test.inc 파일을 중복 인클루드 하고 있어용!
	echo -------------------------------------------
ENDIF