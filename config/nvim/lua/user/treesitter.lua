local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup({
  ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "javascript", "html", "hcl", "css", "svelte", "yaml" },
  -- ensure_installed = "all", -- one of "all" or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { } },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

})
