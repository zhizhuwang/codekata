/*
* 除自身以外数组的乘积
* 给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积 。
题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。
请 不要使用除法，且在 O(n) 时间复杂度内完成此题。

示例 1:
输入: nums = [1,2,3,4]
输出: [24,12,8,6]
示例 2:

输入: nums = [-1,1,0,-3,3]
输出: [0,0,9,0,0]
 

提示：
2 <= nums.length <= 105
-30 <= nums[i] <= 30
保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内
 
进阶：你可以在 O(1) 的额外空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组 不被视为 额外空间。）
*/

#include <vector>
#include <cassert>

std::vector<int> productExceptSelf(std::vector<int>& nums) {
	unsigned int length = nums.size();
	std::vector<int> result(length, 0);
	std::vector<int> L(length), R(length);

	if (length == 1) {
		return result;
	}

	L[0] = 1;
	for ( int i = 1; i < length; i++) {
		L[i] = L[i - 1] * nums[i - 1];
	}

	R[length - 1] = 1;
	for ( int i = length - 2; i >= 0; i--) {
		R[i] = R[i + 1] * nums[i + 1];
	}

	for ( int i = 0; i < length; i++) {
		result[i] = L[i] * R[i];
	}

	return result;
}

std::vector<int> productExceptSelf2(std::vector<int>& nums)
{
	int length = nums.size();
	std::vector<int> result(length, 0);

	result[0] = 1;
	for (int i = 1; i < length; i++) {
		result[i] = result[i - 1] * nums[i - 1];
	}

	int R = 1;
	for (int i = length - 1; i >= 0; i--) {
		result[i] = result[i] * R;

		R = R * nums[i];
	}
	return result;
}


void test_productExceptSelf()
{
	std::vector<int> nums = { 1, 2, 3, 4 };  //[24,12,8,6]
	assert(productExceptSelf(nums)[0] == 24 && productExceptSelf(nums)[1] == 12 &&
		productExceptSelf(nums)[2] == 8 && productExceptSelf(nums)[3] == 6);

	assert(productExceptSelf2(nums)[0] == 24 && productExceptSelf2(nums)[1] == 12 &&
		productExceptSelf2(nums)[2] == 8 && productExceptSelf2(nums)[3] == 6);

}