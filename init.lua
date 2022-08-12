-- lua table mutating shit starts here
local function locate( lookup, value )
    for i = 1, #lookup do
        if lookup[i] == value then return true end
    end
    return false
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- colorschemes
	use("folke/tokyonight.nvim")
	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- core workflow
	use("kyazdani42/nvim-web-devicons") -- for nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly",
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use("tpope/vim-fugitive")
	use("haya14busa/incsearch.vim")
	use("folke/which-key.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	-- lsp
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	-- basic functionality++
	use("ntpeters/vim-better-whitespace")
	use("rhysd/clever-f.vim")
	use("lewis6991/gitsigns.nvim")
	use("fmoralesc/Vim-pad")
	use("mbbill/undotree")
	use("kshenoy/vim-signature")
	use({ "iamcco/markdown-preview.nvim", run = "cd app & yarn install" })
	use({ "prettier/vim-prettier", run = "yarn install" })
	-- misc
	use("stevearc/vim-arduino")
	use("MarcWeber/vim-addon-mw-utils")
	use("tomtom/tlib_vim")

	-------------
	-- DISPLAY --
	-------------
	vim.opt.termguicolors = true
	vim.g.tokyonight_style = "night"
	vim.cmd([[colorscheme tokyonight]])
	-- make comments bright
	vim.cmd("hi Comment guifg=#FFA500")
	-- remove -- insert -- now redundent thanks to lightline
	vim.opt.showmode = false
	vim.opt.laststatus = 2
	require("lualine").setup({
		options = {
			theme = "tokyonight",
		},
	})
	-- whitespace highlighting
	vim.cmd("hi ExtraWhitespace guibg=#990000 ctermbg=red")

	-------------------
	-- MISC SETTINGS --
	-------------------
	-- use system clipboard
	vim.opt.clipboard = "unnamedplus"
	-- only search case senstivie if uppercase letter used
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
	vim.opt.scrolloff = 2
	-- linenumbers on by default
	vim.opt.nu = true
	-- time to wait for next key in sequence
	vim.opt.timeoutlen = 500
	-- error signs in number gutter
	vim.opt.signcolumn = "number"

	vim.g.python3_host_prog = "/usr/bin/python3"

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

	------------------
	-- PLUGIN SETUP --
	------------------
	require("nvim-web-devicons").setup()
	require("nvim-tree").setup({
		hijack_netrw = true,
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		view = {
			mappings = {
				list = {
					{ key = { "<C-c>" }, action = "copy", mode = "n" },
					{ key = { "<C-x>" }, action = "cut", mode = "n" },
					{ key = { "<C-p>" }, action = "paste", mode = "n" },
					{ key = { "D" }, action = "remove", mode = "n" },
					{ key = { "A" }, action = "create", mode = "n" },
					{ key = { "v" }, action = "vsplit", mode = "n" },
					{ key = { "x" }, action = "split", mode = "n" },
					{ key = { "cd" }, action = "cd", mode = "n" },
					{ key = { "d" }, action = "", mode = "n" },
				},
			},
		},
		filters = {
			dotfiles = true,
		},
	})
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
			disable = { "python" },
		},
	})
	require("which-key").setup({})
	require("gitsigns").setup({
		numhl = true,
		signcolumn = false,
	})

	-------------------
	-- AUTO COMMANDS --
	-------------------
	vim.g.followCursor = false

	local function toggle_follow_cursor()
		-- Switch the toggle variable
		vim.g.followCursor = not vim.g.followCursor

		-- Enable if toggled on
		if vim.g.followCursor then
			vim.cmd([[
            augroup FollowCursor
            au!
            au VimEnter,WinEnter,BufWinEnter * setlocal cursorline | setlocal cursorcolumn
            au WinLeave * setlocal nocursorline | setlocal nocursorcolumn
            augroup END
            setlocal cursorline | setlocal cursorcolumn
        ]])
			-- reset and disable options
		else
			vim.cmd([[
            augroup FollowCursor
                autocmd!
            augroup END
            setlocal nocursorline | setlocal nocursorcolumn
        ]])
		end
	end

	-------------
	-- KEYMAPS --
	-------------
	vim.g.mapleader = " "
	-- fastsave
	vim.keymap.set("n", "<Esc><Esc>", ":w<CR>")
	-- qwerty timesave
	vim.keymap.set("i", "jk", "<ESC>")
	-- Y yanks to end of line (consistency with D)
	vim.keymap.set("n", "Y", "y$")
	-- remove highlighting
	vim.keymap.set("n", "<leader>h", ":noh<CR>")
	-- map buffer kill
	-- vim.keymap.set("n", "Q" ":bd<CR>")
	-- window navigation
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
	-- window resizing
	vim.keymap.set("n", "<S-C-h>", "<C-w><")
	vim.keymap.set("n", "<S-C-l>", "<C-w>>")

	vim.keymap.set("n", "<S-C-j>", "<C-w>+")
	vim.keymap.set("n", "<S-C-k>", "<C-w>-")
	-- line numbers
	vim.keymap.set("n", "<F3>", ":set nu<CR>")
	vim.keymap.set("n", "<F4>", ":set nonu<CR>")
	-- remap K to inverse of J

	-- autocmd
	vim.keymap.set("n", "<leader>x", toggle_follow_cursor)

	-- lsp
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

	--------------------
	-- PLUGIN KEYMAPS --
	--------------------
	-- open dir
	vim.keymap.set("n", "<leader>d", ":NvimTreeToggle<CR>")

	-- telescope
	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
				},
			},
		},
	})
	telescope = require("telescope.builtin")
	vim.keymap.set("n", "<leader>t", telescope.find_files)
	vim.keymap.set("n", "<leader>tg", telescope.live_grep)
	vim.keymap.set("n", "<leader>tb", telescope.buffers)
	vim.keymap.set("n", "<leader>th", telescope.help_tags)

	---------
	-- CMP --
	---------

	local cmp = require("cmp")

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {},
		mapping = cmp.mapping.preset.insert({
			["<Tab>"] = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
			["<S-Tab>"] = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end,
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" }, -- For luasnip users.
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	-- Setup lspconfig.
	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

	----------------
	-- FORMATTING --
	----------------
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.eslint_d,
	}

	---------
	-- LSP --
	---------
    local forbidden_formatters = {"tsserver"}
	local lsp_formatting = function(bufnr)
		vim.lsp.buf.format({
			-- filter = function(client)
                -- if locate(forbidden_formatters, client.name) then
                    -- return false
                -- end
                -- return true
			-- end,
			bufnr = bufnr,
		})
	end

	local on_lsp_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<leader>o", function()
            vim.lsp.buf.format()
		end, bufopts)
	end

	null_ls.setup({
		sources = sources,
		debug = true,
		on_attach = on_lsp_attach,
	})
	require("lspconfig")["pyright"].setup({
		on_attach = on_lsp_attach,
	})
	require("lspconfig")["tsserver"].setup({
		on_attach = on_lsp_attach,
	})
end)
