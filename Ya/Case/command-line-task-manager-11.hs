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
      `har` (is @Task `har_` DONE `st'hjd'tb` "Find their HR on Linkedin and ask on it" `ryu` Enter @Tree)
    `ha___` push `ho'ho` that
     `har_` that `ha` sub @Tree
      `har` (is @Task `har_` TODO `st'hjd'tb` "Check their open source contributions" `ryu` Enter @Tree)
      `har` (is @Task `har_` TODO `st'hjd'tb` "Bail if you see AI slop there" `ryu` Enter @Tree `ryu` Enter @List)
    `ha___` push `ho'ho` that
      `har` (is @Task `har_` IDEA `st'hjd'tb` "Try to find people who work there" `ryu` Enter @Tree)
  `har____` empty @List

pattern Motion e = This e
pattern Status e = That e

match = (exact `ha` Glyph `ha` Letter `ha` Lower `har'st` J) `ho'yo` (Motion `ha` Aside `ha` Below)
 `hop'ys'has` (exact `ha` Glyph `ha` Letter `ha` Lower `har'st` K) `ho'yo` (Motion `ha` Aside `ha` Above) `ho` Check
 `hop'ys'has` (exact `ha` Glyph `ha` Letter `ha` Lower `har'st` L) `ho'yo` (Motion `ha` Pitch `ha` Below) `ho` Check
 `hop'ys'has` (exact `ha` Glyph `ha` Letter `ha` Lower `har'st` H) `ho'yo` (Motion `ha` Pitch `ha` Above) `ho` Check
 `hop'ys'has` (exact `ha` Glyph `ha` Letter `ha` Upper `har'st` T) `ho'yo` (Status `ha` TODO) `ho` Check
 `hop'ys'has` (exact `ha` Glyph `ha` Letter `ha` Upper `har'st` D) `ho'yo` (Status `ha` DONE) `ho` Check

print tasks =
 Adapt @(Scrolling Tree) `ho` morph @Tree
 `har__` tasks `kyo` Focus
 `kyokl` Depth `ha` Forth `ha` Await `ha___` line
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `har'st` Newline

type Indent = List Unit

indent level = level
 `yok_` Plane @List
 `ha__'yo` Glyph `ha` Symbol `ha` Punctuate
 `ha__` Adapt @Twice `ho` morph @List
 `ha__` Space `hop'tb` Space

-- line :: Status `I'T` Along String `I'T` Along Cursor `I'T` Along Indent `AR__` List ASCII
line = field `ho` this @Indent `ho` indent
  `hop_` is `hu` " -> " `has` is `hu` "  - " `ha_` field `ho` this @Cursor
 `ho__` morph @List `ha` Merge @List @List `ha` Clasp
  `hop_` is `hu` "IDEA " `has` is `hu` "TODO " `has` is `hu` "DONE " `ha_` field `ho` this @Status
 `ho__` morph @List `ha` Merge @List @List `ha` Clasp
  `hop_` field `ho` this @String `ho` Adapt `ho` morph @List
 `ho__` morph @List `ha` Merge @List `ha` Clasp

process = Unit `ryu` Enter @(World `JNT` State `T'I` Scrolling Tree `T` Task)
 `yuk____` Await `har` clear `hjd_'yp` Await `har` prepare
 `yuk____` Lease `ha_` State `ha` Event `har` fetch
 `yok____` Await `ha_` print
 `yuk____` Await `har` input `yok___` Retry `ha_'yok` Check `ha` match
 `yok____` Apply `ha_` State `ha____` Event `ha` shift `ho'hu` Unit
  `has____` Apply `ha_` State `ha____` Event `ha` relay `ho'hu` Unit 
 `ho___'ha` Scope `har` point @Tree `ha` Locus @Tree
    `ho__` Scope `har` point @Alone `ha` Root @Tree
    `ho__` Scope `har` field @Status @(Alone Task)
 `yuk____` Again `har'st` Same

main = process `bt'har_` Adapt @Tree `ho` morph @(Scrolling Tree) `har` start
