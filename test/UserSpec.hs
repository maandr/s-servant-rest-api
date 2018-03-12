{-# LANGUAGE RecordWildCards #-}

module UserSpec where

import App.Models.User
import Data.Time.Calendar ( fromGregorian )
import Test.Hspec

spec :: Spec
spec = do

    describe "createUser" $ do
        it "should create a user instance" $ do
            -- given + when
            let User{..} = createUser "Mats" 30 "mats@example.com" (1987, 23, 11)

            -- then
            name `shouldBe` "Mats"
            age `shouldBe` 30
            email `shouldBe`"mats@example.com"
            registration_date `shouldBe` fromGregorian 1987 23 11