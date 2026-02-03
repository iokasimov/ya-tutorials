import Ya
import Ya.World
import Ya.ASCII
import Ya.Expo.ASCII
import Ya.Expo.Terminal

import "base" System.IO (IO, print)

-- morse_code_tree = Binary
 -- `yiiiiiiii`(Exist `ha` Root E `ha` Binary
  -- `yiiiiii` Exist `ha` Node I `ha` Binary
    -- `yiiii` Exist `ha` Node S `ha` Binary
      -- `yii` (Exist `yi` leaf H)
       -- `hjd` (Exist `yi` leaf V)
     -- `yi'lu` Exist `ha` Node U `ha` Binary
      -- `yii` (Exist `yi` leaf F)
       -- `hjd` Empty ()
   -- `yi'yi'lu` Exist `ha` Node A `ha` Binary
    -- `yiiii` Exist `ha` Node R `ha` Binary
      -- `yii` (Exist `yi` leaf L)
       -- `hjd` Empty ()
     -- `yi'lu` Exist `ha` Node W `ha` Binary
      -- `yii` (Exist `yi` leaf P)
       -- `hjd` (Exist `yi` leaf J))
 -- `yi'yi'yi'lu` (Exist `ha` Root T `ha` Binary
  -- `yiiiiii` Exist `ha` Node N `ha` Binary
    -- `yiiii` Exist `ha` Node D `ha` Binary
      -- `yii` (Exist `yi` leaf B)
       -- `hjd` (Exist `yi` leaf X)
     -- `yi'lu` Exist `ha` Node K `ha` Binary
      -- `yii` (Exist `yi` leaf C)
       -- `hjd` (Exist `yi` leaf Y)
   -- `yi'yi'lu` (Exist `ha` Node M `ha` Binary
    -- `yiiii` Exist `ha` Node G `ha` Binary
     -- `yiii` (Exist `yi` leaf Z)
       -- `hjd` (Exist `yi` leaf Q)
     -- `yi'lu` (Exist `yi` leaf O)))

type Morse = () `S` ()

pattern Dot e = This e :: Morse
pattern Dash e = That e :: Morse

type Table = Supertype (Forest (Binary Tree) Latin)

-- TODO: now I understand what I should do
-- ..... I need to use `find` method of `Dict` class

-- TODO: make it working
-- main = morse_code_tree `yokl'yokl` Fore `ha` print

-- jump x = review `haa`rep (super x) `ho` State

-- trim t = (sub `yi_` t `huuuu` this)
 -- `hu` but `hu` relay `hu` Transition `hu` State
 -- `yu` (top `yi_` t `huuuu` this)

-- main = Dot () `hjd` Dash () `hjd` Dot () `huuu` as @(Nonempty List) @Morse
 -- `yokl` way @Fore @(State Table `JT` Halts)
 -- `haaaaa` intro `ho'yokl` jump `ho'yokl` on @Halts `ho'yokl` trim
 -- `yiiiz'yiz` morse_code_tree
 -- `huuuuuu`but "[ERROR] Letter was not found!"
     -- `rfz` that `hoz'yo` (Letter `ha` Upper)
 -- `yokl` way @Fore `ha` output

main = print "typechecked"
