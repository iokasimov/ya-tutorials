import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Cursor = Unit `S` Unit

type Table = Scrolling List String

display tasks = is @Table `har` tasks
 `kyokl` Focus `ha` Forth `ha` Await
 `ha___` Focus `ho'ut` " --> "
    `has` Exist `ho'ut` "   * "
   `ha_` this `ha` field @Cursor
   `hop_` this `ha` field @String
  `ho__` derive `ha` Merge @(Nonempty List) @_ @(Nonempty List) `ha` Clasp
  `ho__'yokl` Forth `ha` Apply `ha` output
  `ho__'yok'ut` Await `ha` output `ha` Caret `har'st` Newline

-- command = First `ha` Stops `ha__'hjd'eq` Glyph `ha` Letter `ha` Lower `har'st` K

process = Pass `ryo` Enter @(World `JNT` State Table)
 `yok_____'ut` Await `har` clear `hjd_'yp` Await `har` prepare
 `yok_____'ut` Lease `ha` State `ha` Event `har` Pull @Table
   `yok_____` Await `ha` display
 `yok_____'ut` Await `har` input `yok____` Retry
  `ha____'yok` First `ha` derive `ha` Stump `ha` Stops `ha__'hjd'eq` Glyph `ha` Letter `ha` Lower `ha'st` J
     `hop__'ys` First `ha` derive `ha` Stump `ha` Stops `ha__'hjd'eq` Glyph `ha` Letter `ha` Lower `ha'st` K
   `yok_____` Allot `ha` State `ha` Event
    `ha_____` Ok `ho_'ut` happen `ha` Shift `ha` Forth @Maybe
      `has___` Ok `ho_'ut` happen `ha` Shift `ha` Aback @Maybe
 `yok_____'ut` Again `har'st` Pass

example = Only `ho'ut` "Apply to that new position"
 `has______` Only `ho'ut` "Organize a boardgame session"
  `has_____` Only `ho'ut` "Buy a water gun for Songkran"
   `has____` Only `ho'ut` "Find a way to fix ligatures"
 `_____ryo` derive @(Nonempty List) @(Scrolling List) `ha` Adapt

main = process `bt'har` example
