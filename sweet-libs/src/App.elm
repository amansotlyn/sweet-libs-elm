module App exposing (..)

import Html exposing (Html, text, div, h1, button, program)
--import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Time exposing (Time, second)
--import TimeDisplay exposing (secsToStr)

type alias Time
  =Float

main =
  Html.program
   { init = init
    , view = view
    , model = model
    , update = update
    , subscriptions = subscriptions
    }

init : (Model, Cmd Msg)
init = (
  { value = 0
  , running = False
  }, Cmd.none)


type alias Model =
  { value: Int
  , running: Bool
}

model : Model
model =
  {
    value = 0
    , running = False
  }

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Tick


type Msg
  = Start Bool
  | Stop Bool
  | Reset Bool
  | Tick Time

update : Msg -> Model -> Model
update msg model =
  case msg of
    Start changeState ->
      if not model.running then
      {model | running = True}
      else model
    Stop changeState->
      if model.running then
      {model | running = False}
      else model
    Reset changeState->
      if model.running then
      {model | value = 0, running = False}
      else model
    Tick newTime ->
      if model.running then
      {model | value = model.value + 1}
      else model
view : Model -> Html (Bool -> Msg)
view model =
   div []
    [ h1 []
        [ text (toString model.value) ]
    , button [ onClick Start]
        [ text "Start" ]
    , button [onClick Stop]
        [ text "Stop" ]
    , button [ onClick Reset]
        [ text "Reset" ]
    ]




