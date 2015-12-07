module Main where

import Adventofcode
import System.Environment (getArgs)
import Text.Read (readMaybe)
import Data.Maybe (maybeToList)

main :: IO ()
main = do
    args <- getArgs
    let days = parseIndices args
    case days of
        [] -> putStrLn "Missing arg: specify one day between [1-25]"
        (day:_) -> adventFor day

adventFor :: Int -> IO ()
adventFor n = case n of
    1 -> do
        input <- getContents
        putStr "Day 1: "
        print (advent01 input)
    2 -> do
        input <- getContents
        putStr "Day 2: "
        print (advent02 input)
    _ -> putStrLn "Invalid arg: specify one day between [1-25]"

parseIndices :: [String] -> [Int]
parseIndices = foldr ((++) . maybeToList . readMaybe) []
