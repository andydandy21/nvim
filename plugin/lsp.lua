vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  float = { border = "rounded" },
  severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local b = { buffer = args.buf, silent = true }
    local map = vim.keymap.set
    local lsp = vim.lsp.buf
    -- general
    map("n", "gd", lsp.definition, b)
    map("n", "gD", lsp.declaration, b)
    map("n", "gi", lsp.implementation, b)
    map("n", "gr", lsp.references, b)
    map("n", "K", lsp.hover, b)
    map("n", "<leader>rn", lsp.rename, b)
    map({ "n", "v" }, "<leader>ca", lsp.code_action, b)

    -- diagnostics
    map("n", "<C-w>d", vim.diagnostic.open_float, b)
    map("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, { buffer = args.buf, desc = "Prev diagnostic" })
    map("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, { buffer = args.buf, desc = "Next diagnostic" })
  end,
})

vim.lsp.enable({
  "lua_ls",
  "ts_ls",
  "rust-analyzer",
  "bashls",
})
