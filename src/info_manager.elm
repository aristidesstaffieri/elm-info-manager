module InfoManager where

--import Color exposing (..)
--import Graphics.Collage exposing (..)
import Array exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

-- need a list, a selected item, a way to sort the list, and a way to search the list

-- MODEL

type SortDirection = Up | Down

type alias Info =
  { list : Array
  , sort : SortDirection
  }

type alias InfoItem =
  { title : String
  , value : String
  , selected : Bool
  }

-- UPDATE

flipSortDir : SortDirection -> SortDirection
flipSortDir direction =
  if direction == Up then Down else Up

-- VIEW

listStyle : Attribute
listStyle =
  style
  [ ("list-style-type",  "none")
  , ("width", "100%")
  ]

listItemStyle : Attribute
listItemStyle =
  style
  [ ("width", "100%")
  , ("height", "50px")
  , ("font-size", "1em")
  , ("border", "1px solid grey")
  , ("text-align", "center")
  , ("text-decoration", "none")
  ]

renderItem : String -> Html
renderItem item =
  li [listItemStyle] [text item]

renderChannels : List String -> Html
renderChannels itemList =
  let
    l = List.map renderItem itemList
  in
    ul [listStyle] l

main : Html
main =
  renderChannels ["yo", "yoyoyo"]
