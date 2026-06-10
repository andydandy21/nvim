local width = math.floor(vim.o.columns * 0.85)
local height = math.floor(vim.o.lines * 0.85)

vim.g.floaterm_width = width
vim.g.floaterm_height = height
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
vim.g.floaterm_position = "top"
vim.g.floaterm_autoclose = 1

vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>FloatermToggle<CR>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>FloatermNext<CR>")
vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>FloatermPrev<CR>")
vim.keymap.set({ "n", "t" }, "<C-=>", "<cmd>FloatermNew<CR>")
vim.keymap.set({ "n", "t" }, "<C-->", "<cmd>FloatermKill<CR>")
