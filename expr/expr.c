#include <stdio.h>
#include <assert.h>


int add(const char *s)
{
	int i = *s - '0';
	s ++;
	if(*s == '+')
	{
		s ++;
		i += *s - '0';
	}
	return i;
}
void test_add()
{
	assert(add("1") == 1);
	assert(add("1+2") == 1+2);
}
int main()
{
	test_add();
	printf("hello world\n");
	return 0;
}
