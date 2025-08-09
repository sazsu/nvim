return {
  'luasnip',
  after = function(_)
    require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/snippets/' })
    local ls = require('luasnip')
    ls.config.setup { enable_autosnippets = true }
  end,
}
