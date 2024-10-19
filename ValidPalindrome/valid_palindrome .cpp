/*
* A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

 

Example 1:

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
Example 2:

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
Example 3:

Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
*/
#include <iostream>
#include <cassert>
using namespace std;

bool valid_palindrome(const string& s)
{
	string newStr{""};

	for (char c : s)
	{
		if (c >= 'a' && c <= 'z')
			newStr += c;
		else if (c >= 'A' && c <= 'Z')
			newStr += (c + 32);
	}

	cout << "new string =" << newStr << endl;
	int i = 0, j = newStr.size() - 1;
	for (; ;)
	{
		if (i >= j)
			break;
		if (newStr[i] == newStr[j])
		{
			i++;
			j--;
		}
		else
			break;
	}
	if (i >= j)
		return true;
	return false;
}

void test_valid_palindrome()
{
	assert(valid_palindrome("A man, a plan, a canal: Panama") == true);
	assert(valid_palindrome("race a car") == false);
	assert(valid_palindrome(" ") == true);
}