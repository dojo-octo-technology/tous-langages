import Test.Hspec

type Card = Int
type Hand = Int

compareHands :: String -> String -> Ordering
compareHands s s' = compare (handValue s) (handValue s')

handValue :: String -> Hand
handValue = sum . map cardValue . words

cardValue :: String -> Card
cardValue (c:_) | c `elem` "TJQK" = 10
                | otherwise       = read [c]

main = hspec $ do
  describe "BlackJack Hand comparator" $ do
    describe "compareHands" $ do
      it "recognizes when two hands are the same" $ do
        compareHands "2D 3S" "2D 3S" `shouldBe` EQ
      it "expect the highest card to win" $ do
        compareHands "2D" "3D" `shouldBe` LT
        compareHands "3D" "2D" `shouldBe` GT
        compareHands "4D" "2D" `shouldBe` GT
        compareHands "9S" "TD" `shouldBe` LT
        compareHands "JS" "TD" `shouldBe` EQ
        compareHands "3D 5S" "3S 2D" `shouldBe` GT
        compareHands "5S 3D" "3S 6H" `shouldBe` LT
        compareHands "5S 4D" "3S 7H" `shouldBe` LT
        compareHands "5S 4D 5D" "3S 7H" `shouldBe` GT

    describe "cardValue" $ do
      it "get 10 for a Face or Ten" $ do
        cardValue "T" `shouldBe` 10
        cardValue "J" `shouldBe` 10
        cardValue "Q" `shouldBe` 10
        cardValue "K" `shouldBe` 10
      it "get the numeric value of a peasant" $ do
        cardValue "9" `shouldBe` 9
        cardValue "8" `shouldBe` 8
        cardValue "7" `shouldBe` 7
        cardValue "6" `shouldBe` 6
        cardValue "5" `shouldBe` 5
        cardValue "4" `shouldBe` 4
        cardValue "3" `shouldBe` 3
        cardValue "2" `shouldBe` 2
