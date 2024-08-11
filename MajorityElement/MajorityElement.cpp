//多数元素
// 给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n / 2 ⌋ 的元素。
//
//你可以假设数组是非空的，并且给定的数组总是存在多数元素。
//
//
//
//示例 1：
//
//输入：nums = [3, 2, 3]
//输出：3
//示例 2：
//
//输入：nums = [2, 2, 1, 1, 1, 2, 2]
//输出：2

#include <iostream>
#include <cassert>
#include <vector>
#include <map>
#include <unordered_map>
#include <algorithm>

static int majorityElement2(std::vector<int>& nums)
{
	std::unordered_map<int, int> count{};
	for (std::vector<int>::const_iterator it = nums.cbegin();
		it != nums.cend(); it++) {
		if (count.find(*it) == count.cend()) {
			count[*it] = 1;
		}
		else {
			count[*it]++;
		}

		if (count[*it] > nums.size() / 2)
			return *it;
	}
	return 0;
}

int majorityElement(std::vector<int>& nums) {
	/*std::map<std::string, std::string>
		m1{ {"γ", "gamma"}, {"β", "beta"}, {"α", "alpha"}, {"γ", "gamma"} },
		m2{ {"ε", "epsilon"}, {"δ", "delta"}, {"ε", "epsilon"} };*/
	std::map<int, int> numCount{};

	int count = 1;
	int majoriry = nums[0];
	for (int x : nums) {
		++numCount[x];
		if (numCount[x] > count) {
			count = numCount[x];
			majoriry = x;
		}
	}
	for (std::map<int, int>::const_iterator it = numCount.begin(); it != numCount.end(); ++it) {
		std::cout << it->first << "-" << it->second << std::endl;
	}

	return majoriry;
}


int majorityElement3(std::vector<int>& nums)
{
	sort(nums.begin(), nums.end());
	return nums[nums.size() / 2];
}

void test_majorityElement()
{
	std::vector<int> nums3{ 1,2,3,4,3,3 };
	assert(majorityElement(nums3) == 3);
	assert(majorityElement3(nums3) == 3);


	std::vector<int> nums{ 3,2,3 };
	assert(majorityElement2(nums) == 3);

	std::vector<int> nums2{ 2, 2, 1, 1, 1, 2, 2 };
	//assert(majorityElement(std::cref(std::move(std::vector<int>{2, 2, 1, 1, 1, 2, 2}))) == 2);
	assert(majorityElement2(nums2) == 2);

}