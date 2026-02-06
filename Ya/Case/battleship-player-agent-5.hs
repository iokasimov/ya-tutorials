import Ya
import Ya.World
import Ya.ASCII
import Ya.Console

import "base" GHC.Num (Integer, (-), (+))

type Tile = Unit `S` Unit

pattern Idle e = This e
pattern Ship e = That e

type Nail = Unit `S` Unit

pattern Bang i = This i
pattern Sunk i = That i

type Shot = Nail `S` Unit

pattern Nail i = This i
pattern Miss i = That i

type Mark = Shot `S` Integer

pattern Shot e = This e
pattern Mist e = That e

type Ship = Nonempty List Unit

submarine = Nonempty @List
 `ha` Item Unit `ha` Next
 `ha` Item Unit `ha` Next
 `ha` Item Unit `ha` Last `hc` Unit

destroyer = Nonempty @List
 `ha` Item Unit `ha` Next
 `ha` Item Unit `ha` Last `hc` Unit

boat = Nonempty @List
 `ha` Item Unit `ha` Last `hc` Unit

fleet = Nonempty @List @Ship
 `ha_` Item `hc` destroyer `ha_` Next
 `ha_` Item `hc` submarine `ha_` Last `hv_` Unit

type Cell = Tile `P` Mark

type Fleet = Nonempty List Ship

type Target = Maybe Ship

shoot' = Miss `has_` Nail `ha` Bang `ho_` Shot `ha__` this @Tile

type Result = Unit `S` Ship

-- pattern Verge e = This (This e)
pattern Smash e = This e
pattern Fault e = That e

type Board = Sliding List

type Personal = Board Tile
type Opponent = Board Mark

-- + Empty: If there is `Exist Ship` - we need to remove it from `Fleet`, stop

process = intro @(Stops Result `JNT` State `T'I` Target `P` Fleet `P` Board Cell) Unit
 `yuk__` State `ho` New `hv__` Event `ha` adjust `hc` (by Expand `hjd` by Right) `ha_` Scope `hc` field @(Board Cell)
 `yok__` Usual `ha__` Idle `hu` (review `yu` Unit) `has_` Ship `hu` (pursuit `yu` Unit) `ha__` Last `hu` by Idle `has_` this @Tile
 `yok__` Again `ha` Same

-- + If there is `Ship` tile
pursuit = intro @(Stops Result `JNT` State `T'I` Target `P` Fleet `P` Board Cell) Unit
 `yuk___` State `ho` New `hv___` Event `hv_` hit `ha_` Scope `hc` field @Target

-- If there is no bombing target - startize a new bombing target
-- If there is a bombing target - add a tile to this bombing target
hit = auto `ha` Exist @Ship
 `ha__` Empty @Ship `hu_` intro @(Nonempty List) `hc` Unit
   `has_` push `hc` Unit `ho` that

-- . If there is `Idle` tile
 -- , if there is `Empty Ship` - do nothing
 -- , if there is `Exist Ship` - we need to remove it from `Fleet` and skip
review = intro @(Stops Result `JNT` State `T'I` Target `P` Fleet `P` Board Cell) Unit
 `yuk___` Old `ha` State `hv__` Event `hc` fetch `ha_` Scope `hc` field @Target
 `yok___` Apply `ha__` Empty `hu_` intro `ha` Empty `hc` Unit `has_` unstock

-- 1. Try to find the same ship
-- 2. If ship is found - remove from `Fleet`
-- 3. If ship isn't found - `Interrupt` with an `Fault`
-- 4. If after removing ship fleet is empty - terminate with `Smash`
-- 5. If fleet is not empty - just update `Fleet`
unstock ship = intro @(Stops Result `JNT` State `T'I` Target `P` Fleet `P` Board Cell) Unit
 `yuk___` New `ha` State `hv__` Event `ha` spot `ha` (by Right `hjd`) `ha` Match `ha` exact `ha` Same `hc` ship `ha_` Scope `hc` field @Fleet `ho` Scope (as @(Scrolling List))
 `yok___` Try `ha__` Error `hu_` Reach @Result `ha` Fault `hc` ship `has_` Ok
 `yok___` Try `ha__` Empty `hu_` Reach @Result `hc` by Smash `has_` Ok `ha__` field @(Shafted List Ship) `st'ho` this `ho` morph @List
 `yok___` New `ha` State `ha__` Event `ha` relay `ho_'ha` Scope `hc` field @Fleet
 `yuk___` New `ha` State `hv___` Event `ha` relay `hc` empty @List `ha__` Scope `hc` field @(Board Cell) `ho_` Scope `hc` field @(List Cell)
 `yok___` New `ha` State `ha___` Event `ha` across `ho__'ha` Scope `hc` field @(Board Cell) `ho_` Scope `hc` field @(Shafted List Mark) `ho_` Scope `ha` rep `hc'st` Passed
 `yuk___` New `ha` State `hv___` Event `ha` relay `hc` Empty Unit `ha__` Scope `hc` field @Target

exact sample item = Wrong `hu` by False `has_` Valid `hu` by True `li_` sample `hjd'q` super item
-- exact sample item = sample `hjd'q` item `yi` dim `yiu` Unit `yi_` Boolean

across sunk passed = that @(List Cell) `ha` pop `hc` sunk `yokl` Forth `ha` Apply `ha` State `ha` Event `ha` push `hc___` passed

-- Update
-- Review

