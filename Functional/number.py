def zero(f,x):
	return x

def one(f,x):
	return f(x)

def two(f,x):
	return f(f(x))

def three(f,x):
	return f(f(f(x)))

def inc(n,f,x):
	return f(n(f,x))

def add(m,n,f,x):
	return m(f,n(f,x))

def test():

	f = lambda x: x+1
	print zero(f,0)
	print one(f,0) 
	print two(f,0)
	print three(f,0)
	print inc(zero,f,0)
	print add(one,three,f,0)


if __name__ == '__main__':
	test()


rule = or_rule(
	or_rule(rule3(3),
		    add_rule(
			    add_rule(rule1(3),rule1(5)),
			    rule1(7))
		    ), 
	rule4())