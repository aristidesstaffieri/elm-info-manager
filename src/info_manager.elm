import Color exposing (..)
import Graphics.Collage exposing (..)

main = listItem

listItem =
  collage 400 400
  [ filled lightGrey (rect 100 100)
  , outlined (solid grey) (rect 100 100)
  ]
