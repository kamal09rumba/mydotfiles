-- PLUGINS
require("lualine").setup({
	options = {
		theme = "dracula-nvim",
	},
})
require("nvim-autopairs").setup({})

require("plug-config.nvim-tree-config")
require("plug-config.vim-commentry-config")
require("plug-config.lsp-config")
require("plug-config.null-ls-config")
require("plug-config.autopairs")
require("plug-config.fugitive-config")
require("plug-config.telescope")
require("plug-config.treesitter")
