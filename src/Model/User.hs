{-# LANGUAGE DeriveGeneric #-}

module Model.User ( 
        User(..)
        , createUser 
    ) where

import Data.Time.Calendar ( Day, fromGregorian )
import GHC.Generics ( Generic )
import Data.Aeson.Types ( ToJSON, FromJSON )

data User = User {
    name :: String,
    age :: Int,
    email :: String,
    registrationDate :: Day
} deriving (Eq, Show, Generic)

instance ToJSON User
instance FromJSON User

createUser :: String -> Int -> String -> (Integer, Int, Int) -> User
createUser name age email (year, month, day) = User name age email $ fromGregorian year month day