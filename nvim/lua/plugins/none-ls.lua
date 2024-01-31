local M = {
	"nvimtools/none-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")

	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.ocamlformat,
			null_ls.builtins.formatting.rustfmt,
			null_ls.builtins.formatting.gofmt,
			null_ls.builtins.diagnostics.golangci_lint,
		},
	})
end

return M
