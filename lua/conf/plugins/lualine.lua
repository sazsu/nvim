local function mode()
  local m = vim.api.nvim_get_mode()['mode']
  return string.upper(m)
end

local function lsp_clients()
  local clients = {}
  for i, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    clients[i] = c.name
  end
  return table.concat(clients, ' ')
end

local function completion()
  local comp_enabled
  if vim.b.completion == nil then
    comp_enabled = true
  else
    comp_enabled = vim.b.completion
  end
  return 'comp ' .. tostring(comp_enabled)
end

vim.o.showcmdloc = 'statusline'

return {
  'lualine.nvim',
  event = { 'DeferredUIEnter', },
  after = function(_)
    require('lualine').setup({
      options = {
        component_separators = {},
        section_separators = {},
        theme = {},
        globalstatus = true,
        refresh = {
          statusline = 200,
        }
      },
      sections = {
        lualine_a = { mode },
        lualine_b = {
          { 'filename', path = 4, }
        },
        lualine_c = { lsp_clients, completion },
        lualine_x = { '%S' },
        lualine_y = { 'filetype' },
        lualine_z = { {
          'location',
          padding = 0,
        } },
      },
    })
  end,
}
