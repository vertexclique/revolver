module Revolver.Logger where

import Data.Time (getCurrentTime)
import System.Log.FastLogger ( LoggerSet
                             , ToLogStr (..)
                             , newStdoutLoggerSet
                             , defaultBufSize
                             , pushLogStrLn
                             )

createLogger :: IO LoggerSet
createLogger = newStdoutLoggerSet defaultBufSize

logMsg logger str = do
    now <- getCurrentTime
    let logStr = toLogStr (show now) `mappend` toLogStr (" : " :: String)
                                     `mappend` toLogStr str
    pushLogStrLn logger logStr
