import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Cursor = Unit `S` Unit

print = is @(Cursor `P` String)
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

main = start `kyokl` Focus `ha` Forth `ha` Await `ha__'st` print `ha` swap
