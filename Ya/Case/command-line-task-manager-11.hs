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
 Adapt @(Scrolling Tree) `ho` morph @Tree
 `hc___` tasks `kyo` Focus
 `kyokl` Depth `ha` Forth `ha` Await `ha___` line
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hc'st` Newline

type Indent = List Unit

indent level = level
 `yok_` Plane @List
 `ha__'yo` Glyph `ha` Symbol `ha` Punctuate
 `ha__` Adapt @Twice `ho` morph @List
 `ha__` Space `hop` Space

-- line :: Status `I'T` Along String `I'T` Along Cursor `I'T` Along Indent `AR__` List ASCII
line = field `ho` this @Indent `ho` indent
   `hop_` is `hu` " -> " `has` is `hu` "  - " `ha_` field `ho` this @Cursor
  `ho__` morph @List `ha` Merge @List @List `ha` Clasp
   `hop_` is `hu` "IDEA " `has` is `hu` "TODO " `has` is `hu` "DONE " `ha_` field `ho` this @Status
  `ho__` morph @List `ha` Merge @List @List `ha` Clasp
   `hop_` field `ho` this @String `ho` Adapt `ho` morph @List
  `ho__` morph @List `ha` Merge @List `ha` Clasp

draft = Unit `_ryu` Enter @(World `JNT` Task `I'T` Scrolling Tree `I'T` State)
 `yuk____` Await `hc_` clear `hjd'yp` Await `hc` prepare
 `yuk____` Lease `ha_` State `ha` Event `hc_` fetch
 `yok____` Await `ha_` print
 `yuk____` Await `hc_` input `yok___` Retry `ha_'yok` Check `ha` match
 `yok____` Apply `ha_` State `ha____` Event `ha` shift `ho'hu` Unit
  `has____` Apply `ha_` State `ha____` Event `ha` relay `ho'hu` Unit 
 `ho___'ha` Scope `hc_` point @Tree `ha` Locus @Tree
    `ho__` Scope `hc_` point @Alone `ha` Root @Tree
    `ho__` Scope `hc_` field @Status
 `yuk____` Again `hc'st` Same

main = draft `hc_` Adapt @Tree `ho` morph @(Scrolling Tree) `hc` start
