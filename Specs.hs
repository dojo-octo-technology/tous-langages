import Test.Hspec

data Cell = Dead | Live
  deriving (Eq, Show)
type Board = [[Cell]]

emptyBoard :: Int -> Int -> Board
emptyBoard l c = replicate l (replicate c Dead)

nextStep :: Board -> Board
nextStep ls@(l:_)  = emptyBoard (length ls) (length l) 

main = hspec $ do
  describe "emptyBoard" $ do
    it "init table to 1x1" $ do
      emptyBoard 1 1 `shouldBe` [[Dead]]

    it "init table to 1x2" $ do
      emptyBoard 1 2 `shouldBe` [[Dead, Dead]]

    it "init table to 2x2" $ do
      emptyBoard 2 2 `shouldBe` [[Dead, Dead], [Dead, Dead]]

  describe "nextStep" $ do
    it "with one dead cell" $ do
      nextStep (emptyBoard 1 1) `shouldBe` [[Dead]]

    it "with 4 dead cells" $ do
      nextStep (emptyBoard 2 2) `shouldBe` emptyBoard 2 2

    it "with 1 live cell" $ do
      nextStep [[Live]] `shouldBe` [[Dead]]

    it "with 2 live cell" $ do
      nextStep [[Live, Live]] `shouldBe` [[Dead, Dead]]
      nextStep [[Live], [Live]] `shouldBe` [[Dead], [Dead]]



