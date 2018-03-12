{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App.Controller.Hello (
          HelloAPI
        , helloController
    ) where

import Control.Monad.Trans.Either
import App.Model.HelloMessage
import Servant

type HelloAPI = 
    -- GET /hello
    Get '[JSON] HelloMessage

helloController :: Server HelloAPI
helloController = getHello


--EitherT ServantErr IO [User]
getHello :: EitherT ServantErr IO HelloMessage
getHello = HelloMessage "no-name"