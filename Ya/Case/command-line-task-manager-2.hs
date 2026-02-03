import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

start = Adapt @(Nonempty List) `ho` to @(Scrolling List)
 `ha___` Build `ha` (`hjd` "Apply to that new position")
 `ha___` Exist `ha` (`hjd` "Organize a boardgame session")
 `ha___` Exist `ha` (`hjd` "Buy a water gun for Songkran")
 `ha___` Exist `ha` (`hjd` "Find a way to fix ligatures")
 `hc___'st` Empty

print = is @String
 `ho_'yokl` Forth `ha` Await `ha` output
 `ho_'yuk` Await `ha` output `ha` Caret `hc'st` Newline

main = start `yokl` Forth `ha` Apply `ha` print
