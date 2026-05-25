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
    `har__` TODO `st'hjd'tb` "Apply to that new position" `ryu` Enter @Tree
 `har_____` push `ho'ho` that
      `har` (DONE `st'hjd'tb` "Find their HR on Linkedin and ask on it" `ryu` Enter @Tree)
    `ha___` push `ho'ho` that
     `har_` that `ha` sub @Tree
      `har` (TODO `st'hjd'tb` "Check their open source contributions" `ryu` Enter @Tree)
      `har` (TODO `st'hjd'tb` "Bail if you see AI slop there" `ryu` Enter @Tree `ryu` Enter @List)
    `ha___` push `ho'ho` that
      `har` (IDEA `st'hjd'tb` "Try to find people who work there" `ryu` Enter @Tree)
  `har____` empty @List

pattern Motion e = This e
pattern Change e = That e

type Command = Shifter Tree `S` Status

print tasks =
 Adapt @(Scrolling Tree) @Tree `ho` derive
 `har__` tasks `kyo` Focus
 `kyokl` Depth `ha` Forth `ha` Await `ha___` line
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yok'ut` Await `ha` output `ha` Caret `har'st` Newline

type Indent = List Unit

indent level = level
 `yok_` Plane @List
 `ha__'yo` Glyph `ha` Symbol `ha` Punctuate
 `ha__` Adapt @Twice `ho` derive
 `ha__` Space `hop'tb` Space

-- line :: Change `I'T` Along String `I'T` Along Cursor `I'T` Along Indent `AR__` List ASCII
line = field `ho` this @Indent `ho` indent
  `hop_` is `hu` " -> " `has` is `hu` "  - " `ha_` field `ho` this @Cursor
 `ho__` derive `ha` Merge `ha` Clasp @List @List
  `hop_` is `hu` "IDEA " `has` is `hu` "TODO " `has` is `hu` "DONE " `ha_` field `ho` this @Status
 `ho__` derive `ha` Merge `ha` Clasp @List @List
  `hop_` field `ho` this @String `ho` Adapt `ho` derive
 `ho__` derive `ha` Merge `ha` Clasp @List @List

process = Unit `ryu` Enter @(World `JNT` State `T'I` Scrolling Tree `T` Task)
 `yok______'ut` Await `har` clear `hjd_'yp` Await `har` prepare
 `yok______'ut` Lease `ha_` State `ha` Event `har` fetch
 `yok______` Await `ha_` print
 `yok______'ut` Await `har` input `yok___` Retry
 `ha____'yok` Check `ha_` derive `ha` Stump `ha` Stops `ha` on @Glyph @ASCII
  `ho___'yok` Check `ha_` derive `ha` Stump `ha` Stops `ha` on @Letter @Glyph
  `ho___'yok` Check `ha_` derive `ha` Stump `ha` Stops `ha'hjd'eq` (Lower `har'st` J) `ho'yu` (Motion `ha` Aside `har'st` Below)
   `hop_'ys'has` Check `ha_` derive `ha` Stump `ha` Stops `ha'hjd'eq` (Lower `har'st` K) `ho'yu` (Motion `ha` Aside `har'st` Above)
   `hop_'ys'has` Check `ha_` derive `ha` Stump `ha` Stops `ha'hjd'eq` (Lower `har'st` L) `ho'yu` (Motion `ha` Pitch `har'st` Below)
   `hop_'ys'has` Check `ha_` derive `ha` Stump `ha` Stops `ha'hjd'eq` (Lower `har'st` H) `ho'yu` (Motion `ha` Pitch `har'st` Above)
   `hop_'ys'has` Check `ha_` derive `ha` Stump `ha` Stops `ha'hjd'eq` (Upper `har'st` T) `ho'yu` (Change `har'st` TODO)
   `hop_'ys'has` Check `ha_` derive `ha` Stump `ha` Stops `ha'hjd'eq` (Upper `har'st` D) `ho'yu` (Change `har'st` DONE)
 `yok______` Apply `ha_` State `ha_____` Event `ha` shift `ho'hu` Unit
  `has______` Apply `ha_` State `ha_____` Event `ha` relay `ho'hu` Unit
   `ho___'ha` Scope `har` Locus @Tree `ho` Root @Alone `ho` within `ho__` Scope `har` field @Status
 `yok______'ut` Again `har'st` Same

main = process `bt'har_` Adapt @Tree @(Scrolling Tree) `ho` derive `har` start
