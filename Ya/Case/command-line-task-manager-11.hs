import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Status = Unit `S` Unit `S` Unit

pattern IDEA e = This (This e)
pattern TODO e = This (That e)
pattern DONE e = That e

type Task = Along String Status

type Cursor = Unit `S` Unit

start = that `ha` sub @Tree @List @Task
    `hv_` intro @Tree `hv` (unwrap TODO `lu` "Apply to that new position")
 `hv____` push `ho'ho` that
    `hv_` intro @Tree `hv` (unwrap DONE `lu` "Find their HR on Linkedin and ask on it")
  `ha___` push `ho'ho` that
   `hv__` that `ha` sub @Tree
    `hv_` intro @Tree `hv` (unwrap TODO `lu` "Check their open source contributions")
    `hv_` intro @List `hv` intro @Tree (unwrap TODO `lu` "Bail if you see AI slop there")
  `ha___` push `ho'ho` that
    `hv_` intro @Tree `hv` (unwrap IDEA `lu` "Check out people who work there")
  `hv___` empty @List

pattern Motion e = This e
pattern Status e = That e

match = exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` J `ho'yo` (Motion `ha` Aside `ha` Below)
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` K `ho'yo` (Motion `ha` Aside `ha` Above) `ho` Check
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` L `ho'yo` (Motion `ha` Pitch `ha` Below) `ho` Check
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` H `ho'yo` (Motion `ha` Pitch `ha` Above) `ho` Check
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Upper `hv'he` T `ho'yo` (Status `ha` TODO) `ho` Check
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Upper `hv'he` D `ho'yo` (Status `ha` DONE) `ho` Check

print tasks = tasks
 `kyo` Focus `yi_` to @Tree
 `kyokl` Depth `ha` Forth `ha` Await
 `ha___` line
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hv'he` Newline

type Indent = List Unit

indent level = level
 `yok_` Plane @List
 `ha__'yo` Glyph `ha` Symbol `ha` Punctuate
 `ha__` to @List @Twice
 `ha__` Space `lo` Space

-- line :: Status `I'T` Along String `I'T` Along Cursor `I'T` Along Indent `AR__` List ASCII
line = at `ho` this @Indent `ho` indent
   `lo_` is `hu` " -> " `la` is `hu` "  - "
   `ha_` at `ho` this @Cursor
  `ho__` to @List `ha` Merge @List @List
   `lo_` is `hu` "IDEA " `la` is `hu` "TODO " `la` is `hu` "DONE "
   `ha_` at `ho` this @Status
  `ho__` to @List `ha` Merge @List @List
   `lo_` at `ho` this @String `ho` to @List
  `ho__` to @List `ha` Merge @List

process = intro @(World `JNT` Task `I'T` Scrolling Tree `I'T` State) `hv` Unit
 `yuk_____` Await `hv` clear `lu'yp` Await `hv` prepare
 `yuk_____` Lease `ha` State `ha` Event `hv` fetch
 -- `yok_____` Await `ha` print `ha` to @Tree
 `yok_____` Await `ha` print
 `yuk_____` Await `hv` input `yok__` Retry `ha` match
 `yok_____` Apply `ha` State `ha___` Event `ha` shift `ho'hu` Unit
   `la____` Apply `ha` State `ha___` Event `ha` relay `ho'hu` Unit 
   `ho__'ha` Scope `hv` at @(Tree Task) `ho_` Scope `hv` top @Tree `ho_` Scope `hv` at @Status
 `yuk_____` Again `hv'he` Same

main = process `he'he'hv_` to @(Scrolling Tree) `hv` start
