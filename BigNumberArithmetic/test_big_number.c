/*
 * testBigNumber.c
 *
 *  Created on: 2015-3-7
 *      Author: zhizhuwang
 */

#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "big_number_arithmetic.h"


void assert_add(const char * left, const char * right, const char * expect)
{
	assert(strcmp(add(left, right), expect) == 0);
}
void test_add()
{
	assert_add("1", "1", "2");
}
int main()
{
	test_add();

	printf("hello world\n");
	return 0;
}

