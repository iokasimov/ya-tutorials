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

type Board = Sliding List

type Ship = Nonempty List Unit
 
type Personal = Board Tile
type Opponent = Board Mark

submarine = Nonempty @List
 `ha` Item Unit `ha` Next
 `ha` Item Unit `ha` Next
 `ha` Item Unit `ha` Last `hc` Unit

destroyer = Nonempty @List
 `ha` Item Unit `ha` Next
 `ha` Item Unit `ha` Last `hc` Unit

fleet = Nonempty @List @Ship
 `ha_` Item `hc` submarine `ha_` Next
 `ha_` Item `hc` destroyer `ha_` Last `hv_` Unit

window' ship = ship `yukl` Forth
 `ha` New `ha` State `ha` Event
 `ha` adjust `hc` (by Expand `hjd` by Fore)

match = intro @(Halts `JNT` State Opponent) Unit
 `yuk____` Lease `ha` State `hv___` Event `hc` pop @List `ha__` Scope `hc` field @(Shafted List Mark) `ho_` Scope `ha` rep `hc'st` Passed
 `yok____` Check `ha` out
 `yuk____` Lease `ha` State `hv___` Event `hc` pop @List `ha__` Scope `hc` field @(Shafted List Mark) `ho_` Scope `ha` rep `hc'st` Future
 `yok____` Check `ha` out
 `yuk____` Lease `ha` State `hv___` Event `hc` fetch `ha_` Scope `hc` field @(List Mark)
 `yok____` Check `ha` inner
 `yok____` Apply `ha` State `ha___` Event `ha` put `ho_'ha` Scope `hc` field @(List Mark)

out = Empty `hu` by Continue
 `la__` Nail `hu` by Interrupt
   `has_` Miss `hu` by Continue
   `has_` Mist `hu` by Continue

inner ship = ship
 `yokl` Apply `ho` Forth
 `ha__` Bang `ho` Nail `ho` Shot `ho` Valid
   `has_` Sunk `ho` Nail `hu` Error Unit
   `has_` Miss `ho` Shot `hu` Error Unit
   `has_` (+1) `ho` Mist `ho` Valid

mount board = Same `hu` board
 `has_` is `ho'st` that @Opponent
 `li` match `hc` board

chance = intro @(State `T` Sliding List Mark) Unit
 `yuk___` Apply `ha` State `hv____` Event `hv_` auto `ho'ho` mount
 `yuk___` Apply `ha` State `hv____` Event `ha` shift `hc` by Future
 `yok___` Retry `ha` Stops `ha'st` not

distribute fleet = fleet
 `yokl` Forth `ha` Apply
 `ha__` intro @(State _) @(AR)
  `ho_'yok` New `ha` window'
  `ho_'yuk` New `hc` chance
  `ho_'yuk` New `ha` State `ha` Event `ha` rewind `hc` by Back

enemy = Nonempty @List
 `ha` Item Idle `ha` Next
 `ha` Item Ship `ha` Next
 `ha` Item Ship `ha` Next
 `ha` Item Ship `ha` Next
 `ha` Item Idle `ha` Next
 `ha` Item Ship `ha` Next
 `ha` Item Ship `ha` Next
 `ha` Item Idle `ha` Next
 `ha` Item Idle `ha` Next
 `ha` Item Idle `ha` Last `hc` Unit

known = enemy `yu` Mist 0

type Cell = Tile `P` Mark

guess = that `hv_` distribute fleet `hc` to known

main = morph @List enemy `hjd'yp` Align `hc` morph @List guess
 `yokl` Forth `ha` World `ha` render where

 mark = intro `ha` Glyph `ha` Symbol `ha` Punctuate
  `ha__` Bang `hu` by Plus `has_` Sunk `hu` by Hash `has_` Miss `hu` by Hyphen
  `la__` integer `ho_'yo` Glyph `ha` Digit

 tile = Glyph `ha` Symbol `ha` Punctuate
  `ha___` Hyphen `has_` Plus

 cell (These him me) = intro @(State _) Unit
  `yuk_` New `ha` State `ha` Event `ha` push
    `ha` Glyph `ha` Symbol `ha` Punctuate `hc` by Bar
  `yuk_` New `ha` State `ha` Event `ha` push `hc` tile him
  `hc___` mark me

 render info = that `hc` cell info
  `yokl` Forth `ha` World `ha` output
  `yuk_` World `ha` output `ha` Caret `hc` by Space
  `yuk_` World `ha` output `ha` Caret `hc` by Space
