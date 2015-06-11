#include <stdio.h>
#include <assert.h>


int num(const char * s)
{
	return *s - '0';
}
int add(const char *s)
{
	int n = num(s++);
	while(*s == '+')
	{
		s ++;
		n += num(s++);
	}
	return n;
}
void test_add()
{
	assert(add("1") == 1);
	assert(add("1+2") == 1+2);
	assert(add("1+2+3") == 1+2+3);
}
int main()
{
	test_add();
	printf("hello world\n");
	return 0;
}
