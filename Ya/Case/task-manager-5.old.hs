import Ya

import "base" System.IO (IO, print)
import "ya-ascii" Ya.ASCII
import "ya-tutorials" Ya.Expo.ASCII
import "ya-tutorials" Ya.Instances

import qualified "ya-tutorials" Ya.Expo.Terminal as Console

type Title = List ASCII

type Mark = Unit `ML` Unit

pattern TODO e = This e :: Mark
pattern DONE e = That e :: Mark

type Move = Unit `ML` Unit

pattern Down x = This x :: Move
pattern Lift x = That x :: Move

type Quit = Unit

type Task = Mark `LM` Title

pattern Task m t = These m t :: Task

type Command = Scroller List `ML` Mark `ML` Quit

pattern Move x = This (This x) :: Command
pattern Mark x = This (That x) :: Command
pattern Quit x = That x :: Command

pattern Bullet = This Unit
pattern Cursor = That Unit

type Shifted = Shafted List

string prefix cursor (These status title) = intro @IO
 `yuk__` Forward `he` prefix `yokl` output
 `yuk__` Forward `he` hand cursor `yokl` output
 `yuk__` Forward `he` mark status `yokl` output
 `yuk__` Forward @List `he` title `yokl` output
 `yuk__` Once `he_` Caret Newline `yokl` output

block_tree prefix cursor tree =
      this `ho` is @Task `ho` string prefix cursor
 `lo'yp` (that `ho` Forward `ho_'yokl` Construct `ho` block_tree (tab `ha` tab `he` prefix) Bullet) `ho'yu` Unit
 `li` unwrap (unwrap (unwrap tree))

tab = that `ha` push @List (Caret Space)

block_scrolling_list_tree prefix cursor (U_T_I_TT_I (These focus (U_T_I_TT_I (These left right)))) = intro @IO
 `yuk__`  left `yokl` block_tree prefix Bullet
 `yuk__` focus `yokl` block_tree prefix cursor
 `yuk__` right `yokl` block_tree prefix Bullet

block_project :: Title -> (Unit `ML` Unit) -> Project -> IO Unit
block_project prefix cursor project = intro @IO
 `yuk__` output `he` Caret Newline
 `yuk__` block_scrolling_list_tree prefix cursor `ha` unwrap @AR
    `ha` to @(Scrolling List `T'TT'I` Tree) `he` project
 `yuk__` intro @IO where

hand = is @Title `ha__` is `hu` "   * " `la` is `hu` "  -> "
mark = is @Title `ha__` is `hu` "TODO " `la` is `hu` "DONE "

press k f p = Maybe `he___` k `lu'q` p `yi` dim `yiu` f Unit

type Project = Scrolling Tree Task

type Outline = Scrolling List Project

type Application = State Outline `JNT` Halts `JNT` IO

draft = intro @Application
 `yuk___` prepare `lu'yp` Await `hv` clear
 `yuk___` State `he___` Transition `he` auto
 `ha__'he` Scope @(Shafted List Project) at
   `ho'he` Scope @(Reverse List Project) at
 `yok___'yokl` block_project (Empty @List Unit) Bullet
 `yuk___` State `he___` Transition `he` auto
 `ha__'he` Scope @(Focused Project) at
 `yok___'yokl` block_project (Empty @List Unit) Cursor
 `yuk___` State `he___` Transition `he` auto
 `ha__'he` Scope @(Shafted List Project) at
   `ho'he` Scope @(Forward List Project) at
 `yok___'yokl` block_project (Empty @List Unit) Bullet
 `yuk___` input `yok__` Retry
  `ha___` match @Letter @ASCII
   `ho__` press `he` Lower K `he` (Move `ha` Down)
 `lo'ys'la` press `he` Lower J `he` (Move `ha` Lift)
 `lo'ys'la` press `he` Lower Q `he` (Quit)
 `lo'ys'la` press `he` Upper T `he` (Mark `ha` TODO)
 `lo'ys'la` press `he` Upper D `he` (Mark `ha` DONE)
     `la` Wrong `hv` is @(Number `ML` Symbol `ML` Caret)
 `yok___` State `ho` to `ha__` Transition `ha_` scroll `ho'ho` (`yi` dim)
  `la___` State `ho` to `ha__` Transition `ha_` relay `ho'ho` (`yi` dim)
  `ho_'ha'he` Scope @(Focused Project) at
   `ho'he'he` Scope @((Scrolling List `T'TT'I` Tree) Task) at
   `ho'he'he` Scope @(Focused `T'I` Tree Task) at
   `ho'he'he'he'he` Scope @Mark at
  `la___` Close `ho` to @Application
 `yok___` Again `ha` Once

initial = Construct `ho` to @(Scrolling List)
 `ha______` Next `ha_` Tree `he` Task (TODO Unit) "Get ready for a Bangkok hackaton" `ho` to @(Scrolling Tree)
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

main = unwrap (draft `he'he` initial)
