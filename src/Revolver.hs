module Main where

import Revolver.ConfigParser
import Revolver.Consumer
import Revolver.Logger
import Development.Placeholders

helper = "REVOLVER – Kafka to Graphite metrics consumer service\n\
\  USAGE:\n\
\\tc: config file\n"

main :: IO()
main = do
    logger <- createLogger
    config <- parseConfig logger
    putStrLn helper
