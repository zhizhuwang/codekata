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

void test_add_with_negative()
{
	assert_add("11", "-3", "08");
	assert_add("-12", "36", "24");
	assert_add("-12", "-36", "-48");

	assert_add("11", "-432", "-421");
	assert_add("-11", "4", "-07");
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

	assert_sub("12","3","09");
}

void test_sub_with_negative()
{
	assert_sub("3","-1","4");
	assert_sub("-3","-7","4");
	assert_sub("-3","1","-4");

	assert_sub("-3","24","-27");

	assert_sub("-6","-2","-4");
}

int main()
{
	test_add();
	test_sub();

	test_add_with_negative();

	test_sub_with_negative();

	printf("hello world\n");
	return 0;
}

