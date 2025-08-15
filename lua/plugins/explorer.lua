return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-web-devicons").setup()
      local api = require("nvim-tree.api")

      require("nvim-tree").setup({
        view = {
          number = true,
          relativenumber = true,
          float = {
            enable = true,
            open_win_config = {
              relative = "editor",
              width = vim.o.columns,
              height = vim.o.lines,
              row = 0,
              col = 0,
            },
          }
        },
        renderer = {
          icons = {
            web_devicons = {
              file = { enable = true, color = true },
              folder = { enable = true, color = true },
            },
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
              hidden = true,
              diagnostics = true,
              bookmarks = true,
            },
          },
        },
        actions = {
          open_file = { quit_on_open = true },
        },
        on_attach = function(bufnr)
          api.config.mappings.default_on_attach(bufnr)

          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- Custom keybinds
          vim.keymap.set("n", "%", api.fs.create, opts("Create File or Directory"))
          vim.keymap.set("n", "d", api.fs.create, opts("Create File or Directory"))
          vim.keymap.set("n", "D", api.fs.remove, opts("Delete"))
          vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
          vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
          vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD into node"))
          vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up to parent"))
        end,
      })
    end,
  },
}
