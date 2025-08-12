return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      styles = { transparency = true }, -- keep or tweak as you like
      -- variant = "main", -- or "moon" / "dawn" if you prefer
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
