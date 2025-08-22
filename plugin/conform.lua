local conform = require("conform")

vim.keymap.set({ "n", "v" }, "<leader>l", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or selection" })

conform.setup({
	log_level = vim.log.levels.DEBUG,
	notify_no_formatters = true,
	notify_on_error = true,
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "never",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "biome", "prettierd", "prettier" },
		javascriptreact = { "biome", "prettierd", "prettier" },
		typescript = { "biome", "prettierd", "prettier" },
		typescriptreact = { "biome", "prettierd", "prettier" },
		json = { "jq", "biome", "prettier" },
		css = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		markdown = { "prettierd", "prettier" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		rust = { "rustfmt" },
		python = { "ruff_format", "black" },
	},
})
