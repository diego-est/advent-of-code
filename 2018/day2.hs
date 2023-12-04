import Data.List
import Data.Function
import System.IO
import Control.Monad


toNums = map (read :: String -> Int) . map parse

main = do
    handle <- openFile "day2.txt" ReadMode
    contents <- hGetContents handle
    let input = words contents
