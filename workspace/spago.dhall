{ name = "cw-purescript"
, dependencies =
  [ "aff"
  , "bigints"
  , "console"
  , "datetime"
  , "debug"
  , "effect"
  , "maybe"
  , "prelude"
  , "profunctor-lenses"
  , "quickcheck"
  , "rationals"
  , "spec"
  , "spec-discovery"
  , "spec-quickcheck"
  , "spec-reporter-codewars"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
