return {
  'indent-blankline.nvim',
  event = { 'DeferredUIEnter', },
  after = function (_)
    require('ibl').setup({
      indent = {
        char = '▏',
      },
      scope = { enabled = false },
    })
  end,
}
