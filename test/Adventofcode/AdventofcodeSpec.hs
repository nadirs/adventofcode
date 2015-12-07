{-# OPTIONS_GHC -fno-warn-unused-do-bind #-}
module Adventofcode.AdventofcodeSpec where

import Test.Hspec
import Adventofcode

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "Day 1" $ do
        it "Begin at 0" $
            advent01 "" `shouldBe` 0
        it "Open paren adds 1" $ do
            advent01 "(" `shouldBe` 1
            advent01 "(((" `shouldBe` 3
        it "close paren subtracts 1" $ do
            advent01 ")" `shouldBe` -1
            advent01 "))))" `shouldBe` -4
        it "put them together" $ do
            advent01 "()()()" `shouldBe` 0
            advent01 "(())()" `shouldBe` 0
            advent01 ")(())()((" `shouldBe` 1

    describe "Day 2" $
        it "Finds index of first time it went downstairs" $ do
            advent02 ")()))())(()(((" `shouldBe` Just 1
            advent02 "()()))(()()())))((()()))(()()" `shouldBe` Just 5
            advent02 "((()()()(())())))()())" `shouldBe` Just 17
