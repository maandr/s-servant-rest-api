{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controller.Hello (
          HelloAPI
        , helloController
    ) where

import Model.HelloMessage
import Servant

type HelloAPI = 
    -- GET /hello?name={name}
    "hello" :>  QueryParam "name" String :> Get '[JSON] HelloMessage

helloController :: Server HelloAPI
helloController = getHello

getHello :: Maybe String -> Handler HelloMessage
getHello mName = return . HelloMessage $ case mName of
    Nothing -> "Hello, anonymous"
    Just name -> "Hello, " ++ name