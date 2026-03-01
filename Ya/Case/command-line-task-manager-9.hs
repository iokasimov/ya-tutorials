import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

start = that `ha` sub @Tree `har__` "Apply to that new position" `ryu` Enter @Tree @String
 `har____` push `ho'ho` that `har__` "Find their HR on Linkedin and ask on it" `ryu` Enter @Tree @String
  `ha____` push `ho'ho` that `har__` "Bail if you see AI slop there" `ryu` Enter @Tree @String
   `st'ryu` Enter @List `hjd_'tb` is @String `har` "Check their open source contributions"
  `ha____` push `ho'ho` that `har__` "Try to find people who work there" `ryu` Enter @Tree @String
  `har___` empty @List

-- example :: Tree `T'I` String
-- example = "Bail if you see AI slop there" `ryu` Enter @Tree
--    `st'ryu` Enter @List
--    `hjd_` "Apply to that new position"

-- main = start
--  `yokl` Forth `ha` Await `ha__` is @String
--  `ho_'yokl` Forth `ha` Await `ha` output
--  `ho_'yuk` Await `ha` output `ha` Caret `hc'st` Newline

type Indent = List Unit

line = is `ho'st` that @Indent
 `ho___'yokl` Forth `ha` Await
  `ha__` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha` Space
  `hop'yp` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha` Space `ho` Await
 `ho___'yuk` Await `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `har'st` Plus
   `hjd_'yp` Await `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `har'st` Space
 `lo___'yp` Await `ha__` is `ho'st` this @String `ho_'yokl` Forth `ha` Await `ha` output
 `ho___'yuk` Await `ha` output `ha` Caret `har'st` Newline

main = start `kyokl` Depth `ha` Forth `ha` Await `ha` line
