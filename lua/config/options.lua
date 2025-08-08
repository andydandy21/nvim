vim.opt.termguicolors = true
vim.cmd([[highlight Normal guibg=NONE]])
vim.cmd([[highlight NormalFloat guibg=NONE]])

vim.opt.clipboard = 'unnamedplus'      -- Share clipboard with OS
vim.opt.number = true                  -- Enable line numbering
vim.opt.relativenumber = true          -- Relative numbers for easier navigation

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

