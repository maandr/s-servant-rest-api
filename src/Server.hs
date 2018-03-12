{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module Server ( app ) where

import Prelude
import Data.Time.Calendar
import Data.Aeson.Types
import Data.List
import Data.Maybe
import GHC.Generics
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import qualified Data.Aeson.Parser

-- GET /users?sortby={age, name}
type UserAPI = "users" :> Get '[JSON] [User]

data SortBy = Age | Name

data User = User {
    name :: String,
    age :: Int,
    email :: String,
    registration_date :: Day
} deriving (Eq, Show, Generic)

instance ToJSON User


users :: [User]
users = [
          User "Isaac Newton" 372 "isaac@newton.co.uk" (fromGregorian 1683 3 1)
        , User "Albert Einstein" 136 "ae@mc2.org" (fromGregorian 1905 12 1)
    ]

server :: Server UserAPI
server = return users

userAPIProxy :: Proxy UserAPI
userAPIProxy = Proxy

app :: Application
app = serve userAPIProxy server