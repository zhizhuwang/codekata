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
> take 10 $ cycle [1,2,3]
    [1,2,3,1,2,3,1,2,3,1]
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



Tuple
(x,y,z)
一组元素的组合，元素类型可以不同
长度大于1，且不可变
List of tuples，用来表示一组相关的元素，例如，表示二维平面上的一组坐标：
    [ (1,2) , (8,11), (3,5)]
Pair(含有两个元素的tuple)的常用函数
fst  
snd

zip
取两个 List，然后将它们交叉配对，形成一组pair的 List
>  zip [1,2,3,4,5] [5,5,5,5,5]
    [(1,5),(2,5),(3,5),(4,5),(5,5)]
>  zip [1 .. 5] ["one", "two", "three", "four", "five"]
    [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]


一个示例
如何取得所有三边长度皆为整数且小于等于 10，周长为 24 的直角三角形？
> let rightTriangles' = 
    [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
> rightTriangles'
    [(6,8,10)]



 一门纯粹的函数式编程语言
 根据科学家Haskell B.Curry的名字命名. Haskell经过多年的发展完善, 目前使用的版本是Haskell 98. 

相比较命令(imperative)编程语言, 函数编程语言关注于更高层次的"做什么"而不是"怎么做"。
函数编程语言的语法功能非常强，使编程的效率大幅提高。 
Haskell是世界上公认的语法最优美最简洁的一种语言。



1.注释有两种: 一种以"--"开始到行尾结束, 一种以"{-"开始,以"-}"结束,可以延续多行. 

2.表达式和函数都有类型,但类型声明不是必需的,有一套类型推断系统可以推断出所涉及的类型. 

3.函数的定义多使用模式(pattern)匹配的方法, 两个标识符(identifier)邻接就表示函数调用. 

4.函数变量和类型变量的标识符以小写字母开头, 类型构造和模块的标识符以大写字母开头. 

5.语句块以缩进区分, 从同一列开始的语句属于同一个块. 

6.保留字: case class data default deriving do else if import in infix infixl infixr instance let module newtype of then type where _ 

7.运算符可以自定义,由以下符号进行组合: 
       : # $ % & * + - = . / \ < > ? ! @ ^ | 
 预定义的运算符有: 
       +  -  *  /  ^  $  ++  .  &&  ||  ==  /= <=  >=  <  > 
       : //  =  @  ->  =>  ..  ::  <-  !! 
        
8.数字: 123  12.3  1.23e5  0o67  0x3A 

 字符: 'a' 'A' '\n' 
  
 字符串: "character string" 



 高阶函数

 函数可以作为参数和返回值
本质上，haskell的所有函数都只有一个参数，所有多个参数的函数都是柯里函数。


