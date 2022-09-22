module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Time.Duration (Milliseconds(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec.Discovery (discover)
import Test.Spec.Reporter.Codewars (codewarsReporter)
import Test.Spec.Runner (defaultConfig, runSpec')

main :: Effect Unit
main = launchAff_ $ discover ".+Spec" >>= runSpec' config [ codewarsReporter ]
  where
  config = defaultConfig { timeout = Just (Milliseconds 12000.0) }
