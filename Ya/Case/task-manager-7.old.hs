import Ya

import "base" System.IO (IO)
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console
import "ya-tutorials" Ya.Instances

import qualified "ya-tutorials" Ya.Expo.Terminal as Console

type Title = List ASCII

type Mark = Unit `S` Unit

pattern TODO e = This e :: Mark
pattern DONE e = That e :: Mark

type Move = Scroller List `S` Scroller Tree

pattern Outline x = This x :: Move
pattern Project x = That x :: Move

pattern Down x = This x :: Scroller List
pattern Lift x = That x :: Scroller List

pattern Range x = This x :: Scroller Tree
pattern Level x = That x :: Scroller Tree

type Quit = Unit

type Task = Mark `P` Title

pattern Task m t = These m t :: Task

type Command = ((Move) `S` Mark) `S` Quit

pattern Move x = This (This x) :: Command
pattern Mark x = This (That x) :: Command
pattern Quit x = That x :: Command

type Cursor = Unit `S` Unit

pattern Bullet = This Unit
pattern Cursor = That Unit

type Shifted = Shafted List

string prefix cursor (These status title) = intro @IO
 `yuk__` Blinking `ha` On `he` Unit `yi__` styled
 `yuk__` Forward `he` hand cursor `yokl` output
 `yuk__` Blinking `ha` Off `he` Unit `yi_` styled
 `yuk__` Forward `he` prefix `yokl` output
 `yuk__` Once `he_` Caret Space `yokl` output
 `yuk__` Emphasize `ha` On `he` Unit `yi_` styled
 `yuk__` Forward `he` mark status `yokl` output
 `yuk__` Emphasize `ha` Off `he` Unit `yi` styled
 `yuk__` Once `he_` Caret Space `yokl` output
 `yuk__` titled status `he` On Unit `yi` styled
 `yuk__` Forward @List `he` title `yokl` output
 `yuk__` titled status `he` Off Unit `yi` styled
 `yuk__` Once `he_` Caret Newline `yokl` output

titled = is `hu` Underline `la` is `hu` Crossing

block_sl prefix cursor (U_T_I_TT_I (These (T'TT'I (U_T_I_TT_I (These focus (U_T_I_TT_I (These left right))))) (T'TT'I (Reverse (T'TT'I (T'I'II (This ()))))))) = intro @IO
 `yuk__`  left `yokl` block_tree prefix Bullet
 `yuk__` focus `yokl` block_tree prefix cursor
 `yuk__` right `yokl` block_tree prefix Bullet
 `yuk__` intro @_ @IO Unit
block_sl prefix cursor (U_T_I_TT_I (These current (T'TT'I (Reverse (T'TT'I (T'I'II (That (R_U_I_T_I (Recursive (U_I_T_II (These x xs))))))))))) =
 let (U_T_I_TT_I (These focus (T'TT'I (U_T_I_TT_I (These rs fs))))) = x in intro
 `yuk__` output (Caret Newline)
 `yuk__` focus `yokl` string prefix Bullet
 `yuk__` rs `yokl` block_tree (tab `he` prefix) Bullet
 `yuk__` block_sl (tab `he` prefix) cursor (U_T_I_TT_I (These current (T'TT'I (Reverse (T'TT'I ((xs `yo`R_U_I_T_I)))))))
 `yuk__` fs `yokl` block_tree (tab `he` prefix) Bullet
 `yuk__` intro @_ @IO Unit

block_tree prefix cursor (R_U_I_T_I (Recursive (U_I_T_II (These focus subtree)))) =
 let pointer = is `hu` prefix `la` is `hu` (prefix `yu` level) `li` cursor in
 let aligner = that `ha` push @List (Caret Space) `ha` that `ha` push @List level in
      string pointer cursor focus `yu` Unit
 `lu'yp` ((Forward subtree `yokl` Construct `ho` block_tree (aligner prefix) Bullet) `yu` Unit)

print cursor x = intro @IO
 `yuk__` x `yokl` block_sl "" cursor
 `ho_'yuk` output `he` Caret Newline

tab = that `ha` push @List level

level = Glyph `ha` Symbol `ha` Punctuation `ha` Hyphen `he` Unit

hand = is @Title `ha__` is `hu` "    " `la` is `hu` "--> "
mark = is @Title `ha__` is `hu` "TODO" `la` is `hu` "DONE"

press k f p = Maybe `he___` k `lu'q` p `yi` dim `yiu` f Unit

apply = press `he` Lower P `he` (Move `ha` Outline `ha` Down)
 `lo'ys'la` press `he` Lower N `he` (Move `ha` Outline `ha` Lift)
 `lo'ys'la` press `he` Lower K `he` (Move `ha` Project `ha` Range `ha` Down)
 `lo'ys'la` press `he` Lower J `he` (Move `ha` Project `ha` Range `ha` Lift)
 `lo'ys'la` press `he` Lower D `he` (Move `ha` Project `ha` Level `ha` Down)
 `lo'ys'la` press `he` Lower U `he` (Move `ha` Project `ha` Level `ha` Lift)
 `lo'ys'la` press `he` Upper T `he` (Mark `ha` TODO)
 `lo'ys'la` press `he` Upper D `he` (Mark `ha` DONE)
 `lo'ys'la` press `he` Lower Q `he` (Quit)
 `la____` Wrong `hv` is @(Number `S` Symbol `S` Caret)

type Project = Scrolling Tree Task

