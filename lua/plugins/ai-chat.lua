return {

  -- GitHub Copilot (Lua-native)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            -- TODO: remove the bottom?
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false }, -- disable side panel to avoid clutter
      })
    end,
  },

  -- CodeCompanion: agent + chat + inline LLM prompts
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat" },
    keys = {
      { "<leader>ca", "<cmd>CodeCompanion<cr>",            desc = "CodeCompanion (Visual Prompt)" },
      { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat (CodeCompanion)" },
    },
    opts = {
      chat = {
        side = "right", -- Open chat on the right side
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

  -- Fidget: UI feedback during LSP and AI activity
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
