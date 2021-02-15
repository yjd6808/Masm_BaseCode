#include <stdio.h>

extern "C" void __stdcall	AssmblyMain();
extern "C" void __stdcall	Memcpy(void*, void*, int);

int main()
{
	printf("[어셈블리 코드에서의 출력]\n\n");
	AssmblyMain();

	printf("==================================\n");
	printf("[CPP 코드에서의 출력]\n\n");
	short a[5] = { 1,2,3,4,5 };
	short b[5];

	Memcpy(b, a, sizeof(short) * 5);

	for (int i = 0; i < 5; i++)
		printf("b[%d] : %hd\n", i, b[i]);

	return 0;
}