type Outline = Scrolling List Project

type Application = State Outline `JNT` Halts `JNT` IO

process = intro @Application
 `yuk_____` prepare `lu'yp` clear
 `yuk_____` Caret `he` Newline `yi` output
 `yuk_____` State `he__` Transition `he` auto
    `ha_'he` Scope @(Shafted List Project) at
     `ho'he` Scope @(Reverse List Project) at
 `yok_____` print Bullet
 `yuk_____` State `he__` Transition `he` auto
     `ha'he` Scope @(Focused Project) at
 `yok_____` print Cursor
 `yuk_____` State `he__` Transition `he` auto
    `ha_'he` Scope @(Shafted List Project) at
     `ho'he` Scope @(Forward List Project) at
 `yok_____` print Bullet
 `yuk_____` input `yok_` Retry `ha_` on @Letter @ASCII `ho` apply
 `yok_____` State `ho` to `ha__` Transition `ha_` scroll @List `ho'ho` (`yi` dim)
  `la_____` State `ho` to `ha__` Transition `ha_` scroll @Tree `ho'ho` (`yi` dim)
  `ho_'ha'he` Scope @(Focused Project) at
     `ho'he` Scope @Project it
  `la_____` State `ho` to `ha__` Transition `ha_` (\m x -> Unit `lu_` x `yo`(`yui` m))
  `ho_'ha'he` Scope @(Focused Project) at
   `ho'he'he` Scope @(Leveled Tree Task) at
   `ho'he'he` Scope @(Focused `T'I` Tree Task) at
     `ho'he` Scope @(Tree Task) at
  `la_____` Close `ho` to @Application
 `yok_____` Again `ha` Same

initial = Construct `ho` to @(Scrolling List)
 `ha______` Next `ha_` Tree `he` Task (TODO Unit) "Get ready for a Bangkok hackaton" `ho` to @(Scrolling Tree)
  `ha_____` Next `ha_` Node `he` Task (TODO Unit) "Prepare on Chain Fusion hackaton" `ha` List `ha` Some `ha` Construct
   `ha____` Next `he_` Node `he` Task (DONE Unit) "Ask my wife to help with a pitch" `he` Empty @List Unit
   `ha____` Next `he_` Node `he` Task (DONE Unit) "Consider his remarks on the text" `he` Empty @List Unit
   `he____` Last `ha_` Node `he` Task (TODO Unit) "Read about canister interactions" `ha` List `ha` Some `ha` Construct
    `ha___` Next `he_` Node `he` Task (TODO Unit) "How to poll with smart contracts" `he` Empty @List Unit
    `ha___` Next `he_` Node `he` Task (TODO Unit) "Can I use custom Juno canisters?" `he` Empty @List Unit
    `ha___` Next `he_` Node `he` Task (TODO Unit) "Get an IC identity with a laptop" `he` Empty @List Unit
    `he___` Last `he_` Node `he` Task (TODO Unit) "Should I compile JS code to WASM?"`he` Empty @List Unit
  `ha_____` Next `he_` Node `he` Task (TODO Unit) "Purchase good round trip tickets" `he` Empty @List Unit
  `ha_____` Next `he_` Node `he` Task (TODO Unit) "Book some room nearby Klong Toei" `he` Empty @List Unit
  `ha_____` Next `he_` Node `he` Task (DONE Unit) "Can I take my longboard with me?" `he` Empty @List Unit
  `ha_____` Next `ha_` Node `he` Task (DONE Unit) "Schedule activities on this week" `ha` List `ha` Some `ha` Construct
   `ha____` Next `he_` Node `he` Task (TODO Unit) "Take some snacks from Chiang Mai" `he` Empty @List Unit
   `he____` Last `he_` Node `he` Task (TODO Unit) "Book a yoga session some evening" `he` Empty @List Unit
  `he_____` Last `ha_` Node `he` Task (DONE Unit) "Try to team up with ex coworkers" `ha` List `ha` Some `ha` Construct
   `he____` Last `he_` Node `he` Task (TODO Unit) "Discuss my pitching text to them" `he` Empty @List Unit
 `he______` Last `ha_` Tree `he` Task (TODO Unit) "Hang out with guys this Saturday" `ho` to @(Scrolling Tree)
  `ha_____` Next `he_` Node `he` Task (TODO Unit) "Invite him, her, them and others" `he` Empty @List Unit
  `ha_____` Next `ha_` Node `he` Task (TODO Unit) "Clean the room, pick a boardgame" `ha` List `ha` Some `ha` Construct
   `ha____` Next `he_` Node `he` Task (DONE Unit) "(5) Oath, Pax Pamir and DerrocAr" `he` Empty @List Unit
   `he____` Last `he_` Node `he` Task (TODO Unit) "(2-4) Arcs, Brass or Sammu Ramat" `he` Empty @List Unit
  `he_____` Last `ha_` Node `he` Task (DONE Unit) "Download Switch local coop games" `ha` List `ha` Some `ha` Construct
   `ha____` Next `he_` Node `he` Task (TODO Unit) "Check if controllers are charged" `he` Empty @List Unit
   `ha____` Next `he_` Node `he` Task (TODO Unit) "Prioritize on Boomerang Fu first" `he` Empty @List Unit
   `he____` Last `he_` Node `he` Task (TODO Unit) "Keep Talking and Nobody Explodes" `he` Empty @List Unit

main = unwrap (process `he'he` initial)
