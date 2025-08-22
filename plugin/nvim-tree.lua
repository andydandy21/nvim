-- disable netrw and its plugin early
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer (full-screen float)" })

local function on_attach(bufnr)
	api.config.mappings.default_on_attach(bufnr) -- see README “Custom Mappings” example. :contentReference[oaicite:1]{index=1}

	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, {
			buffer = bufnr,
			desc = "nvim-tree: " .. desc,
			noremap = true,
			silent = true,
			nowait = true,
		})
	end

	map("n", "%", api.fs.create, "Create File or Directory")
	map("n", "d", api.fs.remove, "Delete")
	map("n", "y", api.fs.copy.node, "Copy")
	map("n", "p", api.fs.paste, "Paste")
	map("n", "C", api.tree.change_root_to_node, "CD into node")
	map("n", "u", api.tree.change_root_to_parent, "Up to parent")
end

require("nvim-tree").setup({
	on_attach = on_attach,
	disable_netrw = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	-- auto_open conflicts with auto-session, functionality handled by an autocmd
	hijack_directories = { enable = true, auto_open = false },

	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	view = {
		number = true,
		relativenumber = true,
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				width = vim.o.columns,
				height = vim.o.lines,
				row = 0,
				col = 0,
				border = "none",
			},
		},
	},
	update_focused_file = { enable = true, update_root = false },
	actions = { open_file = { quit_on_open = true } },
	renderer = {
		icons = {
			web_devicons = {
				file = { enable = true, color = true },
				folder = { enable = true, color = true },
			},
		},
	},
	filters = { git_ignored = false },
})
