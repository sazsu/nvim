local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta


return {
  s(
    { trig = '$', snippetType = 'autosnippet', },
    fmta('$<>$', { i(1) })
  ),
  s(
    { trig = 'tm', snippetType = 'autosnippet', },
    fmta('$<>$', { i(1) })
  ),
  s(
    { trig = 'atm', snippetType = 'autosnippet', },
    fmta('$ <> $', { i(1) })
  ),
  s(
    { trig = 'disj', },
    fmta([[
    cases(delim: "[",
      <>
    )]], { i(1) })
  ),
  s(
    { trig = 'conj', },
    fmta([[
    cases(
      <>
    )]], { i(1) })
  ),
  s(
    { trig = 'template', },
    fmta([[
    #import "<>": <>

    #show: <>.with(<>)
    ]], { i(1), i(2), i(3), i(4) })
  )
}
