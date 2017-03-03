module Main where

import Prelude (bind, pure, (<$>))
import Control.Monad.Eff (Eff)
import Pux (App, CoreEffects, start, renderToDOM, fromSimple)
import Pux.Html (Html, Attribute, h3, div, text)
import Pux.Html.Attributes (attr)
-- import Pux.Html.Events (handler)
import Pux.Devtool as Pux.Devtool
import Data.Function.Uncurried (runFn2)
import Unsafe.Coerce (unsafeCoerce)
import Data.Array ((!!))
import Data.Maybe (Maybe, fromMaybe)
import State
import Editor as Editor


data Action eventArg
  = SetNotes (Array eventArg)

type AppEffects = ()


update :: forall e. Action e -> State -> State
update (SetNotes eventArgs) state = state { notes = notes' }
  where
    notes' :: Maybe String
    notes' = unsafeCoerce <$> (eventArgs !! 0)


evt :: forall event action. String -> (Array event -> action) -> Attribute action
evt eventName = runFn2 Editor.changeHandler eventName


view :: forall e. State -> Html (Action e)
view state =
  div []
    [ h3 [] [ text "A React component (react-quill)" ]
    , Editor.fromReact [ evt "onChange" SetNotes
                       , attr "defaultValue" (fromMaybe "" state.notes) ] []
    , h3 [] [ text "Contents of the editor" ]
    , div [] [ text (fromMaybe "" state.notes) ]
    ]


main :: forall e. State -> Eff (CoreEffects ()) (App State (Action e))
main state = do
  app <- start
    { initialState: state
    , update: fromSimple update
    , view: view
    , inputs: []
    }

  renderToDOM "#app" app.html

  pure app


debug :: forall e. State -> Eff (CoreEffects ()) (App State (Pux.Devtool.Action (Action e)))
debug state = do
  app <- Pux.Devtool.start
    { initialState: state
    , update: fromSimple update
    , view: view
    , inputs: []
    }

  renderToDOM "#app" app.html

  pure app
