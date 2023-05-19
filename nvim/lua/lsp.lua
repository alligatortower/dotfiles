----------------
-- FORMATTING --
----------------
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local prettier = require("prettier")
lspconfig = require("lspconfig")

prettier.setup({
	bin = "prettier", -- or `'prettierd'` (v0.22+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})
local null_ls_sources = {
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
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
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
	vim.keymap.set("n", "<leader>gd", function()
		telescope.lsp_definitions({ jump_type = "never" })
	end, bufopts)
	vim.keymap.set("n", "<leader>gr", function()
		telescope.lsp_references({ jump_type = "never" })
	end, bufopts)
	vim.keymap.set("n", "<leader>gt", function()
		telescope.lsp_type_definitions({ jump_type = "never" })
	end, bufopts)
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
	sources = null_ls_sources,
	debug = true,
	on_attach = on_lsp_attach,
})

lspconfig.pyright.setup({
	on_attach = on_lsp_attach,
})
lspconfig.tsserver.setup({
	on_attach = on_lsp_attach,
})
lspconfig.tailwindcss.setup({
	on_attach = on_lsp_attach,
})
lspconfig.rust_analyzer.setup({
	-- cmd = { "rustup", "run", "stable", "rust-analyzer" },
	on_attach = on_lsp_attach,
})
