vim.cmd("packadd packer.nvim")
-- [[ plug.lua ]]
return require("packer").startup({
	function()
		use({ "wbthomason/packer.nvim" })

		local config = function(name)
			return string.format("require('plugins.%s')", name)
		end

		local use_with_config = function(path, name)
			use({ path, config = config(name) })
		end
		-- [[ Plugins Go Here ]]
		use({ -- filesystem navigation
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons", -- filesystem icons
		})
		use({ "tpope/vim-surround" }) -- add/edit/delete parentheses/quotes/XML-tags
		-- [[ Theme ]]
		--    use { 'mhinz/vim-startify' }                      -- start screen
		use({ "DanilaMihailov/beacon.nvim" }) -- cursor jump
		use({
			"nvim-lualine/lualine.nvim", -- statusline
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({ "Mofiqul/dracula.nvim" }) -- colorscheme
		-- [[ Dev ]]
		use({
			"nvim-telescope/telescope.nvim", -- fuzzy finder
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use({ "majutsushi/tagbar" }) -- code structure
		use({ "Yggdroot/indentLine" }) -- see indentation
		use({ "windwp/nvim-autopairs" }) -- auto close brackets, etc.
		use({
			"tpope/vim-fugitive",
			requires = { "tpope/vim-rhubarb", "junegunn/gv.vim" }, -- commit history
			-- config = config("fugitive"),
		})
		use({ "airblade/vim-gitgutter" })
		use({ "tpope/vim-commentary" }) -- toggle comments
		use({ "neovim/nvim-lspconfig" }) -- LSP client
		use({
			"davidgranstrom/nvim-markdown-preview", -- preview markdown output in browser
			opt = true,
			ft = { "markdown" },
			cmd = "MarkdownPreview",
		})
		use({ "norcalli/nvim-colorizer.lua" })
		-- Autocomplete
		use({
			"hrsh7th/nvim-cmp", -- Completion plugin for neovim
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"saadparwaiz1/cmp_luasnip",
				"L3MON4D3/LuaSnip",
			},
		})
		-- syntax highlights
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		-- linters
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		}) -- Null ls is used for code formatting and pylint analysis
		-- use {"p00f/nvim-ts-rainbow"}
	end,
	config = {
		package_root = vim.fn.stdpath("config") .. "/site/pack",
	},
})
