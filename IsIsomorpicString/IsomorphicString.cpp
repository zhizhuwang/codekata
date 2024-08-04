/*
205. ͬ���ַ���

���������ַ��� s �� t ���ж������Ƿ���ͬ���ġ�

��� s �е��ַ����԰�ĳ��ӳ���ϵ�滻�õ� t ����ô�������ַ�����ͬ���ġ�

ÿ�����ֵ��ַ���Ӧ��ӳ�䵽��һ���ַ���ͬʱ���ı��ַ���˳�򡣲�ͬ�ַ�����ӳ�䵽ͬһ���ַ��ϣ���ͬ�ַ�ֻ��ӳ�䵽ͬһ���ַ��ϣ��ַ�����ӳ�䵽�Լ�����

ʾ�� 1:

���룺s = "egg", t = "add"
�����true
ʾ�� 2��

���룺s = "foo", t = "bar"
�����false
ʾ�� 3��

���룺s = "paper", t = "title"
�����true
*/

#include <iostream>
#include <map>

bool isIsomorphic(std::string s, std::string d)
{
	if (s.length() != d.length())
		return  false;
	std::map<char, char> m{};
	
	for (int i = 0; i < s.length(); i++) {
		if (m.find(s[i]) == m.end())
			m[s[i]] = d[i];
		else if (m[s[i]] != d[i])
			return false;
	}
	return true;
}