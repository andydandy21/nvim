return {
  {
    "vim-airline/vim-airline",
    lazy = false,
    dependencies = { "vim-airline/vim-airline-themes" },
    init = function()
      vim.g.airline_powerline_fonts = 1
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g.airline_theme = "rose_pine"
      vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
    end,
  },
}
