module Adventofcode where

import Control.Arrow
import Data.Foldable

advent01 :: Integral a => String -> a
advent01 = sum . map matchParens

advent02 :: Integral a => String -> Maybe a
advent02 = maybeResult . dropWhile ((>= 0) . snd) . zip [1..] . accum 0 . map matchParens
  where
    accum :: Integral a => a -> [a] -> [a]
    accum acc (x:xs) = (acc + x) : accum (acc + x) xs
    maybeResult ((i, _):xs) = Just i
    maybeResult _ = Nothing

appendSum :: Integral a => [(a, a)] -> Char -> [(a, a)]
appendSum rest@((counter, addendum):_) x = (counter + 1, addendum + matchParens x) : rest

matchParens :: Integral a => Char -> a
matchParens '(' = 1
matchParens ')' = -1
matchParens _ = 0

