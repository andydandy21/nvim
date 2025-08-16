-- Reload only user config modules (no lazy internals)
vim.api.nvim_create_user_command("ReloadConfig", function()
  local modules = {
    "config.options",
    "config.keymaps",
    "config.commands",
    "config.filetypes",
  }

  -- unload
  for _, m in ipairs(modules) do
    package.loaded[m] = nil
  end

  -- re-require in a deterministic order
  for _, m in ipairs(modules) do
    require(m)
  end

  vim.notify("User config reloaded (modules only).", vim.log.levels.INFO)
end, { desc = "Reload user config modules (no lazy)" })
