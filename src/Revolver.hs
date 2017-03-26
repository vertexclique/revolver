module Main where

import Revolver.ConfigParser
import Revolver.Consumer
import Development.Placeholders

helper = "REVOLVER – Kafka to Graphite metrics consumer service\n\
\  USAGE:\n\
\\tc: config file\n"

main :: IO()
main = do
    parseArgsToConfig
    putStrLn helper
