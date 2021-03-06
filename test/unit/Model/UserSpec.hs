{-# LANGUAGE RecordWildCards #-}

module Unit.Model.UserSpec where

import Model.User
import Data.Time.Calendar ( fromGregorian )
import Test.Hspec

spec :: Spec
spec = do

    describe "createUser" $ do
        it "should create a User instance" $ do
            -- given + when
            let User{..} = createUser "Mats" 30 "mats@example.com" (1987, 23, 11)

            -- then
            name `shouldBe` "Mats"
            age `shouldBe` 30
            email `shouldBe`"mats@example.com"
            registrationDate `shouldBe` fromGregorian 1987 23 11