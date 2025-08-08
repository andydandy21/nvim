local function set_indent(size)
  vim.opt_local.tabstop = size
  vim.opt_local.softtabstop = size
  vim.opt_local.shiftwidth = size
  vim.opt_local.expandtab = true
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust", "python" },
  callback = function()
    set_indent(4)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "lua" },
  callback = function()
    set_indent(2)
  end,
})
