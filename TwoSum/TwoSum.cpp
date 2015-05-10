/*
 * TwoSum.cpp
 *
 *  Created on: 2015Äê4ÔÂ19ÈÕ
 *      Author: zhizhuwang
 */


#include <iostream>
#include <vector>
#include <map>

using namespace std;
/**
 * Given an array of integers, find two numbers such that they add up to a specific target number.

The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

You may assume that each input would have exactly one solution.

Input: numbers={2, 7, 11, 15}, target=9
Output: index1=1, index2=2
 */

class Solution {
public:
    vector<int> twoSum(vector<int> &numbers, int target) {
    	vector<int> r;
    	unsigned int i1 = 1,i2 = 1;
    	for(i1 = 1; i1< numbers.size(); i1++)
    		for(i2 = i1+1; i2 < numbers.size(); i2++)
    		{
    			if(numbers[i1 -1] + numbers[i2 -1] == target)
    			{
    				r.push_back(i1);
    				r.push_back(i2);
    			}
    		}

    	return r;

    }
};

vector<int> twoSum2(vector<int> &numbers, int target){
	vector<int> result;
	map<int,int> m;
	for(unsigned int i = 0; i<numbers.size(); i++)
	{
		if(m.find(numbers[i]) == m.end())
			m[target - numbers[i]] = i;
		else
		{
			result.push_back(m[numbers[i]] + 1);
			result.push_back(i + 1);
		}
	}
	return result;
}

int main()
{
	int n[] = {2,7,11,15};
	vector<int> numbers(n, n+sizeof(n)/sizeof(int));
	Solution *s = new Solution();
	vector<int> r = s->twoSum(numbers,9);
	for(unsigned int i = 0; i<r.size();i++)
		cout<<r[i]<<endl;

	r = twoSum2(numbers, 9);
	for(unsigned int i = 0; i<r.size();i++)
		cout<<r[i]<<endl;
	cout<<"hello world"<<endl;
	return 0;
}
