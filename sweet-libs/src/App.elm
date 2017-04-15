module App exposing (..)

import Html exposing (Html, text, div, h1, button)
--import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Time exposing (Time, second)

---- MODEL ----


type alias Model =
    { value: Int
    , running : Bool
    , time : Int
    }




init : (Model, Cmd Msg)
init = Model 0 True


---- UPDATE ----
type Msg = Increase Time | Stop Time | Reset Time

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increase ->
            if model.running
            then {model | value = model.value+1}
            else model
        Stop ->
            {model | running = not model.running}
        Reset ->
            { model | value = 0}


---- VIEW ----


view : Model -> Html Msg
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
  Time.every second Increase




