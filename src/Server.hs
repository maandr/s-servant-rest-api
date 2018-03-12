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

import Data.Time.Calendar ( Day, fromGregorian )
import Data.Aeson.Types ( ToJSON )
import GHC.Generics ( Generic )
import Servant

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

usersHandler :: Server UserAPI
usersHandler = return users

apiProxy :: Proxy UserAPI
apiProxy = Proxy

app :: Application
app = serve apiProxy usersHandler