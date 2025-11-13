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
 `ha` Item Unit `ha` Last `hv` Unit

destroyer = Nonempty @List
 `ha` Item Unit `ha` Next
 `ha` Item Unit `ha` Last `hv` Unit

boat = Nonempty @List
 `ha` Item Unit `ha` Last `hv` Unit

fleet = Nonempty @List @Ship
 `ha_` Item `hv` destroyer `ha_` Next
 `ha_` Item `hv` submarine `ha_` Last `hv_` Unit

type Cell = Tile `P` Mark

type Fleet = Nonempty List Ship

type Target = Maybe Ship

shoot' = Miss `la` Nail `ha` Bang `ho_` Shot `ha__` this @Tile

type Result = Unit `S` Ship

-- pattern Verge e = This (This e)
pattern Smash e = This e
pattern Fault e = That e

type Board = Sliding List

type Personal = Board Tile
type Opponent = Board Mark

-- + Empty: If there is `Exist Ship` - we need to remove it from `Fleet`, stop

process = intro @(Stops Result `JNT` State `T'I` Target `P` Fleet `P` Board Cell) Unit
 `yuk__` State `ho` New `hv__` Event `ha` adjust `hv` (by Expand `lu` by Right) `ha_` Scope `hv` at @(Board Cell)
 `yok__` Usual `ha__` Idle `hu` (review `yu` Unit) `la` Ship `hu` (pursuit `yu` Unit) `ha__` Last `hu` by Idle `la` this @Tile
 `yok__` Again `ha` Same

-- + If there is `Ship` tile
pursuit = intro @(Stops Result `JNT` State `T'I` Target `P` Fleet `P` Board Cell) Unit
 `yuk___` State `ho` New `hv___` Event `hv_` hit `ha_` Scope `hv` at @Target

-- If there is no bombing target - startize a new bombing target
-- If there is a bombing target - add a tile to this bombing target
hit = auto `ha` Exist @Ship
 `ha__` Empty @Ship `hu_` intro @(Nonempty List) `hv` Unit
   `la` push `hv` Unit `ho` that

-- . If there is `Idle` tile
 -- , if there is `Empty Ship` - do nothing
 -- , if there is `Exist Ship` - we need to remove it from `Fleet` and skip
review = intro @(Stops Result `JNT` State `T'I` Target `P` Fleet `P` Board Cell) Unit
 `yuk___` Old `ha` State `hv__` Event `hv` get `ha_` Scope `hv` at @Target
 `yok___` Run `ha__` Empty `hu_` intro `ha` Empty `hv` Unit `la` unstock

-- 1. Try to find the same ship
-- 2. If ship is found - remove from `Fleet`
-- 3. If ship isn't found - `Interrupt` with an `Fault`
-- 4. If after removing ship fleet is empty - terminate with `Smash`
-- 5. If fleet is not empty - just update `Fleet`
unstock ship = intro @(Stops Result `JNT` State `T'I` Target `P` Fleet `P` Board Cell) Unit
 `yuk___` New `ha` State `hv__` Event `ha` spot `ha` (by Right `lu`) `ha` Match `ha` exact `ha` Same `hv` ship `ha_` Scope `hv` at @Fleet `ho` Scope (as @(Scrolling List))
 `yok___` Try `ha__` Error `hu_` Reach @Result `ha` Fault `hv` ship `la` Ok
 `yok___` Try `ha__` Empty `hu_` Reach @Result `hv` by Smash `la` Ok `ha__` at @(Shafted List Ship) `he'ho` this `ho` to @List
 `yok___` New `ha` State `ha__` Event `ha` relay `ho_'ha` Scope `hv` at @Fleet
 `yuk___` New `ha` State `hv___` Event `ha` relay `hv` empty @List `ha__` Scope `hv` at @(Board Cell) `ho_` Scope `hv` at @(List Cell)
 `yok___` New `ha` State `ha___` Event `ha` across `ho__'ha` Scope `hv` at @(Board Cell) `ho_` Scope `hv` at @(Shafted List Mark) `ho_` Scope `ha` rep `hv'he` Passed
 `yuk___` New `ha` State `hv___` Event `ha` relay `hv` Empty Unit `ha__` Scope `hv` at @Target

exact sample item = Wrong `hu` by False `la` Valid `hu` by True `li_` sample `lu'q` unwrap item
-- exact sample item = sample `lu'q` item `yi` dim `yiu` Unit `yi_` Boolean

across sunk passed = that @(List Cell) `ha` pop `hv` sunk `yokl` Forth `ha` Run `ha` State `ha` Event `ha` push `he'he'hv___` passed

-- Update
-- Review

