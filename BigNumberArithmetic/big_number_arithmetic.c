/*
 * big_number_arithmetic.c
 *
 *  Created on: 2015-3-7
 *      Author: zhizhuwang
 */

#include <string.h>
#include <stdlib.h>
#include "big_number_arithmetic.h"

static unsigned get_digit(const char * str, unsigned int pos)
{
	if(pos >= strlen(str))
		return 0;
	return str[strlen(str) - pos - 1] - '0';
}

static char * add_internal(const char * left, const char * right)
{
	char *result = NULL;
	int i = 0;
	unsigned int sum = 0, carry_bit = 0;
	unsigned int len = strlen(left) > strlen(right) ? strlen(left) : strlen(right);
	unsigned int max_width = len + 1;

	result = (char *)calloc(max_width + 1, sizeof(char));

	for(i=0; i<max_width; i++)
	{
		sum = get_digit(left, i) + get_digit(right, i) + carry_bit;

		result[max_width - 1 - i] = sum % 10 + '0';
		carry_bit = sum / 10;
	}

	if(result[0] == '0')
		memmove(result, result + 1, max_width);

	result[max_width] = '\0';

	return result;

}

unsigned int isPositive(const char * s)
{
	return s[0] <= '9' && s[0] >= '0';
}
unsigned int isNegative(const char * s)
{
	return s[0] == '-';
}

static char * negative(char * s)
{
	char * result = calloc(strlen(s)+2, sizeof(char));
	result[0] = '-';
	memcpy(result+1, s, strlen(s));
	return result;
}
char * add(const char * left, const char * right)
{
	if(isPositive(left) && isNegative(right))
		return sub(left, right+1);

	else if(isNegative(left) && isPositive(right))
		return sub(right, left+1);

	else if(isNegative(left) && isNegative(right))
		return negative(
				add(right+1, left+1)
				);
	else
		return add_internal(left, right);
}
char * sub(const char * left, const char * right)
{
	char * result = NULL;
	unsigned int width = strlen(left);
	unsigned int i = 0, borrow = 0;
	int diff = 0;

	result = (char *)calloc(width+1, sizeof(char));

	while(i < strlen(left))
	{
		diff = get_digit(left, i) - borrow - get_digit(right, i);
		borrow = (diff < 0 ? 1: 0);
		result[width - i - 1] = diff + 10*borrow + '0';
		i++;
	}
	result[width] = '\0';
	return result;
}
