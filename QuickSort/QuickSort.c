/*
 * QuickSort.c
 *
 *  Created on: 2015Äê5ÔÂ30ÈÕ
 *      Author: zhizhuwang
 */


#include <stdio.h>

void QSort(int s[], int start, int end)
{
	int i = start+1, j = end;
	int pivot = s[start];
	int t;
	int x;
	if(start >= end)
	{
		return ;
	}
	while(i <= j)
	{
		while(s[i] <= pivot)
		{
			s[i-1] = s[i];
			i ++;
		}
		while(s[j] >= pivot)
		{
			j --;
		}
		if(i < j)
		{
			t = s[i];
			s[i] = s[j];
			s[j] = t;
		}
	}
	s[i - 1] = pivot;
	QSort(s, start, i-1-1);
	QSort(s, i, end);

}

void testArrayInAscendingOrder() {
	int i;
	int a[] = { 1, 2, 3 ,4};
	QSort(a,0,sizeof(a) / sizeof(int));
	for (i = 0; i < sizeof(a) / sizeof(int); i++)
		printf("%d ", a[i]);
	printf("\n");
}

void testArrayWithMultiple() {
	int i;
	int a[] = { 2,1,3,0,7 };
	QSort(a, 0, sizeof(a) / sizeof(int) - 1);
	for (i = 0; i < sizeof(a) / sizeof(int); i++)
		printf("%d ", a[i]);
	printf("\n");
}

void testArrayWithMultiple2() {
	int i;
	int a[] = { 4,2,3,5,6,1,2 };
	QSort(a, 0, sizeof(a) / sizeof(int) - 1);
	for (i = 0; i < sizeof(a) / sizeof(int); i++)
		printf("%d ", a[i]);
	printf("\n");
}
int main()
{
	testArrayInAscendingOrder();
	testArrayWithMultiple();
	testArrayWithMultiple2();

	printf("hello world\n");
	return 0;
}
