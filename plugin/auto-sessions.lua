require("auto-session").setup({
	close_filetypes_on_save = { "NvimTree" },
	post_restore_cmds = {
		function()
			vim.g.__restored_session = true
		end,
	},
})
