{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controller.User (
          UserAPI
        , userController
    ) where

import Data.Dictionary
import Model.User
import Servant

type UserAPI =
    -- POST /users
    "users" :> ReqBody '[JSON] User :> Post '[JSON] User
    -- GET /users
    :<|> "users" :> Get '[JSON] [User]
    -- GET /users/:id
    :<|> "users" :> Capture "userId" Int :> Get '[JSON] User

userController :: Server UserAPI
userController = postUsers
    :<|> getUsers 
    :<|> getUser

postUsers :: User -> Handler User
postUsers user = return user

getUsers :: Handler [User]
getUsers = return [ isaac, albert ]

getUser :: Int -> Handler User
getUser userId = return user
    where Just user = dictFind usersDict userId

usersDict :: Dictionary Int User
usersDict = Dictionary  [
        (1, isaac),
        (2, albert),
        (3, leibniz)
    ]

isaac :: User
isaac = createUser "Isaac Newton" 372 "isaac@newton.co.uk" (1683, 3, 1)

albert :: User
albert = createUser "Albert Einstein" 136 "ae@mc2.org" (1905, 12, 1)

leibniz :: User
leibniz = createUser "Gottfried Wilhelm Leibniz" 371 "mc_wilhelm@nur-echt-mit-42-zähnen.com" (1646, 7, 1)