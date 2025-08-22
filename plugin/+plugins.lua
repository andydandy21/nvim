vim.pack.add({
	-- Theme & UI
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- Core tooling
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/rmagatti/auto-session" },

	-- Fuzzy finder
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	-- Git
	{ src = "https://github.com/tpope/vim-fugitive" },

	-- File explorer
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },

	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- Formatting
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- DAP stack
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },

	-- Neotest
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/marilari88/neotest-vitest" },
	{ src = "https://github.com/nvim-neotest/neotest-jest" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
}, { load = true })

require("rose-pine").setup({})
vim.cmd.colorscheme("rose-pine")

require("mason").setup({})
require("lualine").setup({
	options = { theme = "auto", globalstatus = true, section_separators = "", component_separators = "" },
})
