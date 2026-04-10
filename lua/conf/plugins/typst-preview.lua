local function getopen_cmd()
  local utils = require('typst-preview.utils')

  local shell = vim.uv.os_getenv('SHELL')
  local shell_name = shell and shell:match('([^/]+)$')

  local open_cmd = utils.open_cmd
  if utils.is_macos() and shell_name == 'nu' then
    open_cmd = 'Open %s'
  end
  return open_cmd
end


return {
  'typst-preview.nvim',
  ft = { 'typst' },
  after = function(_)
    require('typst-preview').setup({
      invert_colors = 'auto',
      open_cmd = getopen_cmd(),
    })
  end,
}
