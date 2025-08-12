return {
  -- Mason: set up once, early.
  {
    "mason-org/mason.nvim",
    lazy = false, -- don't lazy-load; Mason recommends early setup
    opts = {},    -- Lazy will call require("mason").setup({})
  },
}
