{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App.API ( api, router ) where

import App.Controller.User
import App.Controller.Hello
import Servant

type API = UserAPI :<|> HelloAPI

router :: Server API
router = userController :<|> helloController

api :: Proxy API
api = Proxy