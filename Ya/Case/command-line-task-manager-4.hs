import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Cursor = Unit `S` Unit

display tasks = tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'he` swap @(Cursor `P` String)
  `ho__'yoi` Focus `hu` "  -> " `la` Exist `hu` "   - "
  `ho__` to @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List)
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hv'he` Newline

start = empty @Maybe
 `lu` "Apply to that new position" `yi` Exist
 `lu` "Organize a boardgame session" `yi` Exist
 `lu` "Buy a water gun for Songkran" `yi` Exist
 `lu` "Find a way to fix ligatures" `yi` Build
 `yi` is @(Nonempty List String)
 `ho` to @(Scrolling List)

main = display `ha` that @(Scrolling List String) `hv__` shift `hv'he` Below `hv` start