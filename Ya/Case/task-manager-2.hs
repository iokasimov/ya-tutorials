import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Title = List ASCII

pattern Bullet e = This e
pattern Cursor e = That e

print cursor title = intro @World Unit
 `yuk___` Run `hv____` point `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` title `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` output `ha` Caret `hv'he` Newline where

 point = is @Title `hv__` Bullet `hu` "  -  " `la` Cursor `hu` "  -> " `hv_` cursor

initial = empty @Maybe
 `lu` "Apply to that new position" `yi` Exist
 `lu` "Organize a boardgame session" `yi` Exist
 `lu` "Buy a water gun for Songkran" `yi` Exist
 `lu` "Find a way to fix ligatures" `yi` Build
 `yi` to @(Scrolling List) @(Nonempty List) @Title

draft = intro @(World `JNT` State `T'I` Scrolling List Title) Unit
 `yuk___` World `hv__` prepare `lu'yp` Await `hv` clear
 `yuk___` Apply `ha` State `hv___` Event `hv` get `ha__` Scope `hv` at @(Shafted List Title) `ho_'he` Scope `ha` rep `hv'he` Passed
 `yok___` World `ha_'yokl` Prior `ha` Run `ha` print (by Bullet)
 -- `yuk___` State `ho` Apply `hv___` Event `hv` get `ha__` Scope `hv` at @(Alone Title) `ho` Scope it
 -- `yok___` World `ha_'yokl` Forth `ha` Run `ha` print (by Cursor)
 -- `yuk___` State `ho` Apply `hv___` Event `hv` get `ha__` Scope `hv` at @(Shafted List Title) `ho_` Scope `ha` rep `hv'he` Future
 -- `yok___` World `ha_'yokl` Forth `ha` Run `ha` print (by Bullet)

main = draft `he'he'hv` initial
