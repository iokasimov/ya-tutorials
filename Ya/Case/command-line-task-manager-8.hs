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

type Table = Scrolling List Task

print tasks = tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'st` line `ha` swap
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hc'st` Newline

line = is @(Cursor `P` (Status `P` String))
 `yio'yio'yoi` TODO `hu` "TODO " `has` DONE `hu` "DONE "
 `yio'yio` to @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List) `ha` Clasp
 `yio'yoi` Focus `hu` "  -> " `has` Exist `hu` "   - "
 `yio` to @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List) `ha` Clasp

start = Adapt @(Nonempty List) `ho` to @(Scrolling List)
 `ha___` Build `ha` (`hjd_` TODO `st'hjd` "Apply to that new position")
 `ha___` Exist `ha` (`hjd_` TODO `st'hjd` "Organize a boardgame session")
 `ha___` Exist `ha` (`hjd_` DONE `st'hjd` "Buy a water gun for Songkran")
 `ha___` Exist `ha` (`hjd_` TODO `st'hjd` "Find a way to fix ligatures")
 `hc___'st` Empty

pattern Motion e = This e
pattern Status e = That e

match = exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` J `ho'yo` (Motion `ha` Below)
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` K `ho'yo` (Motion `ha` Above) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Upper `hc'st` T `ho'yo` (Status `ha` TODO) `ho` Check
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Upper `hc'st` D `ho'yo` (Status `ha` DONE) `ho` Check

draft = Unit `ryu` Enter @(World `JNT` State Table)
 `yuk___` Await `hc` clear `hjd'yp` Await `hc` prepare
 `yuk___` Lease `ha` State `ha` Event `hc` fetch
 `yok___` Await `ha` print
 `yuk___` Await `hc` input `yok__` Retry `ha_'yok` Check `ha` match
 `yok___` Apply `ha` State `ha___` Event `ha` shift `ho'hu` Unit
  `has___` Apply `ha` State `ha___` Event `ha` relay `ho'hu` Unit
   `ho__'ha` Scope `hc` at @(Alone Task)
    `ho_'st` Scope `hc` at @Status
 `yuk___` Again `hc'st` Same

main = draft `hc` start
