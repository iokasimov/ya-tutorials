import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Title = List ASCII

type Mark = Unit `S` Unit

pattern TODO e = This e
pattern DONE e = That e

type Task = Mark `P` Title

pattern Bullet e = This e
pattern Cursor e = That e

type Move = Shifter List

type Command = Move `S` Mark

pattern Move x = This x
pattern Mark x = That x

print cursor (These status task) = intro @World `hv` Unit
 `yuk___` Run `hv____` hand cursor `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` mark status `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` task `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` output `ha` Caret `hv` by Newline

hand cursor = is @Title `hv__` Bullet `hu` "  -  " `la` Cursor `hu` "  -> " `li` cursor

mark status = is @Title `hv__` TODO `hu` "TODO " `la` DONE `hu` "DONE " `li` status

press k f p = Maybe `hv___` k `hv` Unit `lu'q` p `yi` dim `yiu` f Unit

apply = is @(ASCII `M` Glyph `S_` Glyph `M` Letter) `hu` by Wrong
  `la____` press `hv` (Lower `ha` J) `hv` (Move `ha` Down)
  `lo'ys'la` First `ha` press (Lower `ha` K) (Move `ha` Lift)
  `lo'ys'la` First `ha` press (Upper `ha` T) (Mark `ha` TODO)
  `lo'ys'la` First `ha` press (Upper `ha` D) (Mark `ha` DONE)

start = to @(Scrolling List) `ha` Nonempty @List @Task
 `ha_` Next `ho` Item (by TODO `lu` "Apply to that new position")
 `ha_` Next `ho` Item (by TODO `lu` "Find a way to fix ligatures")
 `ha_` Next `ho` Item (by TODO `lu` "Organize a boardgame session")
 `ha_` Last `ho` Item (by DONE `lu` "Buy a water gun for Songkran")

draft = intro @(State `T'I` Scrolling List Task `JNT` World) Unit
 `yuk____` World `hv__` prepare `lu'yp` Await `hv` clear
 `yuk____` State `ho` Old `hv___` Event `hv` auto `ha_` Scope `ha` shaft `hv` by Passed `yok____` World `ha_'yokl` Prior `ha` Run `ha` print (by Bullet)
 `yuk____` State `ho` Old `hv___` Event `hv` auto `ha_` Scope `hv` focus `ho` Scope it `yok____` World `ha_'yokl` Forth `ha` Run `ha` print (by Cursor)
 `yuk____` State `ho` Old `hv___` Event `hv` auto `ha_` Scope `ha` shaft `hv` by Future `yok____` World `ha_'yokl` Forth `ha` Run `ha` print (by Bullet)
 `yuk____` World `hv___` input `yok` Retry @Command `ha` apply `ha_` on @Glyph `ho'ho` on @Letter `ho` unwrap @(AR)
 `yok____` State `ho` New `ha___` Event `ha_` shift `ho'ho` dim @(Optional Task)
  `la____` State `ho` New `ha___` Event `ha_` relay `ho'ho` dim @Mark
  `ho__'ha` Scope `hv` focus `ho_'he` Scope `hv` at @Mark
 `yok____` Again `ha` Once

-- Scope `hv` at @ASCII
-- Shall `hv` be @Glyph
-- Shall `hv` be @Symbol
-- Match `hv` on @Symbol

main = draft `he'he'hv` by start
