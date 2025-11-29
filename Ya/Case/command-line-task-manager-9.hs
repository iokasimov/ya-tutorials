import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

start :: Tree String
start = that `ha` sub @Tree
    `hv_` intro @Tree `hv` "Apply to that new position"
 `hv____` push `ho'ho` that
    `hv_` intro @Tree `hv` "Find their HR on Linkedin and ask on it"
  `ha___` push `ho'ho` that
   `hv__` that `ha` sub @Tree
    `hv_` intro @Tree `hv` "Check their open source contributions"
    `hv_` intro @List `hv` intro @Tree "Bail if you see AI slop there"
  `ha___` push `ho'ho` that
    `hv_` intro @Tree `hv` "Try to find people who work there"
  `hv___` empty @List

-- main = start
--  `yokl` Forth `ha` Await `ha__` is @String
--  `ho_'yokl` Forth `ha` Await `ha` output
--  `ho_'yuk` Await `ha` output `ha` Caret `hv'he` Newline

type Indent = List Unit

line = is `ho'he` that @Indent 
 `ho___'yokl` Forth `ha` Await
  `ha__` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha` Space
  `lo'yp` output `ha` Glyph `ha` Symbol `ha` Punctuate `ha` Space `ho` Await
 `ho___'yuk` Await `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `hv'he` Plus
     `lu'yp` Await `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `hv'he` Space
 `lo___'yp` Await `ha__` is `ho'he` this @String `ho_'yokl` Forth `ha` Await `ha` output
 `ho___'yuk` Await `ha` output `ha` Caret `hv'he` Newline

main = start `kyokl` Depth `ha` Forth `ha` Await `ha` line