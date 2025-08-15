vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set("n", "Q", "<nop>", { silent = true })

-- Create a line below on shift enter
keymap.set("i", "<S-CR>", "<Esc>O", { noremap = true })

-- Move selected text up/down in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Buffer navigation
keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })


-- PLUGINS


-- Toggle Explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle the directory explorer" })

-- Telescope fuzzy finder
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Find all files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })

-- LSP-related shortcuts
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover documentation" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename symbol" })
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action" })
keymap.set("n", "<leader>gh", vim.diagnostic.open_float, { desc = "Show diagnostics" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap.set({ "n", "v" }, "<leader>l", vim.lsp.buf.format, { desc = "Format file/selection" })

-- Neotest — test framework shortcuts
keymap.set("n", "<leader>tn", function()
  require("neotest").run.run()
end, { desc = "Neotest: Run nearest test" })

keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Neotest: Run tests in current file" })

keymap.set("n", "<leader>tt", function()
  require("neotest").summary.toggle()
end, { desc = "Neotest: Toggle summary panel" })

keymap.set("n", "<leader>ta", function()
  require("neotest").run.run({ suite = true })
end, { desc = "Neotest: Run suite" })
