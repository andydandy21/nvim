return {
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        ignore = {}, -- ensure LSPs and plugins like CodeCompanion show up
      },
      notification = {
        override_vim_notify = true,
        window = {
          winblend = 0,
        },
      },
    },
  },
}
