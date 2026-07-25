if require("config.lazygit").is_excluded("fzf-lua") then
	return
end

local fzf = require("fzf-lua")

fzf.setup({
	{ "telescope" },
	winopts = {
		border = "rounded",
		preview = {
			default = "bat",
			layout = "horizontal",
			horizontal = "right:60%",
			flip_columns = 120,
			scrollbar = true,
			wrap = false,
			title = true,
		},
	},
	files = { fd_opts = "--color=never --type f --hidden --follow --exclude .git" },
})

local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files (fzf-lua)" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep (fzf-lua)" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers (fzf-lua)" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Help tags (fzf-lua)" })
map("n", "<leader>fm", function()
	require("fzf-lua").marks({
		marks = "[A-Z]",
	})
end, { desc = "Global marks (fzf-lua)" })

fzf.register_ui_select()
