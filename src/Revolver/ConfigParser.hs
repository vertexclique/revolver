module Revolver.ConfigParser where

import System.Console.ParseArgs
import Data.Yaml

data Options =
    OptionFlag |
    OptionFlagString
    deriving (Ord, Eq, Show)

argd :: [ Arg Options ]
argd = [ Arg { argIndex = OptionFlagString,
               argName = Just "config",
               argAbbr = Just 'c',
               argData = argDataOptional "config.yml" ArgtypeString,
               argDesc = "Config file for Revolver" } ]

data Config = Config {
    statsd :: String
}

parseArguments = parseArgsIO
        (ArgsParseControl (ArgsTrailing "junk") ArgsSoftDash)
        argd

parseArgsToConfig = do
    args <- parseArguments
    case getArg args OptionFlagString of
        Just s -> putStrLn ("saw string " ++ s)
        Nothing -> return ()

readConfig :: String -> Config
readConfig c = Config "asd"
