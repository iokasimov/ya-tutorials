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
    `har__` TODO `st'hjd` "Apply to that new position" `ryu` Enter @Tree @Task
 `har_____` push `ho'ho` that
      `har` (DONE `st'hjd` "Find their HR on Linkedin and ask on it" `ryu` Enter @Tree)
    `ha___` push `ho'ho` that
     `har_` that `ha` sub @Tree
      `har` (TODO `st'hjd` "Check their open source contributions" `ryu` Enter @Tree)
      `har` (TODO `st'hjd` "Bail if you see AI slop there" `ryu` Enter @Tree `ryu` Enter @List)
    `ha___` push `ho'ho` that
      `har` (TODO `st'hjd_` "Try to find people who work there" `ryu` Enter @Tree @Task)
  `har____` empty @List

type Indent = List Unit

indent level = level
 `yok_` Plane @List
 `ha__'yo` Glyph `ha` Symbol `ha` Punctuate
 `ha__` Adapt @Twice `ho` morph @List
 `ha__` Space `hop'tb` Space

main = start
 `kyokl_` Depth `ha` Forth `ha` Await
 `ha____` field `ho` this @Indent `ho` indent
   `hop_'tb` is `hu` "TODO " `has` is `hu` "DONE " `ha_` field `ho` this @Status
   `ho__` morph @List `ha` Merge @List @List
   `hop_'tb` field `ho` this @String `ho` Adapt `ho` morph @List
   `ho__` morph @List `ha` Merge @List
  `ho___'yokl` Forth `ha` Await `ha` output
  `ho___'yuk` Await `ha` output `ha` Caret `har'st` Newline
