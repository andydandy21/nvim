return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          astro = { "prettier" },
          python = { "black" },
        },
        formatters = {
          prettier = {
            command = "prettier",
            args = { "--stdin-filepath", "$FILENAME" },
            stdin = true,
            condition = function(ctx)
              return vim.fs.find({ "package.json" }, { upward = true, path = ctx.filename })[1]
            end,
          },
        },
      })
    end,
  },
}
