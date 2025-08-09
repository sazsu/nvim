local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    { trig = 'implug', snippetType = 'autosnippet', },
    fmt([[
    { import = 'conf.plugins.<>' },
    ]], { i(1) }, { delimiters = '<>' })
  ),
  s(
    { trig = 'lspdef', snippetType = 'autosnippet', },
    fmt([[
    return {
      cmd = { '<>' },
      filetypes = { '<>' },
    }
    ]], { i(1), i(2) }, { delimiters = '<>' })
  ),
  s({ trig = 'plugdef', snippetType = 'autosnippet' },
    fmt([[
    return {
      '<>',
      event = { '<>', },
      after = function (_)
        <>
      end,
    }
    ]], {
        i(1), i(2), i(3)
      }, { delimiters = '<>' })
  )
}
