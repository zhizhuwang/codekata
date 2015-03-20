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

unsigned int is_positive(const char * s)
{
	return s[0] <= '9' && s[0] >= '0';
}
unsigned int is_negative(const char * s)
{
	return s[0] == '-';
}
unsigned int great_than_by_abs(const char * l, const char * r)
{
	return strlen(l)>strlen(r) ||
			(strlen(l) == strlen(r) && strcmp(l,r) > 0);
}
static char * negative(char * s)
{
	char * result = calloc(strlen(s)+2, sizeof(char));
	result[0] = '-';
	memcpy(result+1, s, strlen(s));
	free(s);
	return result;
}
char * add(const char * left, const char * right)
{
	if(is_positive(left) && is_negative(right))
	{
		if(great_than_by_abs(left, right+1)) return sub(left, right+1);
		else return negative(sub(right+1, left));
	}
	/* (-A) + B = B + (-A)*/
	if(is_negative(left) && is_positive(right))  return add(right, left);

	if(is_negative(left) && is_negative(right))   return negative( add(right+1, left+1));

	else return add_internal(left, right);
}
static char * sub_internal(const char * left, const char * right)
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


char * sub(const char * left, const char * right)
{
	if(is_positive(left) && is_negative(right))  return add(left, right+1);

	if(is_negative(left) && is_negative(right))
	{
		if(great_than_by_abs(left+1, right+1)) return negative(sub(left+1,right+1));
		else return sub(right+1, left+1);
	}

	if(is_negative(left) && is_positive(right))  return negative(add(left+1, right));
	else
		return sub_internal(left, right);
}


static char * mul_by_x(const char * s, char x)
{
	char c;
	char * tmp = NULL;
	char *mul_of_x = add("0", "0");
	for(c = '0'; c < x; c++)
	{
		tmp = add(s, mul_of_x);
		free(mul_of_x);
		mul_of_x = tmp;
	}
	return mul_of_x;
}
static char * mul_by_ten( char * s)
{
	return mul_by_x(s, '0'+10);
}
static char * mul_internal(const char * left, const char * right)
{
	char * acc = NULL;
	char * mul_of_x = NULL;
	char  *tmp = NULL;
	int i;

	acc = add("0", "0");
	for(i = 0; i<strlen(right); i++)
	{
		tmp = mul_by_ten(acc);  free(acc);  acc= tmp;

		mul_of_x = mul_by_x(left, right[i]);

		tmp = add(mul_of_x, acc); free(acc); acc = tmp;
	}
	return acc;
}

char * mul(const char * left, const char * right)
{
	if(is_positive(left) && is_positive(right))    return mul_internal(left, right);

	if(is_positive(left) && is_negative(right))    return negative(mul(left, right + 1));

	if(is_negative(left) && is_positive(right))    return negative(mul(left + 1, right));

	if(is_negative(left) && is_negative(right))    return mul(left + 1, right + 1);

	return NULL;
}
