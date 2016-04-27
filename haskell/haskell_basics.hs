函数组合
当一个函数的返回值的类型与另一个函数输入值的类型相同时, 这两个函数就可以复合. 
在Haskell中两个函数复合用运算符(.)表示.
f (g x) = f.g  x
复合运算满足结合律:    f . (g . h) = (f . g) . h 


示例一
f x = (x,2)
g (x,y)=(x+y)*(x-y) 
h = g.f


示例二
sumaux  [] = [] 
sumaux  (x:xs) = x+sum xs : sumaux xs 
sums  = reverse.sumaux.reverse 

> sums([1,2,3,4])
[1,3,6,10]


几个常见的定理
(map  f . map  g)  xs = map  (f.g)  xs 即 map  f . map g = map (f.g) 

map  f  (xs ++ ys)  = map f xs ++ map f ys 
map  f . concat  = concat . map (map f) 
map  f . (x:) = (f x :) . map f 
map  f  xs = foldr  g  []  xs  where  g  x  ys = f  x :  xs 
concat   xss = fold   (++)   []   xss 
sum  (xs ++ ys) = sum  xs  +  sum  ys 
