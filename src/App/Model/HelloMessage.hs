{-# LANGUAGE DeriveGeneric #-}

module App.Model.HelloMessage ( HelloMessage(..) ) where

import GHC.Generics ( Generic )
import Data.Aeson.Types ( ToJSON )

data HelloMessage = HelloMessage {
    msg :: String
} deriving ( Generic )

instance ToJSON HelloMessage