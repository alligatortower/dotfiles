local leap = require("leap")
local wk = require("which-key")

-- -- Make new table from string
-- local t = {}
-- local str = "fjdkslaruvmgheiwoxqpbnzFJDKSLARUVMGHEIWOXQPBNZ"
-- for i = 1, #str do
--     t[i] = str:sub(i, i)
-- end
-- leap.opts.labels = t
leap.opts.highlight_unlabeled_phase_one_targets = true

wk.register(do_global_leap)

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("LeapSetup", { clear = true }),
	pattern = "*",
	callback = function(opts)
		if vim.bo.buftype == "" or vim.bo.buftype == "help" then
			wk.register(get_local_leap_n(opts))
			wk.register(get_local_leap_o(opts))
			wk.register(get_local_leap_x(opts))
		end
	end,
})
