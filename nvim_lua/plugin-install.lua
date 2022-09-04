require("packer").startup(function(use)
	vim.cmd([[packadd packer.nvim]])

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
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
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
	-- misc
	use("stevearc/vim-arduino")
	use("MarcWeber/vim-addon-mw-utils")
	use("tomtom/tlib_vim")
end)
