return {
  'gitsigns.nvim',
  event = { 'DeferredUIEnter', },
  after = function (_)
    require('gitsigns').setup({
      current_line_blame = true,
    })
  end,
}
