module Main where

import Control.Monad (forM_)
import Control.Exception (SomeException, handle)
import System.Environment (getArgs)
import Language.Haskell.Parser (ParseResult(..), parseModule)
import Text.Pretty.Simple (pPrint)

parseAndPrint :: FilePath -> IO ()
parseAndPrint file = do
    let handler :: SomeException -> IO ()
        handler err = putStrLn $ "Failed to process " <> file <> ": " <> show err
    handle handler $ do
        contents <- readFile file
        case parseModule contents of
            ParseFailed loc err -> putStrLn $ "Failed to parse " <> file <> ": " <> show loc <> "    " <> err
            ParseOk m -> pPrint m

main :: IO ()
main = do
    args <- getArgs
    forM_ args parseAndPrint