return {
  'nvim-lspconfig',
  event = { 'DeferredUIEnter', 'FileType', 'BufReadPre', 'BufNewFile' },
  cmd = {
    'LspInfo',
    'LspStart',
    'LspStop',
    'LspRestart',
  },
  after = function (_)
    vim.lsp.inlay_hint.enable(true)
    vim.lsp.enable({
      'lua_ls',
      'nil',
      'nixd',
      'ruff',
      'basedpyright',
      -- 'ty', # ERROR: inlay hints issues
      'tinymist',
      'clangd',
      -- 'rust_analyzer',
      'jinja_lsp'
    })
  end,
}
