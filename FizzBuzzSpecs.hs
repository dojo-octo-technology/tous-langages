import Test.Hspec
import FizzBuzz

main = hspec $ do
  describe "FizzBuzz" $ do
    describe "fizzBuzz" $ do
      context "natural numbers" $ do
        it "it associates 1 with \"1\"" $ do
          fizzBuzz 1 `shouldBe` "1"
        it "it associates 2 with \"2\"" $ do
          fizzBuzz 2 `shouldBe` "2"
        it "it associates 4 with \"4\"" $ do
          fizzBuzz 4 `shouldBe` "4"
      context "fizzing" $ do
        it "it associates 3 with \"fizz\"" $ do
          fizzBuzz 3 `shouldBe` "fizz"
        it "it associates 6 with \"fizz\"" $ do
          fizzBuzz 6 `shouldBe` "fizz"
        it "it associates 9 with \"fizz\"" $ do
          fizzBuzz 9 `shouldBe` "fizz"
      context "buzzing" $ do
        it "it associates 5 with \"buzz\"" $ do
          fizzBuzz 5 `shouldBe` "buzz"
      context "fizzbuzzing" $ do
        it "it associates 15 with \"fizzbuzz\"" $ do
          fizzBuzz 15 `shouldBe` "fizzbuzz"
