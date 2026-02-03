import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = List ASCII

-- example = Exist `ha` is @String `hc` "Something!"
--  -- `yi` is @(Optional (List ASCII))
--  -- `yo` is @String `hu` "Not something."
--  `yu` "Not something."
--  `yuk` Check `hc` Exist @String "Is there something?"

-- main = example `yokl'yokl` Check `ha` Forth `ha` Await `ha` output
-- main = is @String "typechecked" `yokl` Forth `ha` World `ha` output

x = is @(String `P` String) `hc__` "Hello" `hjd` "World"

exp1 = is @Unit `hu` "Hello" `ryio` is @(String `S` String)
exp2 = is @Unit `hu` "World" `ryoi` is @(String `S` String)

-- xx :: _
-- xx = basetype (Unit `ryu` Enter @(State Letter `JNT` Given String))

xx :: State Latin Latin
-- xx = R `ryo` Enter @(State Latin) `yuk` Apply `ha` State `ha` Event `ha` relay `hc'st` B -- `hc__'st` A
xx = R `ryo` Enter @(State Latin) `yuk` Lease `ha` State `ha` Event `hc_` relay `hc'st` B -- `hc__'st` A

-- \Latin `AR__` Latin `P` Latin

main = do
 is @(Alone String) `hc` Alone "Hi" `yor` Unit `yokl` Forth `ha` Await `ha` output
 "Hi" `_ryu` is @(Alone String) `yokl'yokl` Apply `ha` Forth `ha` Await `ha` output
 x `yoir` Unit `yokl` Forth `ha` Await `ha` output
 x `yior` Unit `yokl` Forth `ha` Await `ha` output
 x `yoor` This Unit `yokl` Forth `ha` Await `ha` output
 x `yoor` That Unit `yokl` Forth `ha` Await `ha` output

 is @Void `hu'st` A `ryo` Enter @Maybe `yokl` Check `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper

 output `ha` Glyph `ha` Letter `ha` Upper `hc______` xx `hc'st` A `yoor` This Unit
 
 -- example `yoor'st` This @Unit `yokl` Forth `ha` Await `ha` output
 -- example `yoor'st` That @Unit `yokl` Forth `ha` Await `ha` output

 -- f `ryoo` x
 -- f `yoor` x