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


List
最常用的数据结构，用于存储相同类型的多个元素。
字符串是一个Char类型的List
Range
List Comprehension


List常用操作
++    
    [1,2,3] ++ [4,5,6]    --> [1,2,3,4,5,6]
:      
    1:[2,3,4]              -->[1,2,3,4]
!!     
    [1,2,3,4,5,6] !! 3  -->  4
List of Lists     
     [[1,2,3],[4,5,6],[7,8,9]]


head      
    head “hello”   -->  ‘h’
tail          
    tail “hello”    -->  “ello”
last          
    last “hello”  -- >  ‘o’
init       
init  “hello” -- > “ello”

length 
    length [1,2,3] -- > 3
null
    null  []   -- > True
maximum
    maximum [1,2,3] -- > 3
sum
    sum [1,2,3]  -- > 6
product
    product [1,2,3,4]  -- > 24


reverse
    > reverse "hello"  -- >   "olleh“
take
    > take 3 [5,4,3,2,1]  -- > [5,4,3]
drop
    > drop 3 [8,4,2,1,5,6]   -- > [1,5,6]
replicate
    > replicate 3 10 ，-- >  [10,10,10]
elem
    > 4 `elem` [3,4,5,6]   -- > True


Range
构造list的方法之一，其中的值必须是可枚举的
惰性的
ghci> [1..10]
    [1,2,3,4,5,6,7,8,9,10]
ghci> ['a'..'z']
    "abcdefghijklmnopqrstuvwxyz"
ghci> ['K'..'Z']
    "KLMNOPQRSTUVWXYZ"

惰性
> [1..]  一个无穷自然数列
> take 10 [1..]
    [1,2,3,4,5,6,7,8,9,10]
> take 10 (repeat 5)
    [5,5,5,5,5,5,5,5,5,5]


List Comprehension
来源于数学中的Set Comprehension，从一个集合产生另外一个集合
例如，前十个偶数的set comprehension可以表示为：

Haskell中的List Comprehension具有类似的功能。


>  take 10 [2,4..]
    [2,4,6,8,10,12,14,16,18,20]

>  [x*2 | x <- [1..10]]   [2,4,6,8,10,12,14,16,18,20]

Filtering
> [ x | x <- [50..100],  x `mod` 7 == 3]
    [52,59,66,73,80,87,94]

> [ x*y | x <-[2,5,10],  y <- [8,10,11],  x*y > 50]
    [55,80,100,110]

> removeNonUppercase st = 
                                                    [ c | c <- st,  c `elem` ['A'..'Z']]
> removeNonUppercase "Hahaha! Ahahaha!"
    "HA"
