import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Title = Nonempty List ASCII

initial = empty @Maybe
 `lu` "Apply to that new position" `yi` Exist
 `lu` "Organize a boardgame session" `yi` Exist
 `lu` "Buy a water gun for Songkran" `yi` Exist
 `lu` "Find a way to fix ligatures" `yi` Build
 `yi` is @(Nonempty List Title)
 `ho` to @(Scrolling List)

print = is @Title
 `ho_'yokl` Forth `ha` Await `ha` output
 `ho_'yuk` Await `ha` output `ha` Caret `hv'he` Newline

main = initial `yokl` Forth `ha` Apply `ha` print
