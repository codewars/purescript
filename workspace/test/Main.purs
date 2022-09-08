module Test.Main where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)

import Test.Spec.Discovery (discover)
import Test.Spec.Runner (defaultConfig, run')

import Test.Spec.Reporter.Codewars (codewarsReporter)

main :: Effect Unit
main = discover ".+Spec" >>= run' config [codewarsReporter]
  where
    config = defaultConfig { timeout = Just 12000 }
