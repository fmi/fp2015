# Алгебрични структури от данни

Говорихме си за различни начини, по които може да се дефинират нови типове в Haskell:

* Чрез `typе` като типови синоними
* Чрез `data`, като си разказахме какво са value constructors.


##Препоръчани материали

* [Глава от Learn You a Haskell по тази тема](http://learnyouahaskell.com/making-our-own-types-and-typeclasses)
* [Declaring Types and Classes - TU-Delft, Part 1](http://delftxdownloads.tudelft.nl/FP101x-FunctionalProgramming/Week5/FP101x-chapter9-part1-video.720.mp4)
* [Declaring Types and Classes - TU-Delft, Part 2](http://delftxdownloads.tudelft.nl/FP101x-FunctionalProgramming/Week5/FP101x-chapter9-part2-video.720.mp4)
* [Declaring Types and Classes - TU-Delft, Part 3](http://delftxdownloads.tudelft.nl/FP101x-FunctionalProgramming/Week5/FP101x-chapter9-part3-video.720.mp4)
* [Functional Programming - 101, TU-Delft](https://github.com/fptudelft/FP101x-Content)


## Задачи

### Product чрез type

Използвайки следната типова дефиниция:

```haskell
type Product = (String, Double)
```

Напишете следните функции:

* `getName :: Product -> String`
* `getPrice :: Product -> Double`
* `discount :: Double -> [Product] -> [Product]`, където първият аргумент е процент, между 0 и 100. Функцията трябва да върне нов списък с продукти, в който всички са намалени с дадения процент

### Shapes

Използвайки следната дефиниция:

```haskell
data Shape = Circle | Triangle | Rectangle
```

Добавете типът `Shape` в следните типови класове:

* `Show`
* `Eq`

Да се напишат следните функции:

* `isCircle :: Shape -> Bool`
* `isTriangle :: Shape -> Bool`
* `isRectangle :: Shape -> Bool`

### Vector2D

Използвайки следната дефиниция:

```haskell
data Vector2D = Vector2D Double Double
```

Добавете типът `Vector2D` в следните типови класове:

* `Show`
* `Eq`

Да се напишат следните функции:

* `addVectors :: Vector2D -> Vector2D -> Vector2D`
* `vectorLength :: Vector2D -> Double` - дължина на вектор

### Библиотека

Използвайки следните дефиници на типът книга:

```haskell
data Book = Paper String Int | Online String Int Int
type Library = [Book]
```

Където типът книга има 2 value construcrors:

* `Paper` с два аргумента - името на книгата и броят страници
* `Online` с три аргумента - името на книгата, цената и броят на страниците

Така сме описали книга, която може да е хартиена или пък онлайн.

В нашата библиотека, само онлайн книгите имата цена.

**А библиотеката представлява списък от книги.**

Да се напишат следните функции:

* `getPages :: Book -> Int` - връща броя на страниците на дадена книга
* `getTotalPages :: Library -> Int` - връща броя на страниците на всички книги в една библиотека
* `getOnlineCount :: Library -> Int` - връща броя на книгите в дадена библиотека, които са online
* `getPaperCount :: Library -> Int` - връща броя на книгите в дадена библиотека, които са paper
* `getBooksLike :: String -> Library -> Library` - връща нов списък от книги, в които низа, подаден като първи аргумент се среща в тяхното заглавие. Един вид, правим търсене на книги по някакъв низ в блиотека. **Търсенето трябва да е case insensitive - т.е главните и малките букви са еднакви**. За това може да ползвате `toLower :: Char -> Char` от `Data.Char`

