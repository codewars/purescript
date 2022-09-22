{ name = "cw-purescript"
, dependencies =
  [ "aff"
  , "bigints"
  , "console"
  , "datetime"
  , "debug"
  , "effect"
  , "either"
  , "enums"
  , "maybe"
  , "ordered-collections"
  , "prelude"
  , "profunctor-lenses"
  , "quickcheck"
  , "rationals"
  , "record"
  , "spec"
  , "spec-discovery"
  , "spec-quickcheck"
  , "spec-reporter-codewars"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
