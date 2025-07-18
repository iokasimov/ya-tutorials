import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Imbalance = (Shape `P` Shape) `S` (Shape `S` Shape)

pattern Mismatch x = This x
pattern Missing x = That x

deposit bracket = intro @(State `T'I` List Shape `JNT` Error Imbalance) Unit
 `yuk__` New `ha` State `ha` Event `hv` push @List bracket

analyze bracket = intro @(State `T'I` List Shape `JNT` Error Imbalance) Unit
 `yuk__` New `ha` State `ha` Event `hv` pop @List
 `yok__` Try `ha__` None `hu_` Error @Imbalance `ha` Missing `ha` Opened `hv` bracket `la` Valid @Shape
 `yok__` Try `ha__` Error @Imbalance `ha` Mismatch `la` Valid @Shape `ha__` compare bracket

compare closed opened = opened `lu'q` closed

remnant = Empty @List `hu` by Valid
 `la` Error @Imbalance `ha` Missing `ha` Closed
 `ha` this @Shape `ha` top @(Nonempty List)

inspect code = code
 `yokl_` Forth `ha` Run @(State `T'I` List Shape `JNT` Error Imbalance)
 `ha___` Some `hu` intro Unit `la_` is @Bracket `ho_` (deposit `la` analyze) `ho'yu` Unit
 `ha___` on @Glyph `ho'ho` on @Symbol `ho'he` is `ho'ho` on @Bracket `ho'he` is
 `he'he'hv____`by `hv` Empty @List
 `yok__` Try `ha` remnant `ha'he` that @(List Shape)

main = Error `hu` "[ERROR] Missing or mismatching bracket!"
 `la___` Valid `hu` "[VALID] Everything is seem to be good!" `ho` is @(List ASCII)
 `li___` inspect `ha` is @(Nonempty List ASCII) `hv` "fn main() { println('hello, <world>!') }"
 `yokl_` Forth `ha` Run `ha` output
