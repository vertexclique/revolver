{-# LANGUAGE DeriveGeneric #-}

module Revolver.ConfigParser where

import System.Console.ParseArgs
import GHC.Generics
import Data.Yaml
import Data.HashMap.Strict as HashMap

import Revolver.Logger

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
    kafka :: String,
    statsd :: String,
    mappings :: HashMap String String
} deriving (Show, Generic)

instance FromJSON Config

parseArguments = parseArgsIO
        (ArgsParseControl (ArgsTrailing "junk") ArgsSoftDash)
        argd

parseConfig logger = do
    args <- parseArguments
    case getArg args OptionFlagString of
        Just s -> do
            logMsg logger ("Loading configuration from \"" ++ s ++ "\"")
            readConfig s
        Nothing -> return ()

readConfig :: String -> IO ()
readConfig c = do
    file <- decodeFile c :: IO (Maybe Config)
    putStrLn (maybe "Failed to load Config" show file)
