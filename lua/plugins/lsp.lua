return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", lazy = false, opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "pyright", "rust_analyzer", "astro" },
      handlers = {
        function(server)
          require("lspconfig")[server].setup({})
        end,
      },
    },
  },
}
