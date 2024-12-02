/*
给定⼀个⻓度为n的整数序列，判断是不是JollyJump。即相邻每两个整数的差值
刚好覆盖1..n - 1⾃然数列。例如： 1, 4, 2, 1是JollyJump，差值3, 2, 1刚好覆盖了⾃然
数列1, 2, 3。再例如： 1, 2, 3, 4, 5不是，因为差值为1, 1, 1, 1。
• 

*/

#include <iostream>
#include <vector>
#include <cassert>
#include <unordered_map>

bool IsJollyJump(std::vector<int> &v) 
{
	std::unordered_map<int, int> m{};

	for (int i = 1; i < v.size(); i++)
	{
		int diff = v[i] > v[i -1] ? (v[i] - v[i-1]) : (v[i-1] - v[i]);
		m[diff] = 1;
	}

	if (m.size() != v.size() - 1)
		return false;

	for (int j = 1; j < v.size() - 1; j++)
	{
		if (m[j] != 1)
			return false;
	}
	
	return true;
}



void test_IsJollyJump()
{
	std::vector<int> v{1,4,2,1};
	assert(IsJollyJump(v) == true);

	std::vector<int> v2{ 1,2,3,4,5};
	assert(IsJollyJump(v2) == false);
}