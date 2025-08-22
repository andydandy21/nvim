---@type vim.lsp.Config
return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  settings = {
    typescript = { inlayHints = { includeInlayFunctionLikeReturnTypeHints = true } },
    javascript = { inlayHints = { includeInlayFunctionLikeReturnTypeHints = true } },
  },
}
