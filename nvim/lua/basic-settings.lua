vim.g.mapleader = " "

-- use system clipboard
vim.opt.clipboard = "unnamedplus"
-- only search case senstivie if uppercase letter used
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- window title = file (path)
vim.opt.title = true
-- minimal line number gutter
vim.opt.numberwidth = 1
-- hide buffers when :e-ing out
vim.opt.hidden = true
-- quicker updates
vim.opt.updatetime = 250
-- start scroll when one line from top or bottom
vim.opt.scrolloff = 3
-- linenumbers on by default
vim.opt.nu = true
-- time to wait for next key in sequence
vim.opt.timeoutlen = 500
-- error signs in number gutter
vim.opt.signcolumn = "number"
-- always show tabline
vim.o.showtabline = 2

vim.g.python3_host_prog = "/usr/bin/python3"
