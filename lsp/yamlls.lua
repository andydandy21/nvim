return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	root_dir = vim.fs.dirname(vim.fs.find({ ".git", "pyproject.toml", "setup.py" }, { upward = true })[1]),
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.0-standalone-strict/all.json"] = {
					"k8s/**/*.yaml",
					"kubernetes/**/*.yaml",
					"manifests/**/*.yaml",
					-- Exclude kustomization files
					"!**/kustomization.yaml",
					"!**/kustomization.yml",
				},
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
				["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
			},
		},
	},
}
