module DictionarySpec where

import Data.Dictionary
import Test.Hspec

spec :: Spec
spec = do

    describe "dictAdd" $ do
        it "should add an entry to the passed dictionary" $ do
            -- given
            let dict = givenDictionary

            -- when
            let result = dictAdd dict 4 "d"

            -- then
            result `shouldBe` Dictionary [(1, "a"), (2, "b"), (3, "c"), (4, "d")]

    describe "dictFind" $ do
        it "should return the value of the key that does exist within the passed dictioanry" $ do
            -- given
            let dict = givenDictionary

            -- when
            let result = dictFind dict 2 :: Maybe String

            -- then
            result `shouldBe` Just "b"
        
        it "should return nothing when given a key that dosen't exist within the passed dictionary" $ do
            -- given
            let dict = givenDictionary

            -- when
            let result = dictFind dict 5 :: Maybe String

            -- then
            result `shouldBe` Nothing
        it "should return nothing when given an empty dictionary" $ do
            -- given
            let dict = Dictionary []

            -- when
            let result = dictFind dict 1 :: Maybe String

            -- then
            result `shouldBe` Nothing

    describe "dictMap" $ do
        it "should apply a given function to all entires of the passed dictionary" $ do
            -- given
            let dict = givenDictionary

            -- when
            let result = dictMap (\x -> x ++ x) dict

            -- then
            result `shouldBe` Dictionary [(1, "aa"), (2, "bb"), (3, "cc")]

-- helper

givenDictionary :: Dictionary Int String
givenDictionary = Dictionary [(1, "a"), (2, "b"), (3, "c")] :: Dictionary Int String