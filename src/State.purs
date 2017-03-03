module State where

import Data.Maybe (Maybe(..))

type State =
  { notes :: Maybe String
  , source :: Maybe String}

init :: State
init =
  { notes: Just "<h1>I'm a heading</h1><p>What is this?</p>"
  , source: Nothing
  }
