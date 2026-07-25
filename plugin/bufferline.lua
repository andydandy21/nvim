if require("config.lazygit").is_excluded("bufferline.nvim") then
	return
end

require("bufferline").setup({
	options = {
		separator_style = { "", "" },
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
})
