module Styles where

import Html exposing (..)
import Html.Attributes exposing (..)

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
