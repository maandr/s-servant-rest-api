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

import Servant
import App.Models.User ( User, createUser )

-- GET /users?sortby={age, name}
type UserAPI = "users" :> Get '[JSON] [User]
    :<|> "albert" :> Get '[JSON] User
    :<|> "isaac" :> Get ' [JSON] User

getUsers :: [User]
getUsers = [ getIsaac, getAlbert ]

getIsaac :: User
getIsaac = createUser "Isaac Newton" 372 "isaac@newton.co.uk" (1683, 3, 1)

getAlbert :: User
getAlbert = createUser "Albert Einstein" 136 "ae@mc2.org" (1905, 12, 1)

server :: Server UserAPI
server = return getUsers
    :<|> return getAlbert
    :<|> return getIsaac

apiProxy :: Proxy UserAPI
apiProxy = Proxy

app :: Application
app = serve apiProxy server