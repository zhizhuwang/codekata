#coding=utf-8
import re
import os

adverb_words = ['越发','难道','可巧','不曾','原是']
adverb_count_part1 = {'越发':0, '难道':0 ,'可巧':0, '不曾':0,'原是':0}
adverb_count_part2 = {'越发':0, '难道':0 ,'可巧':0, '不曾':0,'原是':0}
adverb_count_part3 = {'越发':0, '难道':0 ,'可巧':0, '不曾':0,'原是':0}


def split_origin_file():
	first_part = True
	second_part = False
	third_part = False;

	f_part_1 = open('part1.txt', 'w')
	f_part_2 = open('part2.txt', 'w') 
	f_part_3 = open('part3.txt', 'w')

	filename = ('..'+os.sep+'红楼梦.txt').decode('utf-8')
	with open(filename, 'r+')	as f:
		for line in f:
			if re.match(r'^第四十一回\s+.*$', line):
				first_part = False
				second_part = True
				third_pard = False
				f_part_1.close()
			elif re.match(r'^第八十一回\s+.*$', line):
				first_part = False
				second_part = False
				third_part = True	
				f_part_2.close()

			if first_part:
				f_part_1.write(line)
			elif second_part:
				f_part_2.write(line)
			elif third_part:
				f_part_3.write(line)

		f_part_3.close()


def adverb_count_in_part1():
	with open('part1.txt', 'r') as f:
		for line in f:
			for adverb in adverb_count_part1.keys():
				li = re.findall(r''+adverb, line)
				if(len(li) > 0):
					adverb_count_part1[adverb] = adverb_count_part1[adverb] + len(li)


	with open('result.txt','a+') as f:
		f.write("part1: ")
		for (k,v) in adverb_count_part1.items():
			f.write('{0}:{1}  '.format(k, str(v)))

		f.write("\n");

def adverb_count_in_part2():
	with open('part2.txt', 'r') as f:
		for line in f:
			for adverb in adverb_count_part1.keys():
				li = re.findall(r''+adverb, line)
				if(len(li) > 0):
					adverb_count_part2[adverb] = adverb_count_part2[adverb] + len(li)

	with open('result.txt','a+') as f:
		f.write("part2: ")
		for (k,v) in adverb_count_part2.items():
			f.write('{0}:{1}  '.format(k, str(v)))

		f.write("\n");

def adverb_count_in_part3():
	with open('part3.txt', 'r') as f:
		for line in f:
			for adverb in adverb_count_part3.keys():
				li = re.findall(r''+adverb, line)
				if(len(li) > 0):
					adverb_count_part3[adverb] = adverb_count_part3[adverb] + len(li)

	with open('result.txt','a+') as f:
		f.write("part3: ")
		for (k,v) in adverb_count_part3.items():
			f.write('{0}:{1}  '.format(k, str(v)))
		f.write("\n");

def adverb_count():
	adverb_count_in_part1()
	adverb_count_in_part2()
	adverb_count_in_part3()



function_words = '或亦方即皆仍故尚呀吗咧罢么呢让向往就但越再更很偏'
function_word_count_part1 = {'或':0,'亦':0,'方':0,'即':0,'皆':0,'仍':0,'故':0,'尚':0,'呀':0,'吗':0,'咧':0,'罢':0,'么':0,'呢':0,'让':0,'向':0,'往':0,'就':0,'但':0,
'越':0,'再':0,'更':0,'很':0,'偏':0}
function_word_count_part2 = {'或':0,'亦':0,'方':0,'即':0,'皆':0,'仍':0,'故':0,'尚':0,'呀':0,'吗':0,'咧':0,'罢':0,'么':0,'呢':0,'让':0,'向':0,'往':0,'就':0,'但':0,
'越':0,'再':0,'更':0,'很':0,'偏':0}
function_word_count_part3 = {'或':0,'亦':0,'方':0,'即':0,'皆':0,'仍':0,'故':0,'尚':0,'呀':0,'吗':0,'咧':0,'罢':0,'么':0,'呢':0,'让':0,'向':0,'往':0,'就':0,'但':0,
'越':0,'再':0,'更':0,'很':0,'偏':0}

