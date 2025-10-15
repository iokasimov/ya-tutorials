import "ya" Ya
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Imbalance = (Shape `P` Shape) `S` (Shape `S` Shape)

pattern Mismatch x = This x
pattern Missing x = That x

deposit bracket = intro @(Stops Imbalance `JNT` State `T` List Shape) Unit
 `yuk__` New `ha` State `ha` Event `hv` push @List bracket

analyze bracket = intro @(Stops Imbalance `JNT` State `T` List Shape) Unit
 `yuk__` New `ha` State `ha` Event `hv` pop @List
 `yok__` Try `ha__` Empty `hu_` Error @Imbalance `ha` Missing `ha` Opened `hv` bracket `la` Valid @Shape
 `yok__` Try `ha__` Error @Imbalance `ha` Mismatch `la` Valid @Shape `ha__` compare bracket

compare closed opened = opened `lu'q` closed

remnant = Empty `hu` Valid Unit
 `la` Error @Imbalance `ha` Missing `ha` Closed
 `ha` this @Shape `ha` top @(Nonempty List)

inspect code = code
 `yokl____` Forth `ha` Run @(Stops Imbalance `JNT` State `T` List Shape)
 `ha______` Maybe `ha` dim `ha` on @Glyph
 `ho___'yok` Maybe `ha` dim `ha` on @Symbol `ho` Check
 `ho___'yok` Maybe `ha` dim `ha` on @Bracket `ho` Check
 `ho___'yokl` Check `ha` Run `ha__` deposit `la` analyze
 `he'he'hv_______` empty @List
 `yok_____` Check `ha` remnant `ha'he` that @(List Shape)

main = Error `hu` "[ERROR] Missing or mismatching bracket!"
 `la___` Valid `hu` "[VALID] Everything is seem to be good!" `ho` is @(List ASCII)
 `li___` inspect `ha` is @(Nonempty List ASCII) `hv` "fn main() { println('hello, <world>!') }"
 `yokl_` Forth `ha` Run `ha` output
