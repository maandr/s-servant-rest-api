{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module API ( api, router ) where

import Controller.User
import Controller.Hello
import Servant

type API = UserAPI :<|> HelloAPI

router :: Server API
router = userController :<|> helloController

api :: Proxy API
api = Proxy