{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App.Controller.User (
          UserAPI
        , userController
    ) where

import Control.Monad.Trans.Either
import App.Model.User
import Servant

type UserAPI = 
    -- GET /users
    Get '[JSON] [User]
    -- GET /users/albert
    :<|> "albert" :> Get '[JSON] User
    -- GET /users/isaac
    :<|> "isaac" :> Get '[JSON] User

userController :: Server UserAPI
userController = getUsers 
    :<|> getAlbert 
    :<|> getIsaac

--getUsers :: [User]
getUsers :: EitherT ServantErr IO [User]
getUsers = [ isaac, albert ]

--getIsaac :: User
getIsaac :: EitherT ServantErr IO User
getIsaac = isaac

--getAlbert :: User
getAlbert :: EitherT ServantErr IO User
getAlbert = albert

isaac :: User
isaac = createUser "Isaac Newton" 372 "isaac@newton.co.uk" (1683, 3, 1)

albert :: User
albert = createUser "Albert Einstein" 136 "ae@mc2.org" (1905, 12, 1)