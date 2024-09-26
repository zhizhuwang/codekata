/*
给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
有效字符串需满足：
左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
每个右括号都有一个对应的相同类型的左括号。

示例 1：
输入：s = "()"
输出：true

示例 2：
输入：s = "()[]{}"
输出：true

示例 3：
输入：s = "(]"
输出：false

示例 4：
输入：s = "([])"
输出：true
*/


#include <iostream>
#include <cassert>
#include <stack>

bool isValidBracket(std::string s) {
	std::stack<char> st;
	unsigned int i;
	for ( i = 0; i < s.size(); i++) {
		char c = s[i];
		if (c == ' ')
			continue;

		if (c == '(' || c == '[' || c == '{') {
			st.push(c);
			continue;
		}

		if (c == ')' && (st.top() == '(')) {
			st.pop();
				
		}else if (c == ']' && st.top() == '[') {
			st.pop();
		}
		else if (c == '}' && st.top() == '{') {
			st.pop();
		}
		else {
			return false;
		}
	}
	
	if (i == s.size())
		return true;

	return false;
}


void test_isValidBrackets() {
	assert(isValidBracket("()") == true);

	assert(isValidBracket("()[] {}") == true);
	
	assert(isValidBracket("(]") == false);

	assert(isValidBracket("([])") == true);

	std::cout<< "xxx" << std::endl;
	return ;
}