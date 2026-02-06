import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

import "ya-tutorials" Ya.Instances

import "base" GHC.Num (Integer, (-), (+))
-- import "base" System.IO (print)

type Tile = Unit `S` Unit

pattern Idle = This Unit
pattern Ship = That Unit

type Ship = Nonempty List Unit

type Fleet = Nonempty List Ship

fleet = Nonempty @List @Ship
 `ha_` Item `ha` Nonempty @List
  `ha` Item Unit `ha` Next
  `ha` Item Unit `ha` Next
  `ha` Item Unit `ha` Maybe `hc` Last
 `ha_` Maybe `ha_` Next
 `ha_` Item `ha` Nonempty @List
  `ha` Item Unit `ha` Next
  `ha` Item Unit `ha` Maybe `hc` Last
 `ha_` Maybe `hv_` Last

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
 `ha` Item Idle `ha` Maybe `hc` Last

type Shot = Unit `S` Unit `S` Unit

pattern Miss i = This (This i)
pattern Bang i = This (That i)
pattern Sunk i = That i

type Mark = Shot `S` Integer

pattern Shot e = This e :: Mark
pattern Mist e = That e :: Mark

type Board = Nonempty List `T'I` Mark `P` Tile

sunk x = intro @(State `T` Scrolling List Ship `JNT` Stops `T` Shafted List Ship) Unit
 `yuk____` New `ha` State `hv__` Event `hv_` auto `ho'yoi` (`hjd'q` Same x) `ha_'st` Scope `hc` field @(Focused Ship)
 `yok____` New `ha` State `hv__` Event `hv_` scroll `hc` by Next `ho'yoi` Continue
  `lv____` New `ha` State `hv__` Event `hv_` auto `ho'yoi` Interrupt `ha_'st` Scope `hc` field @(Shafted List Ship)
 -- TODO: can we replace it with `Retry`?
 `yok____` Try `ha` is @(Stops `T` Shafted List Ship `T` _)
 `yok____` Again `ha` Once

known = enemy `yu` Mist 0

window ship = ship `yukl` Forth
 `ha` New `ha` State `ha` Event
 `ha` adjust @List `hc` by Fore

match ship = Interrupt `hu_` auto `hc` ship `has_` auto `li` check `hc` ship

check tile = tile
 `yokl` Apply `ho` Forth
 `ha__` Miss `ho` Shot `ho` Error
   `has_` Bang `ho` Shot `ho` Valid
   `has_` Sunk `ho` Shot `ho` Error
   `has_` (+1) `ho` Mist `ho` Valid

chance = intro @(State `T'I` Sliding List Mark) Unit
 `yuk___` State `ho` New `hv__` Event `hc` match `ha_'st` Scope `hc` field @(List Mark)
 `yuk___` State `ho` New `hv__` Event `ha` slide `hc` by Future
 `yok___` Retry `ha` Perhaps `ha` not

rewind = State `ha` Event `hv_` auto `ho'ho` morph @(Sliding List) `ha` morph @List

distribute fleet = fleet
 `yokl` Forth `ha` Apply
 `ha__` intro @(State _)
  `ho_'yok` New `ha` window
  `ho_'yuk` New `hc` chance
  `ho_'yuk` New `hc` rewind

main = print `ha` that `hv_` distribute fleet `hc` to known

-- TODO: replace this expression with a `Mapping` instance
print = this `ha'st` field @(Shafted List Mark)
      `ho_` (super @AR `ha` this `ha'st` field @(Reverse List Mark))
      `ho_'yokl` Prior `ha` Apply `ha` render
 -- `lo_'yp` is `hu_` output `ha` Glyph `ha` Symbol `ha` Bracket `hc` Opened Square
 `lo_'yp` this `ha'st` field @(List Mark)
      `ho_'yokl` Forth `ha` Apply `ha` render
 -- `lo_'yp` is `hu_` output `ha` Glyph `ha` Symbol `ha` Bracket `hc` Closed Square
 `lo_'yp` this `ha'st` field @(Shafted List Mark)
      `ho_` super @AR `ha` this `ha'st` field @(Forward List Mark)
      `ho_'yokl` Forth `ha` Apply `ha` render

