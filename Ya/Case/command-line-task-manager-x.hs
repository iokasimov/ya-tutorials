import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Status = Unit `S` Unit

pattern TODO e = This e
pattern DONE e = That e

type Task = Status `P` String

type Cursor = Unit `S` Unit

print tasks = tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___'st` line `ha` swap
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yuk` Await `ha` output `ha` Caret `hc'st` Newline

line = is @(Cursor `P` (Status `P` String))
 `yio'yio'yoi` TODO `hu` "TODO " `has_` DONE `hu` "DONE "
 `yio'yio` to @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List)
 `yio'yoi` Focus `hu` "  -> " `has_` Exist `hu` "   - "
 `yio` to @(Nonempty List) `ha` Merge @(Nonempty List) @(Nonempty List)

start = empty @Maybe
 `hjd` (is `hc'st` TODO `hjd` "Apply to that new position") `yi` Exist
 `hjd` (is `hc'st` TODO `hjd` "Organize a boardgame session") `yi` Exist
 `hjd` (is `hc'st` DONE `hjd` "Buy a water gun for Songkran") `yi` Exist
 `hjd` (is `hc'st` TODO `hjd` "Find a way to fix ligatures") `yi` Build
 `yi` is @(Nonempty List `T'I` Task)
 `ho` to @(Scrolling List)
 `ho` to @(Scrolling Tree)

type Command = Shifter List `S` Status

pattern Motion e = This e
pattern Status e = That e

match = exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` J `ho'yo` (Motion `ha` Below)
 `hop_'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` K `ho'yo` (Motion `ha` Above) `ho` Check
 `hop_'ys'has` exact `ha` Glyph `ha` Letter `ha` Upper `hc'st` T `ho'yo` (Status `ha` TODO) `ho` Check
 `hop_'ys'has` exact `ha` Glyph `ha` Letter `ha` Upper `hc'st` D `ho'yo` (Status `ha` DONE) `ho` Check

process = intro @(World `JNT` Task `I'T` Scrolling Tree `I'T` State) `hc` Unit
 `yuk_____` Await `hc` clear `hjd'yp` Await `hc` prepare
 -- `yuk_____` Lease `ha` State `ha` Event `hc` fetch
 -- `yok_____` Await `ha` print
 -- `yuk_____` Await `hc` input `yok__` Retry `ha` match
 -- `yok_____` Apply `ha` State `ha___` Event `ha` shift `ho'hu` Unit
 --   `has_____` Apply `ha` State `ha___` Event `ha` relay `ho'hu` Unit
 --   `ho__'ha` Scope `hc` at @(Alone Task)
 --    `ho_'st` Scope `hc` at @Status
 -- `yuk_____` Again `hc'st` Same

main = process `hc` start
