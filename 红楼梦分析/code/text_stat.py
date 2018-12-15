#coding=utf-8
import re
import os

adverb_words = ['越发','难道','可巧','不曾','原是']
adverb_count_part1 = {'越发':0, '难道':0 ,'可巧':0, '不曾':0,'原是':0}
adverb_count_part2 = {'越发':0, '难道':0 ,'可巧':0, '不曾':0,'原是':0}
adverb_count_part3 = {'越发':0, '难道':0 ,'可巧':0, '不曾':0,'原是':0}


def open_origin_file():
	first_part = True
	second_part = False
	third_part = False;

	f_part_1 = open('part1.txt', 'w')
	f_part_2 = open('part2.txt', 'w') 
	f_part_3 = open('part3.txt', 'w')

	with open('../红楼梦.txt', 'r')	as f:
		for line in f:
			if re.match(r'^第四十一回\s+.*$', line):
				first_part = False
				second_part = True
				third_pard = False
				f_part_1.close()
			elif re.match(r'^第八十一回\s+.*$', line):
				first_part = False
				second_part = False
				third_pard = True	
				f_part_2.close()

			if first_part:
				f_part_1.write(line)
			elif second_part:
				f_part_2.write(line)
			elif third_part:
				f_part_3.write(line)

def adverb_count_in_part1():
	with open('part1.txt', 'r') as f:
		for line in f:
			for adverb in adverb_count_part1.keys():
				if(re.search(r''+adverb, line)):
					adverb_count_part1[adverb] = adverb_count_part1[adverb] + 1
	print adverb_count_part1

	with open('result.txt','a+') as f:
		f.write("part1: ")
		for (k,v) in adverb_count_part1.items():
			f.write('{0}:{1}  '.format(k, str(v)))

		f.write("\n");

def adverb_count_in_part2():
	with open('part2.txt', 'r') as f:
		for line in f:
			for adverb in adverb_count_part1.keys():
				if(re.search(r''+adverb, line)):
					adverb_count_part2[adverb] = adverb_count_part2[adverb] + 1

	with open('result.txt','a+') as f:
		f.write("part2: ")
		for (k,v) in adverb_count_part2.items():
			f.write('{0}:{1}  '.format(k, str(v)))

		f.write("\n");

def adverb_count_in_part3():
	with open('part3.txt', 'r') as f:
		for line in f:
			for adverb in adverb_count_part3.keys():
				if(re.search(r''+adverb, line)):
					adverb_count_part3[adverb] = adverb_count_part3[adverb] + 1

	with open('result.txt','a+') as f:
		f.write("part3: ")
		for (k,v) in adverb_count_part3.items():
			f.write('{0}:{1}  '.format(k, str(v)))
		f.write("\n");

def adverb_count():
	adverb_count_in_part1()
	adverb_count_in_part2()
	adverb_count_in_part3()



def main():
#	open_origin_file()
	adverb_count()

if __name__ == '__main__':
	main()