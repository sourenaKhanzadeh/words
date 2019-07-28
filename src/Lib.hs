module Lib
    ( grid,
    languages
    ) where

import Data.List (isInfixOf, transpose)
import Data.Maybe (catMaybes)

type Grid = [String]

outputGrid :: Grid -> IO()
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: Grid -> String
formatGrid = unlines

getLines :: Grid -> [String]
getLines grid =
  let horizontal = grid
      vertical = transpose grid
      diagnol1 = transpose (skew horizontal)
      diagnol2 = transpose (skew $ map reverse horizontal)
      lines = horizontal ++ vertical ++ diagnol1 ++ diagnol2
  in lines ++ (map reverse lines)

findWord :: Grid -> String -> Maybe String
findWord grid word =
  let lines = getLines grid
      found = or $ map (findWordInLine word) lines
  in if found then Just word else Nothing


findWords :: Grid -> [String] -> [String]
findWords grid words =
  let foundWords = map (findWord grid) words
  in catMaybes foundWords

numFoundWords :: Grid -> [String] -> Int
numFoundWords grid  words = length $ findWords grid words

foundAll :: Grid ->  [String] -> Bool
foundAll grid words =
  let num = numFoundWords grid words
      tot = length words
  in num == tot

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf

skew :: Grid -> Grid
skew [] = []
skew (l:ls) = l : skew (map indent ls)
  where indent line = '-' : line

grid = [
  "--C--------R---",
  "--SI--------U--",
  "--HASKELL----B-",
  "--A--A-----S--Y",
  "--R---B---C----",
  "--PHP----H-----",
  "----S-LREP-----",
  "----I--M-Y--L--",
  "----L-E--T-O---",
  "---------HB----",
  "---------O-----",
  "--------CN-----"
  ]

languages = [
  "BASIC",
  "COBOL",
  "CSHARP",
  "CSHARP",
  "HASKELL",
  "LISP",
  "PERL",
  "PHP",
  "PYTHON",
  "RUBY",
  "SCHEME"]
