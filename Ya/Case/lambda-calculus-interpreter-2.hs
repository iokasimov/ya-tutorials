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

abstraction'I = Impel `har_` Abstraction `har'st` X `har'st` Value `ha` X

application'I = Impel `har___` Application `har__` Impel `har_` Abstraction `har'st` X `har'st` Value `ha` X `har__'st` Value `ha` Y

pattern ABS x xx = Impel (Abstraction x xx)
pattern APP x xx = Impel (Application x xx)
pattern VAR x = Value x

abs'I = ABS `har'st` X `har'st` VAR `ha` X

app'I = APP `har_` ABS `har'st` X `har'st` VAR `ha` X `har_'st` VAR `ha` Y

-- TODO: Instruction Term `C'AR_____` Instruction Term `T'TT'I__` Term `S'T'I'TT'I` Alone

main = do
 Instruction @Term abs'I `yokl` Forth `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper
 output `ha` Caret `har'st` Tab
 Instruction @Term app'I `yokl` Forth `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper
 output `ha` Caret `har'st` Tab
