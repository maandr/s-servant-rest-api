{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controller.User (
          UserAPI
        , userController
    ) where

import Data.Dictionary
import Model.User
import Servant
import Servant.Server

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
postUsers = return

getUsers :: Handler [User]
getUsers = return [ isaac, albert ]

getUser :: Int -> Handler User
getUser userId = case dictFind usersDict userId of
        Just user -> return user
        Nothing -> throwError err404

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