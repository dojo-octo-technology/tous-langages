import Test.Hspec
import Data.List (nub, (\\))

type Book      = Int
type Price     = Double
type Discount = Double

reduction :: Int -> Discount
reduction 1 = 1
reduction 2 = 0.95
reduction 3 = 0.90
reduction 4 = 0.80
reduction 5 = 0.75

priceOf :: [Book] -> Price
priceOf bs | n == n'   = fromIntegral n * u * reduction n
           | otherwise = priceOf (bs \\ bs')  + priceOf bs'
  where bs' = nub bs
        n  = length bs
        n' = length bs'
        u = 8.0

main = hspec $ do
  describe "KataPotter" $ do
    describe "priceOf" $ do
      describe "duplicates only" $ do
        it "is 8 for one book" $ do
          priceOf [1] `shouldBe` 8.0
        it "is 16 for twice the same book" $ do
          priceOf [1, 1] `shouldBe` 16.0
          priceOf [2, 2] `shouldBe` 16.0
        it "is 24 for thrice the same book" $ do
          priceOf [3, 3, 3] `shouldBe` 24.0
      describe "one serie only" $ do
        it "is 15.2 for two different books" $ do
          priceOf [1, 2] `shouldBe` 15.2
          priceOf [1, 3] `shouldBe` 15.2
        it "is 21.6 for three different books" $ do
          priceOf [1, 2, 3] `shouldBe` 21.6
          priceOf [1, 2, 4] `shouldBe` 21.6
        it "is 25.6 for four different books" $ do
          priceOf [1, 2, 3, 4] `shouldBe` 25.6
        it "is 30 for five different books" $ do
          priceOf [1, 2, 3, 4, 5] `shouldBe` 30.0
      describe "mix of series" $ do
        it "is 23.2 for three books, two duplicates" $ do
          priceOf [1, 2, 2] `shouldBe` 23.2
          priceOf [1, 3, 3] `shouldBe` 23.2
