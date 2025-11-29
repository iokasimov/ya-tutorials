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

print tasks = tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'he` line `ha` swap
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hv'he` Newline

line = is @(Cursor `P` (Status `P` String))
 `yio'yio'yoi` TODO `hu` "TODO " `la` DONE `hu` "DONE "
 `yio'yio` to @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List)
 `yio'yoi` Focus `hu` "  -> " `la` Exist `hu` "   - "
 `yio` to @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List)

start = empty @Maybe
 `lu` (is `hv'he` TODO `lu` "Apply to that new position") `yi` Exist
 `lu` (is `hv'he` TODO `lu` "Organize a boardgame session") `yi` Exist
 `lu` (is `hv'he` DONE `lu` "Buy a water gun for Songkran") `yi` Exist
 `lu` (is `hv'he` TODO `lu` "Find a way to fix ligatures") `yi` Build
 `yi` is @(Nonempty List `T'I` Task)
 `ho` to @(Scrolling List)
 `ho` to @(Scrolling Tree)

type Command = Shifter List `S` Status

pattern Move e = This e
pattern Status e = That e

match = exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` J `ho'yo` (Move `ha` Down)
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` K `ho'yo` (Move `ha` Lift) `ho` Check
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Upper `hv'he` T `ho'yo` (Status `ha` TODO) `ho` Check
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Upper `hv'he` D `ho'yo` (Status `ha` DONE) `ho` Check

process = intro @(World `JNT` Task `I'T` Scrolling Tree `I'T` State) `hv` Unit
 `yuk_____` Await `hv` clear `lu'yp` Await `hv` prepare
 -- `yuk_____` Lease `ha` State `ha` Event `hv` fetch
 -- `yok_____` Await `ha` print
 -- `yuk_____` Await `hv` input `yok__` Retry `ha` match
 -- `yok_____` Apply `ha` State `ha___` Event `ha` shift `ho'hu` Unit
 --   `la____` Apply `ha` State `ha___` Event `ha` relay `ho'hu` Unit
 --   `ho__'ha` Scope `hv` at @(Alone Task)
 --    `ho_'he` Scope `hv` at @Status
 -- `yuk_____` Again `hv'he` Same

main = process `he'he'hv` start
