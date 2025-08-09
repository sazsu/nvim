return {
	'blink.cmp',
  event = 'DeferredUIEnter',
  -- on_require = { 'lspconfig' },
  after = function(_)
    require('blink.cmp').setup {
      keymap = {
        preset = 'none',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = 'rounded',
            max_height = 30,
          },
        },
        ghost_text = { enabled = true },
      },
      signature = {
        enabled = true,
      },
      snippets = {
        preset = 'luasnip'
      },
      sources = {
        default = { 'lsp', 'snippets', 'path', 'buffer' },
      },
    }
  end,
  opts_extend = { 'sources.default' },
}
