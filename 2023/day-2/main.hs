import Data.List.Split

sliceVertPair :: [a] -> [(a,a)]
sliceVertPair (x0:x1:xs) = (x0,x1) : sliceVertPair xs
sliceVertPair [] = []
sliceVertPair _ = error "odd number of elements"

check :: String -> String -> ((), Bool)

format = map (sliceVertPair . words . filter (/=',')) . splitOn ";" . drop 2 . dropWhile (/= ':')

main = do
    let line1 = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    print $ format line1
