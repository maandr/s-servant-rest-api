module Server ( app ) where

import App.API
import Servant

app :: Application
app = serve proxy server