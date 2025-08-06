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
 `yuk___` Run `hv____` output `ha` Caret `hv` by Newline where

 point = is @Title `hv__` Bullet `hu` "  -  " `la` Cursor `hu` "  -> " `hv_` cursor

type Move = Shifter List

sieve x = intro @Maybe Unit
 `yuk___` Check `ha` Maybe `ha` dim `ha` on @Glyph `hv` x
 `yok___` Check `ha` Maybe `ha` dim `ha` on @Letter

apply = press `hv` (Lower `ha` J) `hv` Down
 `lo'ys'la` press `hv` (Lower `ha` K) `hv` Lift `ho` First

press k f p = Maybe `hv___` unwrap k `lu'q` p `yi` dim `yiu` f Unit

draft = intro @(World `JNT` State `T'I` Scrolling List Title) Unit
 `yuk___` Await `hv` prepare `lu'yp` Await `hv` clear
 `yuk___` State `ho` New `hv__` Event `hv` auto `ha_` Scope `ha` shaft `hv` by Passed `yok___` World `ha_'yokl` Prior `ha` Run `ha` print (by Bullet)
 `yuk___` State `ho` New `hv__` Event `hv` auto `ha_` Scope `hv` focus `ho` Scope it `yok___` World `ha_'yokl` Forth `ha` Run `ha` print (by Cursor)
 `yuk___` State `ho` New `hv__` Event `hv` auto `ha_` Scope `ha` shaft `hv` by Future `yok___` World `ha_'yokl` Forth `ha` Run `ha` print (by Bullet)
 `yuk___` Await `hv___` input `yok` Retry `ha_'yok` Check `ha` apply `ha_` sieve
 `yok___` State `ho` New `ha` Event `ha` shift
 `yok___` Again `ha` Once

start = to @(Scrolling List) `ha` Nonempty @List @Title
 `ha` Item "Apply to that new position" `ha` Next
 `ha` Item "Find a way to fix ligatures" `ha` Next
 `ha` Item "Organize a boardgame session" `ha` Next
 `ha` Item "Buy a water gun for Songkran" `ha` Last

main = draft `he'he'hv` by start
