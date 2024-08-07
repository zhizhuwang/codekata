//�������ְ������������ַ�: I�� V�� X�� L��C��D �� M��
//
//�ַ�          ��ֵ
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//���磬 �������� 2 д�� II ����Ϊ�������е� 1 ��12 д�� XII ����Ϊ X + II �� 27 д��  XXVII, ��Ϊ XX + V + II ��
//
//ͨ������£�����������С�������ڴ�����ֵ��ұߡ���Ҳ�������������� 4 ��д�� IIII������ IV������ 1 ������ 5 ����ߣ�����ʾ�������ڴ��� 5 ��С�� 1 �õ�����ֵ 4 ��ͬ���أ����� 9 ��ʾΪ IX���������Ĺ���ֻ�������������������
//
//I ���Է��� V(5) �� X(10) ����ߣ�����ʾ 4 �� 9��
//X ���Է��� L(50) �� C(100) ����ߣ�����ʾ 40 �� 90��
//C ���Է��� D(500) �� M(1000) ����ߣ�����ʾ 400 �� 900��
//����һ���������֣�����ת����������
//
//
//
//ʾ�� 1:
//
//����: s = "III"
//��� : 3
//ʾ�� 2 :
//
//	���� : s = "IV"
//	��� : 4
//	ʾ�� 3 :
//
//	���� : s = "IX"
//	��� : 9
//	ʾ�� 4 :
//
//	���� : s = "LVIII"
//	��� : 58
//	���� : L = 50, V = 5, III = 3.
//	ʾ�� 5 :
//
//	���� : s = "MCMXCIV"
//	��� : 1994
//	���� : M = 1000, CM = 900, XC = 90, IV = 4.

#include <iostream>
#include <vector>
#include <cassert>
#include <map>

int romanToInt(const std::string &s) {
	int val = 0;
	std::map<char, int> romam_int_map
	{ 
		{'I',             1},
		{'V',             5},
		{'X',             10},
		{'L',             50},
		{'C',             100},
		{'D',             500},
		{'M',             1000},
	};

	for (int i = 0; i < s.size(); i++) {
		val += romam_int_map[s[i]];

		if (i >= 1 && s[i - 1] == 'C' && (s[i] == 'D' || s[i] == 'M'))
		{
			val -= romam_int_map['C'];
			val -= romam_int_map['C'];
		}
		else if (i >= 1 && s[i - 1] == 'X' && (s[i] == 'L' || s[i] == 'C'))
		{
			val -= romam_int_map['X'];
			val -= romam_int_map['X'];
		}
		else if (i >= 1 && s[i - 1] == 'I' && (s[i] == 'V' || s[i] == 'X'))
		{
			val -= romam_int_map['I'];
			val -= romam_int_map['I'];
		}
	}

	return val;
}

void test_romanToInt()
{
	assert(romanToInt("I") == 1);
	assert(romanToInt("II") == 2);
	assert(romanToInt("III") == 3);

	assert(romanToInt("V") == 5);
	assert(romanToInt("VI") == 6);
	assert(romanToInt("IV") == 4);
	assert(romanToInt("IX") == 9);
	
	assert(romanToInt("LVIII") == 58);
	assert(romanToInt("MCM") == 1900);
	assert(romanToInt("XL") == 40);
	assert(romanToInt("MCMXCIV") == 1994);
}