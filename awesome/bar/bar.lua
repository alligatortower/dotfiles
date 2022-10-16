local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local theme = require("theme.theme")
local lain = require("lain")

local separators = lain.util.separators
local arrow = separators.arrow_left
local globalWidgets = {}

local batteryarc_widget = require("bar.widgets.batteryarc-widget.batteryarc")
local brightness_widget = require("bar.widgets.brightness-widget.brightness")
local calendar_widget = require("bar.widgets.calendar-widget.calendar")
local cpu_widget = require("bar.widgets.cpu-widget.cpu-widget")
local volume_widget = require("bar.widgets.volume-widget.volume")
local logout_menu_widget = require("bar.widgets.logout-menu-widget.logout-menu")
local ram_widget = require("bar.widgets.ram-widget.ram-widget")
local weather_widget = require("bar.widgets.weather-widget.weather")

local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

globalWidgets.logout_menu_widget = logout_menu_widget()
globalWidgets.mytextclock = wibox.widget.textclock()
globalWidgets.mytextclock.font = "FiraCode Nerd Font 12"
globalWidgets.cw = calendar_widget({
	theme = "dark",
	placement = "top_right",
})
globalWidgets.mytextclock:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		globalWidgets.cw.toggle()
	end
end)
globalWidgets.cpu_widget = cpu_widget()
globalWidgets.ram_widget = ram_widget({
	color_free = theme.green,
	color_used = theme.red,
})
globalWidgets.brightness_widget = brightness_widget({
	type = "arc",
	program = "brightnessctl",
	step = 10,
	max_value = 255,
})

globalWidgets.volume_widget = volume_widget({
	widget_type = "arc",
})
globalWidgets.batteryarc_widget = batteryarc_widget({
	show_current_level = true,
	arc_thickness = 2,
})
globalWidgets.systray = wibox.widget.systray()
globalWidgets.weather_widget = weather_widget({
	api_key = "eb8b26070bba4ea81b44bd7d3e662c38",
	coordinates = { 40.4406, -79.9959 },
	timeout = 1200,
	icons = "VitalyGorbachev",
	icons_extension = ".svg",
	time_format_12h = false,
	units = "metric",
	font_name = theme.font,
	show_hourly_forecast = true,
	show_daily_forecast = true,
})
gears.debug.dump(globalWidgets.volume_widget, 1)

awful.screen.connect_for_each_screen(function(s)
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.noempty,
		buttons = taglist_buttons,
	})

	s.mywibox = awful.wibar({ position = "top", screen = s })

	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			globalWidgets.logout_menu_widget,
			s.mytaglist,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			arrow(theme.gray_active, theme.green),
			wibox.container.background(wibox.widget.textbox(" "), theme.green),
			wibox.container.background(globalWidgets.cpu_widget, theme.green),
			wibox.container.background(wibox.widget.textbox(" "), theme.green),

			arrow(theme.green, theme.blue),
			wibox.container.background(wibox.widget.textbox(" "), theme.blue),
			wibox.container.background(globalWidgets.ram_widget, theme.blue),
			wibox.container.background(wibox.widget.textbox(" "), theme.blue),

			arrow(theme.blue, theme.red),
			wibox.container.background(wibox.widget.textbox(" "), theme.red),
			wibox.container.background(globalWidgets.brightness_widget, theme.red),
			wibox.container.background(wibox.widget.textbox(" "), theme.red),

			arrow(theme.red, theme.pink),
			wibox.container.background(wibox.widget.textbox(" "), theme.pink),
			wibox.container.background(globalWidgets.volume_widget, theme.pink),
			wibox.container.background(wibox.widget.textbox(" "), theme.pink),

			arrow(theme.pink, theme.blue),
			wibox.container.background(wibox.widget.textbox("  "), theme.blue),
			-- theme.bg_systray to change background of widget
			wibox.container.background(wibox.layout.margin(globalWidgets.systray, 0, 0, 5, 5), theme.blue),
			wibox.container.background(wibox.widget.textbox("  "), theme.blue),

			arrow(theme.blue, theme.yellow),
			wibox.container.background(wibox.widget.textbox(" "), theme.yellow),
			wibox.container.background(globalWidgets.batteryarc_widget, theme.yellow),
			wibox.container.background(wibox.widget.textbox(" "), theme.yellow),

			arrow(theme.yellow, theme.green),
			wibox.container.background(wibox.widget.textbox(" "), theme.green),
			wibox.container.background(globalWidgets.weather_widget, theme.green),
			wibox.container.background(wibox.widget.textbox(" "), theme.green),

			s.mylayoutbox,
			wibox.container.background(wibox.widget.textbox(" "), theme.bar_clock),
			wibox.container.background(globalWidgets.mytextclock, theme.bar_clock),
			wibox.container.background(wibox.widget.textbox(" "), theme.bar_clock),
		},
	})
end)
