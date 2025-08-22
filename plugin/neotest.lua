local neotest = require("neotest")

-- Detect deps in package.json to prefer Vitest, fall back to Jest
local function pkg_has(dep)
	local pkg = vim.fs.find("package.json", { upward = true, stop = vim.loop.os_homedir() })[1]
	if not pkg then return false end
	local ok, json = pcall(function() return vim.json.decode(table.concat(vim.fn.readfile(pkg), "\n")) end)
	if not ok or type(json) ~= "table" then return false end
	local dd, d = json.devDependencies or {}, json.dependencies or {}
	return dd[dep] ~= nil or d[dep] ~= nil
end

local adapters = {}

table.insert(adapters, require("neotest-vitest")({
	filter_dir = function(name) return name ~= "node_modules" end,
	is_enabled = function() return pkg_has("vitest") end,
}))

table.insert(adapters, require("neotest-jest")({
	jestCommand = function()
		if vim.fn.executable("pnpm") == 1 then return "pnpm test --" end
		if vim.fn.executable("yarn") == 1 then return "yarn test --" end
		return "npm test --"
	end,
	env = { CI = true },
	cwd = function() return vim.fn.getcwd() end,
	is_enabled = function() return not pkg_has("vitest") and (pkg_has("jest") or pkg_has("@jest/globals")) end, -- :contentReference[oaicite:26]{index=26}
}))

neotest.setup({
	adapters = adapters,
	quickfix = { enabled = false, open = false },
	discovery = { enabled = true },
	running = { concurrent = true },
})

local map = vim.keymap.set
map("n", "<leader>tt", function() neotest.run.run() end, { desc = "Nearest test" })
map("n", "<leader>tT", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "File tests" })
map("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end, { desc = "Nearest test (DAP)" })
map("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Test summary" })
map("n", "<leader>to", function() neotest.output.open() end, { desc = "Test output" })
map("n", "<leader>tS", function() neotest.run.stop() end, { desc = "Stop tests" })
