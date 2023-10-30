{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.HTTP.Types
import Network.Wai.Handler.Warp (run)

app :: Application
app _ respond = respond $ responseLBS
    status200
    [("Content-Type", "text/plain")]
    "Hello, this is Servy"

main :: IO () 
main = do
    putStrLn "Starting Servy on http://localhost:3000/"
    run 3000 app