import Data.Function
import System.IO
import Control.Monad
import qualified Data.Set as Set

true a b = a
false a b = b

if' a
    | True = true
    | otherwise = false

eq = on (==) id
parse = filter (not . eq '+')
if' True x _ = x
if' False _ x = x
dup :: Ord a => [a] -> Maybe a
dup xs = dup' xs Set.empty
  where dup' [] _ = Nothing
        dup' (x:xs) s = if Set.member x s
            then Just x
            else dup' xs (Set.insert x s)

solutionA = sum

solutionB = dup . scanl (+) 0 . cycle

toNums = map (read :: String -> Int) . map parse

main = do
    handle <- openFile "day1.txt" ReadMode
    contents <- hGetContents handle
    let input = toNums $ words contents

    print $ solutionA input
    print $ solutionB input
