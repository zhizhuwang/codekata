import os
import re

def read_files(root):
	for f in os.listdir(root):
		if is_duplicate_file(f):
			os.remove(os.path.join(root, f))

def is_duplicate_file(file):
	return file.find('-') > 0



if __name__ == "__main__":
	read_files('e:\\pics');

