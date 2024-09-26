/*
����һ��ֻ���� '('��')'��'{'��'}'��'['��']' ���ַ��� s ���ж��ַ����Ƿ���Ч��
��Ч�ַ��������㣺
�����ű�������ͬ���͵������űպϡ�
�����ű�������ȷ��˳��պϡ�
ÿ�������Ŷ���һ����Ӧ����ͬ���͵������š�

ʾ�� 1��
���룺s = "()"
�����true

ʾ�� 2��
���룺s = "()[]{}"
�����true

ʾ�� 3��
���룺s = "(]"
�����false

ʾ�� 4��
���룺s = "([])"
�����true
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