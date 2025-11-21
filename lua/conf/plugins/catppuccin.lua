return {
  'catppuccin/nvim',
  -- event = { 'DeferredUIEnter', },
  lazy = false,
  after = function (_)
    require('catppuccin').setup({
      styles = {
        comments = { 'italic' },
      },
      color_overrides = {
				mocha = {
					base = '#000000',
				},
			},
    })
  end,
}
