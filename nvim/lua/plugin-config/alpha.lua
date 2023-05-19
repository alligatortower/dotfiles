local alpha = require("alpha")
return {
	layout = {
		{
			type = "padding",
			val = 3,
		},
		{
			type = "text",
			val = {
				" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
				" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
				" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
				" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
				" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
				" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
			},
			opts = {
				position = "center",
			},
		},
		{
			type = "padding",
			val = 1,
		},
		{
			type = "text",
			val = "alligatortower's config",
			opts = {
				position = "center",
			},
		},
		{
			type = "padding",
			val = 4,
		},
		{
			type = "group",
			opts = {
				spacing = 1,
			},
			val = {
				{
					type = "text",
					val = "🔭 Find File       <leader>t",
					opts = {
						position = "center",
						align_shortcut = "left",
						width = 50,
					},
				},
				{
					type = "text",
					val = "🔍 Live Grep       <leader>f",
					on_press = "<leader>f",
					opts = {
						position = "center",
						align_shortcut = "left",
						width = 50,
					},
				},
				{
					type = "text",
					val = "🕑 Recent Files    <leader>o",
					on_press = "<leader>o",
					opts = {
						position = "center",
						align_shortcut = "left",
						width = 50,
					},
				},
				{
					type = "text",
					val = "🌳 NVim Tree       <leader>d",
					on_press = "<leader>d",
					opts = {
						position = "center",
						align_shortcut = "left",
						width = 50,
					},
				},
			},
		},
		{
			type = "padding",
			val = 5,
		},
		-- {
		-- 	type = "terminal",
		-- },
		{
			type = "button",
			val = "", -- for cursor
			opts = {
				position = "center",
			},
		},
	},
}
