module App exposing (..)

import Html exposing (Html, div, text, input, beginnerProgram)

import Html.Attributes exposing (class, style, placeholder)

import Html.Events exposing (onInput)

-- MAIN

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL


type alias Model =
    {
    colorOne: String
    , colorTwo: String
    , colorThree: String
  }

type Result error value
    = Err error
    | Ok value


model : Model
model = {
  colorOne = toString 250
  , colorTwo = toString 250
  , colorThree = toString 210
 }

-- MESSAGES
type Msg
    = ChangeOne String
    | ChangeTwo String
    | ChangeThree String

update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeOne newColor ->
      {model | colorOne = newColor}
    ChangeTwo newColor ->
      {model | colorTwo = newColor}
    ChangeThree newColor ->
      {model | colorThree = newColor}


-- VIEW


view : Model -> Html Msg
view model =
    div [style [("margin", "0 auto")
                , ("display", "flex")
                , ("flex-direction", "column")
                , ("align-items", "center")]] [
        input [placeholder "enter a number between 0 and 255", style [("width", "250px")], onInput ChangeOne] []
        , input [placeholder "enter a number between 0 and 255", style [("width", "250px")], onInput ChangeTwo] []
        , input [placeholder "enter a number between 0 and 255", style [("width", "250px")], onInput ChangeThree] []
        , div [class "color-box"
        , style [("background-color", "rgb("++model.colorOne++","++model.colorTwo++","++model.colorThree++")")
        , ("height", "200px")
        , ("width", "200px")
        , ("display", "flex")
        , ("flex-direction", "column")
        , ("align-items", "center")
        , ("margin-top", "10%")]] [changeTextColor model]
        ]

--changeTextcolor

changeTextColor : Model -> Html msg
changeTextColor model =
  let
    textColor =
      if Result.withDefault 0 (String.toInt model.colorOne) < 120 && Result.withDefault 0 (String.toInt model.colorTwo) < 120 && Result.withDefault 0 (String.toInt model.colorThree) < 120 then
        "rgb(255,239,213)"
      else
        "rgb(47,79,79)"
  in
    div [style [("color", textColor)]] [text "I Change Color!"]
