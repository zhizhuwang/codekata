/*
* ��������������ĳ˻�
* ����һ���������� nums������ ���� answer ������ answer[i] ���� nums �г� nums[i] ֮�������Ԫ�صĳ˻� ��
��Ŀ���� ��֤ ���� nums֮������Ԫ�ص�ȫ��ǰ׺Ԫ�غͺ�׺�ĳ˻�����  32 λ ������Χ�ڡ�
�� ��Ҫʹ�ó��������� O(n) ʱ�临�Ӷ�����ɴ��⡣

ʾ�� 1:
����: nums = [1,2,3,4]
���: [24,12,8,6]
ʾ�� 2:

����: nums = [-1,1,0,-3,3]
���: [0,0,9,0,0]
 

��ʾ��
2 <= nums.length <= 105
-30 <= nums[i] <= 30
��֤ ���� nums֮������Ԫ�ص�ȫ��ǰ׺Ԫ�غͺ�׺�ĳ˻�����  32 λ ������Χ��
 
���ף�������� O(1) �Ķ���ռ临�Ӷ�����������Ŀ�𣿣� ���ڶԿռ临�Ӷȷ�����Ŀ�ģ�������� ������Ϊ ����ռ䡣��
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