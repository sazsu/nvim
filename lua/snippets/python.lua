local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

return {
  s(
    { trig = 'ifmain', snippetType = 'autosnippet' },
    fmta([[
    if __name__ == '__main__':
        <>
    ]], { i(1) })
  ),
  s(
    { trig = 'def', },
    fmta([[
    def <>(<>) ->> <>:
        <>
    ]], { i(1), i(2), i(3), i(4) })
  ),
  s(
    { trig = 'cls', },
    fmta([[
    class <>:
        def __init__(self, <>) ->> None:
            <>
    ]], { i(1), i(2), i(3) })
  )
}
