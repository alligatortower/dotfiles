local awful = require("awful")

-- Table of layouts to cover with awful.layout.inc, order matters.
--

awful.layout.layouts = {
	awful.layout.suit.floating,
	awful.layout.suit.tile,
	awful.layout.suit.fair,
	awful.layout.suit.spiral,
	awful.layout.suit.max.fullscreen,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}
-- }}}
