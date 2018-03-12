{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App.Controller.User (
        UserAPI
        , getUsers
        , getIsaac
        , getAlbert
    ) where

import App.Models.User
import Servant

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