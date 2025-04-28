module ReverseString (reverseString) where

reverseString :: String -> String
reverseString str = helper [] str
  where
    helper acc [] = acc
    helper acc (x:xs) = helper (x:acc) xs
