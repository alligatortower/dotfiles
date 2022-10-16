local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

-- Lain Cairo separators util submodule
-- lain.util.separators
local separators = { height = beautiful.separators_height or 0, width = 12 }

function separators.rounded_left(col1, col2)
	local widget = wibox.widget.base.make_widget()
	widget.col1 = col1
	widget.col2 = col2

	widget.fit = function(_, _, _)
		return separators.width, separators.height
	end

	widget.update = function(c1, c2)
		widget.col1 = c1
		widget.col2 = c2
		widget:emit_signal("widget::redraw_needed")
	end

	widget.draw = function(_, _, cr, width, height)
		if widget.col2 ~= "alpha" then
			-- cr:set_source_rgba(gears.color.parse_color(widget.col2))
			cr:set_source_rgba(gears.color.parse_color("blue"))
			cr:move_to(0, 0)
			gears.shape.arc(cr, separators.width, separators.height, 40, 3, 0, separators.width)
			-- gears.shape.pie(cr, separators.width, separators.height, 3.14159, 0, 10)
			cr:fill()
		end
	end
	if widget.col1 ~= "alpha" then
		return wibox.container.background(widget, widget.col1)
	end

	return widget
end

return separators
