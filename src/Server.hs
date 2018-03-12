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
    :<|> "albert" :> Get '[JSON] User
    :<|> "isaac" :> Get ' [JSON] User

data SortBy = Age | Name

data User = User {
    name :: String,
    age :: Int,
    email :: String,
    registration_date :: Day
} deriving (Eq, Show, Generic)

instance ToJSON User

getUsers :: [User]
getUsers = [ getIsaac, getAlbert ]

getIsaac :: User
getIsaac = User "Isaac Newton" 372 "isaac@newton.co.uk" (fromGregorian 1683 3 1)

getAlbert :: User
getAlbert = User "Albert Einstein" 136 "ae@mc2.org" (fromGregorian 1905 12 1)

server :: Server UserAPI
server = return getUsers
    :<|> return getAlbert
    :<|> return getIsaac

apiProxy :: Proxy UserAPI
apiProxy = Proxy

app :: Application
app = serve apiProxy server