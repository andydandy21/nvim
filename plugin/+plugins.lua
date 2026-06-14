vim.pack.add({
	-- UI
	{ src = "https://github.com/rose-pine/neovim",               name = "rose-pine" }, -- Theme
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },                 -- Icons
	{ src = "https://github.com/akinsho/bufferline.nvim" },                     -- Top bufferline
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },                   -- Bottom line
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },                     -- Explorer replacement

	-- Core tooling
	{ src = "https://github.com/rmagatti/auto-session" },    -- Sessions
	{ src = "https://github.com/ibhagwan/fzf-lua" },         -- Fuzzy finder
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- Code colors, navigation

	-- Quality of life
	{ src = "https://github.com/j-hui/fidget.nvim" }, -- Notifications
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }, -- Git in buffer
	{ src = "https://github.com/stevearc/conform.nvim" }, -- Formatting
	{ src = "https://github.com/tpope/vim-fugitive" }, -- Git cli tool
	{ src = "https://github.com/voldikss/vim-floaterm" }, -- Terminal
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" } -- Code completion
}, { load = true })

require("rose-pine").setup({})
vim.cmd.colorscheme("rose-pine")

require("lualine").setup({
	options = { theme = "auto", globalstatus = true, section_separators = "", component_separators = "" },
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
	},
})
