import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Parenthesis = Unit `S` Unit

deposit bracket = intro @(Halts `JNT` State `T` List _) Unit
 `yuk__` New `ha` State `ha` Event `hv` push @List bracket

analyze _______ = intro @(Halts `JNT` State `T` List _) Unit
 `yuk__` New `ha` State `ha` Event `hv` pop @List
 `yok__` Try `ha__` Empty `hu` by Error `la` Exist `hu` by Valid

remnant = Empty `hu` by Valid
 `la` Nonempty @List `he'hu` by Error

example = Nonempty @List @Parenthesis
 `ha` Item (Opened Unit) `ha` Next
 `ha` Item (Closed Unit) `ha` Last

main = by example
 `yokl` Forth `ha` Run `ha__` deposit `la` analyze `he'he'hv___` empty @List
 `yok_` Check `ha` remnant `ha'he` that @(List Unit)
 `yi__` Error `hu` "[ERROR] We missed some bracket, oh my!" `ho` is @(List ASCII)
   `la` Valid `hu` "[VALID] Everything is seem to be good."
 `yokl` Forth `ha` Run `ha` output
