module Lib
    ( grid,
    languages
    ) where
outputGrid :: [String] -> IO()
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: [String] -> String
formatGrid = unlines

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
  "----------O----",
  "---------CN----"
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
