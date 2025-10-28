local function floating_terminal(cmd)
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.85)
	local height = math.floor(vim.o.lines * 0.85)
	local row = math.floor((vim.o.lines - height) / 2) - 1
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	vim.fn.termopen(cmd or vim.o.shell, {
		on_exit = function()
			vim.api.nvim_win_close(win, true)
		end,
	})

	vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>g", function()
	floating_terminal("lazygit")
end, { desc = "Open lazygit in a floating terminal" })
