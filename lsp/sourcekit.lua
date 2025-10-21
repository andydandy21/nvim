---@type vim.lsp.Config
return {
	cmd = {
		"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
	},
	filetypes = { "swift" },
	root_markers = { "Package.swift", "*.xcodeproj", "*.xcworkspace", ".git" },
	settings = {},
}
