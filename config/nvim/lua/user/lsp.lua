-- luacheck: globals vim augroup
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local cmp_lsp = require("cmp_nvim_lsp")

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_lsp.default_capabilities())

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

lspconfig.terraformls.setup({})
lspconfig.tflint.setup({})
lspconfig.bashls.setup({})
lspconfig.html.setup({})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitrebase,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.shellcheck,

		null_ls.builtins.completion.spell,

		null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.standardrb,
		null_ls.builtins.diagnostics.stylelint,
		null_ls.builtins.diagnostics.terraform_validate,
		null_ls.builtins.diagnostics.tfsec,
		null_ls.builtins.diagnostics.todo_comments,
		null_ls.builtins.diagnostics.trail_space,
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.diagnostics.zsh,

		null_ls.builtins.formatting.packer,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.standardrb,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.terraform_fmt,
		null_ls.builtins.formatting.trim_whitespace,
		null_ls.builtins.formatting.xmllint,

		null_ls.builtins.hover.printenv,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
