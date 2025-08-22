vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" },
	float = { border = "rounded" },
	severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local b = { buffer = args.buf, silent = true }
		local map = vim.keymap.set
		map("n", "gd", vim.lsp.buf.definition, b)
		map("n", "gD", vim.lsp.buf.declaration, b)
		map("n", "gi", vim.lsp.buf.implementation, b)
		map("n", "gr", vim.lsp.buf.references, b)
		map("n", "K", vim.lsp.buf.hover, b)
		map("n", "<leader>rn", vim.lsp.buf.rename, b)
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, b)
	end,
})

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"rust-analyzer",
	"bashls",
})
