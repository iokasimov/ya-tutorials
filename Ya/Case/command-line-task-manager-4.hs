import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type Title = Nonempty List ASCII

tap = exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` J `ho'yo` Down
 `lo'ys` exact `ha` Glyph `ha` Letter `ha` Lower `hv'he` K `ho'yo` Lift `ho` Check

-- tap' x = to @Maybe `ha` Stump `ha` Stops `ha` on @Glyph `hv` x
--  `yok_` Check `ha` to @Maybe `ha` Stump `ha` Stops `ha` on @Letter
--  `yok_` Check `ha` (exact `ha` Lower `hv'he` J `ho'yo` Down)
--  `lo'ys` Check `ha` (exact `ha` Lower `hv'he` K `ho'yo` Lift)

main = input `yok_` Retry `ha` tap `ho__'yo` is `la` is
