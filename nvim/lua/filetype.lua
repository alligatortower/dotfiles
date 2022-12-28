---------------------------------
-- SPACING / FILETYPE SETTINGS --
---------------------------------
vim.cmd("filetype plugin indent on")
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	command = "setlocal tabstop=2 shiftwidth=2",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	command = "setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	command = "setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "htmldjango", "jinja" },
	command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sass", "scss", "css" },
	command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "yaml" },
	command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.g.jsx_ext_required = 0
