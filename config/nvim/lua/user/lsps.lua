local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

local ok, mason = pcall(require, "mason")
if ok then
  mason.setup()
end
local ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if ok then
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

local ok, null_ls = pcall(require, "null-ls")
if ok then
  null_ls.setup {}
end
