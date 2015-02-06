/*
 * traillingZeros.cpp
 *
 *  Created on: 2015-2-6
 *      Author: zhizhuwang
 */
#include <assert.h>
#include <math.h>
#include <iostream>
using namespace std;


static int times(int n, int multiplesOfFive)
{
	return n / multiplesOfFive;
}

int traillingZeors(int n)
{
	int x = 1, num = 0;

	while(pow(5,x) <= n)
		num += times(n, pow(5,x++));

	return num;
}

void test_traillingZeros()
{
	assert(traillingZeors(5) == 1);

	assert(traillingZeors(10) == 2);
	assert(traillingZeors(15) == 3);
}
int main()
{
	test_traillingZeros();
	cout << "hello world" << endl;
	return 0;
}






