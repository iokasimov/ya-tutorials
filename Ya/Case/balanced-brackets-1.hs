import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Parenthesis = Unit `S` Unit

deposit bracket = intro @(Halts `JNT` State `T` List _) Unit
 `yuk__` New `ha` State `ha` Event `hc` push @List bracket

analyze _______ = intro @(Halts `JNT` State `T` List _) Unit
 `yuk__` New `ha` State `ha` Event `hc` pop @List
 `yok__` Try `ha__` Empty `hu` super Error `has_` Exist `hu` super Valid

remnant = Empty `hu` super Valid
 `has_` Nonempty @List `st'hu` super Error

example = Nonempty @List @Parenthesis
 `ha` Item (Opened Unit) `ha` Next
 `ha` Item (Closed Unit) `ha` Last

main = super example
 `yokl` Forth `ha` Apply `ha__` deposit `has_` analyze `hc___` empty @List
 `yok_` Check `ha` remnant `ha'st` that @(List Unit)
 `yi__` Error `hu` "[ERROR] We missed some bracket, oh my!" `ho` is @(List ASCII)
   `has_` Valid `hu` "[VALID] Everything is seem to be good."
 `yokl` Forth `ha` Apply `ha` output
