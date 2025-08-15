return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "jay-babu/mason-nvim-dap.nvim",
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "codelldb", "js-debug-adapter" },
      })

      local dap = require("dap")

      -- JS/TS via vscode-js-debug (use Mason's bin shim)
      local js_cmd = vim.fn.exepath("js-debug-adapter") ~= "" and vim.fn.exepath("js-debug-adapter")
          or vim.fn.expand("$MASON/bin/js-debug-adapter")
      require("dap-vscode-js").setup({
        debugger_cmd = { js_cmd },
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      })

      -- Python: prefer the debugpy adapter shim instead of venv path
      local debugpy_adapter = vim.fn.exepath("debugpy-adapter") ~= "" and vim.fn.exepath("debugpy-adapter")
          or vim.fn.expand("$MASON/bin/debugpy-adapter")
      dap.adapters.python = { type = "executable", command = debugpy_adapter }
      dap.configurations.python = {
        { type = "python", request = "launch", name = "Launch file", program = "${file}", console = "integratedTerminal" },
      }

      -- Rust/C++: use the codelldb shim in Mason bin (no more /extension/adapter path)
      local codelldb = vim.fn.exepath("codelldb") ~= "" and vim.fn.exepath("codelldb")
          or vim.fn.expand("$MASON/bin/codelldb")
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = { command = codelldb, args = { "--port", "${port}" } },
      }
      dap.configurations.rust = {
        {
          name = "Launch Rust file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      -- Add keymap for toggling breakpoints
      vim.keymap.set("n", "<leader>tb", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
    end,
  },
}
