module Main exposing (..)

import Html exposing (Html, div, text, input, beginnerProgram)

import Html.Attributes exposing (class, style, placeholder)

import Html.Events exposing (onInput)

--resources:
{-
 http://package.elm-lang.org/packages/elm-lang/core/5.0.0/String#toInt
 https://guide.elm-lang.org/
 https://www.elm-tutorial.org/en/
 https://github.com/izdi/elm-cheat-sheet#primitives
 https://blog.codecentric.de/en/2015/11/elm-friday-part-01-what-is-elm/
-}

-- MAIN

--elm's equivalent of document.ready
main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL

--define parameters of the model, something akin to react state

type alias Model =
    {
    colorOne: String
    , colorTwo: String
    , colorThree: String
  }

--a function later on needs a result to be parsed, this parses it.
type Result error value
    = Err error
    | Ok value


--set initial model (what the page looks like on-load), basically initial state
model : Model
model = {
  colorOne = toString 250
  , colorTwo = toString 250
  , colorThree = toString 210
 }

-- MESSAGES

--define "class methods," ways that state can be mutated,
--and the datatypes that these methods take
type Msg
    = ChangeOne String
    | ChangeTwo String
    | ChangeThree String


--update is a function that takes Msg (from above) as a parameter
--to apply to the current model (which is another parameter),
--giving out a new model as a return value
update : Msg -> Model -> Model
update msg model =
  case msg of
    --each input bar changes a different color of the box
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
    (textColor, message) =
      if Result.withDefault 0 (String.toInt model.colorOne) < 120 && Result.withDefault 0 (String.toInt model.colorTwo) < 120 && Result.withDefault 0 (String.toInt model.colorThree) < 120 then
        ("rgb(255,239,213)", "I Change Color!!")
      else if Result.withDefault 0 (String.toInt model.colorOne)==0 || Result.withDefault 0 (String.toInt model.colorTwo)==0 || Result.withDefault 0 (String.toInt model.colorThree)==0 then
        ("rgb(0,0,0)", "Please Enter a valid number")
      else
        ("rgb(47,79,79)", "I Change Color!!")
  in
    div [style [("color", textColor)]] [text message]
