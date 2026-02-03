import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

type Status = Unit `S` Unit

pattern TODO e = This e
pattern DONE e = That e

type Task = Status `P` String

start = that `ha` sub @Tree @List @Task
    `hc___` TODO `st'hjd` "Apply to that new position" `ryu` Enter @Tree
 `hc______` push `ho'ho` that
      `hc_` (DONE `st'hjd` "Find their HR on Linkedin and ask on it" `ryu` Enter @Tree)
    `ha___` push `ho'ho` that
     `hc__` that `ha` sub @Tree
      `hc_` (TODO `st'hjd` "Check their open source contributions" `ryu` Enter @Tree)
      `hc_` (TODO `st'hjd` "Bail if you see AI slop there" `ryu` Enter @Tree `ryu` Enter @List)
    `ha___` push `ho'ho` that
      `hc_` (TODO `st'hjd` "Try to find people who work there" `ryu` Enter @Tree)
  `hc_____` empty @List

type Indent = List Unit

indent level = level
 `yok_` Plane @List
 `ha__'yo` Glyph `ha` Symbol `ha` Punctuate
 `ha__` Adapt @Twice `ho` to @List
 `ha__` Space `hop` Space

main = start
 `kyokl_` Depth `ha` Forth `ha` Await 
 `ha____` at `ho` this @Indent `ho` indent
   `hop_` is `hu` "TODO " `has` is `hu` "DONE " `ha_` at `ho` this @Status
   `ho__` to @List `ha` Merge @List @List
   `hop_` at `ho` this @String `ho` Adapt `ho` to @List
   `ho__` to @List `ha` Merge @List
  `ho___'yokl` Forth `ha` Await `ha` output
  `ho___'yuk` Await `ha` output `ha` Caret `hc'st` Newline
