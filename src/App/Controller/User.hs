{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App.Controller.User (
        UserAPI
        , getUsers
        , getIsaac
        , getAlbert
    ) where

import App.Model.User
import Servant

type UserAPI = 
    -- GET /users
    "users" :> Get '[JSON] [User]
    -- GET /users/albert
    :<|> "users" :> "albert" :> Get '[JSON] User
    -- GET /users/isaac
    :<|> "users" :> "isaac" :> Get '[JSON] User

getUsers :: [User]
getUsers = [ getIsaac, getAlbert ]

getIsaac :: User
getIsaac = createUser "Isaac Newton" 372 "isaac@newton.co.uk" (1683, 3, 1)

getAlbert :: User
getAlbert = createUser "Albert Einstein" 136 "ae@mc2.org" (1905, 12, 1)