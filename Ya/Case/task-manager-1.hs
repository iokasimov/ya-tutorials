import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Title = List ASCII

initial = empty @List @Title
 `yi` push `hv` "Apply to that new position" `ho` that
 `yi` push `hv` "Organize a boardgame session" `ho` that
 `yi` push `hv` "Buy a water gun for Songkran" `ho` that
 `yi` push `hv` "Find a way to fix ligatures" `ho` that

print x = intro @World Unit
 `yuk___` Apply `hv____` x `yokl` Forth `ha` Apply `ha` output
 `yuk___` Apply `hv____` output `ha` Caret `hv'he` Newline

main = initial `yokl` Forth `ha` Apply `ha` print
