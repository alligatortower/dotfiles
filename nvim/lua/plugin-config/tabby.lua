local api = require("tabby.module.api")
local theme = {
	fill = "StatusLine", -- tabline background
	head = "PMenu", -- head element highlight
	current = "PMenuThumb", -- current tab label highlight
	tab = "NormalFloat", -- other tab label highlight
	win = "StatusLine", -- window highlight
	unsaved_current = "lualine_a_insert",
	unsaved = "lualine_b_diff_added_normal",
	tail = "PMenu", -- tail element highlight
}

local tab_name = function(tab)
	local cur_win = api.get_tab_current_win(tab.id)
	if api.is_float_win(cur_win) then
		return "[Floating]"
	end
	local current_bufnr = vim.fn.getwininfo(cur_win)[1].bufnr
	local current_bufinfo = vim.fn.getbufinfo(current_bufnr)[1]
	local current_buf_name = vim.fn.fnamemodify(current_bufinfo.name, ":t")
	if current_buf_name == "" then
		return "[Empty]"
	else
		return current_buf_name
	end
end

local window_count = function(tab)
	local win_count = #api.get_tab_wins(tab.id)
	if win_count == 1 then
		return ""
	else
		return "[" .. win_count .. "]"
	end
end

local win_is_modified = function(win)
	return vim.bo[win.buf().id].modified
end

local tab_is_modified = function(tab)
	local modified = false
	tab.wins().foreach(function(win)
		if win_is_modified(win) then
			modified = true
		end
	end)
	return modified
end

require("tabby.tabline").set(function(line)
	return {
		-- head
		{
			{ "    ", hl = theme.head },
			line.sep("", theme.head, theme.fill),
		},
		-- tabs
		line.tabs().foreach(function(tab)
			local hl
			if tab_is_modified(tab) then
				hl = tab.is_current() and theme.unsaved_current or theme.unsaved
			else
				hl = tab.is_current() and theme.current or theme.tab
			end
			return {
				line.sep("", hl, theme.fill),
				tab.number(),
				tab_name(tab),
				window_count(tab),
				line.sep("", hl, theme.fill),
				hl = hl,
				margin = " ",
			}
		end),
		line.spacer(),
		-- windows
		line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
			local hl
			if win_is_modified(win) then
				hl = win.is_current() and theme.unsaved_current or theme.unsaved
			else
				hl = win.is_current() and theme.current or theme.tab
			end
			return {
				line.sep("", hl, theme.fill),
				win.buf_name(),
				line.sep("", hl, theme.fill),
				hl = hl,
				margin = " ",
			}
		end),
		-- tail
		{
			line.sep("", theme.tail, theme.fill),
			{ "  ", hl = theme.tail },
		},
		hl = theme.fill,
	}
end)
