-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = {
-- 	},
-- 	highlight = { enable = true },
-- 	indent = { enable = true },
-- })

require('nvim-treesitter').install { 
 		"lua",
 		"vim",
 		"vimdoc",
 		"javascript",
 		"typescript",
 		"tsx",
 		"json",
 		"rust",
 		"bash",
 		"regex",
 		"markdown",
 		"markdown_inline",
 		"yaml",
 		"ruby",
	}
