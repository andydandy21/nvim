return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat" },
    keys = {
      -- { "<leader>ca", "<cmd>CodeCompanion<cr>",            desc = "CodeCompanion (Visual Prompt)" },
      { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat (CodeCompanion)" },
      { "<leader>cn", "<cmd>CodeCompanionChat<cr>",        desc = "Open new chat window" }
    },
    opts = {
      chat = {
        side = "right",
      },
      adapters = {
        chat = {
          adapter = {
            name = "copilot",
            model = "gpt-5",
          },
        },
        inline = {
          adapter = {
            name = "copilot",
            model = "gpt-5",
          },
        },
        cmd = {
          adapter = {
            name = "copilot",
            model = "gpt-5",
          },
        },
      },
    },
  },
}
