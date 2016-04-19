import Test.Hspec
import Data.List (sort, group)

data Card = Two
          | Three
          | Four
          | Five
          | Six
          | Seven
          | Eight
          | Nine
          | Ten
          | Jack
          | Queen
          | King
          | Ace
  deriving (Ord, Eq)

data Hand = HighCard [Card] | Pair
  deriving (Ord, Eq)

hand :: String -> Hand
hand s | length (group cs) == 4 = Pair
       | otherwise              = HighCard cs
  where cs = (reverse . sort . map card . words) s

card :: String -> Card
card (c:_) | c == '2' = Two
           | c == '3' = Three
           | c == '4' = Four
           | c == '5' = Five
           | c == '6' = Six
           | c == '7' = Seven
           | c == '8' = Eight
           | c == '9' = Nine
           | c == 'T' = Ten
           | c == 'J' = Jack
           | c == 'Q' = Queen
           | c == 'K' = King
           | c == 'A' = Ace

compareCard :: Card -> Card -> Ordering
compareCard c c' = compare c c'

compareHand :: Hand -> Hand -> Ordering
compareHand h h' = compare h h'

main = hspec $ do
  describe "PokerHand" $ do
    describe "hand" $ do
      describe "highcards" $ do
        it "makes the highest card win" $ do
          compareHand (hand "2D 3D 4S 5H 7C") (hand "2D 3D 4S 5H 8C") `shouldBe` LT
          compareHand (hand "2D 3D 4S 5H 8C") (hand "2D 3D 4S 5H 7C") `shouldBe` GT
          compareHand (hand "2D 3D 4S 5H 8C") (hand "7C 2D 3D 4S 5H") `shouldBe` GT
          compareHand (hand "2D 8C 3D 4S 5H") (hand "7C 2D 3D 4S 5H") `shouldBe` GT
          compareHand (hand "2D 3D 4S 5H 8C") (hand "2D 3D 4S 6H 7C") `shouldBe` GT
        it "doesn't care about the suit when it's all about the height" $ do
          compareHand (hand "2S 3D 4S 5H 8C") (hand "2D 3D 4S 5H 8C") `shouldBe` EQ
      describe "pair" $ do
        it "makes the highest highcard lose against the smallest pair" $ do
          compareHand (hand "AS KS QS JS 9C") (hand "2S 2C 3D 4H 5H") `shouldBe` LT
    describe "card" $ do
      it "recognize two cards have the same value" $ do
        compareCard (card "2D") (card "2S") `shouldBe` EQ
      it "let the highest card win" $ do
        compareCard (card "3D") (card "2S") `shouldBe` GT
      it "lets the jack win against the ten" $ do
        compareCard (card "TD") (card "JS") `shouldBe` LT
