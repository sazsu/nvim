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
      'nixd',
      'ruff',
      'basedpyright',
      'tinymist',
      'clangd',
      -- 'rust_analyzer',
    })
  end,
}
