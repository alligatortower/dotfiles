require("utils")
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
				{ key = { "<C-v>" }, action = "paste", mode = "n" },
				{ key = { "D" }, action = "remove", mode = "n" },
				{ key = { "A" }, action = "create", mode = "n" },
				{ key = { "v" }, action = "vsplit", mode = "n" },
				{ key = { "x" }, action = "split", mode = "n" },
				{ key = { "t" }, action = "tabnew", mode = "n" },
				{ key = { "cd" }, action = "cd", mode = "n" },
				{ key = { "d" }, action = "", mode = "n" },
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	renderer = {
		icons = {
			git_placement = "after",
		},
	},
})
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "python", "typescriptreact" },
	},
})
require("treesitter-context").setup({
	enable = true,
	patterns = {
		default = {
			"class",
			"function",
			"method",
		},
	},
})
require("which-key").setup({})
require("gitsigns").setup({
	numhl = true,
	signcolumn = false,
})

require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

vim.g.UltiSnipsSnippetDirectories = { HOME .. "/dotfiles/ultisnips" }
vim.g["pad#dir"] = HOME .. "/dotfiles/notes"

---------------------
-- NvimTree Colors --
---------------------
vim.cmd([[
  highlight link NvimTreeOpenedFolderName Number
]])

--------------------
-- PLUGIN KEYMAPS --
--------------------
-- open dir
vim.keymap.set("n", "<leader>d", ":NvimTreeToggle<CR>")

-- telescope
require("telescope").load_extension("ui-select")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = "close",
				["<C-z>"] = "delete_buffer",
				["<C-h>"] = "move_to_top",
				["<C-k>"] = "move_selection_previous",
				["<C-j>"] = "move_selection_next",
				["<C-l>"] = "move_to_bottom",
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>t", telescope.find_files)
vim.keymap.set("n", "<leader><leader>t", telescope.buffers)
vim.keymap.set("n", "<leader>f", telescope.live_grep)
vim.keymap.set("n", "<leader><leader>f", telescope.grep_string)

-- luasnip
-- vim.keymap.set({ "i", "s" }, "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
-- vim.keymap.set({ "i", "s" }, "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- -- <C-G> changes to VISUAL, s clears and enters INSERT
-- vim.keymap.set("s", "<BS>", "<C-G>s")
vim.keymap.set("n", "<F6>", ":UltiSnipsEdit<CR>", opts)

---------
-- CMP --
---------

local cmp = require("cmp")

cmp.setup({
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
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
		{ name = "ultisnips", priority = 100 },
		{ name = "nvim_lsp" },
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
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
	null_ls.builtins.formatting.fixjson,
}

---------
-- LSP --
---------
local forbidden_formatters = { "tsserver" }
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
	vim.keymap.set("n", "<leader>gd", function() telescope.lsp_definitions { jump_type = "never" } end, bufopts)
	vim.keymap.set("n", "<leader>gr", function() telescope.lsp_references { jump_type = "never" } end, bufopts)
	vim.keymap.set("n", "<leader>gt", function() telescope.lsp_type_definitions { jump_type = "never"} end, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader><Tab>", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
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
require("lspconfig")["tailwindcss"].setup({
	on_attach = on_lsp_attach,
})
