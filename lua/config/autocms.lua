vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("conform").format({ async = false })
  end,
})
