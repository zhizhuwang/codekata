/*赎金信
给你两个字符串：ransomNote 和 magazine ，判断 ransomNote 能不能由 magazine 里面的字符构成。
如果可以，返回 true ；否则返回 false 。

magazine 中的每个字符只能在 ransomNote 中使用一次。

示例 1：
输入：ransomNote = "a", magazine = "b"
输出：false
示例 2：

输入：ransomNote = "aa", magazine = "ab"
输出：false
示例 3：

输入：ransomNote = "aa", magazine = "aab"
输出：true


提示：

1 <= ransomNote.length, magazine.length <= 105
ransomNote 和 magazine 由小写英文字母组成
*
* 
*/



#include <iostream>
#include <cassert>
#include <unordered_map>

bool canConstruct(std::string ransomNote, std::string magazine) {
	std::unordered_map<char, int> char_map{};
	for (int i = 0; i < magazine.size(); i++) {
			char_map[magazine[i]]++;
	}

	for (int i = 0; i < ransomNote.size(); i++) {
		if (char_map[ransomNote[i]] > 0)
		{
			char_map[ransomNote[i]]--;
		}
		else {
			return false;
		}
	}
	return true;
}


void test_canConstruct()
{
	std::string ransomNote = "a", magazine = "b";
	assert(canConstruct(ransomNote, magazine) == false);

	ransomNote = "aa", magazine = "ab";
	assert(canConstruct(ransomNote, magazine) == false);

	ransomNote = "aa", magazine = "aab";
	assert(canConstruct(ransomNote, magazine) == true);
}