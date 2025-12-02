import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

match = exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` J `ho'yo` Below
 `lo'ys'la` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` K `ho'yo` Above `ho` Check

-- tap' x = to @Maybe `ha` Stump `ha` Stops `ha` on @Glyph `hv` x
--  `yok_` Check `ha` to @Maybe `ha` Stump `ha` Stops `ha` on @Letter
--  `yok_` Check `ha` (exact `ha` Lower `hv'he` J `ho'yo` Below)
--  `lo'ys` Check `ha` (exact `ha` Lower `hv'he` K `ho'yo` Above)

main = input `yok` Retry `ha` match
