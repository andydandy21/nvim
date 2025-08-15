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
        -- Custom denols handler
        ["denols"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.denols.setup({
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
          })
        end,
        -- Custom ts_ls handler
        ["ts_ls"] = function()
          local lspconfig = require("lspconfig")
          local util = lspconfig.util
          lspconfig.ts_ls.setup({
            root_dir = function(fname)
              if util.root_pattern("deno.json", "deno.jsonc")(fname) then
                return nil
              end
              return util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(fname)
            end,
          })
        end,
      },
    },
  },
}
