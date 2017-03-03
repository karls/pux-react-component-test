module Editor where

import Pux.Html (Html, Attribute)
import Data.Function.Uncurried (Fn2)

foreign import fromReact :: forall a.
                            Array (Attribute a) ->
                            Array (Html a) ->
                            Html a

foreign import changeHandler :: forall args a.
                                Fn2 String (Array args -> a) (Attribute a)
