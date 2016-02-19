# -*- coding: utf-8 -*-

# The n-th line of triangles
def triangles(n):
	if n == 1:
		return [1]
	if n == 2:
		return [1,1]

	t = [[1],[1,1]]
	i = 3

	while i<= n:
		x = [1]
		j = 1
		prev_line = t[i-2]
		while j < i-1:
			x.append(prev_line[j-1] + prev_line[j])
			j = j + 1
		x.append(1)
		t.append(x)
		i = i + 1

	return t[-1]


def triangles_with_generator():
	i = 0;
	t=[]
	while True:
		if i == 0:
			t = [1]
		elif i == 1:
			t = [1,1]
		else:
			t = next_line(t,i)
			
		yield t
		i = i+1

	return 

def triangles_with_generator():
	t = [1]
	i = 0

	while True:
		if i == 0:
			yield t
		else:
			t = [1] + [t[i]+t[i+1] for i in range(len(t)-1)] + [1]
			yield t
		i += 1
		
def next_line(prev_line, i):
	x = [1]
	j = 1
	while j < i:
		x.append(prev_line[j-1] + prev_line[j])
		j = j + 1

	x.append(1)
	
	return x


def main():
	print (triangles(1))
	print (triangles(2))
	print (triangles(3))
	print (triangles(4))
	print (triangles(5))
	print (triangles(6))

	n = 0
	for line in triangles_with_generator():
		print (line)
		n = n + 1
		if n == 10:
			break



	n = 0
	for t in triangles_with_generator():
		print(n, t)
		n = n + 1
		if n == 10:
			break
		
if __name__ == '__main__':
	main()
