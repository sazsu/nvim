local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require('luasnip.extras.fmt').fmta

return {
  s(
    { trig = 'main', },
    fmta([[
    int main() {
        <>
        return 0;
    }
    ]], { i(1) })
  ),
  s(
    { trig = 'ustd' },
    t'using namespace std;'
  ),
  s(
    { trig = 'fastio' },
    t({'ios_base::sync_with_stdio(false);', 'cin.tie(nullptr);'})
  )
}
