import Control.Applicative
import Control.Monad
import System.Environment
import System.Exit
import System.Posix.Signals

main = do
    args <- getArgs
    progName <- getProgName
    when (null args) $ do
        putStrLn $ "Usage: " ++ progName ++ " <pid file>"
        exitFailure

    pid <- read <$> readFile (head args)
    signalProcess userDefinedSignal1 pid
