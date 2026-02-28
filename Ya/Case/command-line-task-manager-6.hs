import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Cursor = Unit `S` Unit

type Table = Scrolling List String

print tasks = is @Table `har` tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'st` swap @(Cursor `P` String)
  `ho__'yoi` Focus `hu` "  -> " `has` Exist `hu` "   - "
  `ho__` morph @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List) `ha` Clasp
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `har'st` Newline

start = Adapt @(Nonempty List) `ho` morph @(Scrolling List)
 `ha___` Build `ha` (`hjd` "Apply to that new position")
 `ha___` Exist `ha` (`hjd` "Organize a boardgame session")
 `ha___` Exist `ha` (`hjd` "Buy a water gun for Songkran")
 `ha___` Exist `ha` (`hjd` "Find a way to fix ligatures")
 `har__'st` Empty


draft = Unit `ryu` Enter @(World `JNT` State Table)
 `yuk______` Await `har` clear `hjd_'yp` Await `har` prepare
 `yuk______` Lease `ha_` State `ha` Event `har` fetch
 `yok______` Await `ha_` print
 `yuk______` Await `har` input `yok___` Retry
  `ha___'yok` Check `ha_` morph `ha` Stump `ha` Stops `ha'hjd'eq` (Glyph `ha` Letter `ha` Lower `har'st` J) `ho'yu` (is `har'st` Below)
   `hop_'ys'has` Check `ha_` morph `ha` Stump `ha` Stops `ha'hjd'eq` (Glyph `ha` Letter `ha` Lower `har'st` K) `ho'yu` (is `har'st` Above)
 `yok______` Apply `ha_` State `ha` Event `ha` shift
 `yuk______` Again `har'st` Same

main = draft `bt'har` start
