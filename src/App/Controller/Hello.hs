{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App.Controller.Hello (
          HelloAPI
        , getHello
    ) where

import App.Model.HelloMessage
import Servant

type HelloAPI = 
    -- GET /hello
    "hello" :> Get '[JSON] HelloMessage

getHello :: Maybe String -> HelloMessage
getHallo Nothing = HelloMessage "no-name"
getHello (Just name) = HelloMessage name