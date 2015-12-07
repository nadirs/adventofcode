module Adventofcode
    ( advent01
    ) where

advent01 :: Integral a => String -> a
advent01 = sum . map matchParens

matchParens :: Integral a => Char -> a
matchParens '(' = 1
matchParens ')' = -1
matchParens _ = 0

