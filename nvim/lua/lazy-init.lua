local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
	-- display
	-- { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"sainnhe/sonokai",
	},
	{
		"ray-x/starry.nvim",
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("plugin-config.alpha"))
		end,
	},
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	"Glench/Vim-Jinja2-Syntax",
	-- tabs
	"nanozuki/tabby.nvim",
	-- core workflow
	{
		"kyazdani42/nvim-tree.lua",
		version = "nightly",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"debugloop/telescope-undo.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("undo")
		end,
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",
	"ThePrimeagen/harpoon",
	"tpope/vim-repeat",
	"echasnovski/mini.map",
	"echasnovski/mini.cursorword",
	"echasnovski/mini.comment",
	"echasnovski/mini.surround",
	"tpope/vim-unimpaired",
	"tpope/vim-fugitive",
	"haya14busa/incsearch.vim",
	"folke/which-key.nvim",
	"SirVer/ultisnips",
	"quangnguyen30192/cmp-nvim-ultisnips",
	-- lsp
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"MunifTanjim/prettier.nvim",
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
	-- basic functionality++
	"ntpeters/vim-better-whitespace",
	"ggandor/leap.nvim",
	"ggandor/flit.nvim",
	"lewis6991/gitsigns.nvim",
	"fmoralesc/Vim-pad",
	"kshenoy/vim-signature",
	{ "iamcco/markdown-preview.nvim", build = "cd app & yarn install" },
	"romainl/vim-cool",
	"liangxianzhe/floating-input.nvim",
	-- misc
	-- "brenoprata10/nvim-highlight-colors",
	"stevearc/vim-arduino",
	"MarcWeber/vim-addon-mw-utils",
	"tomtom/tlib_vim",
})
