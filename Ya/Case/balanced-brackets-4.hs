import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Mismatch = Shape `P` Shape

type Missing = Shape `S` Shape

type Imbalance = Mismatch `S` Missing

pattern Mismatch x = This x
pattern Missing x = That x

deposit bracket = intro @(Stops Imbalance `JNT` State `T` List Shape) Unit
 `yuk__` New `ha` State `ha` Event `hc` push @List bracket

analyze bracket = intro @(Stops Imbalance `JNT` State `T` List Shape) Unit
 `yuk__` New `ha` State `ha` Event `hc` pop @List
 `yok__` Try `ha__` Empty `hu_` Error @Imbalance `ha` Missing `ha` Opened `hc` bracket `has_` Valid
 `yok__` Try `ha__` Error @Imbalance `ha` Mismatch `has_` Valid `ha_` compare bracket

compare closed opened = opened `hjd'q` closed

remnant = Empty `hu` by Valid
  `has_` Error @Imbalance `ha` Missing `ha` Closed `ha` this @Shape `ha` top @(Nonempty List)

inspect code = code
 `yokl__` Forth `ha` Apply @(Stops Imbalance `JNT` State `T` List Shape)
 `ha____'yokl` Try `ha` Apply `ha__` deposit `has_` analyze
 `ha____` on @Glyph `ho` dim `ho` Maybe
 `ho_'yok` on @Symbol `ho` dim `ho` Maybe `ho` Try
 `ho_'yok` on @Bracket `ho` dim `ho` Maybe `ho` Try
 `st'st'hv_____` empty @List
 `yok___` Try `ha` remnant `ha'st` that @(List Shape)

main = that @(List ASCII) `ha__` mismatch `has_` missing `has_` balance
 `li___` inspect `ha` is @(Nonempty List ASCII) `hc` "fn main() { println('hello, <world>!') }"
 `yokl_` Forth `ha` Apply `ha` output where

 mismatch (These opened closed) =
  "[ERROR] Mismatched bracket shapes - "
  `yokl` Prior `ha` New `ha` State `ha` Event `ha` push `hc___` List `ha` Exist `ha` Build
  `ha__` Item `ha` Glyph `ha` Symbol `ha` Bracket `ha` Opened `hc` opened `ha` Next
  `ha__` Item `ha` Caret `hc` by Space `ha` Next
  `hv__` Item `ha` Glyph `ha` Symbol `ha` Bracket `ha` Closed `hc` closed `ha` Last `hc` Unit

 missing bracket =
  "[ERROR] Missing bracket - "
  `yokl` Prior `ha` New `ha` State `ha` Event `ha` push
  `hc___` intro @List `ha` Glyph `ha`Symbol `ha` Bracket `hc` bracket

 balance _ = empty @List
  `hjd` "[VALID] Everything is seem to be good!"
