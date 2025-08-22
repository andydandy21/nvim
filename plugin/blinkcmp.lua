require("blink.cmp").setup({
	fuzzy = {
		implementation = "rust",
		prebuilt_binaries = { force_version = "v1.6.0" },
	},
	completion = {
		menu = { draw = { treesitter = { "lsp" } } },
		documentation = { auto_show = true },
		ghost_text = { enabled = vim.g.ai_cmp },
	},
	keymap = {
		preset = "enter",
		["<C-y>"] = { "select_and_accept" },
	},
})
