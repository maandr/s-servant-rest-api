module Server ( app ) where

import API
import Controller.User
import Controller.Hello
import Servant

app :: Application
app = serve api router