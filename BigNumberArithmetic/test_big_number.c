/*
 * testBigNumber.c
 *
 *  Created on: 2015-3-7
 *      Author: zhizhuwang
 */

#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <stdlib.h>
#include "big_number_arithmetic.h"


void assert_add(const char * left, const char * right, const char * expect)
{
	char *r = NULL;
	assert(strcmp(r = add(left, right), expect) == 0);
	free(r);
}
void test_add()
{
	assert_add("1", "1", "2");
	assert_add("11", "23", "34");
	assert_add("11", "123", "134");

	assert_add("1", "9", "10");
	assert_add("21", "9", "30");
	assert_add("22", "9999", "10021");

}

void assert_sub(const char * left, const char * right, const char * expect)
{
	char *r = NULL;
	assert(strcmp(r = sub(left, right), expect) == 0);
	free(r);
}
void test_sub()
{
	assert_sub("3","1","2");
	assert_sub("36","12","24");
}
int main()
{
	test_add();
	test_sub();

	printf("hello world\n");
	return 0;
}

