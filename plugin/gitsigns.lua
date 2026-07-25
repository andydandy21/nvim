require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 50,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> • <summary>",

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end
		map("n", "]c", gs.next_hunk, "Next Hunk")
		map("n", "[c", gs.prev_hunk, "Prev Hunk")
		map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
		map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
		map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
		map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
		map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
		map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end, "Show Full Blame (float)")
		map("n", "<leader>hd", gs.diffthis, "Diff This Buffer From Index")
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end, "Diff This Buffer From Prev Commit")

		-- Gitsigns submode: single-key hunk navigation with an explicit exit.
		--
		-- Enter with <leader>g. While active, these keys are remapped in this
		-- buffer only, so you can't use them to edit until you press q to exit.
		-- To change the mode's keys, edit `submode_keys` and enter_git_mode()
		-- together (they must list the same keys).
		local submode_keys = { "j", "k", "s", "r", "p", "q" }

		local function exit_git_mode()
			for _, k in ipairs(submode_keys) do
				pcall(vim.keymap.del, "n", k, { buffer = bufnr })
			end
			vim.notify("git mode: off")
		end

		local function enter_git_mode()
			local opts = { buffer = bufnr, nowait = true }
			vim.keymap.set("n", "j", gs.next_hunk, opts)
			vim.keymap.set("n", "k", gs.prev_hunk, opts)
			vim.keymap.set("n", "s", ":Gitsigns stage_hunk<CR>", opts)
			vim.keymap.set("n", "r", ":Gitsigns reset_hunk<CR>", opts)
			vim.keymap.set("n", "p", gs.preview_hunk, opts)
			vim.keymap.set("n", "q", exit_git_mode, opts)
			vim.notify("git mode: j/k hunks · s stage · r reset · p preview · q exit")
		end

		map("n", "<leader>g", enter_git_mode, "Enter gitsigns mode")

		-- In the lazygit editor, open straight into git mode.
		if require("config.lazygit").active then
			enter_git_mode()
		end
	end,
})
