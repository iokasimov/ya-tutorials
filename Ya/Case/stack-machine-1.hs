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

load value = intro @(State `T'I` List Integer `JNT` Halts) Unit
 `yuk_` New `ha` State `ha` Event `hv` push @List value

eval binop = intro @(State `T'I` List Integer `JNT` Halts) Unit
 `yuk_` New `ha` State `ha` Event `hv` pop @List
 `lu'yp` New `ha` State `ha` Event `hv` pop @List
 `yok_` Try `ha` (`yp'yo` binop) `ha'ho` Check
 `yok_` New `ha` State `ha` Event `ha` push @List

type Machine item = State `T'I` List item `JNT` Halts

initial = Construct
 `ha` (Item `hv` Immediate 1) `ha` Next
 `ha` (Item `hv` Immediate 2) `ha` Next
 `ha` (Item `hv` Operation (is @(Integer `P` Integer) `ho'hd` (+))) `ha` Next
 `ha` (Item `hv` Immediate 4) `ha` Next
 `ha` (Item `hv` Operation (is @(Integer `P` Integer) `ho'hd` (+))) `ha` Last

main = error `la` this `he'ho` trace
 `hv_______` by `hv` initial
 `yokl` Forth `ha` Run
 `ha__` load `la` eval
 `he'he'hv___` Empty @List Unit where

 error _ = "[ERR] No operands!" `yokl` Forth `ha` Raw `ha` output

 trace x = is @(Nonempty List ASCII) "[OK] Trace: " `yokl` Forth `ha` Raw `ha` output
  `yuk___` Raw `hv____` x `yokl` Forth `ha` Run `ha__` integer
  `ho_'yokl` Forth `ha` Raw `ha` output `ha` Glyph `ha` Digit
  `ho_'yuk` Raw `ha` output `ha` Caret `hv` by Space
