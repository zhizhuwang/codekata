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


def main():
	print triangles(1)
	print triangles(2)
	print triangles(3)
	print triangles(4)
	print triangles(5)
	print triangles(6)


if __name__ == '__main__':
	main()
