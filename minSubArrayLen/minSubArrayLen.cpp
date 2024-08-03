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


int main() {

	std::vector<int> nums2 = { 2, 3, 1, 2, 4, 3 };
	assert(minSubArrayLen(7, nums2) == 2);

}