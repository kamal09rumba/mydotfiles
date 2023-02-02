local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.stylelint, -- scss, less, css
	formatting.stylua, -- lua
	formatting.black, -- python
	formatting.isort, -- python
	formatting.eslint, -- javascript
	formatting.jsonlint, -- JSON
}

null_ls.setup({
	-- debug = true,
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format()
				end,
			})
		end
	end,
	sources = sources,
})

vim.cmd("map <Leader>ln :NullLsInfo<CR>")
vim.cmd("map <Leader>lF :lua vim.lsp.buf.range_formatting()<CR>")
