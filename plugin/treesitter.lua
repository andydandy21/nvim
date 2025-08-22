require("nvim-treesitter.configs").setup({
  ensure_installed      = {
    "lua", "vim", "vimdoc",
    "javascript", "typescript", "tsx", "json",
    "rust", "bash", "regex", "markdown", "markdown_inline",
  },
  highlight             = { enable = true },
  indent                = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
