# 3то упражнение по Haskell

## Материали

Говорихме си за:

* `map`, `filter` и `foldl`
* Function Currying в Haskell. Тук може да прочетете повече - http://learnyouahaskell.com/higher-order-functions#curried-functions
* Композиция на функции - `(.)` и идентитет на функции - `($)`. Прочете това - http://lambda.jstolarek.com/2012/03/function-composition-and-dollar-operator-in-haskell/ - кратко и добро обяснение за двете функции / оператора
* Малко по-задълбочено - http://stackoverflow.com/questions/3030675/haskell-function-composition-and-function-application-idioms-correct-us

От книгата е хубаво да прочетете следните глави, които ще засегнем и следващия път:

* http://learnyouahaskell.com/syntax-in-functions
* http://learnyouahaskell.com/recursion
* http://learnyouahaskell.com/higher-order-functions

## Задачи

### Задача 1 - count

Функцията `count`, със следната сигнатура:

```haskell
count :: Eq a => a -> [a] -> Int
```

Трябва да върне броя на срещания на първия аргумент в списъка.

```haskell
count 1 [1, 2, 3] == 1
count 1 [] == 0
```

### Задача 2 - matchLengths 

Напишете предикат `matchLengths`, който приема два непразни списъка `l1` и `l2` с еднаква дължина.

Нека `l1 = (a1 a2 a3 ... an)` и `l2 = (b1 b2 b3 ... bn)`. Предикатът връща истина, ако разликата между дължините на всяка двойка списъци `(ai, bi)` е еднаква.

Функцията има следната сигнатура:

```haskell
matchLengths :: [[Int]] -> [[Int]] -> Bool
```

**Примери:**

```haskell
matchLengths [ [], [1, 2], [3, 4, 5] ] [ [1], [2,3,4], [5,6,7,8] ] -- True
matchLengths [ [], [1,2], [3,4,5] ] [ [], [2,3,4], [5,6,7] ] -- False
matchLengths [ [1..9], [10..19] ] [ [1,2,3], [1,2,3,4] ] -- True
```

### Задача 3 - trim

Когато четем потребителски вход, трябва да "окастрим" получения низ. Защото потребителите използват шпациите на места, на които не очакваме.

Напишете следната фунцкия:


```haskell
trim :: String -> String
```

Функцията трябва да премахне **всяко срещане на whitespace от началото и края на низа**. Махат се излишните whitespaces, докато не се стигне до нормална буква.

**Две неща:**

* Може да използвате `isSpace :: Char -> Bool`, но ще трябва да напишете следния код на първия ред - `import Data.Char`
* `String` типът е просто списък от Char-ове - `[Char]`.


### Задача 4 - Run-length encoding

[Run-Length encoding](http://en.wikipedia.org/wiki/Run-length_encoding) е прост начин за компресия на текст, при който последователните срещания на един елемент се заменят с `<брой на срещанията><елемента>`, а в случай че тази замяна би заела повече символи, отколкото оригиналния текст (например, ако имаме само едно срещане на буквата `"а"` и го заменим с `"1а"`, то променения текст би заемал повече памет от изходния) се запазва оригиналния текст. Да се напише функция `lengthEncode str`, която компресира низ по зададения метод.


**Сигнатура:**

```haskell
lengthEncode :: String -> String
```

**Примери:**

```haskell
lengthEncode "aaabccdefff" -> "3ab2cde3f"
lengthEncode "abcdef" -> "abcdef"
lengthEncode "aaaaaaaaaaaabbb" -> "12a3b"
```

Може да се счита, че входът ще бъде коректен и ще съдържа само букви

**Hint:**

Може да използвате функцията [show](http://hackage.haskell.org/package/base-4.7.0.1/docs/Prelude.html#v:show) за конвертиране на числа в низове

### Задача 5 - Run-length decoding

За къде сме без обратната функция?

Напишете я:

```haskell
lengthDecode :: String -> String
```

**Примери:**

```haskell
lengthDecode "3ab2cde3f" -> "aaabccdefff"
lengthDecode "abcdef" -> "abcdef"
lengthDecode "12a3b" -> "aaaaaaaaaaaabbb"
```

### Задача 6 - Quicksort

Имплементирайте Quicksort:

```haskell
quickSort :: Ord a => [a] -> [a]
```

Опитайте се да го направите изразително и по Haskell–ски.
