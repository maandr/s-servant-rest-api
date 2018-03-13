{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controller.User (
          UserAPI
        , userController
    ) where

import Model.User
import Servant

type UserAPI = 
    -- GET /users
    "users" :> Get '[JSON] [User]
    -- GET /users/albert
    :<|> "users" :> "albert" :> Get '[JSON] User
    -- GET /users/isaac
    :<|> "users" :> "isaac" :> Get '[JSON] User

userController :: Server UserAPI
userController = return getUsers 
    :<|> return getAlbert 
    :<|> return getIsaac

getUsers :: [User]
getUsers = [ isaac, albert ]

getIsaac :: User
getIsaac = isaac

getAlbert :: User
getAlbert = albert

isaac :: User
isaac = createUser "Isaac Newton" 372 "isaac@newton.co.uk" (1683, 3, 1)

albert :: User
albert = createUser "Albert Einstein" 136 "ae@mc2.org" (1905, 12, 1)