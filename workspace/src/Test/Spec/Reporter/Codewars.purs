module Test.Spec.Reporter.Codewars (codewarsReporter) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String
  ( Pattern(Pattern)
  , Replacement(Replacement)
  , replaceAll
  )
import Effect.Console (log)

import Test.Spec.Reporter.Base (defaultReporter)
import Test.Spec.Runner (Reporter)
import Test.Spec.Runner.Event as Event


codewarsReporter :: Reporter
codewarsReporter = defaultReporter {} update
  where
    update s = case _ of
      Event.Start _ -> pure s
      Event.End _ -> pure s
      Event.Suite name -> s <$ log ("\n<DESCRIBE::>" <> name)
      Event.SuiteEnd -> s <$ log "\n<COMPLETEDIN::>"

      Event.Pending name -> s <$ do
        log $ "\n<IT::>" <> name
        log $ "\n<LOG::>Pending Test"
        log $ "\n<COMPLETEDIN::>"

      Event.Pass name _ ms -> s <$ do
        log $ "\n<IT::>" <> name
        log $ "\n<PASSED::>Test Passed"
        log $ "\n<COMPLETEDIN::>" <> (show ms)

      Event.Fail name msg mStack -> s <$ do
        log $ "\n<IT::>" <> name
        log $ "\n<FAILED::>Test Failed<:LF:>" <> (escapeLF msg)
        case mStack of
          Nothing -> pure unit
          Just k  -> log $ "\n<LOG::-Stack Trace>" <> (escapeLF k)
        log $ "\n<COMPLETEDIN::>"

      _ -> pure s


escapeLF :: String -> String
escapeLF = replaceAll (Pattern "\n") (Replacement "<:LF:>")
