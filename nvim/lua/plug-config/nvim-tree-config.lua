local nvim_tree = require("nvim-tree")

local tree_cb = require("nvim-tree.config").nvim_tree_callback

nvim_tree.setup({
	-- open_on_setup = true,
	-- open_on_setup_file = true,
	open_on_tab = true,
	git = {
		enable = true,
		ignore = false,
		timeout = 400,
		show_on_dirs = true,
	},
	view = {
		mappings = {
			custom_only = false,
			list = {
				-- user mappings go here
				{ key = "gs", cb = tree_cb("vsplit") }, -- open file in vertical split
				{ key = "gi", cb = tree_cb("split") }, -- open file in horizontal split
				{ key = "t", cb = tree_cb("tabnew") }, -- open file in horizontal split
			},
		},
	},
})

-- always open nvim-tree
local function open_nvim_tree()
	-- open the tree
	require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
