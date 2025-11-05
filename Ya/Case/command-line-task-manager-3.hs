import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Title = Nonempty List ASCII

pattern Bullet e = This e
pattern Cursor e = That e

print = Cursor `hu` "  -> " `lo` is `la_` Bullet `hu` "   - " `lo` is
 `ho__` is @Title `ha` to `ha` Merge @List @(Nonempty List)
 `ho__'yokl` Forth `ha` Apply `ha` output
 `ho__'yuk` Await `ha` output `ha` Caret `hv'he` Newline

initial = empty @Maybe
 `lu` "Apply to that new position" `yi` Exist
 `lu` "Organize a boardgame session" `yi` Exist
 `lu` "Buy a water gun for Songkran" `yi` Exist
 `lu` "Find a way to fix ligatures" `yi` Build
 `yi` is @(Nonempty List Title)
 `ho` to @(Scrolling List)

main = initial `kyokl` Focus `ha` Forth `ha` Await `ha` print
