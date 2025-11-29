import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Status = Unit `S` Unit

pattern TODO e = This e
pattern DONE e = That e

type Task = Status `P` String

type Cursor = Unit `S` Unit

block tasks = tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'he` line `ha` swap
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hv'he` Newline

line = is @(Cursor `P` (Status `P` String))
 `yio'yio'yoi` TODO `hu` "TODO " `la` DONE `hu` "DONE "
 `yio'yio` to @(Nonempty List) `ha` Merge @(Nonempty List)
 `yio'yoi` Focus `hu` "  -> " `la` Exist `hu` "   - "
 `yio` to @(Nonempty List) `ha` Merge @(Nonempty List)

start = empty @Maybe
 `lu` (unwrap TODO `lu` "Apply to that new position") `yi` Exist
 `lu` (unwrap TODO `lu` "Organize a boardgame session") `yi` Exist
 `lu` (unwrap DONE `lu` "Buy a water gun for Songkran") `yi` Exist
 `lu` (unwrap TODO `lu` "Find a way to fix ligatures") `yi` Build
 `yi` is @(Nonempty List `T'I` Task)
 `ho` to @(Scrolling List)

match = exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` J `ho'yo` Down
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` K `ho'yo` Lift `ho` Check

process = intro @(World `JNT` Task `I'T` Scrolling List `I'T` State) `hv` Unit
 `yuk_` Await `hv` prepare `lu'yp` Await `hv` clear
 `yuk_` Lease `ha` State `ha` Event `hv` fetch
 `yok_` Await `ha` block
 `yuk_` Await `hv` input `yok` Retry `ha` match
 `yok_` Apply `ha` State `ha` Event `ha` shift
 `yuk_` Again `hv'he` Same

main = process `he'he'hv` start
