module FizzBuzz where

fizzBuzz :: Int -> String
fizzBuzz n = specialCase fizz buzz n
  where fizz = fizzBuzz' 3 "fi" n
        buzz = fizzBuzz' 5 "bu" n

specialCase :: Maybe String -> Maybe String -> Int -> String
specialCase m m' n = normalCase (addSpecialCase m m') n

addSpecialCase :: Maybe String -> Maybe String -> Maybe String
addSpecialCase (Just s) (Just s') = Just (s ++ s')
addSpecialCase (Just s) Nothing   = Just s
addSpecialCase Nothing  Nothing   = Nothing
addSpecialCase Nothing  m         = addSpecialCase m Nothing

normalCase :: Maybe String -> Int -> String
normalCase (Just s) _ = s
normalCase Nothing  n = show n

fizzBuzz' :: Int -> String -> Int -> Maybe String
fizzBuzz' m s n | n `mod` m == 0 = Just (s ++ "zz")
                | otherwise      = Nothing
