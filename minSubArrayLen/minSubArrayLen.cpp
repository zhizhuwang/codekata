/*
示例 1：

输入：target = 7, nums = [2, 3, 1, 2, 4, 3]
输出：2
解释：子数组[4, 3] 是该条件下的长度最小的子数组。
示例 2：

输入：target = 4, nums = [1, 4, 4]
输出：1
示例 3：

输入：target = 11, nums = [1, 1, 1, 1, 1, 1, 1, 1]
输出：0
*/

//给定一个含有 n 个正整数的数组和一个正整数 target 。
//
//找出该数组中满足其总和大于等于 target 的长度最小的
//子数组
//[numsl, numsl + 1, ..., numsr - 1, numsr] ，并返回其长度。如果不存在符合条件的子数组，返回 0 。




#include <vector>
#include <iostream>
#include <algorithm>
#include <cassert>


/*
* 滑动窗口，sum([start, end]) == target
*/
int minSubArrayLen(int target, std::vector<int>& nums) {
    int start = 0, end = 0;
    int prev_start=0, prev_end=0;
    int sum = 0;
    int width = nums.size();

    while (end < nums.size()) {
        sum += nums[end];
        while (sum > target)
        {
            sum -= nums[start];
            start++;
        }
        if (sum == target) {
            if (end - start + 1 < width) {
                prev_start = start;
                prev_end = end;
                width = end - start + 1;
            }
        }
        end++;
    }
    std::cout << "width:" <<width << std::endl;
    return width;
}



int minSubArrayLen2(int target, std::vector<int>& nums)
{
    std::vector<int> sum_of_nums(nums.size(), 0);
    int width = nums.size();
    int prev_start = 0, prev_end = 0;
    sum_of_nums[0] = nums[0];
    for (int i = 1; i < nums.size(); i++) {
        sum_of_nums[i] = sum_of_nums[i - 1] + nums[i];
    }

    if (sum_of_nums[nums.size() - 1] < target) {
        return 0;
    }

    for (int i = 1; i < nums.size(); i++) {
        int range_value = target + sum_of_nums[i - 1];
        auto it = lower_bound(sum_of_nums.cbegin(), sum_of_nums.cend(), range_value);

        if (range_value == target + sum_of_nums[i - 1])
        {
            if (static_cast<int>(it - sum_of_nums.cbegin()) - i + 1 < width)
            {
                prev_end = static_cast<int>(it - sum_of_nums.cbegin());
                prev_start = i;
                width = std::min(prev_end - prev_start + 1, width);
            }
        }
    }

    std::cout << "[" << prev_start << " - " << prev_end << "] " << "width = " << width << std::endl;
    return width;
}


int main() {

	std::vector<int> nums2 = { 2, 3, 1, 2, 4, 3 };
	assert(minSubArrayLen(7, nums2) == 2);
	
	assert(minSubArrayLen2(7, nums2) == 2);

}