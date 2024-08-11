/*
轮转数组

给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。



示例 1:

输入: nums = [1, 2, 3, 4, 5, 6, 7], k = 3
输出 : [5, 6, 7, 1, 2, 3, 4]
解释 :
	向右轮转 1 步 : [7, 1, 2, 3, 4, 5, 6]
	向右轮转 2 步 : [6, 7, 1, 2, 3, 4, 5]
	向右轮转 3 步 : [5, 6, 7, 1, 2, 3, 4]
	示例 2 :

	输入：nums = [-1, -100, 3, 99], k = 2
	输出：[3, 99, -1, -100]
	解释 :
	向右轮转 1 步 : [99, -1, -100, 3]
	向右轮转 2 步 : [3, 99, -1, -100]
*/
#include <vector>
#include <cassert>
void rotate(std::vector<int>& nums, int k)
{
	for (int i = 0; i < k; i++) {
		int temp = nums.back();
		for (int j = nums.size() - 1; j > 0; j--) {
			nums[j] = nums[j - 1];
		}
		nums[0] = temp;
	}
}

/*
* 根据k算出每个元素的最终位置，一步移动到位
*/
void rotate2(std::vector<int>& nums, int k)
{
	std::vector<int> nums_copy(nums.size(), 0);
	copy(nums.cbegin(), nums.cend(), nums_copy.begin());

	for (int i = 0; i < nums.size(); i++) {
		nums[(i + k) % nums.size()] = nums_copy[i];
	}
}
void test_rotate() {
	std::vector<int> nums{ 1,2,3,4,5,6,7 };
	rotate(nums, 3);
	assert(nums[0] == 5 && nums[1] == 6 && nums[2] == 7);

	std::vector<int> nums2{ 1,2,3,4,5,6,7 };
	rotate(nums2, 3);
	assert(nums2[0] == 5 && nums2[1] == 6 && nums2[2] == 7);

}