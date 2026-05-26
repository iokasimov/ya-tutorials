import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console
import "ya-literal" Ya.Literal

type Identifier = Nonempty List Latin

type Manipulate = Along Identifier `S'T'I'TT'I` Twice

pattern Abstraction x = Clasp (This (Along x)) :: Manipulate Identifier
pattern Application x = Clasp (That (Twice x)) :: Manipulate Identifier

type Expression = Instruction Manipulate Identifier

-- type Spate a o = Instruction (Along a) o

-- x, xx :: Spate Identifier Unit
-- x = Instruction `ha` Value `har` Unit
-- xx = Instruction `ha` Impel `ha` Along `ha` (`hjd` "hello") `ha` Value `har` Unit

-- TODO: we probably should start with a simple ASCII parser
-- TODO: try to use Representing object to initialise corrent/incorrect terms

-- parse_1 :: Latin `AR___` Stops (Latin `P` Latin) Result -- Result
-- parse_1 = Stops `ha'hjd'eq` Y Unit `ho'yu` Yes Unit

-- parse_1 :: List Latin `AR___` Stops (Latin `P` Latin) (List Result) -- Result
-- parse_1 = Stops `ha'hjd'eq` Y Unit `ho'yu` Yes Unit

-- x :: List `C'AT` Maybe
-- x = Scope `har_` within `ha` Stock @Maybe

-- xx = within `ha` Front `ha` Stock @Alone `har` is @(List ASCII) "ABCD"

-- parse :: ASCII `AR___` Maybe Result
-- parse = 

main = Pass `ryo` Enter @World
  -- (Abstraction `har___` Y `ryo` Enter `hjd__` X `ryo` Enter :: Manipulate Identifier)
   -- `yokl'yokl` Apply `ha` Apply `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper
 -- this `ha` within `ha` First @Maybe `har` is @(List ASCII) "ABCD" `yokl` Check `ha` Await `ha` output
 -- derive `ha` Stock @Maybe `har` is @(List ASCII) "ABCD" `yokl` Check `ha` Await `ha` output
