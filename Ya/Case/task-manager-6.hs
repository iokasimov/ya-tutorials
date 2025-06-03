import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Title = List ASCII

type Mark = Unit `S` Unit

pattern TODO e = This e
pattern DONE e = That e

type Task = Mark `P` Title

pattern Bullet e = This e
pattern Cursor e = That e

type Dimmed = Unit `S` Unit

pattern Reveal e = This e
pattern Dimmed e = That e

print hidden cursor (These status task) = intro @World `hv` Unit
 `yuk___` World `ha` styled `ha` Darkling `ha__` Off `la` On `hv__` hidden
 `yuk___` Run `hv____` hand cursor `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` mark status `yokl` Forth `ha` Run `ha` output
 `yuk___` Run `hv____` is @Title task `yokl` Prior `ha` Run `ha` output
 `yuk___` Run `hv____` output `ha` Caret `hv` by Newline
 `yuk___` World `ha` styled `ha` Darkling `hv` by Off

hand cursor = is @Title `hv__` Bullet `hu` "   * " `la` Cursor `hu` "  -> " `li` cursor

mark status = is @Title `hv__` TODO `hu` "TODO " `la` DONE `hu` "DONE " `li` is @Mark status

type Mode = Unit `S` Unit

type Move = Shifter List

title string = string `yi` is @Title
 `yokl` Forth `ha` New `ha` State `ha` Event `ha` push
 `he'he'hv___` empty @List `yi__` that @Title

start = to @(Scrolling List) `ha` Nonempty @List @Task
 `ha_` Next `ho` Item (by TODO `lu` title "Apply to that new position")
 `ha_` Next `ho` Item (by TODO `lu` title "Find a way to fix ligatures")
 `ha_` Next `ho` Item (by TODO `lu` title "Organize a boardgame session")
 `ha_` Last `ho` Item (by DONE `lu` title "Buy a water gun for Songkran")

render dimmed = shaft @List `hv` by Passed `ho` this `ho_'yokl` Prior `ha` Run `ha` print dimmed (by Bullet)
 `lo__'yp` Await `ha__` focus @Only `ho` this `ho_'yokl` Forth `ha` Run `ha` print (by Reveal) (by Cursor)
 `lo__'yp` Await `ha__` shaft @List `hv` by Future `ho` this `ho_'yokl` Forth `ha` Run `ha` print dimmed (by Bullet)

press k f p = Maybe `hv___` k `hv` Unit `hd'q` p `yui` Unit `yiu` f Unit

type Panel = Scrolling List Task

-- explore' = press (Caret `ha` Newline) (Event `ha` (switch `ho'ho'yui` Unit) `ha` Focused `ho__'ha` Scope `hv` at @Mode @(Mode `P` Panel))
--  `lo'ys'la` First `ha` press (Glyph `ha` Letter `ha` Lower `ha` J) (Event `ha` (shift `ho'ho'yui` Unit) `ha` Down `ho__'ha` Scope `hv` at @Panel)
--  `lo'ys'la` First `ha` press (Glyph `ha` Letter `ha` Lower `ha` K) (Event `ha` (shift `ho'ho'yui` Unit) `ha` Lift `ho__'ha` Scope `hv` at @Panel)
--  `lo'ys'la` First `ha` press (Glyph `ha` Letter `ha` Upper `ha` T) (Event `ha` (switch `ho'ho'yui` Unit) `ha` TODO `ho__'ha` Scope `hv` at @Panel `ho_` Scope `hv` focus @Only `ho_'he` Scope `hv` at @Mark)
--  `lo'ys'la` First `ha` press (Glyph `ha` Letter `ha` Upper `ha` D) (Event `ha` (switch `ho'ho'yui` Unit) `ha` DONE `ho__'ha` Scope `hv` at @Panel `ho_` Scope `hv` focus @Only `ho_'he` Scope `hv` at @Mark)

pattern Mode x = That x

type Explore = Move `S` Mark `S` Mode

pattern Move x = This (This x)
pattern Mark x = This (That x)

type Focused = Unit `S` Glyph `S` Mode

pattern Drop x = This (This x)
pattern Pile x = This (That x)

-- explore :: ASCII `AR___` Maybe Explore
explore = press (Caret `ha` Newline) (Mode `ha` Focused)
 `lo'ys'la` First `ha` press (Glyph `ha` Letter `ha` Lower `ha` J) (Move `ha` Down)
 `lo'ys'la` First `ha` press (Glyph `ha` Letter `ha` Lower `ha` K) (Move `ha` Lift)
 `lo'ys'la` First `ha` press (Glyph `ha` Letter `ha` Upper `ha` T) (Mark `ha` TODO)
 `lo'ys'la` First `ha` press (Glyph `ha` Letter `ha` Upper `ha` D) (Mark `ha` DONE)

-- focused :: ASCII `AR___` Maybe Focused
focused = Some `ha'he` Pile
 `la____` press (Newline) (Mode `ha` Explore) `ha'he` is
 `lo'ys'la` First `ha` press (Delete) (Drop) `ha'he` is

type Command = Explore `S` Focused

-- command :: Mode `AR___` World Command
command mode = input
 `yok__` Retry
  `ha__` is `hu` (explore `ho'yo` Explore)
    `la` is `hu` (focused `ho'yo` Focused)
    `li` mode

pattern Explore e = This e
pattern Focused e = That e

draft = intro @(State `T'I` Mode `P` Scrolling List Task `JNT` World) Unit
 `yuk____` Run `hv__` prepare `lu'yp` Await `hv` clear
 `yuk____` Old `ha` State `hv__` Event `hv` auto
 `yok____` Run `ha__` is `ho'hd` render
 `yuk____` Old `ha` State `hv__` Event `hv` auto `ha_` Scope `hv` at @Mode
 `yok____` Run `ha__` command
 `yok____` New `ha` State `ha___` Event `ha` (shift `ho'ho'yui` Unit) `ho__'ha` Scope `hv` at @Panel
   `la___` New `ha` State `ha___` Event `ha` (switch `ho'ho'yui` Unit) `ho__'ha` Scope `hv` at @Panel `ho_` Scope `hv` focus `ho_'he` Scope `hv` at @Mark
   `la___` New `ha` State `ha___` Event `ha` (switch `ho'ho'yui` Unit) `ho__'ha` Scope `hv` at @Mode
  `la____` New `ha` State `ha___` Event `ha` ((\_ -> pop) `ho'ho'yui` Unit) `ho__'ha` Scope `hv` at @Panel `ho_` Scope `hv` focus `ho_'he` Scope `hv` at @Title
   `la___` New `ha` State `ha___` Event `ha` (push `ha` Glyph `ho'ho'yui` Unit) `ho__'ha` Scope `hv` at @Panel `ho_` Scope `hv` focus `ho_'he` Scope `hv` at @Title
   `la___` New `ha` State `ha___` Event `ha` (switch `ho'ho'yui` Unit) `ho__'ha` Scope `hv` at @Mode
 `yok____` Again `ha` Once

main = draft `he'he'hv` (Explore `lo` start `li` Unit)
