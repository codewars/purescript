{ name = "cw-purescript"
, dependencies =
  [ "aff"
  , "arrays"
  , "bigints"
  , "console"
  , "datetime"
  , "debug"
  , "effect"
  , "either"
  , "enums"
  , "foldable-traversable"
  , "gen"
  , "integers"
  , "lists"
  , "maybe"
  , "nonempty"
  , "ordered-collections"
  , "partial"
  , "prelude"
  , "profunctor-lenses"
  , "quickcheck"
  , "rationals"
  , "record"
  , "spec"
  , "spec-discovery"
  , "spec-quickcheck"
  , "spec-reporter-codewars"
  , "strings"
  , "tuples"
  , "unsafe-coerce"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
