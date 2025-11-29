import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Status = Unit `S` Unit

pattern TODO e = This e
pattern DONE e = That e

type Task = Status `P` String

start = that `ha` sub @Tree @List @Task
    `hv_` intro @Tree `hv` (unwrap TODO `lu` "Apply to that new position")
 `hv____` push `ho'ho` that
    `hv_` intro @Tree `hv` (unwrap DONE `lu` "Find their HR on Linkedin and ask on it")
  `ha___` push `ho'ho` that
   `hv__` that `ha` sub @Tree
    `hv_` intro @Tree `hv` (unwrap TODO `lu` "Check their open source contributions")
    `hv_` intro @List `hv` intro @Tree (unwrap TODO `lu` "Bail if you see AI slop there")
  `ha___` push `ho'ho` that
    `hv_` intro @Tree `hv` (unwrap TODO `lu` "Try to find people who work there")
  `hv___` empty @List

type Indent = List Unit

indent level = level
 `yok_` Plane @List
 `ha__'yo` Glyph `ha` Symbol `ha` Punctuate
 `ha__` to @List @Twice
 `ha__` Space `lo` Space

main = start
 `kyokl` Depth `ha` Forth `ha` Await 
 `ha___` at `ho` this @Indent `ho` indent
   `lo_` is `hu` "TODO " `la` is `hu` "DONE "
   `ha_` at `ho` this @Status
  `ho__` to @List `ha` Merge @List @List
   `lo_` at `ho` this @String `ho` to @List
  `ho__` to @List `ha` Merge @List
  `ho__'yokl` Forth `ha` Await `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hv'he` Newline