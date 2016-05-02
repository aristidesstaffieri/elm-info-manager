import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Signal exposing (Address)
import Regex exposing (regex, contains)
import StartApp.Simple as StartApp
import String exposing (..)

main =
  StartApp.start { model = empty, view = view, update = update }

-- STYLES

appStyles : Html.Attribute
appStyles =
  style
  [  ("display", "flex")
  ,  ("flex-direction", "column")
  ,  ("justify-content", "center")
  ,  ("align-items", "center")
  ,  ("width", "100%")
  ]


containerStyles : Html.Attribute
containerStyles =
  style
  [  ("display", "flex")
  ,  ("flex-direction", "column")
  ,  ("justify-content", "center")
  ,  ("align-items", "center")
  ,  ("width", "100%")
  ]

mainContainerStyles : Html.Attribute
mainContainerStyles =
  style
   [  ("display", "flex")
   ,  ("flex-direction", "column")
   ,  ("justify-content", "center")
   ,  ("align-items", "center")
   ,  ("width", "200px")
   ,  ("margin-top", "200px")
   ,  ("background-color", "#333")
   ,  ("border-radius", "5px")
   ,  ("padding", "1%")
   ]


searchContainerStyles : Html.Attribute
searchContainerStyles =
  style
  [  ("display", "flex")
  ,  ("flex-direction", "column")
  ,  ("justify-content", "center")
  ,  ("align-items", "center")
  ,  ("width", "100%")
  ]

listStyle : Html.Attribute
listStyle =
  style
  [  ("display", "flex")
  ,  ("flex-direction", "column")
  ,  ("justify-content", "center")
  ,  ("align-items", "center")
  ,  ("list-style-type",  "none")
  ,  ("border", "1px solid #fff")
  ,  ("border-radius", "5px")
  ,  ("padding", "1%")
  ,  ("width", "120px")
  ]

listItemStyle : Html.Attribute
listItemStyle =
  style
  [ ("font-size", "1em")
  , ("text-align", "center")
  , ("text-decoration", "none")
  , ("width", "100%")
  , ("color", "#fff")
  , ("margin-top", "20px")
  , ("margin-bottom", "20px")
  ]

-- MODEL

type alias Model =
  {  searchList : List String
  ,  search : String
  }

empty : Model
empty =
  {  searchList = ["First", "Second", "Third"]
  ,  search = ""
  }

-- UPDATE

type Action = Search String


update action model =
  case action of
    Search search ->
      { model | searchList = checkList model.searchList search  }

checkList itemList search =
  if length search < 1 then
    empty.searchList
  else
    List.filter (\n -> Regex.contains (regex search) n) itemList


-- VIEW

renderItem : String -> Html
renderItem item =
  li [listItemStyle] [text item]

renderList : List String -> Html
renderList itemList =
  let
    l = List.map renderItem itemList
  in
    ul [listStyle] l

renderContainer address itemList search =
  div [mainContainerStyles]
  [  div [searchContainerStyles]
        [  input
            [ style [  ("border", "1px solid #fff")
                    ,  ("border-radius", "5px")
                    ,  ("padding", "1%")
                    ,  ("width", "120px")
                    ]
              , type' "text"
            , placeholder ""
            , on "input" targetValue (\string -> Signal.message address (Search string))
            ]
        []

        ]
  ,
      div [containerStyles] [renderList itemList]
  ]


view : Address Action -> Model -> Html
view address model =
  div [appStyles]
  [ renderContainer address model.searchList model.search ]
