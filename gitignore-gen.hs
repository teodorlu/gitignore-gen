import System.Environment (getArgs)
import Network.Curl.Download (openURI)
import qualified Data.ByteString.Char8 as Char8

urlEncode :: Char -> Char
urlEncode c = c

gitignoreName :: String -> String
gitignoreName s = "https://raw.githubusercontent.com/github/gitignore/master/" ++ s ++ ".gitignore"

rightOnly :: [Either a b] -> [b]
rightOnly [] = []
rightOnly (Left  _:t) =   rightOnly t
rightOnly (Right v:t) = v:rightOnly t

sampleArgs = ["Haskell", "Scala"]

main = do
	args <- getArgs
	dlResults <- sequence $ map (openURI . gitignoreName . map urlEncode) args
	mapM_ Char8.putStrLn $ rightOnly dlResults
