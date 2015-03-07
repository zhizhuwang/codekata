/*
 * big_number_arithmetic.c
 *
 *  Created on: 2015-3-7
 *      Author: zhizhuwang
 */

#include <string.h>
#include <stdlib.h>

static unsigned digit(const char * str, unsigned int pos)
{
	if(pos >= strlen(str))
		return 0;
	return str[strlen(str) - pos - 1] - '0';
}
char * add(const char * left, const char * right)
{
	char *result = NULL;
	int i = 0;
	unsigned int len = strlen(left) > strlen(right) ? strlen(left) : strlen(right);
	result = (char *)malloc(len + 1);

	for(i=0; i<len; i++)
	{
		result[len - i -1] = digit(left, i) + digit(right, i) + '0';
	}
	result[len] = '\0';

	return result;

}
