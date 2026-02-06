import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Cursor = Unit `S` Unit

type Table = Scrolling List String

print tasks = is @Table `hc` tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'st` swap @(Cursor `P` String)
  `ho__'yoi` Focus `hu` "  -> " `has` Exist `hu` "   - "
  `ho__` morph @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List) `ha` Clasp
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hc'st` Newline

start = Adapt @(Nonempty List) `ho` morph @(Scrolling List)
 `ha___` Build `ha` (`hjd` "Apply to that new position")
 `ha___` Exist `ha` (`hjd` "Organize a boardgame session")
 `ha___` Exist `ha` (`hjd` "Buy a water gun for Songkran")
 `ha___` Exist `ha` (`hjd` "Find a way to fix ligatures")
 `hc___'st` Empty

match = exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` J `ho'yo` Below `ho` Enter
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` K `ho'yo` Above `ho` Check

draft = Unit `ryu` Enter @(World `JNT` State Table)
 `yuk___` Await `hc` clear `hjd'yp` Await `hc` prepare
 `yuk___` Lease `ha` State `ha` Event `hc` fetch
 `yok___` Await `ha` print
 `yuk___` Await `hc` input `yok` Retry `ha_'yok` Check `ha` match
 `yok___` Apply `ha` State `ha` Event `ha` shift
 `yuk___` Again `hc'st` Same

main = draft `hc__` start
