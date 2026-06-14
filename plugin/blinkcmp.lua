local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
  fuzzy = {
    implementation = "rust",
  },
  completion = {
    menu = { draw = { treesitter = { "lsp" } } },
    documentation = { auto_show = true },
    ghost_text = { enabled = vim.g.ai_cmp },
  },
  keymap = {
    preset = "enter",
    ["<C-y>"] = { "select_and_accept" },
  },
})
