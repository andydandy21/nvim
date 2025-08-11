return {
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
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "codecompanion",
        callback = function(ev)
          local send = function()
            require("codecompanion").send()
          end

          -- Normal mode: send
          vim.keymap.set("n", "<C-CR>", send, {
            buffer = ev.buf,
            desc = "Send CodeCompanion chat",
          })

          -- Insert mode: send and return to insert mode
          vim.keymap.set("i", "<C-CR>", function()
            send()
            vim.schedule(function()
              vim.cmd("startinsert!")
            end)
          end, {
            buffer = ev.buf,
            desc = "Send CodeCompanion chat (insert mode)",
          })
        end,
      })
    end,
  },
}
