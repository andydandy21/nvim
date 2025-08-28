return {
	cmd = { "helm_ls", "serve" },
	filetypes = { "helm" },
	root_dir = vim.fs.dirname(vim.fs.find({ "Chart.yaml", "Chart.yml" }, { upward = true })[1]),
}
