import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-literal" Ya.Literal
import "ya-console" Ya.Console

import "ya-tutorials" Ya.Instances ()

import "base" System.IO (print)
import "base" GHC.Num (Integer)
import "base" GHC.IsList (IsList (Item, toList, fromList))

type Creature = Unit `S` Unit `S` Unit

pattern Wolf i = This (This i)
pattern Goat i = This (That i)
pattern Cabbage i = That i

-- TODO: what if we introduce distance here? Non transitive order relation

render = is @(List ASCII)
 `ha__` Wolf `hu` "Wolf"
   `has_` Goat `hu` "Goat"
   `has_` Cabbage `hu` "Cabbage"
 `ha__` is @Creature

draft = intro @Quest Unit
 `yuk__` Apply `hv__` [Wolf, Goat, Cabbage] `yo` (`hc` Unit) `yi` is @(List Creature)
 `yuk__` Apply `hv__` [Cabbage] `yo` (`hc` Unit) `yi` is @(List Creature)
 -- `yok__` Apply `ha__` intro @List @(AR)

eats (Wolf Unit) (Goat Unit) = Error @(Creature `P` Creature) `hv__'st` Wolf `lo` Goat
eats (Goat Unit) (Cabbage Unit) = Error `hv__` Goat `lo` Cabbage `li` Unit
eats item _food = Valid `hv__` item

meals (These item food) = food
 `yokl` Forth `ha` Check `ha` eats item
 `yu__` item

-- check :: Scrolling List Creature `AR__` Stops (Creature `P` Creature) Creature
-- check = meals
--  `ha__` at @(Alone _) `ho` this @(Alone Creature) `ho'st` is
--    `lo` other `ho` this @(Shafted List Creature)

-- t a `AR____` into (from (tt a) (ttt o)) (t o)

-- List a `AR____` into (from (Scrolling List a) (ttt o)) (t o)

eaten (These item victim) = render item
 `hjd` " has eaten " `yi` Merge @List @List `ho` to @List
 `hjd` render victim `yi` Merge @List @List `ho` to @List

beach :: List Creature `AR__` List ASCII
beach x = x `yok_` Apply `ha` that `ha` spaced `ha` render

spaced = push @List `hv_` Glyph `ha` Symbol `ha` Punctuate `hc'st` Space

-- (`kyok`): List a `AR____` into (from (Scrolling List a) (Check o)) (List o)

-- safe :: List Creature `AR___` List (List Creature)
-- safe x = x `kyok` Range @List `ha` Check `ha` pick

-- pick :: Scrolling List Creature `AR___` Stops `T'I` Creature `P` Creature `T'I` List Creature
-- pick x = to @List `ha` this @(Shafted List Creature) `ha` other `hc` x
--  `kyokl` Range @List `ha` Forth `ha` Check `ha` check

type Area = Twice `T'TT'I` List

-- bank = Scope `hc` at @(Area Creature)
--  `ho_'st` Scope `ha` rep @Twice `hc'st` This

type Move = Maybe Creature

-- turn :: Quest `JNT` State `T` Area Creature `T__` List Creature
-- turn = intro @(Quest `JNT` Stops `T'I` Area Creature `JNT` State `T'I` Area Creature) Unit
--  `yuk__` Lease `ha` State `hv__` Event `hc` fetch `ha_` Scope `hc'st` bank
--  `yok__` Apply `ha` safe

-- [1,2,3] `yi` Round `ho` to @Flux

-- main = draft `yo` render `yokl'yokl` Forth `ha` Forth `ha` Await `ha` output -- `ha` Glyph `ha` Letter

-- instance IsList (Construction Optional `T'TT'I` Along k `T'I_` i) where
--  type Item (Construction Optional `T'TT'I` Along k `T'I_` i) = (k, i)
--  fromList x = T'TT'I (Construct (worker x)) where
--   worker ((k,c) : []) = Item (c `hjd` k `yi` Along) `ha` Last `hc` Unit
--   worker ((k,c) : kcs) = Item (c `hjd` k `yi` Along) `ha` Next `hc` worker kcs

-- example :: List `T'TT'I` Along Latin `T'I_` Integer
-- example = [(A Unit, 1), (B Unit, 2), (C Unit, 3)]

-- _ :: Item (Nonempty List `T'TT'I` Along Unit `T'I_` Integer)

-- main = example `yi` key `hc` B Unit `ho` this `ho` print

example :: Nonempty List `T'I_` Unit `AR` Latin
example = [A, B, C, D]

main = do
 example `yokl` Forth `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper `ha` super @AR
 -- example `kyokl` Forth `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper

-- main = is @(List Creature)
--  `hv__` [by Wolf, by Goat, by Cabbage]
--  `kyok` Range @List `ha` Check `ha` check
--  `yok_` Apply `ha` that `ha` spaced `ha` render
--  `yokl` Forth `ha` Await `ha` output

-- main = [Wolf Unit, Cabbage Unit] `yi` is @(List Creature)
--  `kyokl` Range @List `ha` Forth `ha` Check `ha` check
--  `yi___` eaten `la_` beach
--  `yokl_` Forth `ha__` Await `ha` output
