inc :: Int -> Int
inc x = x + 1

double :: Int -> Int
double x = x * 2

square :: Int -> Int
square x = x * x

-- Pattern matching
-- Една и съща функция, която обаче чака точно специфичен аргумент
-- Не сме задължен да слагаме типова декларация на функцията
factorial 0 = 1
factorial n = n * factorial (n - 1)

fib 1 = 1
fib 2 = 1
fib n = fib (n - 1) + fib (n - 2)

-- Guards за if-ове
abs' x
    | x <  0 = (-x)
    | otherwise = x

sumDigits :: Int -> Int
sumDigits 0 = 0
sumDigits n = (mod n 10) + sumDigits (div n 10)

-- Имплементация с guards
sumDigits' :: Int -> Int
sumDigits' n
    | n == 0 = 0
    | otherwise = (mod n 10) + sumDigits (div n 10)

pyth :: Int -> Int -> Int -> Bool
pyth a b c = a^2 + b^2 == c^2

-- Проверява дали x е в интервала [a, b]
between :: Int -> Int -> Int -> Bool
between x a b = (x >= a) && (x <= b)

-- where за локални дефиниции
-- Правим опашкова рекурсия с локална функция
isPrime :: Int -> Bool
isPrime n
    | n <= 1 = False
    | otherwise = isPrime' 2 n
        where
            isPrime' current n
                | current == n = True
                | mod n current == 0 = False
                | otherwise = isPrime' (current + 1) n

area :: Double -> Double -> Double -> Double
area a b c = sqrt (p * pa * pb * pc)
    where
        p = (a + b + c) / 2
        pa = p - a
        pb = p - b
        pc = p - c

foodForPandas :: Int -> Int -> Int
foodForPandas timeSpan pandaCount = totalFood
    where
        bambooPerDayPerPanda = 10
        ricePerDayPerPanda = 2
        bambooCount = bambooPerDayPerPanda * pandaCount * timeSpan
        riceCount = ricePerDayPerPanda * pandaCount * timeSpan
        totalFood = bambooCount + riceCount
