import Ya
import Ya.World
import Ya.ASCII
import Ya.Literal
import Ya.Console

import "base" GHC.Num (Integer, (+))

type Immediate v = v

type Operation v = v `P` v `AR` v

type Command v = Immediate v `S` Operation v

pattern Immediate x = This x
pattern Operation x = That x

load value = intro @(Halts `JNT` State `T` List Integer) Unit
 `yuk_` New `ha` State `ha` Event `hc` push @List value

eval binop = intro @(Halts `JNT` State `T` List Integer) Unit
 `yuk_` New `ha` State `ha` Event `hc` pop @List
 `hjd'yp` New `ha` State `ha` Event `hc` pop @List
 `yok_` Try `ha` (`yp'yo` binop) `ha'ho` Check
 `yok_` New `ha` State `ha` Event `ha` push @List

type Machine item = Halts `JNT` State `T` List item

start = Build
 `ha` (Item `hc` Immediate 1) `ha` Next
 `ha` (Item `hc` Immediate 2) `ha` Next
 `ha` (Item `hc` Operation (is @(Integer `P` Integer) `ho'hd` (+))) `ha` Next
 `ha` (Item `hc` Immediate 4) `ha` Next
 `ha` (Item `hc` Operation (is @(Integer `P` Integer) `ho'hd` (+))) `ha` Last

main = error `has_` this `st'ho` trace
 `hv_______` super start
 `yokl` Forth `ha` Apply
 `ha__` load `has_` eval
 `hc___` empty @List where

 error _ = "[ERR] No operands!" `yokl` Forth `ha` Raw `ha` output

 trace x = is @(Nonempty List ASCII) "[OK] Trace: " `yokl` Forth `ha` Raw `ha` output
  `yuk___` Raw `hv____` x `yokl` Forth `ha` Apply `ha__` integer
  `ho_'yokl` Forth `ha` Raw `ha` output `ha` Glyph `ha` Digit
  `ho_'yuk` Raw `ha` output `ha` Caret `hc'st` Space
