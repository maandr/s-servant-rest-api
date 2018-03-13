{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App.Controller.Hello (
          HelloAPI
        , helloAPI
        , helloController
    ) where

import App.Model.HelloMessage
import Servant

type HelloAPI = 
    -- GET /hello
    "hello" :>  Get '[JSON] HelloMessage

helloController :: Server HelloAPI
helloController = return getHello

helloAPI :: Proxy HelloAPI
helloAPI = Proxy

getHello :: HelloMessage
getHello = HelloMessage "no-name"