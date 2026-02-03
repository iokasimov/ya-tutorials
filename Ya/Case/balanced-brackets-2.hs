import "ya" Ya
import "ya-ascii" Ya.ASCII
import "ya-world" Ya.World
import "ya-console" Ya.Console

type Imbalance = (Shape `P` Shape) `S_` (Shape `S` Shape)

pattern Mismatch x = This x
pattern Missing x = That x

deposit bracket = intro @(Stops Imbalance `JNT` State `T` List Shape) Unit
 `yuk__` Apply `ha` State `ha` Event `hc` push @List bracket

analyze bracket = intro @(Stops Imbalance `JNT` State `T` List Shape) Unit
 `yuk__` Apply `ha` State `ha` Event `hc` pop @List
 `yok__` Check `ha__` Empty `hu_` Error @Imbalance `ha` Missing `ha` Opened `hc` bracket `has_` Valid
 `yok__` Check `ha__` Error @Imbalance `ha` Mismatch `has_` Valid `ha_` compare bracket

compare closed opened = opened `hjd'q` closed

remnant = Empty `hu` by Valid
  `has_` Error @Imbalance `ha` Missing `ha` Closed `ha` this @Shape `ha` top @(Nonempty List)

example = Nonempty @List
 `ha` Item (Opened Round) `ha` Next
 `ha` Item (Closed Angle) `ha` Last

main = by example
 `yokl` Forth `ha` Apply `ha__` analyze `has_` deposit `hc___` empty @List
 `yok_` Check `ha` remnant `ha'st` that @(List Shape)
 `yi__` Error `hu` "[ERROR] Missing or mismatching bracket!" `ho` is @(List ASCII)
   `has_` Valid `hu` "[VALID] Everything is seem to be good."
 `yokl` Forth `ha` Await `ha` output

