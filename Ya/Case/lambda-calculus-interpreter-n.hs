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

-- \x.x

app'I = APP `har_` ABS `har'st` X `har'st` VAR `ha` X `har_'st` VAR `ha` Y

-- \x.x y

var = VAR `har'st` Y

-- Instruction Term `C'AR___` Instruction Term `T'TT'I` Along `T'TT` List `T'I` Term Unit

f x g = Instruction @Term x
 `kyokl` Trace `ha` Forth `ha` Await
 `ha` (g :: Along `T'TT` List `T'I` (Along Name `S'T'I'TT'I` Along (Unit `S` Unit)) Unit `T'I_` Name `AR____` World Name)

-- print :: Along Latin `S'T'I'TT'I` Along (Unit `S` Unit) `T'I___` Latin `AR__` Nonempty List Latin
-- print = Same @(Along Latin Latin) `ho_'st` Same `ho'ut` "\" this 
 -- `bt'has__` Same @(Along (Size 2) Latin) `ho_'st`

print_abstraction :: Along Name Unit `AR` List ASCII
print_abstraction (Along (These _ name)) =
  Glyph `ha` Symbol `ha` Punctuate `ha` Back `ha` Slash
 `has___` Pass `ho__'ut` Glyph `ha` Letter `ha` Lower `har` name
  `has__` Glyph `ha` Symbol `ha` Punctuate `ha` Period
   `has_` Glyph `ha` Symbol `ha` Punctuate `ha` Underscore
    `has` Caret `ha` Tab
 `__ryo` Enter @List

print_application :: Along (Size 2) Unit `AR` List ASCII
print_application (Along (These _ loc)) =
 Pass `ho___'ut` Symbol `ha` Punctuate `har_` Underscore `has` Underscore `har` loc
 `has____` Pass `ho___'ut` Symbol `ha` Punctuate `har'st` Space
 `ho_____` Glyph
 `___ryo` Enter @List

type Span = Along Name `S'T'I'TT'I` Along (Unit `S` Unit)

{-
unlink :: Name `AR_` Span Unit `AR` (Stops `T'I` Brujin `JNT` State `T'I` Brujin `T'I_` _)
unlink var span = Pass `ryo` Enter @(Stops `T'I` Brujin `JNT` State `T'I` Brujin)
 `yok__'ut` Check `ha___` Ok `ha` Exist `has` Break `ha_'hjd'eq` var `ha_'st` that `bt'has_` Same `ho'ut'st` Empty `har__` span
-}

type Brujin = List Name

search :: Name `AR____` Span Name `AR___` Stops `T'I` Along Name Brujin `JNT` State `T'I` Brujin `T'I_` Maybe (Maybe Name)
search var span = Pass `ryo` Enter @(Stops `T'I` Along Name Brujin `JNT` State `T'I` Brujin)
 `yok___'ut` Steal `ha___` Ok `ha` Exist `ha` this `has` Break `ha_'hjd'eq` var `ha_'st` that `bt'has_` Same `ho_'ut'st` Ok `ha` Empty `har__` span
 `yok_____` Apply `ha____'yokl` Check `ha` Allot `ha` State `ha___` Event `ha` Push `ho__'ha` Scope `har` within `ha` Fresh

{-
binder :: Maybe Name `AR____` State `T'I_` Brujin `T'I_` Maybe (Maybe Name)
binder span = span `yokl__` Check `ha` Allot `ha` State `ha___` Event `ha` Push `ho__'ha` Scope `har` within `ha` Fresh

unlink :: Name `AR__` Span Unit `AR_` Stops Name `T'I` Maybe Name
unlink var = Ok `ha` Exist `ha` this `has` Break `ha_'hjd'eq` var `ha_'st` that `bt'has___` Same `ho_'ut'st` Ok `ha` Empty
-}

 -- `yok__'ut` Allot `ha` State `har__` Event `har'st` Push `ha__` Scope `har` within `ha` Fresh
--  `yok____` Check `ha___` Ok `has` Break `ha_` (arg `hjd'eq` var `yio`)

 -- Ok `has` Break `ha'hjd'eq` var `ha'st` that `bt'has_` Ok

-- index :: ((Along `T'I_` List `T'TT` Span `T'I` Unit) `T'I_` Name) `AR` Stops Name (List (Span Unit))

-- index (Along (These name trace)) = trace
 -- `yokl__` Aback `ha` Apply @(Stops `T'I` Name `JNT` State `T'I` List Unit)
 -- `ha____` Stops `ha__'hjd'eq` name

main = do

 A `has_` B `has` C
  `ryo` Enter @(Nonempty List)
  `kyokl` Depth `ha` Forth `ha` Await
  `ha_'yokl` Forth `ha` Await `ha` output
   `ha` Glyph `ha` Letter `ha` Lower `ha` I
  `ha_` (\(Along (These x trace)) -> trace)

 output `ha` Caret `har'st` Tab

 Instruction @Term app'I
  `kyokl__` Trace `ha` Forth `ha` Await
  `ha_____` Enter @(Along `T'TT` List `T'I` Span Unit) @Name `ho__'st` that
   `ho___'yok` Plane `ha__` print_abstraction `bt'has` print_application
   `ho___'yokl` Forth `ha` Await `ha` output

 output `ha` Caret `har'st` Tab

 -- Instruction @Term abs'I
  -- `yok` 
 -- :: (Along Name `S'T'I'TT'I` Along (Unit `S` Unit)) Unit `AR` List `L` List `T` Void `T` ASCII)
  -- `ha___` record @(List ((Along Name `S'T'I'TT'I` Along (Unit `S` Unit)) Unit)) `ho` this
-- (Enter @(Along `T'TT` List `T'I` (Along Name `S'T'I'TT'I` Along (Unit `S` Unit)) Unit) @Name
-- :: Along `T'TT` List `T'I` (Along Name `S'T'I'TT'I` Along (Unit `S` Unit)) Unit `T'I_` Name `AR_` List ((Along Name `S'T'I'TT'I` Along (Unit `S` Unit)) Unit))

 {-
 Instruction @Term abs'I `yokl` Forth `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper
 output `ha` Caret `har'st` Tab
 Instruction @Term app'I `yokl` Forth `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper
 output `ha` Caret `har'st` Tab
 -}

 -- Instruction @Term var `kyokl` Slant `ha` Forth `ha` Await `ha` output `ha` Glyph `ha` Letter `ha` Upper

-- Lever - ?

-- Splitting list on many:
-- List a `AR____` a `AR` Choice n a `AR___` Vector n (List o)