window' ship = ship `yukl` Forth `ha` New `ha` State `ha` Event `ha` adjust `hv__'st` Expand `lo` Right

match = intro @(Halts `JNT` State Opponent) Unit
 `yuk___` Lease `ha` State `hv__` Event `hc` pop `ha__` Scope `hc` field @(Shafted List Mark) `ho_` Scope `ha` rep `hc'st` Passed `yok___` Check `ha` out
 `yuk___` Lease `ha` State `hv__` Event `hc` pop `ha__` Scope `hc` field @(Shafted List Mark) `ho_` Scope `ha` rep `hc'st` Future `yok___` Check `ha` out
 `yuk___` Lease `ha` State `hv__` Event `hc` fetch `ha_` Scope `hc` field @(List Mark) `yok___` Check `ha` inner
 `yok___` Apply `ha` State `ha__` Event `ha` put `ho_'ha` Scope `hc` field @(List Mark)

out = Empty `hu` by Continue
 `la__` Nail `hu` by Interrupt
   `has_` Miss `hu` by Continue
   `has_` Mist `hu` by Continue

inner ship = ship `yokl` Apply `ho` Forth
 `ha__` Bang `ho` Nail `ho` Shot `ho` Valid
   `has_` Sunk `ho` Nail `hu` Error Unit
   `has_` Miss `ho` Shot `hu` Error Unit
   `has_` (+1) `ho` Mist `ho` Valid

mount board = Same `hu` board
 `has_` is `ho'st` that @Opponent
 `li` match `hc` board

chance = intro @(State `T` Sliding List Mark) Unit
 `yuk___` State `ho` New `hv__` Event `hv_` fetch `ho'ho` mount
 `yuk___` State `ho` New `hv__` Event `ha` shift `hc` by Right
 `yok___` Retry `ha` Perhaps `ha'st` not

distribute fleet = fleet
 `yokl` Forth `ha` Apply
 `ha__` intro @(State _) @(AR)
  `ho_'yok` New `ha` window'
  `ho_'yuk` New `hc` chance
  `ho_'yuk` New `ha` State `ha` Event `ha` rewind `hc` by Back

enemy = Nonempty @List
 `ha` Item (by Idle) `ha` Next
 `ha` Item (by Ship) `ha` Next
 `ha` Item (by Ship) `ha` Next
 `ha` Item (by Ship) `ha` Next
 `ha` Item (by Idle) `ha` Next
 `ha` Item (by Idle) `ha` Next
 `ha` Item (by Idle) `ha` Next
 `ha` Item (by Idle) `ha` Next
 `ha` Item (by Ship) `ha` Next
 `ha` Item (by Ship) `ha` Last

known = by enemy `yu` Mist 0

guess = that @(Board Mark) `hv_` distribute fleet `hc` to known

shoot (These x _) = x `hjd_` by Miss `lv` Nail `hc` by Bang `ho_` Shot `li` x

fresh = morph @List `hc` by enemy
 `hjd'yp` Align `hc` (morph @List `hc` guess)
 `yi` morph @(Sliding List)

title x = is @(List ASCII) x `yokl` Apply `ha` World `ha` output

print x = x `yokl_` Apply `ha` Apply `ha___` is @Ship
 `ho__'yukl` Apply `ha` Apply `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `hc` by Hash
 `ho__'yuk` World `ha` output `ha` Caret `hc` by Space

smash _ = intro @World Unit
 `yuk__` World `hv_` (is @(List ASCII) `hc` "You won, you defeated all ships!" `yokl` Forth `ha` Apply `ha` output)
 -- `yuk__` World `hv_` (fleet `yokl'yokl` Forth `ha` Forth `ha` Apply `ha` output `ha` (is `hu_`by (Glyph `ha` Symbol `ha` Punctuate `ha` Dollar)))
 `yuk__` World `hc` intro @World Unit

fault ship = is @(List ASCII) `hc` "One ship has not been found..." `yokl` Forth `ha` Apply `ha` output
 `yuk____` World `hv____` ship `yukl` Forth `ha` Apply `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha` Dollar `hc` Unit
 -- `yuk__` ship `yukl` Forth `ha` Apply `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha` Dollar `hc` Unit

-- verge _ = is @(List ASCII) `hc` "Highly likely you lost this battle..." `yokl` Forth `ha` Apply `ha` output

main = process `st'st'hv__` by `hc` Empty @Ship `hjd` fleet `hjd` fresh
 -- `yi__` verge `ho'yu` Unit `has_` smash `ho'yu` Unit `has_` fault `ho'yu` Unit
 `yi__` smash `ho'yu` Unit `has_` fault `ho'yu` Unit
  -- `la_` is @(Equipped _ _) `ho'st` that `ho` that @(Board Cell) `ho` morph @List
   `has_` is @(Along _ _) `ho'st` that `ho` this `ho` that @Fleet `ho` print `ho'yu` Unit where
  -- `ho_'yokl'yokl` Forth `ha` Forth `ha` Apply
   -- `ha` (is `hu_`output `hc` by (Glyph `ha` Symbol `ha` Punctuate `ha` Dollar))
  
  -- `ho_'yokl` Forth `ha` Apply `ha` render `ho_'yu` Unit where

{-
 mark = intro `ha` Glyph `ha` Symbol `ha` Punctuate
  `ha__` Bang `hu` by Plus `has_` Sunk `hu` by Hash `has_` Miss `hu` by Hyphen
  `la__` integer `ho_'yo` Glyph `ha` Digit

 tile = Glyph `ha` Symbol `ha` Punctuate
  `ha___` by Hyphen `lv` by Plus

 cell (These him me) = intro @(State _)
  `yuk_` New `ha` State `ha` Event `ha` push
    `ha` Glyph `ha` Symbol `ha` Punctuate `hc` by Bar
  `yuk_` New `ha` State `ha` Event `ha` push `hc` tile him
  `hc___` mark me

 render info = that `hc` cell info
  `yokl` Forth `ha` World `ha` output
  `yuk_` World `ha` output `ha` Caret `hc` by Space
  `yuk_` World `ha` output `ha` Caret `hc` by Space
-}
