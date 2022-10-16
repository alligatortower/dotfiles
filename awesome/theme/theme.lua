-- {{{ Imports
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
-- }}}

local themes_path = string.format("%s/.config/awesome/theme/", os.getenv("HOME"))

local font = "Fira Sans"

-- {{{ Main
local theme = {}
-- }}}

-- {{{ theme font
theme.font = font .. " 12"
--- }}}
theme.green = "#427b58"
theme.blue = "#076678"
theme.yellow = "#b57614"
theme.pink = "#8f3f71"
theme.red = "#9d0006"
theme.gray_active = "#3c3836"
theme.gray_inactive = "#3c3836"

-- {{{ bar colors
theme.bar_bg_one = theme.green
theme.bar_bg_two = theme.blue
theme.bar_bg_tre = theme.yellow
theme.bar_bg_for = theme.red
theme.bar_bg_fiv = theme.pink
theme.bar_clock = theme.gray_active
theme.bg_systray = theme.blue
theme.systray_icon_spacing = 5
--- }}}

-- tasklist
theme.tasklist_font = font .. " 10"

-- {{{ Colors
theme.fg_normal = "#ebdbb2"
theme.fg_focus = "#dfc4a1"
theme.fg_urgent = "#fbf1c7"
theme.bg_normal = "#1d2021"
theme.bg_focus = theme.gray_active
theme.bg_urgent = "#a89984"
-- }}}

-- {{{ Borders
theme.useless_gap = dpi(5)
theme.border_width = dpi(3)
theme.border_normal = "#504945"
theme.border_focus = theme.blue
theme.border_marked = theme.red
-- }}}

-- {{{ Taglist
theme.taglist_font = "Fira Code Medium Nerd Font Complete 24"
theme.taglist_fg_focus = theme.yellow
theme.taglist_fg_occupied = theme.blue
theme.taglist_fg_urgent = theme.red
theme.taglist_fg_empty = theme.gray_active
theme.taglist_bg_urgent = theme.gray_inactive
theme.taglist_spacing = 5
-- }}}

-- {{{ Notifications
theme.notification_font = font .. " 12"
theme.notification_bg = "#282828"
theme.notification_fg = "#fbf1c7"
theme.notification_shape = gears.shape.rounded_rect
-- }}}

-- {{{ Hotkeys Popup
theme.hotkeys_bg = "#282828"
theme.hotkeys_fg = "#ebdbb2"
theme.hotkeys_modifiers_fg = "#458588"
theme.hotkeys_label_bg = "#fabd2f"
theme.hotkeys_label_fg = "#1d2021"
theme.hotkeys_group_margin = dpi(20)
theme.hotkeys_description_font = font .. " 10"
theme.hotkeys_font = font .. " 12"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#cc241d"
theme.mouse_finder_radius = dpi(5)
theme.mouse_finder_timeout = 10
-- }}}

-- {{{ Layout
theme.layout_tile = themes_path .. "gruvbox/layouts/tile.png"
theme.layout_tileleft = themes_path .. "gruvbox/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "gruvbox/layouts/tilebottom.png"
theme.layout_tiletop = themes_path .. "gruvbox/layouts/tiletop.png"
theme.layout_fairv = themes_path .. "gruvbox/layouts/fairv.png"
theme.layout_fairh = themes_path .. "gruvbox/layouts/fairh.png"
theme.layout_spiral = themes_path .. "gruvbox/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "gruvbox/layouts/dwindle.png"
theme.layout_max = themes_path .. "gruvbox/layouts/max.png"
theme.layout_fullscreen = themes_path .. "gruvbox/layouts/fullscreen.png"
theme.layout_magnifier = themes_path .. "gruvbox/layouts/magnifier.png"
theme.layout_floating = themes_path .. "gruvbox/layouts/floating.png"
theme.layout_cornernw = themes_path .. "gruvbox/layouts/cornernw.png"
theme.layout_cornerne = themes_path .. "gruvbox/layouts/cornerne.png"
theme.layout_cornersw = themes_path .. "gruvbox/layouts/cornersw.png"
theme.layout_cornerse = themes_path .. "gruvbox/layouts/cornerse.png"
-- }}}

return theme
