-- Lazygit-only keymap overrides.
--
-- The "zzz--" prefix makes this the LAST plugin/ file sourced, so anything set
-- here wins over the shared keymaps in plugin/keymaps.lua and any plugin maps.
-- The guard means it only takes effect when nvim was launched by lazygit.
--
-- Add lazygit-specific maps below, e.g. a fast in-and-out edit flow:
--   local map = vim.keymap.set
--   map("n", "q", "<cmd>wq<cr>", { desc = "save & return to lazygit" })
--   map("n", "<Esc>", "<cmd>wq<cr>")
-- To drop a shared map in this mode: pcall(vim.keymap.del, "n", "<lhs>")

if not require("config.lazygit").active then
	return
end

-- (empty for now)
