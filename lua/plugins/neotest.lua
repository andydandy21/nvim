return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            -- Pass through to nvim-dap / debugpy
            dap = { justMyCode = false },
          }),
          require("neotest-jest")({}),
        },
      })

      -- Debug the nearest test using Neotest’s DAP strategy
      vim.keymap.set("n", "<leader>td", function()
        require("neotest").run.run({ strategy = "dap" })
      end, { desc = "Neotest debug nearest" })
    end,
  },
}
