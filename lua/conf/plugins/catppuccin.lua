return {
  'catppuccin/nvim',
  -- event = { 'DeferredUIEnter', },
  lazy = false,
  after = function (_)
    require('catppuccin').setup({
      styles = {
        comments = { 'italic' },
      },
      lsp_styles = {
        underlines = {
          warning = { 'undercurl' },
        },
      },
      color_overrides = {
				mocha = {
					base = '#000000',
				},
			},
    })
  end,
}
