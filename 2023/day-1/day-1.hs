import Data.List
import Data.Char

number "one" = "1"
number "two" = "2"
number "three" = "3"
number "four" = "4"
number "five" = "5"
number "six" = "6"
number "seven" = "7"
number "eight" = "8"
number "nine" = "9"
number "1" = "1"
number "2" = "2"
number "3" = "3"
number "4" = "4"
number "5" = "5"
number "6" = "6"
number "7" = "7"
number "8" = "8"
number "9" = "9"
number _ = ""

starling = \a b c d -> a (b d) (c d)

splitAll [] = []
splitAll (x:xs) = [x] : splitAll xs

prefixes = scanl1 (++) . splitAll

suffixes = scanr1 (++) . splitAll

allSubstrs = foldl' (++) [""] . map (suffixes) . prefixes

getNum = starling (++) head last . filter (/= "") . map number . allSubstrs

solve1 = sum . map ((read :: String -> Int) . getNum)

main = interact $ show . solve1 . words