window' ship = ship `yukl` Forth `ha` New `ha` State `ha` Event `ha` adjust `hv__'he` Expand `lo` Right

match = intro @(Halts `JNT` State Opponent) Unit
 `yuk___` Lease `ha` State `hv__` Event `hv` pop `ha__` Scope `hv` at @(Shafted List Mark) `ho_` Scope `ha` rep `hv'he` Passed `yok___` Check `ha` out
 `yuk___` Lease `ha` State `hv__` Event `hv` pop `ha__` Scope `hv` at @(Shafted List Mark) `ho_` Scope `ha` rep `hv'he` Future `yok___` Check `ha` out
 `yuk___` Lease `ha` State `hv__` Event `hv` get `ha_` Scope `hv` at @(List Mark) `yok___` Check `ha` inner
 `yok___` Apply `ha` State `ha__` Event `ha` put `ho_'ha` Scope `hv` at @(List Mark)

out = Empty `hu` by Continue
 `la__` Nail `hu` by Interrupt
   `la` Miss `hu` by Continue
   `la` Mist `hu` by Continue

inner ship = ship `yokl` Run `ho` Forth
 `ha__` Bang `ho` Nail `ho` Shot `ho` Valid
   `la` Sunk `ho` Nail `hu` Error Unit
   `la` Miss `ho` Shot `hu` Error Unit
   `la` (+1) `ho` Mist `ho` Valid

mount board = Same `hu` board
 `la` is `ho'he` that @Opponent
 `li` match `he'he'hv` board

chance = intro @(State `T` Sliding List Mark) Unit
 `yuk___` State `ho` New `hv__` Event `hv_` get `ho'ho` mount
 `yuk___` State `ho` New `hv__` Event `ha` shift `hv` by Right
 `yok___` Retry `ha` Perhaps `ha'he` not

distribute fleet = fleet
 `yokl` Forth `ha` Run
 `ha__` intro @(State _) @(AR)
  `ho_'yok` New `ha` window'
  `ho_'yuk` New `hv` chance
  `ho_'yuk` New `ha` State `ha` Event `ha` rewind `hv` by Back

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

guess = that @(Board Mark) `hv_` distribute fleet `he'he'hv` to known

shoot (These x _) = x `lu_` by Miss `lv` Nail `hv` by Bang `ho_` Shot `li` x

fresh = to @List `hv` by enemy
 `lu'yp` Align `hv` (to @List `hv` guess)
 `yi` to @(Sliding List)

title x = is @(List ASCII) x `yokl` Run `ha` World `ha` output

print x = x `yokl_` Run `ha` Run `ha___` is @Ship
 `ho__'yukl` Run `ha` Run `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `hv` by Hash
 `ho__'yuk` World `ha` output `ha` Caret `hv` by Space

smash _ = intro @World Unit
 `yuk__` World `hv_` (is @(List ASCII) `hv` "You won, you defeated all ships!" `yokl` Forth `ha` Run `ha` output)
 -- `yuk__` World `hv_` (fleet `yokl'yokl` Forth `ha` Forth `ha` Run `ha` output `ha` (is `hu_`by (Glyph `ha` Symbol `ha` Punctuate `ha` Dollar)))
 `yuk__` World `hv` intro @World Unit

fault ship = is @(List ASCII) `hv` "One ship has not been found..." `yokl` Forth `ha` Run `ha` output
 `yuk____` World `hv____` ship `yukl` Forth `ha` Run `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha` Dollar `hv` Unit
 -- `yuk__` ship `yukl` Forth `ha` Run `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha` Dollar `hv` Unit

-- verge _ = is @(List ASCII) `hv` "Highly likely you lost this battle..." `yokl` Forth `ha` Run `ha` output

main = process `he'he'hv__` by `hv` Empty @Ship `lu` fleet `lu` fresh
 -- `yi__` verge `ho'yu` Unit `la` smash `ho'yu` Unit `la` fault `ho'yu` Unit
 `yi__` smash `ho'yu` Unit `la` fault `ho'yu` Unit
  -- `la_` is @(Equipped _ _) `ho'he` that `ho` that @(Board Cell) `ho` to @List
   `la` is @(Along _ _) `ho'he` that `ho` this `ho` that @Fleet `ho` print `ho'yu` Unit where
  -- `ho_'yokl'yokl` Forth `ha` Forth `ha` Run
   -- `ha` (is `hu_`output `hv` by (Glyph `ha` Symbol `ha` Punctuate `ha` Dollar))
  
  -- `ho_'yokl` Forth `ha` Run `ha` render `ho_'yu` Unit where

{-
 mark = intro `ha` Glyph `ha` Symbol `ha` Punctuate
  `ha__` Bang `hu` by Plus `la` Sunk `hu` by Hash `la` Miss `hu` by Hyphen
  `la__` integer `ho_'yo` Glyph `ha` Digit

 tile = Glyph `ha` Symbol `ha` Punctuate
  `ha___` by Hyphen `lv` by Plus

 cell (These him me) = intro @(State _)
  `yuk_` New `ha` State `ha` Event `ha` push
    `ha` Glyph `ha` Symbol `ha` Punctuate `hv` by Bar
  `yuk_` New `ha` State `ha` Event `ha` push `hv` tile him
  `he'he'hv___` mark me

 render info = that `hv` cell info
  `yokl` Forth `ha` World `ha` output
  `yuk_` World `ha` output `ha` Caret `hv` by Space
  `yuk_` World `ha` output `ha` Caret `hv` by Space
-}
