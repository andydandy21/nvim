# testing setup

# lua/plugins/mason.lua
```lua
return {
  -- Mason core: declare only once, no duplicate mason.setup()
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {},
  },
}
```

# lua/plugins/lsp.lua
```lua
return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "pyright", "rust_analyzer", "astro" },
      handlers = {
        function(server)
          require("lspconfig")[server].setup({
            -- on_attach = require("util.lsp").on_attach, -- if you have one
            -- capabilities = require("util.lsp").capabilities(),
          })
        end,
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
}
```

# lua/plugins/dap.lua
```lua
return {
  -- DAP core
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,          desc = "DAP: Continue" },
      { "<leader>di", function() require("dap").step_into() end,         desc = "DAP: Step into" },
      { "<leader>do", function() require("dap").step_over() end,         desc = "DAP: Step over" },
      { "<leader>du", function() require("dap").step_out() end,          desc = "DAP: Step out" },
      { "<leader>dB", function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, desc = "DAP: Conditional breakpoint" },
    },
    config = function()
      local fn = vim.fn
      fn.sign_define("DapBreakpoint",         { text = "●", texthl = "DiagnosticSignError", numhl = "" })
      fn.sign_define("DapBreakpointRejected", { text = "●", texthl = "DiagnosticSignWarn",  numhl = "" })
      fn.sign_define("DapStopped",            { text = "▶", texthl = "DiagnosticSignInfo",  numhl = "" })
    end,
  },

  -- DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    keys = {
      { "<leader>dU", function() require("dapui").toggle() end, desc = "DAP UI: Toggle" },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end
    end,
  },

  -- Mason DAP
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {
      ensure_installed = {
        "python",   -- debugpy
        "js",       -- js-debug-adapter
        "codelldb", -- Rust/C/C++
      },
      automatic_installation = true,
      handlers = {
        function(_) end, -- default

        python = function(config)
          config.adapters = { type = "executable", command = "python", args = { "-m", "debugpy.adapter" } }
          config.configurations = {
            { type = "python", request = "launch", name = "Python: Debug file", program = "${file}", justMyCode = false },
          }
          require("mason-nvim-dap").default_setup(config)
        end,

        js = function(config)
          config.configurations = config.configurations or {}
          table.insert(config.configurations, {
            type = "pwa-node",
            request = "launch",
            name = "Node: Launch current file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          })
          require("mason-nvim-dap").default_setup(config)
        end,

        codelldb = function(config)
          local dap = require("dap")
          dap.configurations.rust = {
            {
              name = "Rust: Debug executable",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
          }
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    },
    config = function(_, opts)
      require("mason-nvim-dap").setup(opts)
    end,
  },
}
```

# lua/plugins/neotest.lua
```lua
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",    -- pytest
      "marilari88/neotest-vitest",      -- Vitest for JS/TS
      -- swap/add: "haydenmeade/neotest-jest", "rouge8/neotest-rust", etc.
    },
    keys = {
      { "<leader>tn", function() require("neotest").run.run() end,                       desc = "Neotest: Run nearest" },
      { "<leader>tN", function() require("neotest").run.run(vim.fn.expand("%")) end,    desc = "Neotest: Run file" },
      { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,  desc = "Neotest: Debug nearest (DAP)" },
      { "<leader>tt", function() require("neotest").summary.toggle() end,               desc = "Neotest: Toggle summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end,  desc = "Neotest: Output (float)" },
    },
    opts = {
      adapters = {
        require("neotest-python")({ runner = "pytest" }),
        require("neotest-vitest")(),
      },
      icons = {
        running_animated = { "⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏" },
        passed = "", failed = "", skipped = "", unknown = "",
      },
    },
    config = function(_, opts)
      require("neotest").setup(opts)
    end,
  },
}
```

# auto sessions

# heirline
