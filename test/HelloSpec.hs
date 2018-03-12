{-# LANGUAGE RecordWildCards #-}

module HelloSpec where

import App.Model.HelloMessage
import Test.Hspec

spec :: Spec
spec = do

    describe "HelloMessage" $ do
        it "should create a HelloMessage instance" $ do
            -- given + when
            let HelloMessage{..} = HelloMessage "ahoi"

            -- then
            msg `shouldBe` "ahoi"

