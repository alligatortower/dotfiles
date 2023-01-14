require("packer").startup(function(use)
	vim.cmd([[packadd packer.nvim]])

	use("wbthomason/packer.nvim")
	-- display
	use("EdenEast/nightfox.nvim")
	use("rebelot/kanagawa.nvim")
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("plugins.alpha"))
		end,
	})
	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- tabs
	use("nanozuki/tabby.nvim")
	-- core workflow
	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"debugloop/telescope-undo.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("undo")
		end,
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")
	use("tpope/vim-commentary")
	use("ThePrimeagen/harpoon")
	use("tpope/vim-repeat")
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	use("tpope/vim-unimpaired")
	use("tpope/vim-fugitive")
	use("haya14busa/incsearch.vim")
	use("folke/which-key.nvim")
	use("SirVer/ultisnips")
	use("quangnguyen30192/cmp-nvim-ultisnips")
	-- lsp
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "neovim/nvim-lspconfig" })
	use("williamboman/mason.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("MunifTanjim/prettier.nvim")
	-- basic functionality++
	use("ntpeters/vim-better-whitespace")
	use("ggandor/leap.nvim")
	use("ggandor/flit.nvim")
	use("lewis6991/gitsigns.nvim")
	use("fmoralesc/Vim-pad")
	use("kshenoy/vim-signature")
	use({ "iamcco/markdown-preview.nvim", run = "cd app & yarn install" })
	use("romainl/vim-cool") -- auto search highlight removal
	-- misc
	use("stevearc/vim-arduino")
	use("MarcWeber/vim-addon-mw-utils")
	use("tomtom/tlib_vim")
end)
