return {
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true, -- Enable inline blame by default
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- Display at end of line
          delay = 50,            -- Delay in milliseconds before showing
          virt_text_priority = 100,
          ignore_whitespace = false,
          use_focus = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%R> • <summary>",
      })
    end,
  },
}
