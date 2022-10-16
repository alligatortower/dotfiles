local awful = require("awful")
local names = { "", "", "", "", "", "", "", "", "" }

local l = awful.layout.suit
local tile_first_layouts = { l.tile, l.fair, l.max, l.tile.left, l.floating }
local floating_first_layouts = { l.floating, l.fair, l.max, l.tile.left, l.tile }
function setup_tags()
	awful.tag(names, s, l.tile)
end

return { setup_tags = setup_tags, tag_names = names }
