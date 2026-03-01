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

block tasks = tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'st` line `ha` swap
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `har'st` Newline

line = is @(Cursor `P` (Status `P` String))
 `yio'yio'yoi` TODO `hu` "TODO " `has` DONE `hu` "DONE "
 `yio'yio` morph @(Nonempty List) `ha` Merge @(Nonempty List) `ha` Clasp
 `yio'yoi` Focus `hu` "  -> " `has` Exist `hu` "   - "
 `yio` morph @(Nonempty List) `ha` Merge @(Nonempty List) `ha` Clasp

start = Adapt @(Nonempty List) `ho` morph @(Scrolling List)
 `ha___` Build `ha` (`hjd__'tb` is @Task `har_` TODO `st'hjd` "Apply to that new position")
 `ha___` Exist `ha` (`hjd__'tb` is @Task `har_` TODO `st'hjd` "Organize a boardgame session")
 `ha___` Exist `ha` (`hjd__'tb` is @Task `har_` DONE `st'hjd` "Buy a water gun for Songkran")
 `ha___` Exist `ha` (`hjd__'tb` is @Task `har_` TODO `st'hjd` "Find a way to fix ligatures")
 `har__'st` Empty

process = Unit `ryu` Enter @(World `JNT` State Table)
 `yuk______` Await `har` clear `hjd_'yp` Await `har` prepare
 `yuk______` Lease `ha_` State `ha` Event `har` fetch
 `yok______` Await `ha_` block
 `yuk______` Await `har` input `yok___` Retry
  `ha___'yok` Check `ha_` morph `ha` Stump `ha` Stops `ha'hjd'eq` (Glyph `ha` Letter `ha` Lower `har'st` J) `ho'yu` (is `har'st` Below)
   `hop_'ys'has` Check `ha_` morph `ha` Stump `ha` Stops `ha'hjd'eq` (Glyph `ha` Letter `ha` Lower `har'st` K) `ho'yu` (is `har'st` Above)
 `yok______` Apply `ha_` State `ha` Event `ha` shift
 `yuk______` Again `har'st` Same

main = process `bt'har` start
