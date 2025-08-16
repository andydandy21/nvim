return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local indent_colors = {
        "RP_Base", -- lowest contrast
        "RP_Overlay",
        "RP_HighlightLow",
        "RP_HighlightMed",
        "RP_Muted",
        "RP_Subtle",
        "RP_Iris", -- highest contrast (lavender)
      }

      local hooks = require("ibl.hooks")
      local api = vim.api
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        api.nvim_set_hl(0, "RP_Base", { fg = "#191724" })         -- Base
        api.nvim_set_hl(0, "RP_Overlay", { fg = "#26233a" })      -- Overlay
        api.nvim_set_hl(0, "RP_HighlightLow", { fg = "#21202e" }) -- Highlight Low
        api.nvim_set_hl(0, "RP_HighlightMed", { fg = "#403d52" }) -- Highlight Med
        api.nvim_set_hl(0, "RP_Muted", { fg = "#6e6a86" })        -- Muted
        api.nvim_set_hl(0, "RP_Subtle", { fg = "#908caa" })       -- Subtle
        api.nvim_set_hl(0, "RP_Iris", { fg = "#c4a7e7" })         -- Iris
      end)

      require("ibl").setup({
        indent = {
          char = "▎", -- Subtle, narrow guide character
          highlight = indent_colors,
        },
        scope = { enabled = false },
      })
    end,
  },
}
