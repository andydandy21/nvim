---@type vim.lsp.Config
return {
	cmd = { "ruby-lsp" },
	filetypes = { "ruby" },
	root_markers = { "Gemfile", ".git" },
	settings = {
		rubyLsp = {
			enabledFeatures = {
				"documentHighlights",
				"documentSymbols",
				"foldingRanges",
				"selectionRanges",
				"semanticHighlighting",
				"formatting",
				"codeActions",
			},
		},
	},
}
