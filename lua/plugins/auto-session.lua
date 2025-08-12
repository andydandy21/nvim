return {
  "rmagatti/auto-session",
  lazy = false, -- load on startup so restore works immediately
  init = function()
    -- Recommended sessionoptions for best results
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
  keys = {
    -- Session picker / actions
    -- TODO: make better keybinds
    { "<leader>wr", "<cmd>SessionSearch<CR>",         desc = "Session search" },
    { "<leader>ws", "<cmd>SessionSave<CR>",           desc = "Save session" },
    { "<leader>wl", "<cmd>SessionRestore<CR>",        desc = "Restore session" },
    { "<leader>wd", "<cmd>SessionDelete<CR>",         desc = "Delete session" },
    { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
  },
  ---@type AutoSession.Config
  opts = {
    -- sensible guardrails so you don't create sessions everywhere
    suppressed_dirs = { "~/", "~/.config", "~/Downloads", "/" },

    -- Telescope/Snacks-backed picker; falls back to vim.ui.select if neither is installed
    session_lens = {
      load_on_setup = true, -- if using Telescope, pre-initialize the picker
    },

    -- Optional: reopen nvim-tree after restore (safe if you don't use it)
    post_restore_cmds = {
      function()
        local ok, api = pcall(require, "nvim-tree.api")
        if ok then
          api.tree.open()
          api.tree.change_root(vim.fn.getcwd())
          api.tree.reload()
        end
      end,
    },
  },
}
