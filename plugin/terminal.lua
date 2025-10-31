-- Helper function to create a terminal toggler
local function create_term_toggle(opts)
	opts = opts or {}
	local buf = nil
	local width_ratio = opts.width or 0.85
	local height_ratio = opts.height or 0.85
	local cmd = opts.cmd or vim.o.shell

	return function()
		local width = math.floor(vim.o.columns * width_ratio)
		local height = math.floor(vim.o.lines * height_ratio)
		local row = math.floor((vim.o.lines - height) / 2) - 2
		local col = math.floor((vim.o.columns - width) / 2)
		if buf and vim.api.nvim_buf_is_valid(buf) then
			local wins = vim.fn.win_findbuf(buf)
			if #wins > 0 then
				vim.api.nvim_win_close(wins[1], true)
			else
				vim.api.nvim_open_win(buf, true, {
					relative = "editor",
					width = width,
					height = height,
					row = row,
					col = col,
					style = "minimal",
					border = "rounded",
				})
				vim.cmd("startinsert")
			end
		else
			buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_open_win(buf, true, {
				relative = "editor",
				width = width,
				height = height,
				row = row,
				col = col,
				style = "minimal",
				border = "rounded",
			})
			vim.fn.termopen(cmd)
			vim.cmd("startinsert")
		end
	end
end

-- Create different terminals
local toggle_general = create_term_toggle()

-- TODO: make agents (OR PLUGIN) for claude and use this for persisting connections
local toggle_claude_chat = create_term_toggle({
	cmd = 'claude "You are to open in a chat only mode. Do not attempt to edit any files unless specifically asked. Do not attempt to run any shell commands unless specifically asked. You do have read access to files. Just act like a helpful assistant and help perform research. Always look up the information to ensure that what you provide is accurate and up to date."',
})
local toggle_claude_agent = create_term_toggle({
	cmd = 'claude "You are to open in a chat only mode. Do not attempt to edit any files unless specifically asked. Do not attempt to run any shell commands unless specifically asked. You do have read access to files. Just act like a helpful assistant and help perform research. Always look up the information to ensure that what you provide is accurate and up to date."',
})

-- Keybindings
vim.keymap.set("n", "<leader>t", toggle_general)
vim.keymap.set("n", "<leader>c", toggle_claude_chat)
vim.keymap.set("n", "<leader>g", toggle_claude_agent)

-- TODO: investigate multiple terminal buffers
-- 1. Modern Buffer Option Setting

-- Note that nvim_buf_set_option is deprecated. Use the modern approach:

-- -- Old (deprecated):
-- vim.api.nvim_buf_set_option(buf, 'buflisted', false)

-- -- New (modern):
-- vim.bo[buf].buflisted = false
-- vim.bo[buf].bufhidden = 'hide'

-- 2. Enhanced Terminal State Structure

-- local function create_term_toggle(opts)
--     opts = opts or {}
--     local state = {
--         buffers = {},      -- List of terminal buffer IDs
--         current_idx = 1,   -- Currently selected buffer index
--         win = nil,         -- Window ID when open
--         width_ratio = opts.width or 0.8,
--         height_ratio = opts.height or 0.8,
--         cmd = opts.cmd or vim.o.shell,
--     }

--     -- Functions would be defined here
--     return state, toggle_function, next_function, prev_function, select_function, new_function
-- end

-- 3. Key Functions to Implement

-- A. Create new terminal buffer:
-- local function create_new_terminal(state)
--     local buf = vim.api.nvim_create_buf(false, true)
--     vim.bo[buf].buflisted = false
--     vim.bo[buf].bufhidden = 'hide'
--     table.insert(state.buffers, buf)
--     state.current_idx = #state.buffers
--     return buf
-- end

-- B. Cycle to next/previous:
-- local function next_terminal(state)
--     if #state.buffers == 0 then return end
--     state.current_idx = (state.current_idx % #state.buffers) + 1
--     show_current_buffer(state)
-- end

-- C. Buffer selection with vim.ui.select:
-- local function select_terminal(state)
--     if #state.buffers == 0 then return end

--     local items = {}
--     for i, buf in ipairs(state.buffers) do
--         local name = vim.api.nvim_buf_get_name(buf)
--         if name == "" then name = "[No Name]" end
--         table.insert(items, string.format("%d: %s", i, name))
--     end

--     vim.ui.select(items, {
--         prompt = "Select terminal:",
--     }, function(choice, idx)
--         if idx then
--             state.current_idx = idx
--             show_current_buffer(state)
--         end
--     end)
-- end

-- 4. Splits Within Floating Window

-- Once the floating window is open, users can naturally use:
-- - :split | terminal - Horizontal split with new terminal
-- - :vsplit | terminal - Vertical split with new terminal
-- - <C-w> keys - Navigate between splits

-- These terminal buffers created via splits would be separate from your managed list, but they'd also be hidden
--  from the main buffer list if you set up an autocommand:

-- vim.api.nvim_create_autocmd("TermOpen", {
--     callback = function()
--         vim.bo.buflisted = false
--         vim.bo.bufhidden = 'hide'
--     end
-- })

-- 5. Suggested Keybindings

-- Within the floating terminal, you could add:
-- - <C-n> - Next terminal buffer
-- - <C-p> - Previous terminal buffer
-- - <C-t> - New terminal buffer
-- - <C-s> - Select from terminal list
