{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.HTTP.Types
import Network.Wai.Handler.Warp (run)

app :: Application
app req respond = case pathInfo req of
    ["about"] -> respond $ responseLBS
        status200 
        [("Content-Type", "text/plain")]
        "This is Servy. A webserver written in Haskell"
    _ -> respond $ responseLBS
        status404
        [("Content-Type", "text/plain")]
        "Page has not been found! Perhaps it does not exist"



main :: IO () 
main = do
    putStrLn "Starting Servy on http://localhost:3000/"
    run 3000 app