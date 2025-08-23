vim.pack.add({
	-- Theme & UI
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- Core tooling
	{ src = "https://github.com/mason-org/mason.nvim" },

  -- Notifications
	{ src = "https://github.com/j-hui/fidget.nvim" },

  -- Code completion
	{ src = "https://github.com/Saghen/blink.cmp" },

  -- Sessions
	{ src = "https://github.com/rmagatti/auto-session" },

	-- Fuzzy finder
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	-- Git
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	-- Formatting
	{ src = "https://github.com/stevearc/conform.nvim" },
}, { load = true })

require("rose-pine").setup({})
vim.cmd.colorscheme("rose-pine")

require("mason").setup({})
require("lualine").setup({
	options = { theme = "auto", globalstatus = true, section_separators = "", component_separators = "" },
})
