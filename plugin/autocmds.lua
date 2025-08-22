local aug = vim.api.nvim_create_augroup
local ac = vim.api.nvim_create_autocmd

-- Highlight on yank
ac("TextYankPost", {
	group = aug("YankHL", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 120 })
	end,
})

-- Treesitter parsers: update once (vim.pack has no build hook)
ac("VimEnter", {
	group = aug("TSUpdateOnce", { clear = true }),
	callback = function()
		local ok, ts_install = pcall(require, "nvim-treesitter.install")
		if ok and not vim.g._ts_updated_once then
			ts_install.update({ with_sync = true })()
			vim.g._ts_updated_once = true
		end
	end,
})

-- Open nvim-tree on startup when no session was restored
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.g.__restored_session then
			return
		end
		-- open only when launched with no args OR a single directory (e.g., `nvim .`)
		local argc = vim.fn.argc()
		if argc == 0 or (argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1) then
			local ok, api = pcall(require, "nvim-tree.api")
			if ok then
				api.tree.open()
				api.tree.change_root(vim.fn.getcwd())
				vim.cmd("wincmd p") -- focus back to last window
			end
		end
	end,
})
