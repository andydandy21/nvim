local map = vim.keymap.set

map("n", "Q", "<nop>", { silent = true })

-- Buffer navigation
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
