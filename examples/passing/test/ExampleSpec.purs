module ExampleSpec where

import Prelude
import Example (add')

import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

spec :: Spec Unit
spec =
  describe "Example" do
    describe "add" do
      it "returns sum" do
        let sum = add' 1 1
        sum `shouldEqual` 2
