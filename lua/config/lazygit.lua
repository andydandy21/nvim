-- Lazygit mode: one config, gated by an env var.
--
-- Lazygit launches nvim with NVIM_LAZYGIT=1 (see ~/.config/lazygit/config.yml).
-- In that mode we load the exact same options, keymaps and theme as always,
-- but strip plugins listed in `excluded` below so the editor pops open fast.
--
-- To strip more plugins from the lazygit editor, add their names to `excluded`.
-- The name is the plugin's `name` field in +plugins.lua, or the last path
-- segment of its `src` URL (e.g. ".../rmagatti/auto-session" -> "auto-session").
--
-- Excluding a plugin here removes it from vim.pack. Any file that *configures*
-- that plugin must also bail out in lazygit mode, or it will error on a missing
-- plugin. Add this line at the top of such a file:
--
--     if require("config.lazygit").is_excluded("<name>") then return end
--
-- (see plugin/bufferline.lua for the worked example).

local M = {}

-- True when nvim was launched by lazygit.
M.active = vim.env.NVIM_LAZYGIT == "1"

-- Plugins to skip in lazygit mode. Add the rest yourself.
M.excluded = {
	["nvim-web-devicons"] = true,
	["bufferline.nvim"] = true,
	["nvim-tree.lua"] = true,
	-- ["auto-session"] = true,
	["fzf-lua"] = true,
	["vim-fugitive"] = true,
	["vim-floaterm"] = true,
}

-- Should `name` be skipped right now? Only ever true in lazygit mode.
function M.is_excluded(name)
	return M.active and M.excluded[name] == true
end

-- Return a plugin's name from a vim.pack spec: its `name`, else the src basename.
local function spec_name(spec)
	return spec.name or (spec.src and spec.src:match("([^/]+)$"))
end

-- Filter a vim.pack spec list, dropping excluded plugins in lazygit mode.
-- Outside lazygit mode the list is returned unchanged.
function M.filter(specs)
	if not M.active then
		return specs
	end
	local kept = {}
	for _, spec in ipairs(specs) do
		if not M.excluded[spec_name(spec)] then
			kept[#kept + 1] = spec
		end
	end
	return kept
end

return M
