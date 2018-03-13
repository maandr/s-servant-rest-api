module Server ( app ) where

import App.API
import App.Controller.User
import App.Controller.Hello
import Servant

app :: Application
app = serve helloAPI helloController