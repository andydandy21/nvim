local map = vim.keymap.set

map("n", "Q", "<nop>", { silent = true })

-- Buffer navigation
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Find/Replace
map("n", "<C-h>", ":%s/\\<<C-r><C-w>\\>/", { desc = "Find and replace word under cursor" })
