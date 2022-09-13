let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20220901/packages.dhall
        sha256:f1531b29c21ac437ffe5666c1b6cc76f0a9c29d3c9d107ff047aa2567744994f

let additions =
      { spec-reporter-codewars =
        { repo = "https://github.com/andys8/purescript-spec-reporter-codewars"
        , version = "d1f0c324630d40b4493c105188a9d7cd048bffb1"
        , dependencies =
          [ "aff"
          , "bigints"
          , "console"
          , "datetime"
          , "debug"
          , "effect"
          , "exceptions"
          , "foldable-traversable"
          , "maybe"
          , "prelude"
          , "profunctor-lenses"
          , "quickcheck"
          , "rationals"
          , "spec"
          , "spec-discovery"
          , "spec-quickcheck"
          , "strings"
          , "transformers"
          ]
        }
      }

in  upstream // additions
