import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

start = that `ha` sub @Tree `hc___` "Apply to that new position" `ryu` Enter @Tree
 `hc_____` push `ho'ho` that `hc___` "Find their HR on Linkedin and ask on it" `ryu` Enter @Tree
  `ha____` push `ho'ho` that `hc___` "Bail if you see AI slop there" `ryu` Enter @Tree
   `st'ryu` Enter @List `hjd_` "Check their open source contributions"
  `ha____` push `ho'ho` that `hc___` "Try to find people who work there" `ryu` Enter @Tree
  `hc____` empty @List

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
 `ho___'yuk` Await `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `hc'st` Plus
    `hjd'yp` Await `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `hc'st` Space
 `lo___'yp` Await `ha__` is `ho'st` this @String `ho_'yokl` Forth `ha` Await `ha` output
 `ho___'yuk` Await `ha` output `ha` Caret `hc'st` Newline

main = start `kyokl` Depth `ha` Forth `ha` Await `ha` line
