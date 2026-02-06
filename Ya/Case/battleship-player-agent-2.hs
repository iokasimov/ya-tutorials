import Ya
import Ya.World
import Ya.ASCII
import Ya.Literal
import Ya.Console

import "base" GHC.Num (Integer, (-), (+))

type Tile = Unit `S` Unit

pattern Idle = This Unit
pattern Ship = That Unit

type Nail = Unit `S` Unit

pattern Bang i = This i
pattern Sunk i = That i

type Shot = Nail `S` Unit

pattern Nail i = This i
pattern Miss i = That i

type Mark = Shot `S` Integer

pattern Shot e = This e
pattern Mist e = That e

type Board = Nonempty List

type Personal = Board Tile
type Opponent = Board Shot

type Ship = Nonempty List Unit

fleet = Nonempty @List @Ship
 `ha_` Item `ha` Nonempty @List
  `ha` Item Unit `ha` Next
  `ha` Item Unit `ha` Next
  `ha` Item Unit `ha` Last `hc` Unit
 `ha_` Next
 `ha_` Item `ha` Nonempty @List
  `ha` Item Unit `ha` Next
  `ha` Item Unit `ha` Last `hc` Unit
 `ha_` Last `hv_` Unit

window' ship = ship `yukl` Forth `ha` New `ha` State `ha` Event `ha` adjust `hv__'st` Expand `lo` Fore

match ship = ship
 `yokl` Apply `ho` Forth
 `ha__` Bang `ho` Nail `ho` Shot `ho` Valid
   `has_` Sunk `ho` Nail `ho` Shot `ho` Error
   `has_` Miss `ho` Shot `ho` Error
   `has_` (+1) `ho` Mist `ho` Valid

mount ship = Same `hu` ship `has_` is `li` match ship

chance = intro @(State `T'I` Sliding List Mark) Unit
 `yuk___` State `ho` New `hv__` Event `hv_` mount `ho` auto `ha_'st` Scope `hc` field @(List Mark)
 `yuk___` State `ho` New `hv__` Event `hv_` shift `hc` by Future
 `yok___` Retry `ha` Perhaps `ha'st` not

distribute fleet = fleet
 `yokl` Forth `ha` Apply
 `ha__` intro @(State _) @(AR)
  `ho_'yok` New `ha` window'
  `ho_'yuk` New `hc` chance
  `ho_'yuk` New `ha` State `ha` Event `ha` rewind `hc` by Back

known = Nonempty @List
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Next
 `ha` Item (Mist 0) `ha` Last `hc` Unit

main = print `ha` that `hv_` distribute fleet `hc` to known where

 print = this `ha'st` field @(Shafted List Mark)
      `ho_` (super @AR `ha` this `ha'st` field @(Reverse List Mark))
      `ho_'yokl` Prior `ha` Apply `ha` render
  `lo_'yp` this `ha'st` field @(List Mark)
      `ho_'yokl` Forth `ha` Apply `ha` render `ho_` Await
  `lo_'yp` this `ha'st` field @(Shafted List Mark)
      `ho_` super @AR `ha` this `ha'st` field @(Forward List Mark)
      `ho_'yokl` Forth `ha` Apply `ha` render `ho_` Await

 render = Bang `hu` Plus `hc` Unit
  `la__` Sunk `hu` Hash `hc` Unit
  `la__` Miss `hu` Hyphen `hc` Unit
  `ho___` intro @_ @(AR) `ha` Glyph `ha` Symbol `ha` Punctuate
  `la__` integer `ho_'yo` Glyph `ha` Digit
  `ho___'yokl` Forth `ha` Apply `ha` output
  `ho___'yuk` World `ha` output `ha` Caret `hc` by Space
