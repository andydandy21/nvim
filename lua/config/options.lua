vim.cmd([[highlight Normal guibg=NONE]])
vim.cmd([[highlight NormalFloat guibg=NONE]])

local opt = vim.opt

opt.termguicolors = true

opt.clipboard = 'unnamedplus'
opt.number = true
opt.relativenumber = true

opt.smartindent = true
opt.wrap = false
opt.incsearch = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
opt.colorcolumn = "80"
opt.cursorline = true

opt.splitright = true
opt.splitbelow = true
