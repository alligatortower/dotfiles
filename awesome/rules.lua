local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local tags = require("tags")

-- {{{ Rules
clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,

			maximized_vertical = false,
			maximized_horizontal = false,
			floating = false,
			maximized = false,
		},
	},
	{
		rule = { class = "Google-chrome" },
		properties = { floating = false },
	},
	{ rule = { class = "Slack" }, properties = { tag = tags.tag_names[3], floating = false } },
	{ rule = { class = "discord" }, properties = { tag = tags.tag_names[9] } },
	{
		rule_any = { class = { "Steam" } },
		properties = {
			titlebars_enabled = false,
			floating = true,
			border_width = 0,
			border_color = 0,
			size_hints_honor = false,
		},
	},
	-- Add titlebars to normal clients and dialogs
	-- {
	-- 	rule_any = { type = { "normal", "dialog" } },
	-- 	exceptions = { class = "kitty" },
	-- 	properties = { titlebars_enabled = true },
	-- },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
