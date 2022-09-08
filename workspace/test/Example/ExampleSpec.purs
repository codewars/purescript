module Example.ExampleSpec where

import Prelude
import Effect.Aff (delay)
import Data.Time.Duration (Milliseconds(..))

import Test.QuickCheck ((===), (/==))
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.QuickCheck (quickCheck)

-- example from README plus basic sanity checks
spec :: Spec Unit
spec =
  describe "purescript-spec" do
    describe "Attributes" do
      it "awesome" do
        let isAwesome = true
        isAwesome `shouldEqual` true

    describe "Features" do
      it "runs in NodeJS" $ pure unit
      it "runs in the browser" $ pure unit
      it "supports async specs" do
        res <- delay (Milliseconds 100.0) *> pure "Alligator"
        res `shouldEqual` "Alligator"

    describe "QuickCheck" do
      it "works" $
        quickCheck \n -> (n * 2 / 2) === n
      it "works again" $
        quickCheck \n -> ((n + 1) * 2) /== n

    describe "Failure example" do
      it "should fail" do
        1 `shouldEqual` 2