render = Miss `hu` Hyphen `hc` Unit
 `la__` Bang `hu` Plus `hc` Unit
 `la__` Sunk `hu` Hash `hc` Unit
 `ho___` intro `ha` Glyph `ha` Symbol `ha` Punctuate
 `la__` integer
 `ho___'yokl` Forth `ha` Apply `ha` output
 `ho___'yuk` World `ha` output `ha` Caret `hc` by Space

-- title x = output `ha` Caret `hc` Newline
 -- `yuk_____` World `hv_____` is @(List ASCII) x
    -- `yokl_` Forth `ha` Apply `ha` output

-- main = fleet
 -- `yokl_` is -- intro @(State `T'I` Sliding List Mark `JNT` World)
 -- `ho__'yukl` Forth `ha` New `ha` State `ha` Event `ha` adjust @List `hc` it Fore
  -- `ho__'yok` New `ha` extent
  -- `ho__'yuk` (State `ho` New `hv__` Event `hc` fits `ha_'st` Scope `hc` field @(List Mark))
  -- `ho__'yuk` Apply `ha` title `hc` "Probs: "
  -- `ho__'yuk` Apply `hc` frame
  -- `ho__'yuk` New `hc` rewind
  -- `ho__'yuk` Apply `ha` title `hc` "Reset: "
  -- `ho__'yuk` Apply `hc` frame
 -- `ho__` Forth `ha` Apply
 -- `st'st'hv_____` morph @(Sliding List) `hc` known where

 -- `yuk_____` World (is @(List _) "Enemy: " `yokl` Forth `ha` Apply `ha` output)
 -- `yuk_____` World (enemy `yokl_` Forth `ha` Apply -- `ha` output
   -- `ha___` (output `ha` Glyph `ha` Symbol `ha` Punctuate `ha__` Hyphen `has_` Hash
    -- `ho__'yuk` Apply `ha` output `ha` Caret `hc` Space))
 -- `yuk_____` World (output `ha` Caret `hc` Newline)
 -- `yuk_____` World (is @(List _) "Known: " `yokl` Forth `ha` Apply `ha` output)
 -- `yuk_____` World (known `yokl` Forth `ha` Apply `ha` render)
 -- `yuk_____` World (output `ha` Caret `hc` Newline)
 
 -- `ho___'yuk` New `hc` probs
 -- `ho___'yuk` Apply `ha` title `hc` "Gauge: "
 -- `ho___'yuk` Apply `hc` frame
 -- `ho___'yuk` New `ha` State `ha` Event `ha` slide `hc` it Fore
 -- `ho___'yok` intro `lv` Again `ha` Once `hc` Unit

 -- `ho___'yuk` New `ha` State `ha` Event `ha` slide `hc` it Fore
 -- `ho___'yok` World `hc` print "The end!" `lv` World `hc` print "Continue..."
 -- `ho___'yuk` Apply `ha` title `hc` "Slide: "
 -- `ho___'yuk` Apply `hc` frame

-- I spend the whole day on a relatively simple question: how to implement `remove` function
-- without left it tied to exact specified meaning?
-- * Should I remove all occurencies of a copy of the same item?
-- * Should I stop after removing first occurrencies?
-- * What if I would like to apply some another predicate on filtering out an element instead of total equivalence relation?

-- main = print known

-- main = print `ha` this `ha`field @(List Mark) `ha` super @AR `ha`that `ha` adjust (Fore Unit) `ha` morph @(Sliding List) `hc` known

-- main = enemy `yokl` Forth `ha` Apply `ha` print `ha_` These `st` Capacity 0

-- main = enemy `yokl__` Forth `ha` Apply
 -- `ha___` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha__` Hyphen `has_` Hash
  -- `ho__'yuk` Apply `ha` output `ha` Caret `hc` Space
