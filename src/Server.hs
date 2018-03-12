{-# LANGUAGE TypeOperators #-}

module Server ( app ) where

import App.Controller.User
import App.Controller.Hello
import Servant

server :: Server UserAPI
server = return getUsers
    :<|> return getAlbert
    :<|> return getIsaac

apiProxy :: Proxy UserAPI
apiProxy = Proxy

app :: Application
app = serve apiProxy server