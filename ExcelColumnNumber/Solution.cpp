/*
 * Solution.cpp
 *
 *  Created on: 2015-2-10
 *      Author: zhizhuwang
 */
#include <iostream>
#include <assert.h>
using namespace std;

class Solution {
public:
	Solution()
	{}
    int titleToNumber(string s) {
    	int n = 0;
    	for(string::iterator it = s.begin(); it != s.end(); it ++)
    	{
    		n = n* 26 + ctoi(*it);
    	}
    	return n;
    }
    static int ctoi(char c)
    {
    	return c - 'A' + 1;
    }
};

void test()
{
	Solution *s = new Solution();
	assert(s->ctoi('A') == 1);

	assert(s->titleToNumber("A") == 1);
	assert(s->titleToNumber("C") == 3);

	assert(s->titleToNumber("AA") == 27);
	assert(s->titleToNumber("AB") == 28);

}

int main()
{
	test();
	cout << "hello world" << endl;
	return 0;
}

