-- Намираме сумата на всички елементи в списък
-- Каква е сигнатурата?
sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum xs

-- Така бихме го написали на Scheme
-- И е грозно!
sum'' :: Num a => [a] -> a
sum'' [] = 0
sum'' items
    | null items = 0
    | otherwise = head items + sum'' (tail items)

-- Правим списък от start към end
-- Тук функцията succ е ключова
-- Сигнатурата казва, че какъвто и тип a да дадем, той трябва да е в кошницата на
-- Enum - да има функция succ
-- Ord - да може да се сравнява
range :: (Enum a, Ord a) => a -> a -> [a]
range start end
    | start > end = []
    | otherwise = start : range (succ start) end

-- Дължина на списък
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

-- Последен елемент на списък
-- Какво правим ако нямаме последен елемент?
last' :: [a] -> a
last' [] = error "Empty list"
last' [x] = x
last' (x:xs) = last' xs

member :: Eq a => a -> [a] -> Bool
member _ [] = False
member needle (x:haystack)
    | needle == x = True
    | otherwise = member needle haystack

-- функция, която добавя елемент накрая на списъка
addLast :: a -> [a] -> [a]
addLast y []  = [y]
addLast y (x:xs) = x : addLast y xs

-- Може да я направим и с оператора за конкатениране на списъци
addLast' :: a -> [a] -> [a]
addLast' item items = items ++ [item]

-- Намиране на обратния списък чрез опашкова рекурсия
reverse'' :: [a] -> [a]
reverse'' items = iter items []
    where
        iter [] result = result
        iter (x:xs) result = iter xs (x:result)

-- Функцията map
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

-- Функцията filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' pred (x:xs)
    | pred x == True = x : filter' pred xs
    | otherwise = filter' pred xs

-- Филтрираме списъка с предиката
-- Ако има поне 1 елемент в новия списък, то условието е изпълнено
any' :: (a -> Bool) -> [a] -> Bool
any' pred items = filteredLength >= 1
    where
        filteredLength = length $ filter pred items

-- Обратната функция - гледаме дали след като филтрираме
-- Получаваме същият списък като дължина
all' :: (a -> Bool) -> [a] -> Bool
all' pred items = filteredLength == actualLength
    where
        filteredLength = length $ filter pred items
        actualLength = length items