def function_word_count_in_part1():
	total_count = 0
	with open('part1.txt', 'r') as f:
		for line in f:
			text = line.decode('utf-8')
			for i in text:
				total_count = total_count + 1
				if i in function_words.decode('utf-8'):
					key = i.encode('utf-8')
					function_word_count_part1[key] = function_word_count_part1[key] + 1

	with open('result.txt','a+') as f:
		f.write("Function word in part1: \n")
		for (k,v) in function_word_count_part1.items():
			f.write('{0}:{1}:{2}%\n '.format(k, str(v),str((float)(v)/(float)(total_count)*100)))
		f.write("\n");

def function_word_count_in_part2():
	total_count = 0
	with open('part2.txt', 'r') as f:
		for line in f:
			text = line.decode('utf-8')
			for i in text:
				total_count = total_count + 1
				if i in function_words.decode('utf-8'):
					key = i.encode('utf-8')
					function_word_count_part2[key] = function_word_count_part2[key] + 1

	with open('result.txt','a+') as f:
		f.write("Function word in part2: \n")
		for (k,v) in function_word_count_part2.items():
			f.write('{0}:{1}:{2}%\n '.format(k, str(v),str((float)(v)/(float)(total_count)*100)))
		f.write("\n");

def function_word_count_in_part3():
	total_count = 0
	with open('part3.txt', 'r') as f:
		for line in f:
			text = line.decode('utf-8')
			for i in text:
				total_count = total_count + 1
				if i in function_words.decode('utf-8'):
					key = i.encode('utf-8')
					function_word_count_part3[key] = function_word_count_part3[key] + 1

	with open('result.txt','a+') as f:
		f.write("Function word in part3: \n")
		for (k,v) in function_word_count_part3.items():
			f.write('{0}:{1}:{2}\n '.format(k, str(v),str((float)(v)/(float)(total_count)*100)))
		f.write("\n");

def function_word_count():
	function_word_count_in_part1()
	function_word_count_in_part2()
	function_word_count_in_part3()


punctuation_mark = '“”"，．？：《》！`'

def average_paragraph_len_of_file(filename):
	paragraph_lens = []
	with open(filename, 'r') as f:
		for line in f:
			text = line.decode('utf-8')
			paragraph_lens.append(len(text))
			
	average_paragraph_len = (float)(sum(paragraph_lens)) / (float)(len(paragraph_lens))

	with open('result.txt','a+') as f:
		f.write("Average paragraph len in {} is {:.6f}\n".format(filename, (average_paragraph_len)))


def average_paragraph_length():
	average_paragraph_len_of_file('part1.txt')
	average_paragraph_len_of_file('part2.txt')
	average_paragraph_len_of_file('part3.txt')


def average_sentence_len_of_file(filename):
	sentence_lens = []
	with open(filename, 'r') as f:
		for line in f:
			text = line.decode('utf-8')
			splited_segs = re.split(ur'[，．？！ 　《》\n]+', text.strip())
			sentences = [s for s in splited_segs if len(s) > 0]

			sentence_lens.extend(map(lambda s : len(s), sentences))
			
	average_sentence_len = (float)(sum(sentence_lens)) / (float)(len(sentence_lens))

	with open('result.txt','a+') as f:
		f.write("Average sentence len in {} is {:.6f}\n".format(filename, (average_sentence_len)))


def average_sentence_length():
	average_sentence_len_of_file('part1.txt')
	average_sentence_len_of_file('part2.txt')
	average_sentence_len_of_file('part3.txt')

def main():
	split_origin_file()
	adverb_count()
	function_word_count()
	average_paragraph_length()
	average_sentence_length()

if __name__ == '__main__':
	main()