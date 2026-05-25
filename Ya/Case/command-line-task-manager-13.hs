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
    `har___` TODO `st'hjd` "Apply to that new position" `ryu` Enter @Tree
 `har______` push `ho'ho` that
      `har_` (DONE `st'hjd` "Find their HR on Linkedin and ask on it" `ryu` Enter @Tree)
    `ha___` push `ho'ho` that
     `har__` that `ha` sub @Tree
      `har_` (TODO `st'hjd` "Check their open source contributions" `ryu` Enter @Tree)
      `har_` (TODO `st'hjd` "Bail if you see AI slop there" `ryu` Enter @Tree `ryu` Enter @List)
    `ha___` push `ho'ho` that
      `har_` (IDEA `st'hjd` "Try to find people who work there" `ryu` Enter @Tree)
  `har_____` empty @List

pattern Motion e = This e
pattern Status e = That e

match = exact `ha` Glyph `ha` Letter `ha` Lower `har'st` J `ho'yo` (Motion `ha` Aside `ha` Below)
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `har'st` K `ho'yo` (Motion `ha` Aside `ha` Above) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `har'st` L `ho'yo` (Motion `ha` Pitch `ha` Below) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `har'st` H `ho'yo` (Motion `ha` Pitch `ha` Above) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Upper `har'st` T `ho'yo` (Status `ha` TODO) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Upper `har'st` D `ho'yo` (Status `ha` DONE) `ho` Check

print tasks =
 Adapt @(Scrolling Tree) `ho` morph @Tree
 `har___` tasks `kyo` Focus
 `kyokl` Depth `ha` Forth `ha` Await `ha___` line
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yok'ut` Await `ha` output `ha` Caret `har'st` Newline

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

type Board = Scrolling Tree

type Altered = Scrolling List

process = Unit `ryu` Enter @(World `JNT` State `T'I` Altered `T` Board Task)
 `yok____'ut` Await `har` clear `hjd_'yp` Await `har` prepare
 `yok____'ut` Lease `ha_` State `har___` Event `har` fetch
    `ha__` Scope `har` point @Alone `ha` Locus
 `yok____` Await `ha_` print `ha` supertype @(AR)

 -- `yuk____` Await `har_` input `yok___` Retry `ha_'yok` Check `ha` match
 -- `yok____` Apply `ha_` State `ha____` Event `ha` shift `ho'hu` Unit
 --  `has____` Apply `ha_` State `ha____` Event `ha` relay `ho'hu` Unit 
 -- `ho___'ha` Scope `har_` point @Tree `ha` Focus @(Board Task)
 --    `ho__` Scope `har_` point @Tree `ha` Locus @Tree
 --    `ho__` Scope `har_` point @Alone `ha` Root @Tree
 --    `ho__` Scope `har_` field @Status
 -- `yuk____` Again `har'st` Same

main = process `bt'har__` Adapt @Tree `ho` morph @(Scrolling Tree) `har` start `ryu` Enter @Altered
