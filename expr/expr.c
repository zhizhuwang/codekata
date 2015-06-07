#include <stdio.h>
#include <assert.h>


int add(const char *s)
{
	return *s - '0';
}
void test_add()
{
	assert(add("1") == 1);
}
int main()
{
	test_add();
	printf("hello world\n");
	return 0;
}
