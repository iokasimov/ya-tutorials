import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console
import "ya-literal" Ya.Literal

type Name = Latin

type Term = Along Name `S'T'I'TT'I` Twice `S'T'I'TT'I` Flout Name

pattern Abstraction x xx = Clasp (This (Clasp (This (Along (These xx x)))))
pattern Application x xx = Clasp (This (Clasp (That (Twice (These x xx)))))
pattern Variable x = Clasp (That (Flout x))

type Expression = Recursive Term

abstraction'I = Recursive `har_` Abstraction `har'st` X
 `har'st` Recursive `ha` Variable `ha` X

application'I = Recursive `har___` Application
 `har__` Recursive `har_` Abstraction `har'st` X
  `har'st` Recursive `ha` Variable `ha` X
 `har__'st` Recursive `ha` Variable `ha` Y

pattern ABS x xx = Recursive (Abstraction x xx)
pattern APP x xx = Recursive (Application x xx)
pattern VAR x = Recursive (Variable x)

abs'I = ABS `har'st` X `har'st` VAR `ha` X

app'I = APP `har_` ABS `har'st` X `har'st` VAR `ha` X `har_'st` VAR `ha` Y

main = Pass `ryo` Enter @World
