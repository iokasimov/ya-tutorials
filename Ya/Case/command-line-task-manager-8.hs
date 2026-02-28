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
  `ho__'yuk` Await `ha` output `ha` Caret `har'st` Newline

line = is @(Cursor `P` (Status `P` String))
 `yio'yio'yoi` TODO `hu` "TODO " `has` DONE `hu` "DONE "
 `yio'yio` morph @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List) `ha` Clasp
 `yio'yoi` Focus `hu` "  -> " `has` Exist `hu` "   - "
 `yio` morph @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List) `ha` Clasp

start = Adapt @(Nonempty List) `ho` morph @(Scrolling List)
 `ha___` Build `ha` (`hjd_` TODO `st'hjd` "Apply to that new position")
 `ha___` Exist `ha` (`hjd_` TODO `st'hjd` "Organize a boardgame session")
 `ha___` Exist `ha` (`hjd_` DONE `st'hjd` "Buy a water gun for Songkran")
 `ha___` Exist `ha` (`hjd_` TODO `st'hjd` "Find a way to fix ligatures")
 `har___'st` Empty

pattern Motion e = This e
pattern Status e = That e

match = Enter `ha_` morph `ha` Stump `ha` Stops `ha'hjd'eq` (Glyph `ha` Letter `ha` Lower `har'st` J) `ho'yu` (Motion `har'st` Below)
 `hop_'ys'has` Check `ha_` morph `ha` Stump `ha` Stops `ha'hjd'eq` (Glyph `ha` Letter `ha` Lower `har'st` K) `ho'yu` (Motion `har'st` Above)
 `hop_'ys'has` Check `ha_` morph `ha` Stump `ha` Stops `ha'hjd'eq` (Glyph `ha` Letter `ha` Upper `har'st` T) `ho'yu` (Status `har'st` TODO)
 `hop_'ys'has` Check `ha_` morph `ha` Stump `ha` Stops `ha'hjd'eq` (Glyph `ha` Letter `ha` Upper `har'st` D) `ho'yu` (Status `har'st` DONE)

process = Unit `ryu` Enter @(World `JNT` State Table)
 `yuk____` Await `har` clear `hjd_'yp` Await `har` prepare
 `yuk____` Lease `ha` State `ha` Event `har` fetch
 `yok____` Await `ha` print
 `yuk____` Await `har` input `yok__` Retry `ha_'yok` Check `ha` match
 `yok____` Apply `ha` State `ha___` Event `ha` shift `ho'hu` Unit
  `has____` Apply `ha` State `ha____` Event `ha` relay `ho'hu` Unit
 `ho___'ha` Scope `har` field @(Alone Task)
  `ho__'st` Scope `har` field @Status
 `yuk____` Again `har'st` Same

main = process `bt'har` start
