import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Title = Nonempty List ASCII

display x = x
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___` Focus `hu` "  -> " `lo` Some `la_` Exist `hu` "   - " `lo` Some
  `ho__` Some @Title `ha` to `ha` Merge @List @(Nonempty List)
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hv'he` Newline

initial = empty @Maybe
 `lu` "Apply to that new position" `yi` Exist
 `lu` "Organize a boardgame session" `yi` Exist
 `lu` "Buy a water gun for Songkran" `yi` Exist
 `lu` "Find a way to fix ligatures" `yi` Build
 `yi` is @(Nonempty List Title)
 `ho` to @(Scrolling List)

match = exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` J `ho'yo` Down
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` K `ho'yo` Lift `ho` Check

process = intro @(World `JNT` State `T'I` Scrolling List Title) `hv` Unit
 `yuk_` Await `hv` prepare `lu'yp` Await `hv` clear
 `yok_` Lease `ha` State `ha` Event `hv` get
 `yok_` Await `ha` display
 `yuk_` Await `hv` input `yok` Retry `ha` match

main = process `he'he'hv` initial
