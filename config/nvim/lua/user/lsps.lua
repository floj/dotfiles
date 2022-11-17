local ok_lsp, _ = pcall(require, "lspconfig")
if not ok_lsp then
	return
end

local ok_mason, mason = pcall(require, "mason")
if ok_mason then
	mason.setup()
end
local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")

if ok_mason_lsp then
	mason_lspconfig.setup({
		ensure_installed = {
			"sumneko_lua",
			"cssls",
			"html",
			"tsserver",
			"bashls",
			"jsonls",
			"yamlls",
		},
		automatic_installation = true,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local ok_null, null_ls = pcall(require, "null-ls")
if ok_null then
	null_ls.setup({
		sources = {
			null_ls.builtins.code_actions.gitrebase,
			null_ls.builtins.code_actions.gitsigns,
			null_ls.builtins.code_actions.shellcheck,

			null_ls.builtins.completion.spell,

			null_ls.builtins.diagnostics.editorconfig_checker,
			null_ls.builtins.diagnostics.luacheck,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.diagnostics.sqlfluff.with({
				extra_args = { "--dialect", "postgres" },
			}),
			null_ls.builtins.diagnostics.standardrb,
			null_ls.builtins.diagnostics.stylelint,
			null_ls.builtins.diagnostics.todo_comments,
			null_ls.builtins.diagnostics.trail_space,
			null_ls.builtins.diagnostics.tsc,
			null_ls.builtins.diagnostics.yamllint,
			null_ls.builtins.diagnostics.zsh,

			null_ls.builtins.formatting.codespell,
			null_ls.builtins.formatting.packer,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.formatting.sqlfluff.with({
				extra_args = { "--dialect", "postgres" },
			}),
			null_ls.builtins.formatting.standardrb,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.terraform_fmt,
			null_ls.builtins.formatting.trim_whitespace,
			null_ls.builtins.formatting.xmllint,

			null_ls.builtins.hover.dictionary,
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
end
