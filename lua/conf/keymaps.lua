local ls = require('luasnip')
local map = vim.keymap.set

map('n', '<leader>d', function()
  local vl = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = vl })
end)

map('n', '<leader>r', function()
  local comp_enabled
  if vim.b.completion == nil then
    comp_enabled = true
  else
    comp_enabled = vim.b.completion
  end
  vim.b.completion = not comp_enabled
end)

map({ 'i' }, '<c-e>', function() ls.expand() end, { silent = true })
map({ 'i' }, '<c-j>', function() ls.jump(1) end, { silent = true })
map({ 'i' }, '<c-k>', function() ls.jump(-1) end, { silent = true })
map({ 'i', 's' }, '<C-K>', function() ls.jump(-1) end, { silent = true })

map({ 'n', }, '<leader>fl', function() vim.lsp.buf.format() end, { silent = true })
