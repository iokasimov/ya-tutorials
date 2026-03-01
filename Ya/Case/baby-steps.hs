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

x = is @(String `P` String) `har_` "Hello" `hjd` "World"

exp1 = is @Unit `hu` "Hello" `ryio` is @(String `S` String)
exp2 = is @Unit `hu` "World" `ryoi` is @(String `S` String)

-- xx :: _
-- xx = basetype (Unit `ryu` Enter @(State Letter `JNT` Given String))

xx :: State Latin Latin
-- xx = R `ryo` Enter @(State Latin) `yuk` Apply `ha` State `ha` Event `ha` relay `hc'st` B -- `hc__'st` A
xx = R `ryo` Enter @(State Latin) `yuk` Lease `ha` State `ha` Event `ha` relay `har'st` B -- `hc__'st` A

-- Letter `AR__` Boolean

xxx = Lower `hu'st` False `has` Upper `hu'st` True `rya` Enter @Match @Letter

xxxx :: Boolean
xxxx = Match @Letter (Lower `hu'st` False `has` Upper `hu'st` True) `yar` (Upper `ha` A) Unit

xxxxx = (har (Event `har` pop @List @ASCII) :: Scope (List ASCII) (Maybe ASCII))

main = do
 is @(Alone String) `har` Alone "Hi" `yor` Unit `yokl` Forth `ha` Await `ha` output
 "Hi" `_ryu` is @(Alone String) `yokl'yokl` Apply `ha` Forth `ha` Await `ha` output
 x `yoir` Unit `yokl` Forth `ha` Await `ha` output
 x `yior` Unit `yokl` Forth `ha` Await `ha` output
 x `yoor` This Unit `yokl` Forth `ha` Await `ha` output
 x `yoor` That Unit `yokl` Forth `ha` Await `ha` output

 is @Void `hu'st` A `ryo` Enter @Maybe `yokl` Check `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper

 output `ha` Glyph `ha` Letter `ha` Upper
  `har____` xx `bt'har'st` A `yoor` This Unit

 output `ha` Glyph `ha` Letter `ha` Upper
  `har__` State `ha` Event `ha` relay `har'st` B `yor` A Unit

 output `ha` Glyph `ha` Letter `ha` Upper
  `har__` Given `har` is `yor` A Unit

 -- (Scope `har` field @String @(String `P` Boolean))
  -- `har` ("Hello" `hjd` True Unit)
  -- `yokl` Forth `ha` Await `ha` output

 (Event `har` pop @List @ASCII)
  `hor` [Glyph `ha` Letter `ha` Upper `har'st` X]
  `yokl` Check `ha` Await `ha` output

 -- (Event `har` pop @List @ASCII)
  -- `har`

  -- [Glyph `ha` Letter `ha` Upper `har'st` X]
  -- `yokl` Check `ha` Await `ha` output

 -- Supertype (Opted i) ~ (i `S` i)
 
 -- Unit `S` Unit `AR__` i `AR__` Opted i

 -- Supertype (Match i) ~ (i `AR__` Boolean)
 
 -- i `AR___` Unit `S` Unit `AR___` Match i

 -- example `yoor'st` This @Unit `yokl` Forth `ha` Await `ha` output
 -- example `yoor'st` That @Unit `yokl` Forth `ha` Await `ha` output

 -- f `ryoo` x
 -- f `yoor` x

 -- `hor` : target (t i o) (source i o)
 -- `har` : target (t a i) (source a i)
 -- Arrow a o `
