-- Transparent window
vim.cmd([[highlight Normal guibg=NONE]])
vim.cmd([[highlight NormalFloat guibg=NONE]])

vim.g.mapleader = " "

-- Auto Session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

local opt = vim.opt

opt.termguicolors = true

opt.clipboard = "unnamedplus"

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.wrap = false

-- Indentation
opt.smartindent = true
opt.autoindent = true
vim.cmd.filetype("plugin indent on")

-- Searching
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.cursorline = true

opt.isfname:append("@-@")

opt.updatetime = 50

opt.splitright = true
opt.splitbelow = true
opt.diffopt:append("vertical")
