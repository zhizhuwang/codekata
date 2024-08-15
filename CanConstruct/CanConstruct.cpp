/*�����
���������ַ�����ransomNote �� magazine ���ж� ransomNote �ܲ����� magazine ������ַ����ɡ�
������ԣ����� true �����򷵻� false ��

magazine �е�ÿ���ַ�ֻ���� ransomNote ��ʹ��һ�Ρ�

ʾ�� 1��
���룺ransomNote = "a", magazine = "b"
�����false
ʾ�� 2��

���룺ransomNote = "aa", magazine = "ab"
�����false
ʾ�� 3��

���룺ransomNote = "aa", magazine = "aab"
�����true


��ʾ��

1 <= ransomNote.length, magazine.length <= 105
ransomNote �� magazine ��СдӢ����ĸ���
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