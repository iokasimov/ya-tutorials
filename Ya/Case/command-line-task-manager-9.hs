import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

start :: Tree String
start = empty @List
 `yi___` push `ho'ho` that
  `hv__` empty @List `yi` push `ho'ho` that `hv` (empty @List `lu` "Bail if you see AI slop there")
    `lu` "Check their open source contributions"
 `ha___` push `ho'ho` that `hv__'he` intro @Tree `hv` "Find their HR on Linkedin and say hi"
 `ha___` push `ho'ho` that `hv__'he` intro @Tree `hv` "Try to find people who work there"
 `lu___` "Apply to that new position"

start' :: Tree String
start' = sub @Tree `ho` that
   `hv___` intro @Tree `hv` "Apply to that new position"
 `hv_____` push `ho'ho` that
   `hv___` intro @Tree `hv` "Try to find people who work there"
  `ha____` push `ho'ho` that
   `hv___` sub @Tree `ho` that
    `hv__` intro @Tree `hv` "Check their open source contributions"
    `hv__` intro @List `ha` intro @Tree @(AR) `hv` "Bail if you see AI slop there"
  `ha____` push `ho'ho` that
   `hv___` intro @Tree `hv` "Find their HR on Linkedin and say hi"
  `hv____` empty @List

start'' :: Tree String
start'' = intro @Tree `hv` "Apply to that new position"
 `yi` that `ha` sub @Tree `hv___` empty @Maybe
 `lu` intro @Tree `hv` "Try to find people who work there" `yi` Exist
 `lu` intro @Tree `hv` "Find their HR on Linkedin and say hi" `yi` Exist
 `lu` intro @Tree `hv` "Check their open source contributions" `yi` Build `ho` to @List

start''' :: Tree String
start''' = that `ha` sub @Tree
   `hv_____` intro @Tree "Apply to that new position"
 `hv_______` push `ho'ho` that
   `hv_____` intro @Tree "Find their HR on Linkedin and ask on it"
  `ha______` push `ho'ho` that
   `hv_____` that `ha` sub @Tree
    `hv____` intro @Tree "Check their open source contributions"
    `hv____` push `ho'ho` that
     `hv___` intro @Tree "Bail if you see AI slop there"
     `hv___` empty @List
  `ha______` push `ho'ho` that
   `hv_____` intro @Tree "Try to find people who work there"
  `hv______` empty @List

-- main = start
--  `yokl` Forth `ha` Await
--  `ha__` is @String
--   `ho_'yokl` Forth `ha` Await `ha` output
--   `ho_'yuk` Await `ha` output `ha` Caret `hv'he` Newline

type Indent = List Unit

main = start'''
 `kyokl` Depth `ha` Forth `ha` Await
 `ha___` is `ho'he` that @Indent `ho_` push `hv` Unit `ho` that `ho_'yukl` Forth `ha` Await `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `hv'he` Asterisk
 `lo_'yp` is `hu_` Await `ha` output `ha` Glyph `ha` Symbol `ha` Punctuate `hv'he` Space
 `lo_'yp` is `ho'he` this @String `ho_'yokl` Forth `ha` Await `ha` output `ho_` Await
 `lo_'yp` is `hu_` Await `ha` output `ha` Caret `hv'he` Newline