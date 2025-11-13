import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Cursor = Unit `S` Unit

display records = records
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'he` swap @(Cursor `P` String)
  `ho__'yoi` Focus `hu` "  -> " `la` Exist `hu` "   - "
  `ho__` to @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List)
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hv'he` Newline

start = empty @Maybe
 `lu` "Apply to that new position" `yi` Exist
 `lu` "Organize a boardgame session" `yi` Exist
 `lu` "Buy a water gun for Songkran" `yi` Exist
 `lu` "Find a way to fix ligatures" `yi` Build
 `yi` is @(Nonempty List String)
 `ho` to @(Scrolling List)

match = exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` J `ho'yo` Down
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` K `ho'yo` Lift `ho` Check

process = intro @(World `JNT` State `T'I` Scrolling List String) `hv` Unit
 `yuk_` Await `hv` prepare `lu'yp` Await `hv` clear
 `yuk_` Lease `ha` State `ha` Event `hv` get
 `yok_` Await `ha` display
 `yuk_` Await `hv` input `yok` Retry `ha` match
 `yok_` Apply `ha` State `ha` Event `ha` shift
 `yuk_` Again `hv'he` Same

main = process `he'he'hv` start
