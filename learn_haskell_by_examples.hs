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
