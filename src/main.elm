import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Signal exposing (Address)
import Regex exposing (regex, contains)
import StartApp.Simple as StartApp
import String exposing (..)
import Styles exposing (..)

main : Signal Html
main =
  StartApp.start { model = empty, view = view, update = update }

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

update : Action
  -> {a | searchList : List String}
  -> {a | searchList : List String}
update action model =
  case action of
    Search search ->
      { model | searchList = checkList model.searchList search  }

checkList : List String -> String -> List String
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

renderContainer : Address Action -> List String -> a -> Html
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
