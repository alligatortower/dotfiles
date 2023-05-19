return {
	"wbthomason/packer.nvim",
	-- display
	"EdenEast/nightfox.nvim",
	"rebelot/kanagawa.nvim",
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
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	-- tabs
	"nanozuki/tabby.nvim",
	-- core workflow
	{
		"kyazdani42/nvim-tree.lua",
		tag = "nightly",
		dependencies = { "kyazdani42/nvim-web-devicons" },
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
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
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
	"williamboman/mason.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"MunifTanjim/prettier.nvim",
	-- basic functionality++
	"ntpeters/vim-better-whitespace",
	"ggandor/leap.nvim",
	"ggandor/flit.nvim",
	"lewis6991/gitsigns.nvim",
	"fmoralesc/Vim-pad",
	"kshenoy/vim-signature",
	{ "iamcco/markdown-preview.nvim", run = "cd app & yarn install" },
	"romainl/vim-cool", -- auto search highlight remova,
	"liangxianzhe/floating-input.nvim",
	-- misc
	"stevearc/vim-arduino",
	"MarcWeber/vim-addon-mw-utils",
	"tomtom/tlib_vim",
}
