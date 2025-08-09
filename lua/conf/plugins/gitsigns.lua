return {
  'gitsigns.nvim',
  event = { 'DeferredUIEnter', },
  after = function (_)
    require('gitsigns').setup()
  end,
}
