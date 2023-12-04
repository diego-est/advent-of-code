import Data.List.Split
import Number.Positional

true = \a b -> a
false = \a b -> b
if' b
    | b == True = true
    | otherwise = false

t = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green\nGame 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue\nGame 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red\nGame 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red\nGame 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

toNum = read :: String -> Int

count = sum . map (\(n,_) -> n) . filter (\(_,b) -> b == True) . enumerate

enumerate t = zip [1..length t] t

check (count, "red") = (<= 12) $ toNum count
check (count, "green") = (<= 13) $ toNum count
check (count, "blue") = (<= 14) $ toNum count

-- [("0", "red"), ("0", "green"), ("0", "blue")]

format = map (sliceVertPair . words . filter (/=',')) . splitOn ";" . drop 2 . dropWhile (/= ':')

solve = foldr1 (&&) . map (foldr1 (&&) . map check) . format

main = interact $ show . count . map solve . lines
