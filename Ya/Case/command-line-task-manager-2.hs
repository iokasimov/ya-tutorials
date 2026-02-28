import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

start = Adapt @(Nonempty List) `ho` morph @(Scrolling List)
 `ha___` Build `ha` (`hjd` "Apply to that new position")
 `ha___` Exist `ha` (`hjd` "Organize a boardgame session")
 `ha___` Exist `ha` (`hjd` "Buy a water gun for Songkran")
 `ha___` Exist `ha` (`hjd` "Find a way to fix ligatures")
 `har__'st` Empty

print = is @String
 `ho__'yokl` Forth `ha` Await `ha` output
 `ho__'yuk` Await `ha` output `ha` Caret `har'st` Newline

main = start `yokl` Forth `ha` Apply `ha` print
