import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console
import "ya-literal" Ya.Literal

type Name = Latin

type Term = Along Name `S'T'I'TT'I` Twice

pattern Abstraction x xx = Clasp (This (Along (These xx x)))
pattern Application x xx = Clasp (That (Twice (These x xx)))

type Expression = Instruction Term Name

pattern ABS x xx = Impel (Abstraction x xx)
pattern APP x xx = Impel (Application x xx)
pattern VAR x = Value x

type Span = Along Name `S'T'I'TT'I` Along (Unit `S` Unit)

type Traced t = Along (List `T'I` t Unit)

pattern ABS'VAR x = Clasp (This (Along (These Unit x)))
pattern APP'FUN x = Clasp (That (Along (These x (This Unit))))
pattern APP'ARG x = Clasp (That (Along (These x (That Unit))))
pattern VAR'CTX x xx = Value (Along (These x xx))

id'abs = ABS `har'st` X `har'st` VAR `ha` X -- \x.x

id'abs'ctx = ABS `har___'st` X `har___` VAR'CTX `har__'st` X `har__` ABS'VAR `ha` X `ryo` Enter @List

id'app = APP `har_` ABS `har'st` X `har'st` VAR `ha` X `har_'st` VAR `ha` Y -- (\x.x) y

id'app'ctx = APP
 `har___` ABS `har'st` X `har` (VAR'CTX `har__'st` X `har__` APP'FUN `has` ABS'VAR `ha` X `ryo` Enter @List)
 `har___` (VAR'CTX `har__'st` Y `har__` APP'ARG `ryo` Enter @List)

main = do

 is `ho'ut` "NO" `has` is `ho'ut` "OK" `ho_'yokl` Forth @List `ha` Await `ha` output
  `har____` Instruction @Term @Name `har` id'abs `kyo` Trace @Span
   `hjd_'eq` Instruction @Term @(Traced Span Name) `har` id'abs'ctx

 output `ha` Caret `har'st` Tab

 is `ho'ut` "NO" `has` is `ho'ut` "OK" `ho_'yokl` Forth @List `ha` Await `ha` output
  `har____` Instruction @Term @Name `har` id'app `kyo` Trace @Span
   `hjd_'eq` Instruction @Term @(Traced Span Name) `har` id'app'ctx

 output `ha` Caret `har'st` Tab
