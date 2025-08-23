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
    map("n", "gd", lsp.definition, b)
    map("n", "gD", lsp.declaration, b)
    map("n", "gi", lsp.implementation, b)
    map("n", "gr", lsp.references, b)
    map("n", "K", lsp.hover, b)
    map("n", "<leader>rn", lsp.rename, b)
    map({ "n", "v" }, "<leader>ca", lsp.code_action, b)

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, { buffer = args.buf, desc = "Prev diagnostic" })

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, { buffer = args.buf, desc = "Next diagnostic" })
    map("n", "<C-w>d", vim.diagnostic.open_float, b)
  end,
})

vim.lsp.enable({
  "lua_ls",
  "ts_ls",
  "rust-analyzer",
  "bashls",
})
