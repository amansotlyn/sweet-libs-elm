module App exposing (..)

import Html exposing (Html, text, div, h1, button)
--import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Time exposing (Time, second)

---- MODEL ----
type alias Time=
    Float

type alias Model =
    { value: Time
    , running : Bool
    }

model : Model
model = {
    value = 0
  , running = False
  }


---- UPDATE ----
type Msg = Increase Time | Stop Time | Reset Time

update : Msg -> Model
update msg model =
  case msg of
     Increase ->
      if not model.running then
       {model | running = True}
      else model
     Stop ->
      if model.running then
       {model | running = False}
      else model
     Reset ->
       { model | value = 0, running = False}


---- VIEW ----


view : Model -> Sub Msg
view model =
    div []
    [ h1 []
        [model.value]
    , button [ onClick Increase]
        [ text "Start" ]
    , button [onClick Stop]
        [ text "Stop" ]
    , button [ onClick Reset]
        [ text "Reset" ]
    ]




---- BEGINNER PROGRAM ----


--main : Program String Model Action
main =
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
 if model.running then
 Time.every second model.value+1




