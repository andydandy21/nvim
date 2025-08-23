local map = vim.keymap.set

map("n", "Q", "<nop>", { silent = true })

map("i", "<C-O>", "<Esc>O", { desc = "Insert line below" })

-- Indenting
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Buffer navigation
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
