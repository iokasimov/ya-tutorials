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
    `hc___` TODO `st'hjd` "Apply to that new position" `ryu` Enter @Tree
 `hc______` push `ho'ho` that
      `hc_` (DONE `st'hjd` "Find their HR on Linkedin and ask on it" `ryu` Enter @Tree)
    `ha___` push `ho'ho` that
     `hc__` that `ha` sub @Tree
      `hc_` (TODO `st'hjd` "Check their open source contributions" `ryu` Enter @Tree)
      `hc_` (TODO `st'hjd` "Bail if you see AI slop there" `ryu` Enter @Tree `ryu` Enter @List)
    `ha___` push `ho'ho` that
      `hc_` (IDEA `st'hjd` "Try to find people who work there" `ryu` Enter @Tree)
  `hc_____` empty @List

pattern Motion e = This e
pattern Status e = That e

match = exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` J `ho'yo` (Motion `ha` Aside `ha` Below)
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` K `ho'yo` (Motion `ha` Aside `ha` Above) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` L `ho'yo` (Motion `ha` Pitch `ha` Below) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` H `ho'yo` (Motion `ha` Pitch `ha` Above) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Upper `hc'st` T `ho'yo` (Status `ha` TODO) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Upper `hc'st` D `ho'yo` (Status `ha` DONE) `ho` Check

print tasks =
 Adapt `ho` to @Tree
 `hc___` tasks `kyo` Focus
 `kyokl` Depth `ha` Forth `ha` Await `ha___` line
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hc'st` Newline

type Indent = List Unit

indent level = level
 `yok_` Plane @List
 `ha__'yo` Glyph `ha` Symbol `ha` Punctuate
 `ha__` Adapt @Twice `ho` to @List
 `ha__` Space `hop` Space

-- line :: Status `I'T` Along String `I'T` Along Cursor `I'T` Along Indent `AR__` List ASCII
line = at `ho` this @Indent `ho` indent
   `hop_` is `hu` " -> " `has` is `hu` "  - "
   `ha_` at `ho` this @Cursor
  `ho__` to @List `ha` Merge @List @List `ha` Clasp
   `hop_` is `hu` "IDEA " `has` is `hu` "TODO " `has` is `hu` "DONE "
   `ha_` at `ho` this @Status
  `ho__` to @List `ha` Merge @List @List `ha` Clasp
   `hop_` at `ho` this @String `ho` Adapt `ho` to @List
  `ho__` to @List `ha` Merge @List `ha` Clasp

draft = Unit `ryu` Enter @(World `JNT` Task `I'T` Scrolling Tree `I'T` State)
 `yuk___` Await `hc` clear `hjd'yp` Await `hc` prepare
 `yuk___` Lease `ha` State `ha` Event `hc` fetch
 `yok___` Await `ha` print
 `yuk___` Await `hc` input `yok__` Retry `ha_'yok` Check `ha` match
 `yok___` Apply `ha` State `ha___` Event `ha` shift `ho'hu` Unit
  `has___` Apply `ha` State `ha___` Event `ha` relay `ho'hu` Unit 
 `ho__'ha` Scope `hc` at @(Tree Task) `ho_` Scope `hc` top @Tree `ho_` Scope `hc` at @Status
 `yuk___` Again `hc'st` Same

main = draft `hc_` Adapt @Tree `ho` to @(Scrolling Tree) `hc` start
