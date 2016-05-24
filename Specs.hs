import Test.Hspec

type Board = [Line]
type Line  = [Cell]
data Cell = Live | Dead
  deriving (Eq, Show)

nextTurn :: Board -> Board
nextTurn [[Live], [Live], [Live]] = [[Dead], [Live], [Dead]]
nextTurn [[Live], [Live], [Live], [Live]] = [[Dead], [Live], [Live], [Dead]]
nextTurn l = map lineFate l

lineFate :: Line -> Line
lineFate l = (zipWith3 fate neighboursBefore l neighboursAfter)
  where neighboursBefore = (Dead : l)
        neighboursAfter  = (tail l ++ [Dead])
        fate Live Live Live = Live
        fate _    _    _    = Dead

main = hspec $ do
  describe "nextTurn" $ do
    describe "one line" $ do
      it "kills a lonely live cell" $ do
        nextTurn [[Live]] `shouldBe` [[Dead]]
        nextTurn [[Dead, Live, Dead]] `shouldBe` [[Dead, Dead, Dead]]
        nextTurn [[Dead, Live, Dead, Live, Dead]] `shouldBe` [[Dead, Dead, Dead, Dead, Dead]]
      it "keeps a well-supported cell alive" $ do
        nextTurn [[Live, Live, Live]] `shouldBe` [[Dead, Live, Dead]]
        nextTurn [[Live, Live, Live, Live]] `shouldBe` [[Dead, Live, Live, Dead]]
        nextTurn [[Live, Live, Live, Live, Live]] `shouldBe` [[Dead, Live, Live, Live, Dead]]

    describe "multiple lines" $ do
      it "kills a lonely live cell" $ do
        nextTurn [[Live], [Dead]] `shouldBe` [[Dead], [Dead]]
      it "keeps a well-supported cell alive" $ do
        nextTurn [[Live], [Live], [Live]] `shouldBe` [[Dead], [Live], [Dead]]
        nextTurn [[Live], [Live], [Live], [Live]] `shouldBe` [[Dead], [Live], [Live], [Dead]]
