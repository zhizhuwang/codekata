class Functor f where
  fmap :: (a -> b) -> f a -> f b
  
instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x leftsub rightsub) =
          Node (f x) (fmap f leftsub) (fmap f rightsub)
          
ghci> fmap (*2) EmptyTree
EmptyTree
ghci> fmap (*4) (foldr treeInsert EmptyTree [5,7,3,2,1,7])
Node 28 (Node 4 EmptyTree (Node 8 EmptyTree (Node 12 EmptyTree (Node 20 EmptyTree EmptyTree)))) EmptyTree


-- type是值的标签，kind是类型的标签

-- query the title by id form database 
post = Post.find_by_id(1)
if post
  return post.title
else
  return nil
end
-- In Haskell we can write like this: 
fmap (getPostTitle) (findPost 1)
-- <$> is the infix version of fmap, so you will often see this instead:
getPostTitle <$> (findPost 1)


-- Maybe and List are Funtors:
instance Functor Maybe where
    fmap (Just val) = Just (fmap val)
    fmap (Nothing)  = Nothing
    
instance Functor [] where 
   fmap = map


如果一个类型遵守 Functor laws，我们可以对它作些基本的假设；如果遵守了 Functor laws，我们知道它作fmap不会做多余的事情，只是用一个函数做映射而已。


我们可以把Functor看成是具有context的值。


如果我们将Functor看成是能输出值的东西，那么可以将mapping over一个Functor看作是在Functor的输出值上再加一次转换，对其输出值进行变换。