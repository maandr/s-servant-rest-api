{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App.API (API, proxy, server) where

import App.Controller.User
import App.Controller.Hello
import Servant

type API = 
    "users" :> UserAPI :<|> 
    "hello" :> HelloAPI

proxy :: Proxy API
proxy = Proxy

server :: Server API
server = userController 
    :<|> helloController