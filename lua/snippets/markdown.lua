local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

return {
  s(
    { trig = '!note', snippetType = 'autosnippet' },
    t({'[!NOTE]', ''})
  ),
  s(
    { trig = '!tip', snippetType = 'autosnippet' },
    t({'[!TIP]', ''})
  ),
  s(
    { trig = '!imp', snippetType = 'autosnippet' },
    t({'[!IMPORTANT]', ''})
  ),
  s(
    { trig = '!warn', snippetType = 'autosnippet' },
    t({'[!WARNING]', ''})
  ),
  s(
    { trig = '!caution', snippetType = 'autosnippet' },
    t({'[!CAUTION]', ''})
  ),
}
