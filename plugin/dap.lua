local dap = require("dap")
local dapui = require("dapui")

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", numhl = "DiagnosticError" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo", numhl = "DiagnosticInfo" })

dapui.setup({
	controls = { enabled = true, element = "repl" },
	layouts = {
		{ elements = { "scopes", "breakpoints", "stacks", "watches" }, size = 40, position = "left" },
		{ elements = { "repl", "console" }, size = 10, position = "bottom" },
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("mason-nvim-dap").setup({
	ensure_installed = { "js", "python", "codelldb" }, -- "js" maps to js-debug-adapter
	automatic_installation = true,
	handlers = {
		function(config) -- fallback for all adapters
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

local map = vim.keymap.set
map("n", "<F5>", dap.continue, { desc = "DAP Continue" })
map("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
map("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
map("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
map("n", "<leader>dt", dap.terminate, {})
map("n", "<leader>du", dapui.toggle, { desc = "DAP UI" })

dap.configurations.typescript = dap.configurations.typescript or {}
dap.configurations.javascript = dap.configurations.javascript or {}
dap.configurations.typescriptreact = dap.configurations.typescriptreact or {}
dap.configurations.javascriptreact = dap.configurations.javascriptreact or {}

table.insert(dap.configurations.typescript, {
	type = "pwa-node",
	request = "launch",
	name = "Node: current file (ts-node)",
	program = "${file}",
	cwd = "${workspaceFolder}",
	runtimeExecutable = "node",
	runtimeArgs = { "-r", "ts-node/register" },
	sourceMaps = true,
	protocol = "inspector",
	skipFiles = { "<node_internals>/**" },
})

table.insert(dap.configurations.javascript, {
	type = "pwa-node",
	request = "launch",
	name = "Node: current file",
	program = "${file}",
	cwd = "${workspaceFolder}",
})

local chrome_cfg = {
	type = "pwa-chrome",
	request = "launch",
	name = "Chrome: Vite app (http://localhost:5173)",
	url = "http://localhost:5173",
	webRoot = "${workspaceFolder}",
}
dap.configurations.typescriptreact = { chrome_cfg }
dap.configurations.javascriptreact = { chrome_cfg }
