#include <stdio.h>
#include <sys/time.h>


int test_if_else(int v)
{
	if(v == 1)
		return v * 13;
	else if(v == 2)
		return v * 23;
	else if(v == 3)
		return v * 33;
	else if(v == 4)
		return v * 43;
	else if(v == 5)
		return v * 53;
	else if(v == 6)
		return v * 63;
	else if(v == 7)
		return v * 73;
	else if(v == 8)
		return v * 83;
	else if(v == 9)
		return v * 93;
	else if(v == 10)
		return v * 103;
	else
		return 0;
}


int test_switch_case(int v)
{
	switch(v){
	case 1:
		return v * 13;
	case 2:
		return v * 23;
	case 3:
		return v * 33;
	case 4:
		return v * 43;
	case 5:
		return v * 53;
	case 6:
		return v * 63;
	case 7:
		return v * 73;
	case 8:
		return v * 83;
	case 9:
		return v * 93;
	case 10:
		return v * 103; 
	default:
		return 0;
	}

}


int main()
{
	struct timeval start, end;
	double elapsed_us = 0;

	int i = 0, v = 0;

	gettimeofday(&start, NULL);
	for(i = 0,v = 0; i<100000000; i++)
		v += test_if_else( i%11 );
	gettimeofday(&end, NULL);

	elapsed_us = 1000000 * (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) ;
	printf("test_if_else ran %f usec, result = %u\n", elapsed_us, v);


	gettimeofday(&start, NULL);
	for(i = 0,v = 0; i<100000000; i++)
		v += test_switch_case( i%11 );

	gettimeofday(&end, NULL);
	elapsed_us = 1000000 * (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) ;
	printf("test_switch_case run %f usec, result = %u\n", elapsed_us, v);

    return 0;
}
