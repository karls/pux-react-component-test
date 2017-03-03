module State where

import Data.Maybe (Maybe(..))

type State =
  { notes :: Maybe String }

init :: State
init =
  { notes: Just "<h2>I'm a React component inside Pux</h2><p>Type some stuff <b>here</b>.</p>"
  }
