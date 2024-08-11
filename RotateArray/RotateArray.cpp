/*
��ת����

����һ���������� nums���������е�Ԫ��������ת k ��λ�ã����� k �ǷǸ�����



ʾ�� 1:

����: nums = [1, 2, 3, 4, 5, 6, 7], k = 3
��� : [5, 6, 7, 1, 2, 3, 4]
���� :
	������ת 1 �� : [7, 1, 2, 3, 4, 5, 6]
	������ת 2 �� : [6, 7, 1, 2, 3, 4, 5]
	������ת 3 �� : [5, 6, 7, 1, 2, 3, 4]
	ʾ�� 2 :

	���룺nums = [-1, -100, 3, 99], k = 2
	�����[3, 99, -1, -100]
	���� :
	������ת 1 �� : [99, -1, -100, 3]
	������ת 2 �� : [3, 99, -1, -100]
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
* ����k���ÿ��Ԫ�ص�����λ�ã�һ���ƶ���λ
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