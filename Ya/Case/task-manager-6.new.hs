import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-tutorials" Ya.Instances
import "ya-console" Ya.Console

type Mode = Unit `S` Unit

pattern Review e = This e
pattern Search e = That e

type Title = List ASCII

type Mark = Unit `S` Unit

pattern TODO e = This e
pattern DONE e = That e

type Description = Sliding List ASCII

type Task = Mark `P` Description

pattern Bullet e = This e
pattern Cursor e = That e

type Move = Shifter List

-- pattern Lift x = This x
-- pattern Down x = That x

type Command = Move `S` Mark `S_` ASCII `S` Unit

pattern Move x = This (This x)
pattern Mark x = This (That x)
pattern Heap x = That (This x)
pattern Away x = That (That x)

print cursor (These status task) = intro @World Unit
 `yuk___` Run `hv____` hand cursor `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` mark status `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` show task -- `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` output `ha` Caret `hv` by Newline

hand cursor = is @Title `hv__` Bullet `hu` "  -  " `la` Cursor `hu` "  -> " `li` cursor

mark status = is @Title `hv__` TODO `hu` "TODO " `la` DONE `hu` "DONE " `li` status

show = shaft `hv` by Passed `ho` this `ho_'yokl` Prior `ha` Run `ha` output `ho_'yu` Unit
 `lo__'yp` focus `ho` this `ho_'yokl` Forth `ha` Run `ha` output `ho_'yu` Unit `ho_` Await
 `lo__'yp` shaft `hv` by Future `ho` this `ho_'yokl` Forth `ha` Run `ha` output `ho_'yu` Unit `ho_` Await

-- (`ha'yo`): (t (tt o) i) -> into (from (a) o) (t (tt a) i)

start = to @(Scrolling List) `ha` Nonempty @List @Task
 `ha_` Next `ho` Item (by TODO `lu` to @(Sliding List) @List @ASCII "Apply to that new position")
 `ha_` Next `ho` Item (by TODO `lu` to @(Sliding List) @List @ASCII "Find a way to fix ligatures")
 `ha_` Next `ho` Item (by TODO `lu` to @(Sliding List) @List @ASCII "Organize a boardgame session")
 `ha_` Last `ho` Item (by DONE `lu` to @(Sliding List) @List @ASCII "Buy a water gun for Songkran")

-- excerpt = shaft `hv` by Passed `ho` this `ho_'yokl` Prior `ha` Run `ha` print (by Bullet)
--  `lo__'yp` focus `ho` this `ho_'yokl` Forth `ha` Run `ha` print (by Cursor) `ho_` Await
--  `lo__'yp` shaft `hv` by Future `ho` this `ho_'yokl` Forth `ha` Run `ha` print (by Bullet) `ho_` Await

active way title = intro @World Unit
 `yuk___` World `ha` styled `ha` Emphasize `hv` by On
 `yuk___` World `ha` styled `ha` Underline `hv` by On
 `yuk___` World (is @Title `hv` title `yokl` way `ha` Run `ha` output)
 `yuk___` World `ha` styled `ha` Emphasize `hv` by Off
 `yuk___` World `ha` styled `ha` Underline `hv` by Off

inactive way title = intro @World Unit
 `yuk___` World (is @Title `hv` title `yokl` way `ha` Run `ha` output)

indicate (These (This _) title) =
 output `ha` Caret `hv` by Space
 `lu'yp` Await `hv` active Forth "EXPLORE"
 `lu'yp` Await `hv` (output `ha` Glyph `ha` Symbol `ha` Punctuate `hv` by Space)
 `lu'yp` Await `hv` inactive Forth "FOCUSED"
 -- `lu'yp` Await `hv` inactive Prior title
 `lu'yp` Await `hv` (output `ha` Caret `hv` by Newline)
 `yu` Unit
indicate (These (That _) title) =
 output `ha` Caret `hv` by Space
 `lu'yp` Await `hv` inactive Forth "EXPLORE"
 `lu'yp` Await `hv` (output `ha` Glyph `ha` Symbol `ha` Punctuate `hv` by Space)
 `lu'yp` Await `hv` active Forth "FOCUSED"
 -- `lu'yp` Await `hv` active Prior title
 `lu'yp` Await `hv` (output `ha` Caret `hv` by Newline)
 `yu` Unit

render = is `hu_` output `ha` Caret `hv` by Newline
 `lo___'yp` (this `ha` at @Mode `lo` this `ha` at @Title) `ho_` indicate `ho_` Await
 `lo___'yp` is `hu_` output `ha` Caret `hv` by Newline `ho_` Await
 -- `lo___'yp` this `ho` this `ho` this `ho_'yokl` Run `ha` World `ha` excerpt `ho_'yu` Unit `ho_` Await

-- search :: ASCII `AR__` Command
-- search = Heap `ha'he` Glyph
 -- `la_` Backspace `hu` by Away
  -- `la` Tab `hu`by Stop
  -- `la` Newline `hu`by Stop
  -- `la` Escape `hu`by Stop
  -- `la` Heap `ha` Caret `ha` Space
  -- `la` Delete `hu` by Stop

press k f p = Maybe `hv___` k `hv` Unit `hd'q` p `yui` Unit `yiu` f Unit
-- press k f p = Maybe `hv___` k `hd'q` p `yui` Unit `yiu` f Unit

type Result = Scrolling List Task

type Stash = List (List Task)

type Interface = Result `P` Stash `P` Title `P` Mode

review :: ASCII `AR__` Maybe Command
review = is `hu` by Wrong
  `la____` press (Lower `ha` J) (Move `ha` Down)
  `lo'ys'la` First `ha` press (Lower `ha` K) (Move `ha` Lift)
  `lo'ys'la` First `ha` press (Upper `ha` T) (Mark `ha` TODO)
  `lo'ys'la` First `ha` press (Upper `ha` D) (Mark `ha` DONE)
  -- `lo'ys'la` press `hv` Lower F `hv` (Find)
 `ha______` on @Glyph @ASCII `ho'ho` on @Letter `ho` row

searchbar = push `ho_'ho'yoi` Some `ha` Fore `ha_'he` Glyph
 `la_` Some `hu` get `ho'ho'yui` by None
  `la` Some `hu` pop `ho'ho'yoi'yo` Back
 `ha_` (`hd_'q` by Delete) `ha'he` is @Caret

filter title = intro @(State `T'I` Task) Unit
 `yuk__` New `ha` State `hv__` Event `ha` locate `ha` (by Fore `lu`) `ha` Predicate `ha` exact `hv` title `ha_` Scope `hv` at @Description

exact sample item = Wrong `hu` by False `la` Valid `hu` by True `li` sample `hd'q` item

update x = intro @(State `T'I` Interface) Unit
 `yuk____` New `ha` State `hv__` Event `hv` searchbar x `ha_` Scope `hv` at @Title
 -- `yok____` New `ha` State `ha__` Event `ha` get `ha` not `ha_` Scope `hv` at @Mode
 --  `la____` New `ha` State `ha__` Event `ha` (is :: _) `ha_` Scope `hv` at 

proccess = intro @(State `T'I` Interface `JNT` World) Unit
 `yuk______` World `hv__` prepare `lu'yp` Await `hv` clear
 `yuk______` State `ho` Old `ha` Event `hv` get
 `yok______` World `ha` render
 `yuk______` World `hv` input
 `yok______` New `ha` update
 `yok______` Again `ha` Once

main = proccess `he'he'hv__` (by `hv` start `lu` empty `lu` empty `lu` by `hv` Review)
