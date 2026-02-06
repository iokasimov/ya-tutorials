import "ya" Ya
import "ya-world" Ya.World
import "ya-ascii" Ya.ASCII
import "ya-console" Ya.Console

type String = Nonempty List ASCII

match :: ASCII `AR___` Maybe `T'I` Shifter List
match = exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` J `ho'yo` Below
 `hop'ys'has` exact `ha` Glyph `ha` Letter `ha` Lower `hc'st` K `ho'yo` Above `ho` Check

-- tap' x = morph @Maybe `ha` Stump `ha` Stops `ha` on @Glyph `hc` x
--  `yok_` Check `ha` morph @Maybe `ha` Stump `ha` Stops `ha` on @Letter
--  `yok_` Check `ha` (exact `ha` Lower `hc'st` J `ho'yo` Below)
--  `hop_'ys` Check `ha` (exact `ha` Lower `hc'st` K `ho'yo` Above)

main = input `yok` Retry `ha_'yok` Check `ha` match
