# Рекурсивни Типове

В Haskell, дефинираме рекурсивен тип по следния начин:

```haskell
data Tree a = Empty | Node a (Tree a) (Tree a)
```

Това е примерна дефиниция за двоично дърво, което има два value constructors:

* Empty - с което ще бележим празно дърво (или край).
* Node - с което ще бележим даден възел. Node-a има стойност `a` и два наследника, които са от тип дърво.

Тоест, едно примерно дърво:

![](https://www.ocf.berkeley.edu/~shidi/cs61a/w/images/d/df/Binary_tree.png)

Би изглеждало така:

```haskell
data Tree a = Empty | Node a (Tree a) (Tree a)

exampleTree :: Tree String
exampleTree = Node "F" 
                (Node "B" 
                  (Node "A" Empty Empty) 
                  (Node "D"
                    (Node "C" Empty Empty)
                    (Node "E" Empty Empty))) 
                (Node "G"
                  Empty 
                  (Node "I" 
                    (Node "H" Empty Empty) Empty))
```

## Задачи върху дървета

Използвайки горните дефиниции, решете съответните задачи:

* `treeElementsCount :: Tree a -> Int` - връща броя на възлите в едно дърво
* `treeHeight :: Tree a -> Int` - връща височината на едно дърво
* `flattenTree :: Tree a -> [a]` - връща дървото, изгладено до списък. Нека обхождането да бъде ляво-корен-дясно
* `treeFind :: Eq a => a -> Tree a -> Bool` - проверява дали елемент се среща в дървото. Това дърво не е двоично дърво за търсене!
* `bstInsert :: Ord a => a -> Tree a -> Tree a` - вмъква елемент в двоично дърво за търсене
* `bstFind :: Ord a => a -> Tree a -> Bool` - проверява дали елемент се съдържа в двоично дъво за търсене
* `treeLevel :: Int -> Tree a -> [a]` - връща списък от всички елементи на търсеното ниво в дървото. Нивата започват от 1.
* `treeLevels :: Tree a -> [[a]]` - връща списък от списъци от всички елементи на всички нива на дървото, започвайки от първо ниво.
* `isEmpty :: Tree a -> Bool` - предикат, който проверява дали дадено дърво е празно
* `isLeaf :: Tree a -> Bool` - предикат, който проверява дали дадено дърво е листо (няма наследници)
* `countLeaves :: Tree a -> Int` - връща броя на всички листа в нашето дърво
* `successorsCount :: Tree a -> Int` - връща броя на преките наследниците на едно дърво (Може да 0, 1 или 2)
* `treeMap :: (a -> b) -> Tree a -> Tree b` - това е `map` функцията в/у дърво - трансформира всеки елемент и прави ново дърво.

Ето примерно вкарване на дървото в `Show`, ако имате функцията `flattenTree`:

```haskell
data Tree a = Empty | Node a (Tree a) (Tree a)

exampleTree :: Tree Int
exampleTree = (Node 5 (Node 4 (Node 10 Empty Empty) Empty) (Node 3 (Node 11 Empty Empty) Empty))

instance Show a => Show (Tree a) where
  show tree = show $ flattenTree tree
```

